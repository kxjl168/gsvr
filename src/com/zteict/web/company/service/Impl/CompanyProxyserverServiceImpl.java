package com.zteict.web.company.service.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.zteict.web.company.dao.CompanyProxyserverDao;
import com.zteict.web.company.model.CompanyProxyserver;
import com.zteict.web.company.service.CompanyProxyserverService;
import com.zteict.web.system.dao.SystemParamsDao;

@Service(value="CompanyProxyserverService")
public class CompanyProxyserverServiceImpl implements CompanyProxyserverService{
	
	@Autowired
	CompanyProxyserverDao companyDao;
	
	@Autowired
	SystemParamsDao sysDao;

	/**
	 * 分页获取banner列表
	 * @param query
	 * @return
	 * @date 2016-8-4
	 */
	@Override
	public List<CompanyProxyserver> getCompanyProxyserverPageList(CompanyProxyserver query) {
		return companyDao.getCompanyProxyserverPageList(query);
	}
	
	/**
	 * 登录
	 * @param bannerID
	 * @return
	 * @date 2016-8-4
	 */
	public CompanyProxyserver getCompanyProxyserverInfo(CompanyProxyserver query)
	{
		return companyDao.getCompanyProxyserverInfo(query);
	}
	

	/**
	 * 获取banner总条数
	 * @param query
	 * @return
	 * @date 2016-8-4
	 */
	@Override
	public int getCompanyProxyserverPageListCount(CompanyProxyserver query) {
		return companyDao.getCompanyProxyserverPageListCount(query);
	}

	@Override
	public int addCompanyProxyserver(CompanyProxyserver CompanyProxyserver) {
		return companyDao.addCompanyProxyserver(CompanyProxyserver);
	}

	@Override
	public int deleteCompanyProxyserver(CompanyProxyserver CompanyProxyserver) {
		return companyDao.deleteCompanyProxyserver(CompanyProxyserver);
	}

	@Override
	public int updateCompanyProxyserver(CompanyProxyserver CompanyProxyserver) {
		
		
		
		CompanyProxyserver tmp= getCompanyProxyserverInfo(CompanyProxyserver);
		if(tmp!=null)
		{
			return companyDao.updateCompanyProxyserver(CompanyProxyserver);	
		}
		else
		{
			return addCompanyProxyserver(CompanyProxyserver);
		}
		
		
	}
	
	public List<CompanyProxyserver> getconflictProxyserverInfo(CompanyProxyserver query) {
		return companyDao.getconflictProxyserverInfo(query);
	}
	
	
	
}
