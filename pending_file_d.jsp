<%@include file="../myCks.jsp"%>
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
    <script type="text/javascript" src="../resources/js/filemovement/pending_file.js"></script>
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
</head>
 <body onload="getToEmployee('<%= employee_id%>','<%= user_status%>');">
	 <div class="container-fluid">
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">
					<h4>Pending File Report</h4>
				</div>
			</div>
		</div>
   <form class="form-horizontal" name="pendingfile" id="pendingfile" method="post" autocomplete="off">
	  <div class="panel panel-default">
		 <div class="panel-heading">
		   <h3 class="panel-title text-right" >New</h3>
		 </div>
	 <div class="panel-body">
	 <div><br></div>
		<div class="form-group">
		 <div class="col-md-12">
			<div class="row">
    		   <label for="" class="col-sm-2 col-form-label" for="msg-XSTARTDATE">From Date</label>
     			  <div class="col-sm-4">
				      <div class="input-group date" id="msg-XSTARTDATE">
							<div class="input-group-addon">
							 <i class="fa fa-calendar"></i>
							</div>
							<input readonly="readonly" data-field-id="" type="text" class="form-control datecalendar from_date" 
							id="XSTARTDATE" name="XSTARTDATE" placeholder="DD/MM/YYYY" value="" onclick="calender(this);" >
					   </div>
				    </div>
				     <label for="" class="col-sm-2 col-form-label" for="msg-XENDDATE">To Date</label>
     			  <div class="col-sm-4">
				      <div class="input-group date" id="msg-XENDDATE">
							<div class="input-group-addon">
							 <i class="fa fa-calendar"></i>
							</div>
							<input readonly="readonly" data-field-id=" " type="text" class="form-control datecalendar from_date" 
							id="XENDDATE" name="XENDDATE" placeholder="DD/MM/YYYY" value="" onclick="calender(this);">
					   </div>
				    </div>
              </div>
          </div>
     </div>
      <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label" for="">Employee</label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="employee" name="employee" >
								 <option value="">All</option>
				   				 
				            </select>
				         </div>
					</div>
		        </div>
		    </div> 
               <div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
	          <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnSearch" >Search</button>
				     <button type="button" class="btn btn-view" id="btnReset" >Reset</button>
				  <!--    <button type="button" class="btn btn-view" id="" >Print</button> -->					
				   </div>
			     </div>
			  </div>
		    </div><!-- END PANEL BODY -->
	       <script type="text/javascript" src="../assets/plugins/datepicker/bootstrap-datepicker.js"></script>  
	      </div><!-- End panel-body -->
	       <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
	   		<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
	   		<input type="hidden" name="eid" id="eid" >
	   		<input type="hidden" name="loct_id" id="loct_id" value="<%=loct_id%>">
	   		<input type="hidden" name="design" id="design" value="">
        </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="frmpendingfile" id="frmpendingfile" width="100%;" height="460px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
</html>
    