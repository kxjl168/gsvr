package com.zteict.web.translog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import com.zteict.tool.utils.JsonUtil;

import com.zteict.web.translog.model.RouteCompletelog;
import com.zteict.web.translog.model.RouteUselog;
import com.zteict.web.translog.model.Routelog;
import com.zteict.web.translog.model.Translog;
import com.zteict.web.translog.service.TranslogService;

import com.zteict.web.system.action.base.BaseController;

@Controller
@RequestMapping(value = "/translog")
public class TranslogController extends BaseController {

	@Autowired
	TranslogService translogService;

	@RequestMapping(value = "/banner/bannerList")
	public ModelAndView GroupList() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/banner/banner");

		return view;
	}

	@RequestMapping(value = "/getRouteUselogList")
	public void getRouteUselogList(HttpServletRequest request,
			HttpServletResponse response) {
		// String translogid = request.getParameter("translogid");

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

			String routeid = jsonIN.optString("routeid");
			String phoneip = jsonIN.optString("phoneip");

			int pageCount = jsonIN.optInt("rows");// request.getParameter("pageCount");
			int curPage = jsonIN.optInt("page");

			RouteUselog query = new RouteUselog();
			query.setPage(curPage);
			query.setPageCount(pageCount);

			query.setRouteid(routeid);// (phone_account_use_id);//(translogid);
			query.setPhoneip(phoneip);// (device_id);//(ip);

			List<RouteUselog> infos = translogService
					.getRouteUselogPageList(query);
			int total = translogService.getRouteUselogPageListCount(query);

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

	@RequestMapping(value = "/getRouteCompletelogList")
	public void getRouteCompletelogList(HttpServletRequest request,
			HttpServletResponse response) {
		// String translogid = request.getParameter("translogid");

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

			String routeid = jsonIN.optString("routeid");
			String proxyserver_id = jsonIN.optString("proxyserver_id");

			int pageCount = jsonIN.optInt("rows");// request.getParameter("pageCount");
			int curPage = jsonIN.optInt("page");

			RouteCompletelog query = new RouteCompletelog();
			query.setPage(curPage);
			query.setPageCount(pageCount);

			query.setRouteid(routeid);// (phone_account_use_id);//(translogid);
			query.setProxyserver_id(proxyserver_id);// (device_id);//(ip);

			List<RouteCompletelog> infos = translogService
					.getRouteCompletelogPageList(query);
			int total = translogService.getRouteCompletelogPageListCount(query);

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

	@RequestMapping(value = "/getRoutelogList")
	public void getRoutelogList(HttpServletRequest request,
			HttpServletResponse response) {
		// String translogid = request.getParameter("translogid");

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

			String routeid = jsonIN.optString("routeid");
			String proxyserver_id = jsonIN.optString("proxyserver_id");
			String ip = jsonIN.optString("ip");
			String city = jsonIN.optString("city");

			int pageCount = jsonIN.optInt("rows");// request.getParameter("pageCount");
			int curPage = jsonIN.optInt("page");

			Routelog query = new Routelog();
			query.setPage(curPage);
			query.setPageCount(pageCount);

			query.setRouteid(routeid);// (phone_account_use_id);//(translogid);
			query.setProxyserver_id(proxyserver_id);// (device_id);//(ip);
			query.setIp(ip);
			query.setCity(city);

			List<Routelog> infos = translogService.getRoutelogPageList(query);
			int total = translogService.getRoutelogPageListCount(query);

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
	 * 页面-获取banner列表
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
		// String translogid = request.getParameter("translogid");

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

			String phone_account_use_id = jsonIN
					.optString("phone_account_use_id");
			String device_id = jsonIN.optString("device_id");
			String city = jsonIN.optString("city");

			String device_ip = jsonIN.optString("device_ip");

			int pageCount = jsonIN.optInt("rows");// request.getParameter("pageCount");
			int curPage = jsonIN.optInt("page");

			Translog query = new Translog();
			query.setPage(curPage);
			query.setPageCount(pageCount);

			query.setPhone_account_use_id(phone_account_use_id);// (translogid);
			query.setRoute_id(device_id);// (ip);
			query.setCity(city);
			query.setRoute_ip(device_ip);// (showall);

			List<Translog> infos = translogService.getTranslogPageList(query);
			int total = translogService.getTranslogPageListCount(query);

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

}
