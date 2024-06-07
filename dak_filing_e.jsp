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
    	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <script type="text/javascript" src="../resources/js/filemovement/dak_employee_mapping.js"></script>
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
</head>
<style>
	.table > thead > tr > th, .table > tfoot > tr > th {
       border: 1px solid green !important;
    }
	 
/* .btn-view {
	    color: #ffffff !important;
	    background-color: #00799A !important;
	    border-color: #687DB4 !important;
	    font-size: 15px !important;
	    box-shadow: 2px 2px 1px #336376 !important;
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;
		}
  */
</style>
<body onload="getfiletype('${fileid}');getDepartment('');getgroups('${fstatus}');">
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
   <div id="" class="page-header"><h4><fmt:bundle basename="filemovement"><fmt:message key="create_and_manage_hierarchy_level.header" /></fmt:bundle>
    <span id="" class="text-right " style="float:right;">
		 <a href="javascript void(0);" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;"> <span>Advance Search</span>
		 	<i class="fa fa-search"></i></a>
		 
	</span>
	
	</h4>
   </div>
    <form class="form-horizontal" name="eForm" id="eForm"  method="post" autocomplete="off">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">${OPT_VALUE}</h3></div>
			<div class="panel-body">
			
			   
				
                <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Department</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frm_departmnt" name="frm_departmnt">
									<option value="">Select From Department</option>
							
								</select>
				           </div>
				           <label class="col-sm-2 col-form-label required-field" for="">To Department</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="todepartmnt" name="todepartmnt">
									<option value="">Select To Department</option>
								</select>
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
									<option value="">Select From Employee Name</option>
									
								</select>
				           </div>
				           <label class="col-sm-2 col-form-label required-field" for="">To Employee Name</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="toempCode" name="toempCode">
									<option value="">Select To Employee Name</option>
								</select>
				           </div>
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
				           <label class="col-sm-2 col-form-label required-field" for="">To Designation</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="to_design" name="to_design">
									<option value="">Select To Designation</option>
								</select>
				           </div>
					   </div>
				   </div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							 <%-- <label class="col-sm-2 col-form-label required-field" for="">File Type</label>
							 <div class="col-sm-4">
							  	<select class="form-control" id="filetype" name="filetype" ${sel} onchange="getdata(this.value);">
									<option value="">Select File Type</option>
								</select>
						     </div> --%>
						     <label class="col-sm-2 col-form-label " for="">Reverse</label>
							 <div class="col-sm-4">
							  	<input type="checkbox" id="rev_emp">
						     </div>
					   </div>
				   </div>
				</div>
				      
				<br>
				<div class="col-sm-12">
						<div class="row text-center">
							<div class="errmessage" id="errMsg1"></div>
						</div>
					</div>
				
			
			 <div class="col-md-12 text-center m-t-20" style="padding-right:0px;margin-bottom:15px;">
					<button type="button" class="btn btn-view" id="addRow" >Add Employee</button>
				</div>	
		<div class="row ">
		<div class="col-xs-12">
		<div class="table-responsive">	
		<table class="table table-striped" class="tableGrid" cellspacing="1" cellpadding="1" width="100%">
		    <thead>
			    <tr style="background-color:cyan;width: 98.5%;border: 1px solid green !important;">
 			    <!--<th style="border-bottom: 1px solid #ffcc33 !important;width:5%"  colspan="2"></th> -->
			        <th style=""  ></th>
			        <th colspan="3">From Employee</th>
			        <th style="width:5%"></th>
			        <th colspan="3">To Employee</th>
			        <th style="" colspan="2"></th>
			    </tr> 
			    <tr style="border: 1px solid green !important;">
			    	<th style="width:5%" >Sr.No.</th> 
			    <!-- 	<th>File Type</th> --> 
				    <th>From Employee Name</th> 
				    <th>From Designation</th> 
				    <th>From Department</th> 
				    <th></th>
				    <th>To Employee Name</th> 
				    <th>To Designation</th> 
				    <th>To Department</th> 
				    <th>Reverse</th> 
				    <th>Remove</th>  
			    </tr>
		    </thead>
		    <tbody id="searchTable">
		      <c:set var="count" value="0"></c:set>
			  <c:forEach items="${data}" var="data"> 
				<c:set var="count" value="${count+1}"></c:set>
				<c:set var="fileType" value="${data.getFiletype()}"></c:set>
				<tr>
				    <td class="text-center" id="${count}">${count}</td>
			        <%-- <td class="text-center"><input type="hidden" class="form-control" id="fileType${count}" value="${data.getFiletype()}" >
						<span id="fileTypeName${count}">${data.getFileTypeName()}</span></td> --%>
					<td class="text-center"><input type="hidden" class="form-control" id="frmempCode${count}" value="${data.getFrom_employee()}">
						<span id="fromEmpName${count}">${data.getFromEmpName()}</span></td>
					<td class="text-center"><input type="hidden" class="form-control" id="frmDesiCode${count}" value="${data.getFrom_designation()}" readonly="readonly">
						<span id="fromDesiName${count}">${data.getFromDesiName()}</span></td>
					<td class="text-center"><input type="hidden" class="form-control" id="frmDeptCode${count}" value="${data.getFrom_department()}" readonly="readonly">
						<span id="fromDeptName${count}">${data.getFromDeptName()}</span></td>
					<td class="text-center"></td>
					<td class="text-center"><input type="hidden" class="form-control" id="toempCode${count}" value="${data.getTo_employee()}">
						<span id="toEmpName${count}">${data.getToEmpName()}</span></td>
					<td class="text-center"><input type="hidden" class="form-control" id="toDesiCode${count}" value="${data.getTo_designation()}" readonly="readonly">
						<span id="toDesiName${count}">${data.getToDesiName()}</span></td>
					<td class="text-center"><input type="hidden" class="form-control" id="toDeptCode${count}" value="${data.getTo_department()}" readonly="readonly">
						<span id="toDeptName${count}">${data.getToDeptName()}</span></td>
					<td class="text-center"><input type="hidden" class="form-control" id="rev_emp${count}" value="${data.getRev_emp()}" readonly="readonly">
					  <c:if test="${data.getRev_emp()=='Y'}">
			     	    <span>Yes</span>
			          </c:if>
				      <c:if test="${data.getRev_emp()=='N'}">
						<span>No</span>
			          </c:if>
					</td>
					<td style="text-align:center;color:RED;cursor:pointer; width:5%; " onclick="deleteRow(${count},'${data.getFiletype()}','${data.getFileId()}')">
					<i class="fa fa-trash-o"></i> Delete</td>
				</tr>
			  </c:forEach>
		    </tbody>    
		</table>
		</div>
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
					<button type="button" class="btn btn-view" id="btnBack">Back</button>
					
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-view" id="saveMappingData" >save</button>
					</c:otherwise>
					</c:choose>
		            <button type="button" class="btn btn-view" id="excel">Excel</button>
					<button type="button" class="btn btn-view" id="btnReset">Reset</button>
				</div>
				   <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
			</div>
		</div>	
		<input type="hidden" name=index id="index" value="${count}">
		<input type="hidden" name=fstatus id="fstatus" value="${status}">
	    <input type="hidden" name="fileType" id="fileType" value="${fileType}">
	    <input type="hidden" name="fr_dept" id="fr_dept" value="${fr_dept}">
	    <input type="hidden" name="fr_emp" id="fr_emp" value="${fr_emp}">
	    <input type="hidden" name="fr_des" id="fr_des" value="${fr_des}">
		
      </form>
      <form class="form-horizontal" name="frmefillingD" id="frmefillingD" action="" method="post" autocomplete="off" target="">
       <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
	     <div class="modal-dialog modal-lg">
		  <div class="modal-content">
			<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red;opacity: 1;">×</button></div>
			  <div class="modal-body">
			   <div class="panel panel-default">
                <div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div>
     			<div class="panel-body">
		<!-- -------------------------------Write content inside this modal------------------------------------------- -->
			   <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label " for="">From Department</label>
							<div class="col-sm-4" >
								<select class="form-control" id="Xfrm_departmnt" name="Xfrm_departmnt">
									<option value="">Select From Department</option>
							
								</select>
				           </div>
				           <label class="col-sm-2 col-form-label " for="">To Department</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="Xtodepartmnt" name="Xtodepartmnt">
									<option value="">Select To Department</option>
								</select>
				           </div>
					   </div>
				   </div>
				</div>
		    
			 <div class="col-md-12 text-center">
				<button type="button" class="btn btn-view" id="btnSearch" data-dismiss="modal" onclick="getsearchlist();">Search</button>
				<button type="button" class="btn btn-view" id="xxbtnReset" onclick="">Reset</button> 				
			 </div>
			<!-- -------------------------------End Here (Write content inside this modal)------------------------------------------- -->
			</div> <!-- End of panal body    -->
			</div> <!-- End of panal default -->
		    </div> <!-- End of modal body    -->	 
			</div> <!-- End of modal content -->
		</div>     <!-- End of modal-dialog  -->
	 </div> <!-- End of modal class/id at which modal will be open -->
	
	</form>
	<iframe class="embed-responsive-item"  onload="resizeIframe(this);" name="btmefillingl" id="btmefillingl"  width="100%;"
	  height="" src="" frameborder="0" scrolling="no"></iframe>
	 
   </div>
  </body>
   <script type="text/javascript">
	  function resizeIframe(iframe) {
		    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
		    window.requestAnimationFrame(() => resizeIframe(iframe));
	    };
	  </script>
</html>
 