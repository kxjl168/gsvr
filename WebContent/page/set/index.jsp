<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
>
<%@include file="/common/tag.jsp"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no, initial-scale=1">
<title>设置</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="../../js/plugin/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="../../css/kCommon.css">

<link rel="stylesheet" href="../../css/zcfg.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/swiper_zcfg.css">
<link rel="stylesheet" href="../../js/plugin/swiper/idangerous.swiper.css">



</head>
<body id="ngSection" ng-app="myApp" ng-controller="eduCtrl">


	<div class="container" id="content"  style="overflow: hidden;">

		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
		<div class="navbar-header ">
				<button type="button" id="menuBtn"  class="navbar-toggle" data-toggle="collapse"
					data-target="#menuItem">
					<span class="sr-only"></span><span
						class="glyphicon glyphicon-th-list  "></span><span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">设置</a>
			</div>
			<div class="collapse navbar-collapse  pull-right-k"
				id="menuItem">
				<ul class="hide nav navbar-nav ">
					<li class=" bg-success"><a href="javascript:void(0)" ng-click="btnP()"> 行政许可</a></li>
					<li class="  bg-warning"><a href="javascript:void(0)" ng-click="btnF()">行政处罚</a></li>

				</ul>
				<form class="hide navbar-form navbar-left " role="search">

					<div class="input-group  ">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-search   "></i></span> <input id="key" type="text"
							class="form-control"> <span class="input-group-btn"><input
							type="button" class="btn btn-primary" ng-click="Search()" value="搜索"> </span>
					</div>
				</form>
				
				<ul class="nav navbar-nav " id="menuul">
									<!-- 	<li ><a href="#" ng-click="load('entry')">子账号列表</a></li>
										<li class="active"><a href="#">设置</a></li>
										<li class=""><a href="">登出</a></li>    --> 

				</ul>
				
			
			</div>
		</nav>


	

		<div class="col-xs-12 row row-margin-top-70">

			<div class="menu hide">
				<div id="slides">
					<ul class="swiper-container" id="swiper_menu">
						<div class="swiper-wrapper"
							style="padding-top: 0px; padding-bottom: 0px; width: 320px; height: 50px; transform: translate3d(0px, 0px, 0px);">

						</div>
					</ul>
				</div>
			</div>



<div class="col-xs-12 row ">
				<div class="table-responsive">
					<table class="table">
						<caption class="">
								
								  <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal2" > 修 改 </button>
						</caption>
						<thead class="hide">
							<tr>
								<th>账号ID</th>
								<th>手机IP</th>
								<th>出口IP刷新周期</th>
								<th>出口位置</th>
								<th>所属公司</th>
									<th>操作</th>
							</tr>

						</thead>
						<tbody>


<tr> 
<td>账号ID</td>
<td>{{detail.accountid}}</td> 
 </tr>
 
 <tr> 
<td>名称 </td>
<td>{{detail.company_name}}</td> 
 </tr>
 
 <tr> 
<td>描述</td>
<td>{{detail.desc_info}}</td> 
 </tr>

 <tr> 
<td>IP段</td>
<td>{{detail.ip_desc}}</td> 
 </tr>
 
  <tr> 
