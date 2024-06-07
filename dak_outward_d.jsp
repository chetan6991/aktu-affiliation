<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
 	
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/dak-outward.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
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
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#FROMDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#FROMDATE").datepicker("setDate", 'today');
		}).on('clearDate', function(selected) {
		});
		
		$("#TODATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#TODATE").datepicker("setDate", 'today');
		}).on('clearDate', function(selected) {
		});
	});
</script> 
<style>

</style>
</head>
<body onload="getEmployeeForSearch(); serachnew(); getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${fromdesgn}');">
	<div class="container-fluid">
	<div id="ftitleHeader" class="page-header"><h4>DAK Outward</h4></div>
	<form class="form-horizontal" name="fileoutward" id="fileoutward" target="_Report" method="post" autocomplete="off">
	
		<div class="panel panel-default">
			<div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.SEARCH}</h3></div>	
				<div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
		    
		    <div class="panel-body">	 
		 	 	<div class="form-group">
			       <div class="col-md-12">
			         <div class="row">
			  			<label class="col-sm-2 col-form-label " for="loc"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.emp" /></fmt:bundle></label>
				 			<div class="col-sm-4">
			    				<select class="form-control" id="emp" name="emp" disabled >
							 		<option value="">Select Employee</option>				   				
			            		</select>
				         	</div>
			         	<label class="col-sm-2 col-form-label " for="designation"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.desg" /></fmt:bundle></label>
					 		<div class="col-sm-4">
			    				<select class="form-control" id="desginationid" name="desginationid" disabled >
							 		<option value="">Select Designation</option>
			            		</select>
							</div>
			        	</div>
			        </div>
			    </div> 
		    
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label for="fromDate" class="col-sm-2 col-form-label ">From Date</label>
								<div class="col-sm-4">
									<div class="input-group date" id="msg-FROMDATE">
										<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
										<input type="text" class="form-control datecalendar" id="FROMDATE" name="FROMDATE" placeholder="From Date" />
									</div>
								</div>
							<label for="endDate" class="col-sm-2 col-form-label ">To Date</label>
								<div class="col-sm-4">
									<div class="input-group date" id="msg-TODATE">
										<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
										<input type="text" class="form-control datecalendar" id="TODATE" name="TODATE" placeholder="To Date" />
									</div>
								</div>
						</div>
					</div>
				</div>
	
          		<div class="form-group m-t-25 m-b-5">
	         		<div class="col-md-12 text-center">
			       		<div class="row">
				     		<button type="button" class="btn btn-view" id="btnSearch1" >Search</button>
				     		<button type="button" class="btn btn-view" id="btnNew" >Back</button>
				     		<button type="button" class="btn btn-view" id="btnReset" >Reset</button>					
				   		</div>
			     	</div>
			  	</div>
			  
		    </div>
	      
	      	<input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
	      	<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
	      	<input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	      	<input type="hidden" id="doclen" value="20">
	      	<input type="hidden" id="doctyp" value="MB">
		
		</div><!-- End panel-body -->
		
	</form><!-- End panel-default -->
    <iframe class="embed-responsive-item" name="_Report" id="_Report" width="100%;" height="520px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;"></iframe>  
	</div> <!-- End container-fluid -->
</body>
</html>