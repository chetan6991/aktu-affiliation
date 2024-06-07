<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<link rel="stylesheet"
	href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css"
	type="text/css">
<script
	src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="../resources/js/filemovement/employee_mapping.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript"
	src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/gen.js"></script>
<script type="text/javascript"
	src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript"
	src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
<%
	response.setHeader("Cache-Control", "no-store"); // HTTP 1.1
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", -1); // Prevents caching at the proxy
%>
<link href="../resources/css/themes/blue.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"
	type="text/css" />
<link
	href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="../resources/assets/plugins/datepicker/datepicker3.css"
	type="text/css">
</head>
<style>

</style>
<body onload="getfiletype('');getsearchlist();">
	<div class="container-fluid">
		<div id="" class="page-header">
			<h4>Create and Manage Group</h4>
		</div>
		<form class="form-horizontal" name="empapprovd" id="empapprovd"  method="post"
			autocomplete="off">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right">Searching Criteria</h3>
				</div>
				<div class="panel-body">

					<!-- <div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label" for="">File Type</label>
								<div class="col-sm-4">
									<select class="form-control" id="filetype" name="filetype">
										<option value="">Select File Type</option>
									</select>
								</div>
								<label class="col-sm-2 col-form-label" for="">is Group</label>
								<div class="col-sm-4">
									<select class="form-control" id="is_group" name="is_group">
									    <option value="N">No</option>
										<option value="Y">Yes</option>									
									
									</select>
								</div>
							</div>
						</div>
					</div> -->
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label required-field" for="">Group Name</label>
							<div class="col-sm-4" >
								<input class="form-control" type="text" id="group" name="group" placeholder="Enter Group name">
				            </div>
							</div>
						</div>
					</div>

					<!-- <div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label" for="">From
									Department</label>
								<div class="col-sm-4">
									<select class="form-control" id="frm_departmnt" name="frm_departmnt">
										<option value="">Select From Department</option>
									</select>
								</div>
								<label class="col-sm-2 col-form-label" for="">To
									Department</label>
								<div class="col-sm-4">
									<select class="form-control" id="todepartmnt" name="todepartmnt">
										<option value="">Select To Department</option>
									</select>
								</div>
							</div>
						</div>
					</div> -->

					<div class="col-sm-12">
						<div class="row text-center">
							<div class="errmessage" id="errMsg"></div>
						</div>
					</div>

					<div class="col-md-12 text-center m-t-20">
						<button type="button" class="btn btn-view" id="btnSearch" onclick='getsearchlist();'>Search</button>
						<button type="button" class="btn btn-view" id="btnNew" >New</button>
						<button type="button" class="btn btn-view" id="btnReset" >Reset</button>
					</div>

				</div>
			</div>
		</form>
		<iframe class="embed-responsive-item" name="frameapproval" id="frameapproval" src="" frameborder="0" width="100%" height="460px"></iframe>
	</div>
</body>
</html>