<td>出口IP刷新周期 </td>
<td>{{detail.ip_refresh_interval}}</td> 
 </tr>



							


						</tbody>
					</table>
				</div>
			</div>

			

		</div>

	</div>
	
	

	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改配置</h4>
				</div>



				<div class="modal-body container margin-top-10 " >
				<div class="row " >
					<form name="fm" class="form-horizontal col-xs-12 col-lg-12 " style="min-width: 150px; ">
				

					
						<input  type="text " class="hide form-control " name="s_recordid" id="s_recordid " ng-model="s_recordid" placeholder=" ">
					
					
					<div class="hide form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">ID：</div>
							<div class="col-xs-7 text-right ">
							 <input required type="text" class="form-control" id="s_account" name="s_account" ng-model="s_account" placeholder="">
							 
							

							</div>
							
							<div class="col-xs-1 text-right ">
							 <span ng-show="fm.s_account.$error.required">
							<span style="color:red" title="用户ID必须填写">
							<span class="glyphicon glyphicon-remove"></span>
							</span> 
							 </span>
							</div>
						</div>
						
					
					<div class=" hide form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">密码：</div>
							<div class="col-xs-7 text-right ">
						
						
						 <input required type="text" class="form-control"  type="password " id="s_pass" name="s_pass" ng-model="s_pass" placeholder="">
							 
						
							</div>
							
							 <div class="col-xs-1 text-right ">
							 <span ng-show="fm.s_pass.$error.required">
							<span style="color:red" title="密码必须填写">
							<span class="glyphicon glyphicon-remove"></span>
							</span> 
							 </span>
							</div>
						</div>
						
					
						<div class=" hide form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">公司名称：</div>
							<div class="col-xs-7 text-right ">
								 <input type="text" class="form-control"  id="name" ng-model="s_company" placeholder="">
						

							</div>
						</div>
						
						<div class="form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">描述：</div>
							<div class="col-xs-7 text-right ">
								 <textarea type="text" class="form-control"  id="name" ng-model="s_desc" placeholder="">
						</textarea>

							</div>
						</div>
						
						<div class="form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">IP段：</div>
							<div class="col-xs-7 text-right ">
								 <textarea type="text" class="form-control"  id="name" ng-model="s_ip_desc" placeholder="">
								 </textarea>
						

							</div>
						</div>
						
						<div class="form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">出口IP刷新周期：</div>
							<div class="col-xs-7 text-right ">
								 <input required type="number" ng-patter="/^\d*$/"  min="9" max="1000"   class="form-control"  id="name" name= "s_ip_refresh" ng-model="s_ip_refresh" placeholder="">
					
							</div>
							 <div class="col-xs-1 text-right ">
							 <span ng-show="fm.s_ip_refresh.$error.required">
							<span style="color:red" title="刷新周期必须填写">
							<span class="glyphicon glyphicon-remove"></span>
							</span> 
							 </span>
							 
							  <span ng-show=" fm.s_ip_refresh.$invalid">
							<span style="color:red" title="刷新周期为大于9的数字">
							<span class="glyphicon glyphicon-remove"></span>
							</span> 
							 </span>
							</div>
						</div>

					
					</form>
					</div>
					
				</div>
				<div class="modal-footer ">
					<button type="button " class="btn btn-default btn-warning " data-dismiss="modal">取消
					</button>
					                 <button type="button " class="btn btn-primary " ng-click="update()" > 确定 </button>
				</div>
			</div>
		</div>
	</div>



</script>

	<script type="text/javascript"
		src="../../js/plugin/jquery/jquery.v1.11.3.js"></script>


	<script type="text/javascript"
		src="../../js/plugin/angular/angular.min.js"></script>
	<script type="text/javascript"
		src="../../js/plugin/angular/angular-resource.min.js"></script>




	<script type="text/javascript"
		src="../../js/plugin/jquery/jquery.noty.min.js"></script>
	<script type="text/javascript"
		src="../../js/plugin/jquery/noty.layout.center.js"></script>
	<script type="text/javascript"
		src="../../js/plugin/jquery/noty.themes.bootstrap.js"></script>


	<script type="text/javascript"
		src="../../js/plugin/bootstrap/js/bootstrap.min.js"></script>


	<script type="text/javascript"
		src="../../js/plugin/swiper/idangerous.swiper.min.js"></script>

	<script src="../../js/menu.js "></script>
	
	<script src="../../js/loading.js"></script>

	<script type="text/javascript"
		src="../../js/plugin/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="index.js"></script>


<script>
$(function() {
    $('#myModal').modal({
        keyboard: true
    })
});


</body>
</html>