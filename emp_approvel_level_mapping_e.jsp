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
    <script type="text/javascript" src="../resources/js/filemovement/emp-approvel-level-mapping.js"></script>
     <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
   
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>
	<script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
	
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />	
	
</head>
 <style>
 	table.tableGrid th {
      background-color: #ffcc33;
      border: 1px solid #439653 !important;
      color:#0c426f;
    }
    .m-b-20{
     margin-bottom:20px;
    }

 
 </style>
 <body onload="getfiletype('${fileid}');getDepartment('');">
 <c:choose>
	<c:when test="${fstatus!='E'}">
		<c:set var="OPT_VALUE" value="${ApplicationConstants.NEW}"></c:set>
		<c:set var="status" value="N"></c:set>
		<c:set var="sel" value=""></c:set>
		<c:set var="orderval" value="1"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="OPT_VALUE" value="${ApplicationConstants.EDIT}"></c:set>
		<c:set var="status" value="E"></c:set>
		<c:set var="sel" value="disabled"></c:set>
		<c:set var="orderval" value="${order}"></c:set>
	</c:otherwise>
</c:choose>



<div class="container-fluid">
   <div id="" class="page-header"><h4>FIle Type Approval Level Mapping</h4></div>
    <form class="form-horizontal" name="empapprovE" id="empapprovE" action="" method="post" autocomplete="off">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">${OPT_VALUE} </h3></div>
			<div class="panel-body">
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label" for="">File Type</label>
							<div class="col-sm-4">
								<select class="form-control" id="filetype" name="filetype"  ${sel} onchange="getdata()">
									<option value="">Select File Type</option>
								</select>
						    </div>
						    <label class="col-sm-2 col-form-label" for="">Department</label>
							<div class="col-sm-4">
								<select class="form-control" id="deptid" name="deptid" onchange="getempid(this.value);">
									<option value="">Select Department</option>
								</select>
						    </div>
						</div>
					</div>
				</div>
 
			  <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label" for="">Order Level</label>
							<div class="col-sm-4">
								<!-- <select class="form-control" id="order" name="order">
									<option value="">Select Order Level</option>
								</select> -->
									<input type="text" class="form-control text-right" id=order name="order" 
									maxlength="2" value="" placeholder=" order level" />
						    </div>
						    <label class="col-sm-2 col-form-label" for="">Employee Name</label>
							<div class="col-sm-4">
								<select class="form-control" id="emp_code" name="emp_code">
									<option value="">Select Employee Name</option>
								</select>
						    </div>
						</div>
					</div>
				</div>

			    <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg1"></div>
					</div>
				</div>


				<div class="col-md-12 text-center m-t-20 m-b-20" >
					<button type="button" class="btn btn-view" id="addRow" >Add</button>
					<button type="button" class="btn btn-view" id="btnReset" >Reset</button>
				</div>
				
				<!--  grid Code -->
				<div id="" style="width:99.6%;height:250px;overflow:scroll;">
				<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid" >
				<tr>
				  <th width="2%" style="text-align:center;">S.No.</th>
				  <th width="5%" style="text-align:center;">Order Level</th>
				  <th width="9%" style="text-align:center;">Employee Name (Code)</th>
				  <th width="7%" style="text-align:center;">Delete</th>
				</tr>
				<tbody id="searchTable" >
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${data}" var="data"> 
				<c:set var="count" value="${count+1}"></c:set>
				<tr>
				<td class="text-center" id="${count}">${count}</td>
				<td class="text-center"><input type="hidden" class="form-control" id="order${count}" value="${data.getOrder()}" >
				<span id="ordername${count}">${data.getOrder()}</span></td>
				<td class="text-center"><input type="hidden" class="form-control" id="mastid${count}" value="${data.getMastid()}">
				<input type="hidden" class="form-control" id="empid${count}" value="${data.getEmp_code()}" >
				<input type="hidden" class="form-control" id="deptid${count}" value="${data.getDeptid()}" readonly="readonly">
					<span id="empname${count}">${data.getEmpname()}</span></td>
				
				<td style="text-align:center;color:RED;cursor:pointer; width:5%; " onclick="deleteRow('${count}')" ">
				<i class="fa fa-trash-o"></i> Delete</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				<!-- <div id="END1" class="dataEntryDiv"></div> -->
				</div>
			  
			    <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg"></div>
					</div>
				</div>

				<div class="col-md-12 text-center m-t-20">
					<input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
					<c:choose>
					 <c:when test="${fstatus=='E'}">
					<button type="button" class="btn btn-view" id="upt" onclick='savedata();'>Update</button>
					<button type="button" class="btn btn-view" id="btnBack" >Back</button>					
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-view" id="sav" onclick='savedata();'>save</button>
					<button type="button" class="btn btn-view" id="searchnew" >Search</button>
					</c:otherwise>
					</c:choose>
					<button type="button" class="btn btn-view"  onclick="resetbtn();" >Reset</button>
					<input type="hidden" name=index id="index" value="${count}">
					<input type="hidden" name=fstatus id="fstatus" value="${status}">
				</div>
				</div>
				</div>
			  
   </form>
   </div>
   </body>
</html>
 