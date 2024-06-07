<%@include file="../myCks.jsp"%> 
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
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
    <script type="text/javascript" src="../resources/js/filemovement/inbox_file_search.js"></script>
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
 <script type="text/javascript">
	$(document).ready(function() {
		$("#XSTARTDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#XSTARTDATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		$("#XENDDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#XENDDATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});

	});
</script>
</head>
 <body onload="getEmployee();serachOnLoad();"> 
<!-- <body onload="getEmployee();"> -->
	 <div class="container-fluid">

		<div class="page-header" id="ftitleHeader">
			<div class="row">

				<div class="col-sm-12">
					<h4><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.header" /></fmt:bundle></h4>
				</div>

			</div>
		</div>

   <form class="form-horizontal" name="file_inward" id="file_inward" target="" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" >${ApplicationConstants.SEARCH}</h3>
				</div>
				<div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
	 <div class="panel-body">
		    <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label " for="employee"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.emp" /></fmt:bundle></label>
						 <div class="col-sm-4">
						 <select  class="form-control" id="employee" name="employee" disabled="disabled">
						 </select>
				    		<!-- <input type="text"   class="form-control" id="employee" name="employee" value="" disabled> -->
								
				         </div>
				         
				         <label class="col-sm-2 col-form-label" for="designation"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle></label>
						 <div class="col-sm-4">
						  <select  class="form-control" id="designation" name="designation" >
						 </select>
				    		<!-- <input type="text" class="form-control" id="dept" name="dept" value="" disabled> -->
								 
				         </div>
				         
				        
					</div>
		        </div>
		    </div> 
		    
		<%--      <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
		             
		              <label class="col-sm-2 col-form-label" for="department"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.departmnt" /></fmt:bundle></label>
						 <div class="col-sm-4">
						  <select  class="form-control" id="dept" name="dept" disabled="disabled">
						 </select>
				    		<!-- <input type="text" class="form-control" id="dept" name="dept" value="" disabled> -->
								 
				         </div>
					   <label class="col-sm-2 col-form-label " for="location"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.loc" /></fmt:bundle></label>
						 <div class="col-sm-4">
						 <select  class="form-control" id="loc" name="loc" disabled="disabled">
						 </select>
				    	 <!-- <input type="text" class="form-control" id="loc" name="loc" value="" disabled> -->
								
				         </div>
					</div>
		        </div>
		    </div>  --%>
		<div class="form-group">
		 <div class="col-md-12">
			<div class="row">
    		   <label for="startDate" class="col-sm-2 col-form-label" for="msg-XSTARTDATE"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.frm_dt" /></fmt:bundle></label>
     			  <div class="col-sm-4">
				      <div class="input-group date" id="msg-XSTARTDATE">
							<div class="input-group-addon">
							 <i class="fa fa-calendar"></i>
							</div>
							<input readonly="readonly" data-field-id=" " type="text" class="form-control datecalendar from_date" id="XSTARTDATE" name="XSTARTDATE" placeholder="Start Date" >
					   </div>
				    </div>
          <label for="endDate" class="col-sm-2 col-form-label"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.to_dt" /></fmt:bundle></label>
        	 <div class="col-sm-4">
			    <div class="input-group date" id="msg-XENDDATE">
					 <div class="input-group-addon">
					   <i class="fa fa-calendar"></i>
					 </div>
				      <input readonly="readonly" data-field-id=" " type="text" class="form-control datecalendar" 
				      id="XENDDATE" name="XENDDATE" placeholder="End Date"  >
				 </div>
			 </div>
          </div>
        </div>
     </div>
         
	          <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnSearch">Search</button>
				     <button type="button" class="btn btn-view" id="btnReset">Reset</button>					
				   </div>
			     </div>
			  </div>
			  
		    </div>
	     
	     <input type= "hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
	     <input type="hidden" name="emp_id" id="eid" value="${sessionScope.employee_id}"> 
	     <input type="hidden" name="depratment_id" id="depratment_id" value="${sessionScope.depratment_id}"> 
	     <input type="hidden" name="desgination_id" id="desgination_id" > 
	      </div><!-- End panel-body -->
	      
	      
        </form><!-- End panel-default -->
      <iframe class="embed-responsive-item" name="frm_file_inward_l" id="frm_file_inward_l" width="100%;" height="500px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
</html>
    