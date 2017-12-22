package com.zteict.web.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;




import com.zteict.web.company.model.CompanyProxyserver;


public interface CompanyProxyserverService {


	/**
	 * 冲突的ip段
	 * 
	 * @param map
	 * @return
	 * @author zj
	 * @date 2017-12-19
	 */
	public List<CompanyProxyserver> getconflictProxyserverInfo(CompanyProxyserver query);
	/**
	 * 分页获取banner列表
	 * @param query
	 * @return
	 * @date 2016-8-4
	 */
	public List<CompanyProxyserver> getCompanyProxyserverPageList(CompanyProxyserver query);

	/**
	 * 获取banner总条数
	 * @param query
	 * @return
	 * @date 2016-8-4
	 */
	public int getCompanyProxyserverPageListCount(CompanyProxyserver query);
	
	/**
	 * 添加CompanyProxyserver
	 * @param CompanyProxyserver
	 * @return
	 */
	public int addCompanyProxyserver(CompanyProxyserver CompanyProxyserver);
	
	/**
	 * 删除CompanyProxyserver
	 * @param id
	 * @return
	 */
	public int deleteCompanyProxyserver(CompanyProxyserver CompanyProxyserver);

	/**
	 * 更新CompanyProxyserver
	 * @param CompanyProxyserver
	 * @return
	 */
	public int updateCompanyProxyserver(CompanyProxyserver CompanyProxyserver);
	


	/**
	 * 根据ID/serverid,获取CompanyProxyserver信息
	 * @param bannerID
	 * @return
	 * @date 2016-8-4
	 */
	public CompanyProxyserver getCompanyProxyserverInfo(CompanyProxyserver CompanyProxyserver);
	
}
