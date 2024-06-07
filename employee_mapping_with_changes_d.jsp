<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 

    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/employee_mapping.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
	<%
		response.setHeader("Cache-Control","no-store");  // HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache");        // HTTP 1.0
		response.setDateHeader ("Expires", -1);        // Prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="../resources/assets/plugins/datepicker/datepicker3.css"  type="text/css">
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
</head>
<style>
	.table > thead > tr > th, .table > tfoot > tr > th {
       border: 1px solid green !important;
    }
	 

 
</style>
<body onload="getfiletype('${fileid}');getDepartment(''); getdeptEmpDesgChecklist('', '', '');">
<c:choose>
	<c:when test="${fstatus!='E'}">
		<c:set var="OPT_VALUE" value="${ApplicationConstants.NEW}"></c:set>
		<c:set var="status" value="N"></c:set>
		<c:set var="sel" value=""></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="OPT_VALUE" value="${ApplicationConstants.EDIT}"></c:set>
		<c:set var="status" value="E"></c:set>
		<c:set var="sel" value="disabled"></c:set>
	</c:otherwise>
</c:choose>


<div class="container-fluid">
   <div id="" class="page-header"><h4 class="hfont">File Type Approval Level Mapping</h4></div>
    <form class="form-horizontal" name="eForm" id="eForm"  method="post" autocomplete="off">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">${OPT_VALUE}</h3></div>
			<div class="panel-body">
			
			   <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">File Type</label>
							  <div class="col-sm-4">
							  	<select class="form-control" id="filetype" name="filetype" ${sel} onchange="getdata(this.value);">
									<option value="">Select File Type</option>
								</select>
						     </div>
					   </div>
				   </div>
				</div>
				
                <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Department</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frm_departmnt" name="frm_departmnt">
									<option value="">Select From Department</option>
							
								</select>
				           </div>
				           <!-- <label class="col-sm-2 col-form-label required-field" for="">To Department</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="todepartmnt" name="todepartmnt">
									<option value="">Select To Department</option>
								</select>
				           </div> -->
				           <label class="col-sm-2 col-form-label required-field" for="">To Department/ To Employee/ To Designation</label>
							<div class="col-sm-4" id="to_design">
								<ul class="form-control" style="height: 200px; padding-top:0px; overflow: auto; 
								border:2px solid #B2BABB; border-radius: 9px !important; list-style-type: none;">															
								</ul>
							</div>				           
					   </div>
				   </div>
				</div>
				
				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Employee Name</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frmempCode" name="frmempCode">
								<!-- onchange="getdeptEmpDesgChecklist('', this.value, '');" -->	
									<option value="">Select From Employee Name</option>
									
								</select>
				           </div>
				           <!-- <label class="col-sm-2 col-form-label required-field" for="">To Employee Name</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="toempCode" name="toempCode">
									<option value="">Select To Employee Name</option>
								</select>
				           </div> -->
					   </div>
				   </div>
				</div>
				       
				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Designation</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frm_design" name="frm_design">
									<option value="">Select From Designation</option>
								</select>
				           </div>
				           <!-- <label class="col-sm-2 col-form-label required-field" for="">To Designation</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="to_design" name="to_design">
									<option value="">Select To Designation</option>
								</select>
				           </div> -->
					   </div>
				   </div>
				</div>
				      
				<br>
				<div class="col-sm-12">
						<div class="row text-center">
							<div class="errmessage" id="errMsg1"></div>
						</div>
					</div>
				
				 <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg"></div>
					</div>
				</div>
				 <div class="col-md-12 text-center m-t-20" style="padding-right:0px;margin-bottom:15px;">
		            <c:choose>
					 <c:when test="${fstatus=='E'}">
					<button type="button" class="btn btn-view" id="saveMappingData" >Update</button>
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-view" id="saveMappingData" >save</button>
					</c:otherwise>
					</c:choose>
		            <button type="button" class="btn btn-view" id="excel">Excel</button>
					<button type="button" class="btn btn-view" id="btnBack">Back</button>
					<button type="button" class="btn btn-view" id="btnReset">Reset</button>
				</div>
				   <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
			</div>
		</div>	
		<input type="hidden" name=index id="index" value="${count}">
		<input type="hidden" name=fstatus id="fstatus" value="${status}">
	    <input type="hidden" name="fileType" id="fileType" value="${fileType}">
		
      </form>
   </div>
  </body>
</html>
 