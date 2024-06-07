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
    <script type="text/javascript" src="../resources/js/filemovement/dak_movement_report.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
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
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="../resources/assets/plugins/datepicker/datepicker3.css"  type="text/css">
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
  <script type="text/javascript">
	$(document).ready(function() {
		$("#XSTARTDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#XSTARTDATE").datepicker("setDate", 'today');
		}).on('clearDate', function(selected) {
		});
		$("#XENDDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		}).on('click', function() {
			$("#XENDDATE").datepicker("setDate", 'today');
		}).on('clearDate', function(selected) {
		});

	});
	 
</script>
<style>

</style>
 </head>
   <body onload="load(); serachnew();">
	   <div class="container-fluid">
		  <div class="page-header" id="ftitleHeader">
			 <div class="row">
				<div class="col-sm-12">
					<h4 class="hfont">DAK Movement Report</h4>
				</div>
			</div>
		</div>

 <form class="form-horizontal" name="filereport" id="filereport" method="post" autocomplete="off">
   <div class="panel panel-default">
		 <div class="panel-heading">
			 <h3 class="panel-title text-right" >${ApplicationConstants.SEARCH}</h3>
		  </div>
				
	 <div class="panel-body">
	    <div><br></div>
	    
	      <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label required-field" for="">Received / Sent</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="rec_sent" name="rec_sent" >
								 <option value="">Select Received / Sent</option>
				   				  <!-- <option value="2">All</option>  -->
				   				 <option selected="selected" value="1">Received </option>
							     <option value="0">Sent</option> 
							    
				            </select>
				         </div>
				         <label class="col-sm-2 col-form-label " for="subject">Manual Dak No.</label>
						<div class="col-sm-4">																			
						<input type="text" class="form-control" id="Mfile_no" name="Mfile_no"  placeholder="Enter Manual File No." >
						</div>
					</div>
		        </div>
		    </div> 
	    
		   <!--  <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label" for="">From Department</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="fromDeprtmnt" name="fromDeprtmnt" onblur="getToEmployee();">
								<option value="">Select From  Department</option>
				            </select>
				         </div>
				         <label class="col-sm-2 col-form-label" for="">To Department</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="toDeprtmnt" name="toDeprtmnt" onblur="getToEmployee();">
								<option value="">Select To Department</option>
				            </select>
				         </div>
					</div>
		        </div>
		    </div>  -->
		    
		 <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label" for="">From Employee</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="frmEmp" name="frmEmp">
								 <option value="">Select From Employee</option>
				            </select>
				         </div>
				         <label class="col-sm-2 col-form-label" for="">To Employee</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="toEmp" name="toEmp" >
								 <option value="">Select To Employee</option>
				   				
				            </select>
				         </div>
					</div>
		        </div>
		   </div> 
		   
		   <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label" for="">From Designation</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="frmdes" name="frmdes">
								 <option value="">Select From Designation</option>
				            </select>
				         </div>
				         <label class="col-sm-2 col-form-label" for="">To Designation</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="todes" name="todes" >
								 <option value="">Select To Designation</option>
				   				
				            </select>
				         </div>
					</div>
		        </div>
		   </div> 
	
		<div class="form-group">
		 <div class="col-md-12">
			<div class="row">
    		   <label for="startDate" class="col-sm-2 col-form-label" for="msg-XSTARTDATE">From Date</label>
     			  <div class="col-sm-4">
				      <div class="input-group date" id="msg-XSTARTDATE">
							<div class="input-group-addon">
							 <i class="fa fa-calendar"></i>
							</div>
							<input readonly="readonly" data-field-id="" type="text" class="form-control datecalendar from_date" 
							id="XSTARTDATE" name="XSTARTDATE" placeholder="DD/MM/YYYY" value="" onclick="calender(this);">
					   </div>
				    </div>
				     <label for="startDate" class="col-sm-2 col-form-label" for="msg-XENDDATE">To Date</label>
     			  <div class="col-sm-4">
				      <div class="input-group date" id="msg-XENDDATE">
							<div class="input-group-addon">
							 <i class="fa fa-calendar"></i>
							</div>
							<input readonly="readonly" data-field-id="" type="text" class="form-control datecalendar from_date" 
							id="XENDDATE" name="XENDDATE" placeholder="DD/MM/YYYY" value=""  onclick="calender(this);">
					   </div>
				    </div>
              </div>
          </div>
     </div>
         
     		   <div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage" id="errMsg"></div>
			 	  </div>
		       </div>
	          <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnSearch" >Search</button>
				     <button type="button" class="btn btn-view" id="btnReset" >Reset</button>
				    <!--  <button type="button" class="btn btn-view" id="" >Print</button> -->					
				   </div>
			     </div>
			  </div>
		    </div><!-- END OF PANEL BODY -->
	       <script type="text/javascript" src="../assets/plugins/datepicker/bootstrap-datepicker.js"></script>  
	      </div><!-- End panel-body -->
	      <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
	   		<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
	   		<input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	   		<input type= "hidden" id="dptid" name="dptid" value='<%=dept_id %>'>
	   		<input type= "hidden" id="fmsdpt" name="fmsdpt">
	   		<input type= "hidden" id="todpt" name="todpt">
	   		<input type="hidden" name="file_status" id="file_status" >
        </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" onload="resizeIframe(this)" name="frmfilemovement" id="frmfilemovement" width="100%;" height="" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
  <script type="text/javascript">
  function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame() = resizeIframe(iframe);
  }
  </script>
</html>
    