<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
>
<%@include file="/common/tag.jsp"%>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
	<title>概览</title>
	<link rel="stylesheet" type="text/css" media="screen" href="../../js/plugin/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" href="../../css/kCommon.css">

	<link rel="stylesheet" href="../../css/zcfg.css">
	<link rel="stylesheet" href="../../css/common.css">
	<link rel="stylesheet" href="../../css/swiper_zcfg.css">
	<link rel="stylesheet" href="../../js/plugin/swiper/idangerous.swiper.css">



</head>

<body id="ngSection" ng-app="myApp" ng-controller="eduCtrl">


	<div class="" id="content" style="">

		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
			<div class="navbar-header">
				<button type="button" id="menuBtn" class="navbar-toggle" data-toggle="collapse" data-target="#menuItem">
					<span class="sr-only"></span>
					<span class="glyphicon glyphicon-th-list  "></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">公司账号管理</a>
			</div>
			<div class="collapse navbar-collapse  pull-right-k" id="menuItem">
				<ul class="hide nav navbar-nav ">
					<li class=" bg-success">
						<a href="javascript:void(0)" ng-click="btnP()"> test</a>
					</li>

				</ul>
				<form class=" navbar-form navbar-left " role="search">


				</form>

				<ul id="menuul" class="nav navbar-nav ">
					<!-- <li class="active">
						<a href="#">{{title}}</a>
					</li>
					<li >
						<a href="#" ng-click="load('pccount')">手机账号管理</a>
					</li>
					
					<li >
						<a href="#" ng-click="load('device')">路由器管理</a>
					</li>
					<li >
						<a href="#" ng-click="load('translog')">流量日志</a>
					</li>
					
					
					<li>
						<a href="#" ng-click="load('set')">设置</a>
					</li>
					<li class="">
						<a href="">登出</a>
					</li> -->

				</ul>


			</div>
		</nav>




		<div class=" row-margin-top-70 row">

			<div class="menu hide">
				<div id="slides">
					<ul class="swiper-container" id="swiper_menu">
						<div class="swiper-wrapper" style="padding-top: 0px; padding-bottom: 0px; width: 320px; height: 50px; transform: translate3d(0px, 0px, 0px);">

						</div>
					</ul>
				</div>
			</div>



					

<div class="col-xs-12 ">
						<div class="panel panel-success row">
							<div class="panel-heading" title="点击显示/隐藏查询条件" data-toggle="collapse" data-parent="#accordion" 
                href="#collapseOne">
							<div class="row">
								<h3 class="panel-title col-xs-4 col-lg-4 col-md-4 ">查询条件</h3>
								
					
                
                	<span id="titlepic" data-toggle="collapse" data-parent="#accordion" 
                href="#collapseOne" class="glyphicon glyphicon-chevron-up pull-right "></span>
                </div>
							</div>
							 <div id="collapseOne" class="panel-collapse collapse ">
							<div class="panel-body">

								<div class="container">


					
									<div class="row  form-group margin-bottom-5">
											<div class=" col-md-6  col-xs-12  ">
														<div class="control-label padding-top-0 col-xs-4 col-md-3 col-lg-3">服务器ID：</div>
														<div class="col-md-6 col-xs-8 text-right ">
															 <input type="text" class="form-control" id="name" ng-model="id" placeholder="">
				
														</div>
													</div>

												<div class=" col-md-6  col-xs-12  ">
														<div class="control-label padding-top-0 col-xs-4 col-md-3 col-lg-3">服务器IP：</div>
														<div class="col-md-6 col-xs-8 text-right ">
															 <input type="text" class="form-control" id="deviceid" ng-model="ip" placeholder="">
				
														</div>
													</div>
									</div>
					

									<div class="row  form-group margin-bottom-5">
											<div class=" col-md-6  col-xs-12  ">
														<div class="control-label padding-top-0 col-xs-4 col-md-3 col-lg-3">出口位置：</div>
														<div class="col-md-6 col-xs-8 text-right ">
															 <input type="text" class="form-control" id="name" ng-model="city" placeholder="">
				
														</div>
													</div>

												<div class="hide col-md-6  col-xs-12  ">
														<div class="control-label padding-top-0 col-xs-4 col-md-3 col-lg-3">服务器IP：</div>
														<div class="col-md-6 col-xs-8 text-right ">
															 <input type="text" class="form-control" id="deviceid" ng-model="" placeholder="">
				
														</div>
													</div>
									</div>



								</div>



							</div>
							</div>
						</div>
					</div>

						<div class="col-xs-12 row ">
							<div class="table-responsive">
								<table class="table">
									<caption>
										{{title}}
										<div class=" hide col-lg-2 col-md-2 col-xs-4 pull-right margin-bottom-10 padding-right-0 ">
											<button type="button" ng-click="addOrModify()"  class="btn btn-primary btn-block   ">新增公司</button>
										</div>
										<div class=" col-lg-2 col-md-2 col-xs-4 pull-right margin-bottom-10 padding-right-0 ">
											<button type="button" ng-click="getList()" class="btn btn-primary btn-block   ">查询</button>
										</div>
									</caption>
									<thead>
										<tr>
										<th>服务器ID</th>
											<th>服务器IP</th>
											<th>服务器端口</th>
											<th>出口位置</th>
											
											<th>已分配手机数</th>
											<th>规划路由器数</th>
											<th>当前在线路由数</th>
											<!-- <th>操作</th> -->
										</tr>
										
									</thead>
									<tbody>
									
					
										<tr ng-repeat="x in datalist">
											 <td>{{ x.proxyserver_id }}</td>
											 <td>{{ x.proxyserver_ip }}</td>
											 <td>{{ x.proxyserver_port }}</td>
											 <td>{{ x.city }}</td>
											 <td>{{ x.phone_num }}</td>
											  <td>{{ x.plan_route_num }}</td>
											 <td>{{ x.online_route_num }}</td>
											 
											 	<!-- <td><a href="#" class="text-info" ng-click="addOrModify(x)">修改</a>
								<a href="#" class="text-warning" ng-click="del(x)">删除</a>
								
								</td> -->
										</tr>
									
									
									</tbody>
								</table>
							</div>
