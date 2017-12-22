package com.zteict.web.company.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import com.zteict.tool.common.Constant;
import com.zteict.tool.utils.JEscape;
import com.zteict.tool.utils.JsonUtil;

import com.zteict.web.company.model.CompanyProxyserver;
import com.zteict.web.company.service.CompanyProxyserverService;

import com.zteict.web.system.action.base.BaseController;
import com.zteict.web.system.model.SysUserBean;

@Controller
@RequestMapping(value = "/companyproxyserver")
public class CompanyProxyserverController extends BaseController {

	@Autowired
	CompanyProxyserverService companyprsvrService;

	@RequestMapping(value = "/")
	public ModelAndView GroupList() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/company/company");

		return view;
	}

	@RequestMapping(value = "/getDetail")
	public void getDetail(HttpServletRequest request,
			HttpServletResponse response) {
		// String data = request.getParameter("data");
		JSONObject jsonIN;
		JSONObject jsonOut = new JSONObject();

		String rst = "";
		try {

			SysUserBean user = (SysUserBean) request.getSession().getAttribute(
					Constant.SESSION_USER);
			if (user != null) {

			}

			CompanyProxyserver detail = null;// companyprsvrService
			// .getCompanyProxyserverInfoByAccountId(user.getUserid());

			Gson gs = new Gson();
			String jsStr = gs.toJson(detail);

			jsonOut.put("ResponseCode", "200");
			jsonOut.put("ResponseMsg", "");
			jsonOut.put("total", 1);
			jsonOut.put("datalist", jsStr);

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			try {
				jsonOut.put("ResponseCode", "201");
				jsonOut.put("ResponseMsg", "");
				jsonOut.put("total", 0);
				jsonOut.put("datalist", "");
			} catch (Exception e2) {
				// TODO: handle exception
			}

		}
		rst = jsonOut.toString();
		JsonUtil.responseOutWithJson(response, rst);
	}

	/**
	 * 页面-获取company列表
	 * 
	 * @param clientType
	 * @param packageName
	 * @param curPage
	 *            当前页
	 * @param pageCount
	 *            每页多少条
	 * @return
	 */
	@RequestMapping(value = "/getInfoList")
	public void getInfoList(HttpServletRequest request,
			HttpServletResponse response) {
		// String companyid = request.getParameter("companyid");

		/*
		 * int pageCount = Integer.parseInt(request.getParameter("rows"));//
		 * request.getParameter("pageCount"); int curPage =
		 * Integer.parseInt(request.getParameter("page"));
		 */

		String data = request.getParameter("data");
		JSONObject jsonIN;
		JSONObject jsonOut = new JSONObject();

		String rst = "";
		try {

			jsonIN = new JSONObject(data);

			String companyid = jsonIN.optString("companyid");

			int pageCount = jsonIN.optInt("rows");// request.getParameter("pageCount");
			int curPage = jsonIN.optInt("page");

			CompanyProxyserver query = new CompanyProxyserver();
			query.setPage(curPage);
			query.setPageCount(pageCount);

			// query.setIp(ip);
			// query.setCity(city);
			query.setCompanyid(companyid);// (id);

			List<CompanyProxyserver> infos = companyprsvrService
					.getCompanyProxyserverPageList(query);

			if (infos != null && infos.size() > 0) {
				boolean isfirst = true;
				String lastpid = "";
				int num = 0;
				int lastindex = 0;

				for (int i = 0; i < infos.size(); i++) {

					if (!lastpid.equals(infos.get(i).getProxyserver_id())) {
						isfirst = true;
						
						if (i != 0) {
							infos.get(lastindex)
									.setRowspan(String.valueOf(num));
						}
						lastindex = i;
						num = 1;
						
					} else {
						num++;
					}
					lastpid = infos.get(i).getProxyserver_id();

				}
				
				infos.get(lastindex)
				.setRowspan(String.valueOf(num));
				
				
			}

			int total = companyprsvrService
					.getCompanyProxyserverPageListCount(query);

			Gson gs = new Gson();
			String jsStr = gs.toJson(infos);

			jsonOut.put("ResponseCode", "200");
			jsonOut.put("ResponseMsg", "");
			jsonOut.put("total", total);
			jsonOut.put("datalist", jsStr);

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			try {
				jsonOut.put("ResponseCode", "201");
				jsonOut.put("ResponseMsg", "");
				jsonOut.put("total", 0);
				jsonOut.put("datalist", "");
			} catch (Exception e2) {
				// TODO: handle exception
			}

		}
		rst = jsonOut.toString();
		JsonUtil.responseOutWithJson(response, rst);

	}

	/**
	 * 添加或者更新company信息
	 * 
	 * @param request
	 * @param response
	 * @date 2016-6-22
	 * @author zj
	 */
	@RequestMapping(value = "/addOrUpdate")
	public void addOrUpdate(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		JSONObject jsonOut = new JSONObject();
		String data = request.getParameter("data");
		JSONObject jsonIN;

		try {

			jsonIN = new JSONObject(data);

			int recordid = jsonIN.optInt("recordid");
			String companyid = jsonIN.optString("companyid");
			String proxyserver_id = jsonIN.optString("proxyserver_id");
			String ipdesc = jsonIN.optString("ipdesc");

			try {

				String[] ips = ipdesc.split("-");
				String pre = ips[0].substring(ips[0].lastIndexOf(".") + 1);
				String[] nums = ips[0].split("\\.");

				String pre3 = ips[0].substring(0, ips[0].lastIndexOf("."));
				int preNum = Integer.parseInt(ips[0].substring(
						ips[0].lastIndexOf(".") + 1, ips[0].length()));

				String end3 = ips[1].substring(0, ips[1].lastIndexOf("."));
				int endNum = Integer.parseInt(ips[1].substring(
						ips[1].lastIndexOf(".") + 1, ips[1].length()));
				if (!pre3.equals(end3)) {
					jsonOut.put("ResponseCode", 201);
					jsonOut.put("ResponseMsg", "请确认IP段前3位一致");
					JsonUtil.responseOutWithJson(response, jsonOut.toString());
					return;
				}
				for (int i = 0; i < nums.length; i++) {
					int n = Integer.parseInt(nums[i]);
					if (n > 255) {
						jsonOut.put("ResponseCode", 201);
						jsonOut.put("ResponseMsg", "请确认IP段数值格式正确");
						JsonUtil.responseOutWithJson(response,
								jsonOut.toString());
						return;
					}
				}

				if (preNum > endNum) {
					jsonOut.put("ResponseCode", 201);
					jsonOut.put("ResponseMsg", "请确认IP段数值格式正确");
					JsonUtil.responseOutWithJson(response, jsonOut.toString());
					return;
				}
			} catch (Exception e) {
				jsonOut.put("ResponseCode", 201);
				jsonOut.put("ResponseMsg", "请确认IP段数值格式正确");
				JsonUtil.responseOutWithJson(response, jsonOut.toString());
				return;
			}

			CompanyProxyserver company = new CompanyProxyserver();
			company.setRecordid(recordid);
			company.setCompanyid(companyid);// (id);
			company.setProxyserver_id(proxyserver_id);// (desc);
			company.setIpdesc(ipdesc);// (ip_desc);

			List<CompanyProxyserver> coficts = companyprsvrService
					.getconflictProxyserverInfo(company);

			if (coficts != null && coficts.size() > 0) {
				jsonOut.put("ResponseCode", 201);
				jsonOut.put("ResponseMsg", "IP段与已分配的IP段冲突");
			} else {
				int rst = companyprsvrService.updateCompanyProxyserver(company);

				if (rst > 0) {
					jsonOut.put("ResponseCode", 200);
					jsonOut.put("ResponseMsg", "OK");
				} else {
					jsonOut.put("ResponseCode", 201);
					jsonOut.put("ResponseMsg", "FAILED");
				}
			}

		} catch (Exception e2) {
			System.out.println(e2.getMessage());
			try {
				jsonOut.put("ResponseCode", "201");
				jsonOut.put("ResponseMsg", "FAILED");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		JsonUtil.responseOutWithJson(response, jsonOut.toString());

	}

	/**
	 * 删除company
	 * 
	 * @param request
	 * @return
	 * @date 2016-8-22
	 */
	@RequestMapping(value = "/del")
	public @ResponseBody
	Map delBanner(HttpServletRequest request) {
		Map res = new HashMap();
		res.put("ResponseCode", "201");
		res.put("ResponseMsg", "删除失败");
		String data = request.getParameter("data");
		JSONObject jsonIN;

		try {

			jsonIN = new JSONObject(data);

			int recordid = jsonIN.optInt("recordid");
			String companyid = jsonIN.optString("companyid");
			String proxyserver_id = jsonIN.optString("proxyserver_id");
			CompanyProxyserver company = new CompanyProxyserver();
			company.setCompanyid(companyid);// (id);
			company.setProxyserver_id(proxyserver_id);// (desc);
			company.setRecordid(recordid);

			if (companyprsvrService.deleteCompanyProxyserver(company) > 0) {
				res.put("ResponseCode", "200");
				res.put("ResponseMsg", "删除成功");
			} else {
				res.put("ResponseCode", "201");
				res.put("ResponseMsg", "删除失败");
			}
		} catch (Exception e) {

		}

		return res;
	}

}
