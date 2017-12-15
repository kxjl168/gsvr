package com.zteict.web.system.action.base;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import com.zteict.tool.common.Constant;
import com.zteict.web.system.model.SysUserBean;

public class PageFilter implements Filter {

	public FilterConfig config;
	
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}

	public void doFilter(ServletRequest orequest, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(
				(HttpServletResponse) response);

		HttpServletRequest request = (HttpServletRequest) orequest;

		HttpSession session = request.getSession();

		String excludedUrls=config.getInitParameter("excludedUrls");
		String[] urls=excludedUrls.split(",");
		
		for (int i = 0; i < urls.length; i++) {
			if(urls[i].trim().equals(""))
				continue;
			if (request.getRequestURI().endsWith(urls[i])
					||request.getRequestURI().endsWith(".css")
					||request.getRequestURI().endsWith(".js")
						||request.getRequestURI().endsWith(".woff2")
							||request.getRequestURI().endsWith(".woff")
								||request.getRequestURI().endsWith(".ttf")
									
					
					) {
				chain.doFilter(request, response);
				return;
			}
		}
		
		
		SysUserBean user = (SysUserBean) session
				.getAttribute(Constant.SESSION_USER);
		
		//System.out.println("pageFilter:" + request.getRequestURI());
		if (user == null) {
			String loginPath = request.getContextPath() + "/login.jsp";
			wrapper.sendRedirect(loginPath);
			return;
		} else {
			
			if(request.getRequestURI().endsWith("/"))
			{	
				//zj 171215  直接访问url权限过滤
			//	System.out.println("filter:"+request.getRequestURI());
				boolean inaccess=false;
				
				if(user.getMenus().size()==0)
					inaccess=true;
				else
					inaccess=false;
				
				
				for (int i = 0; i < user.getMenus().size(); i++) {
					if(user.getMenus().get(i)!=null&&user.getMenus().get(i).getMenuUrl()!=null&&request.getRequestURI().contains(user.getMenus().get(i).getMenuUrl()))
					{
						inaccess=true;
						break;
					}
				}
				
				if(!inaccess)
				{
					String loginPath = request.getContextPath() + "/noaccess.jsp";
					wrapper.sendRedirect(loginPath);
					
				}

			}
		
			
			chain.doFilter(request, response);
			return;
		}

	}

	public void destroy() {
	}
}