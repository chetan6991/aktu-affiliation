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
 	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/summary_of_file.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
   	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script> -->
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<style type="text/css">
.modal-header{
	    margin-top: -35px;
	    margin-right: -10px;
	    color: red;
	}
.close {
    opacity: 1 !important;
    color: red !important;
    padding-right: 10px;
}

	.Highlight {
        background-color: #1c87c9;
        -webkit-border-radius: 60px;
        border-radius: 60px;
        border: none;
        color: #eeeeee;
        cursor: pointer;
        display: inline-block;
        font-family: sans-serif;
        font-size: 20px;
        padding: 5px 15px;
        text-align: center;
        text-decoration: none;
      }
      @keyframes glowing {
        0% {
          background-color: #2ba805;
          box-shadow: 0 0 5px #2ba805;
        }
        50% {
          background-color: #49e819;
          box-shadow: 0 0 20px #49e819;
        }
        100% {
          background-color: #2ba805;
          box-shadow: 0 0 5px #2ba805;
        }
      }
      .Highlight {
        animation: glowing 1300ms infinite;
      }

</style>
</head>
<body onload="getEFDetailChart(${create}, ${received}, ${pending}, ${sent});">
	 <div class="container-fluid">
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">
					<h4>File Detail(s)</h4>
				</div>
			</div>
		</div>
<form class="form-horizontal" name="" id="" method="post" autocomplete="off">
	<div class="panel panel-default">
	<div class="panel-heading"><h3 class="panel-title text-right" >${ApplicationConstants.SEARCH}</h3></div>
	<div class="panel-body">
		<div><br></div>
		<div id="header" style="display: none;">
 			<div class="modal-header">
				<button type="button" class="close cross" id="hide_tab">×</button>
			</div>
 		</div>
		
		<div id="detailViewC" style="display: none;">
	 			<table id="searchTable" class="table table-striped table-bordered table-hover display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align:center;width:2%;">S.No</th>
					  	<th style="text-align:center;width:8%;">File No. ~ Subject</th>
					</tr>
				</thead>
				<tbody id ="detailTable">
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${FILE_CREATED_DETAIL}" var="createList"> 
					<c:set var="count" value="${count+1}"></c:set>
						<tr>
							<td class="text-center">${count}</td>
							<td class="text-center">${createList}</td>
						</tr> 
					</c:forEach>
				</tbody>
				</table>
			</div>
			
			<div id="detailViewR" style="display: none;">
				<table id="searchTable" class="table table-striped table-bordered table-hover display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align:center;width:2%;">S.No</th>
					  	<th style="text-align:center;width:8%;">File No. ~ Subject</th>
					</tr>
				</thead>
				<tbody id ="detailTable">
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${FILE_RECV_DETAIL}" var="recvList"> 
					<c:set var="count" value="${count+1}"></c:set>
						<tr>
							<td class="text-center">${count}</td>
							<td class="text-center">${recvList}</td>
						</tr> 
					</c:forEach>
				</tbody>
				</table>
			</div>
			
			<div id="detailViewP" style="display: none;">
				<table id="searchTable" class="table table-striped table-bordered table-hover display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align:center;width:2%;">S.No</th>
					  	<th style="text-align:center;width:8%;">File No. ~ Subject</th>
					</tr>
				</thead>
				<tbody id ="detailTable">
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${FILE_PEN_DETAIL}" var="penList"> 
					<c:set var="count" value="${count+1}"></c:set>
						<tr>
							<td class="text-center">${count}</td>
							<td class="text-center">${penList}</td>
						</tr> 
					</c:forEach>
				</tbody>
				</table>
			</div>
			
			<div id="detailViewS" style="display: none;">
				<table id="searchTable" class="table table-striped table-bordered table-hover display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align:center;width:2%;">S.No</th>
					  	<th style="text-align:center;width:8%;">File No. ~ Subject</th>
					</tr>
				</thead>
				<tbody id ="detailTable">
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${FILE_SENT_DETAIL}" var="sentList"> 
					<c:set var="count" value="${count+1}"></c:set>
						<tr>
							<td class="text-center">${count}</td>
							<td class="text-center">${sentList}</td>
						</tr> 
					</c:forEach>
				</tbody>
				</table>
			</div>
		
		<div class="form-group">
	  		<div class="col-md-12">
	        	<div class="row">
					<label class="col-sm-3 col-form-label" for="">
						<b style="font-size: 15px;">Total Created</b> : 
						<c:if test="${create ne 0}"><a id="create" onclick="showTable('C');" style="font-size: 20px; color: #f10a0a;">${create}</a></c:if>
						<c:if test="${create eq 0}"><i class="fa fa-times" aria-hidden="true" style="font-size: 25px; color: red;"></i></c:if>
					</label>
					
					<label class="col-sm-3 col-form-label" for="">
						<b style="font-size: 15px;">Total Received (Read)</b> : 
						<c:if test="${received ne 0}"><a id="received" onclick="showTable('R');" style="font-size: 20px; color: #31ed37;">${received}</a></c:if>
						<c:if test="${received eq 0}"><i class="fa fa-times" aria-hidden="true" style="font-size: 25px; color: red;"></i></c:if>
					</label>
					
					<label class="col-sm-3 col-form-label" for="">
						<b style="font-size: 15px;">Total Pending (Un-Read)</b> :
						<c:if test="${pending ne 0}"><a id="pending" onclick="showTable('P');" style="font-size: 20px; color: #fdbd00;">${pending}</a></c:if>
						<c:if test="${pending eq 0}"><i class="fa fa-times" aria-hidden="true" style="font-size: 25px; color: red;"></i></c:if>
					</label>
					
					<label class="col-sm-3 col-form-label" for="">
						<b style="font-size: 15px;">Total Send</b> : 
						<c:if test="${sent ne 0}"><a id="sent" onclick="showTable('S');" style="font-size: 20px; color: #220d;">${sent}</a></c:if>
						<c:if test="${sent eq 0}"><i class="fa fa-times" aria-hidden="true" style="font-size: 25px; color: red;"></i></c:if>
					</label>
				</div>
			</div>
			</div>
		
		<br>
		<div class="col-sm-12" >
		    <!-- <div class="box message-p" id="chartContainer"></div> -->
		    <div id="chartContainer" style="height: 300px; width: 100%;"></div>
		</div>
		    
	    <div class="col-sm-12">
		  <div class="row text-center">
		      <div class="errmessage"  id="errMsg"></div>
		  </div>
       </div>
	
	</div>
	</div>
</form>        
<!-- <iframe class="embed-responsive-item" name="" id="" width="100%;" height="460px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;"></iframe> -->  
</div> <!-- End container-fluid -->
</body>
</html>