</div>



<div class="col-xs-12 row tablefoot" ng-if="page">


							<ul class="pagination pull-right">
							<li>
							<a href="#" ng-click="getList(page-1)">&laquo;</a>
							</li>
										<li ng-repeat="x in pageDataPre" >
										
												<a    href="#" ng-click="getList(x)">{{x}}</a>
												
										</li>
											<li class="active">
							<a href="#" ng-click="getList(page)">{{page}}</a>
							</li>
										<li ng-repeat="x in pageDataAft" >
										
												<a    href="#" ng-click="getList(x)">{{x}}</a>
												
										</li>
										<li>
							<a href="#" ng-click="getList(page+1)">&raquo;</a>
							</li>
								
								<!-- li>
									<a href="#">&laquo;</a>
								</li>
								<li class="active">
									<a href="#">1</a>
								</li>
								<li class="disabled">
									<a href="#">2</a>
								</li>
								<li>
									<a href="#">3</a>
								</li>
								<li>
									<a href="#">&raquo;</a>
								</li> -->
							</ul>
							
							<select onchange="changerows(this)" class="pull-right">
	<option ng-repeat="x in rows_select"  >{{x}}</option>
</select>
					</div>


		</div>

	</div>







	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">条件选择</h4>
				</div>



				<div class="modal-body">
					<div class="row" ng-show="selType==1">
						<div class="form-group col-xs-12">
							<div class="control-label col-xs-4">选择位置</div>
							<div class="col-xs-8 text-right">
								<select class="form-control" onchange="" ng-model="cpTypes" id="cpType" name="cpType">
								</select>
							</div>
						</div>
					</div>
					<div class="row" ng-show="selType==2">
						<div class="form-group col-xs-12">
							<div class="control-label col-xs-4">是否公开</div>
							<div class="col-xs-8 text-center">
								<div class="info_value">
									<input type="radio" value="1" onclick="selectPublic(1)" name="IsPublic" ng-model="cp.IsPublic" ng-checked="cp.IsPublic=='1'">是
									<input type="radio" value="0" onclick="selectPublic(0)" name="IsPublic" ng-model="cp.IsPublic" ng-checked="cp.IsPublic=='0'">否
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="row" ng-show="selType==3">
                    <div class="form-group col-xs-12">
                        <div class="control-label col-xs-4">部门</div>
                        <div class="col-xs-8 text-center">
                            <div class="info_value">
                                <div id="menuContent" class="menuContent">
                                    <ul id="depTree" class="ztree" style="margin-top:0; width:160px;"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">取消
					</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"> 确定 </button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增公司账号</h4>
				</div>



				<div class="modal-body container margin-top-10 " >
				<div class="row " >
					<form name="fm" class="form-horizontal col-xs-12 col-lg-12 " style="min-width: 150px; ">
				

					
						<input  type="text " class="hide form-control " name="s_recordid" id="s_recordid " ng-model="s_recordid" placeholder=" ">
					
					
					<div class="form-group col-xs-12 row ">
							<div class="control-label padding-top-0 col-xs-4 ">用户ID：</div>
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
						
					
					<div class="form-group col-xs-12 row ">
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
						
					
						<div class="form-group col-xs-12 row ">
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
								 <input required type="number" ng-patter="/^\d*$/"  min="9" max="1000"  class="form-control"  id="name" name= "s_ip_refresh" ng-model="s_ip_refresh" placeholder="">
					
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




<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 250px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">确认操作</h4>
				</div>



				<div class="modal-body container margin-top-10 " ">
				<div class="row " >
					
					<p class="col-xs-10">确认执行操作吗？</p>
					
				</div>
				</div>
				<div class="modal-footer ">
					<button type="button " class="btn btn-default btn-warning " data-dismiss="modal">取消
					</button>
					                 <button id="btnconfirm" type="button " class="btn btn-primary " > 确定 </button>
				</div>
			</div>
		</div>
	</div>


</script>

	<script type="text/javascript "
		src="../../js/plugin/jquery/jquery.v1.11.3.js "></script>

<script type="text/javascript "
		src="../../js/plugin/jquery/jquery-ui.js "></script>

	<script type="text/javascript "
		src="../../js/plugin/angular/angular.min.js "></script>
	<script type="text/javascript "
		src="../../js/plugin/angular/angular-resource.min.js "></script>




	<script type="text/javascript "
		src="../../js/plugin/jquery/jquery.noty.min.js "></script>
	<script type="text/javascript "
		src="../../js/plugin/jquery/noty.layout.center.js "></script>
	<script type="text/javascript "
		src="../../js/plugin/jquery/noty.themes.bootstrap.js "></script>


	<script type="text/javascript "
		src="../../js/plugin/bootstrap/js/bootstrap.min.js "></script>


	<script type="text/javascript "
		src="../../js/plugin/swiper/idangerous.swiper.min.js "></script>

	
	<script src="../../js/loading.js "></script>
	
	
		<script src="../../js/menu.js "></script>
	
	

	<script type="text/javascript "
		src="../../js/plugin/select2/select2.full.min.js "></script>
	<script type="text/javascript " src="index.js "></script>


<script>
	$(function () {
		$('#myModal').modal({
			keyboard: true
		})
	});


</body >
</html >