package com.zteict.web.company.model;

import com.zteict.web.system.model.base.BaseModel;

public class CompanyProxyserver extends BaseModel {
	/*
	 * `proxyserver_id` varchar(128) NOT NULL COMMENT '中转服务器id', `companyid`
	 * varchar(64) DEFAULT NULL COMMENT '公司id', `ipdesc` varchar(128) DEFAULT
	 * '0' COMMENT 'ip段',
	 */

	private Integer recordid;
	
	private String proxyserver_id;
	private String companyid;

	private String ipdesc;

	// query 关联中转服务器查询字段
	private String id;
	private String ip;

	private String port;
	private String maxphones; // 链接url
	private String assignphones; // 创建者
	
	private String rowspan;  //页面合并 table 行使用标记

	public String getProxyserver_id() {
		return proxyserver_id;
	}

	public void setProxyserver_id(String proxyserver_id) {
		this.proxyserver_id = proxyserver_id;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public String getIpdesc() {
		return ipdesc;
	}

	public void setIpdesc(String ipdesc) {
		this.ipdesc = ipdesc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getMaxphones() {
		return maxphones;
	}

	public void setMaxphones(String maxphones) {
		this.maxphones = maxphones;
	}

	public String getAssignphones() {
		return assignphones;
	}

	public void setAssignphones(String assignphones) {
		this.assignphones = assignphones;
	}

	public Integer getRecordid() {
		return recordid;
	}

	public void setRecordid(Integer recordid) {
		this.recordid = recordid;
	}

	public String getRowspan() {
		return rowspan;
	}

	public void setRowspan(String rowspan) {
		this.rowspan = rowspan;
	}

	
}
