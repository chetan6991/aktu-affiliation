<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="com.sits.fms.file_creation.FileCreationManager"%>
<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
  	  	
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>  	
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>   	
    <script type="text/javascript" src="../resources/js/filemovement/block_inspect.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/file_creation.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>	
	<script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
	<!--Include the JS & CSS-->
	<link href="../resources/assets/plugins/richtexteditor/rte_theme_default.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="../resources/assets/plugins/richtexteditor/rte.js"></script>
	<script type="text/javascript" src='../resources/assets/plugins/richtexteditor/plugins/all_plugins.js'></script>	
		
	<%
		response.setHeader("Cache-Control","no-store"); // HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="../resources/assets/plugins/datepicker/datepicker3.css" type="text/css">
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
</head> 
<style>
.col-form-label{
	padding: 0 10px 0 10px;
 }
 .panel-title > a:before {
    float: right !important;
    font-family: FontAwesome;
    content:"\f068";
    padding-right: 5px;
	}
 .panel-title > a.collapsed:before {
    float: right !important;
    content:"\f067";
  }

 
 	table.tableGrid th {
      background-color: #583b24;
	  border: 1px solid #439653 !important;
	  color: #fff !important;
	  font-size: 13px;
    }
    .m-b-20{
     margin-bottom:20px;
    }
    .chkAlign{
		margin: 5px 0 0 !important;
		margin-right: 5px !important;
	  }
	  
	 @media screen and (min-width: 500px) {
        .modal-lg {
          width: 500px; /* New width for large modal */
        }
    }
    
     @media screen and (min-width: 500px) {
        .modal-preview {
          min-width: 1050px !important; /* New width for large modal */
        }
    }
   
    .modal-header .close {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
	
	.modal-header .cross {
    	margin-top: 0px;
 	}
	.vl {
		border-left: 2px solid black;
		min-height: 400px;
		margin-left:111px;
		margin-top: -130px;
		border-right: 2px solid black;
		min-height: 400px;
		margin-right:111px;
	}
	.datNo{margin-top: -45px;}
	.vl1 {
		/* border-left: 2px solid black; */
		min-height: 400px;
		margin-left:10px;
	}
	.m-4{margin: 4px 0px;}
	 hr{border-top: 2px solid #a59f9f;}
 </style>
 <script type="text/javascript">
 function callModal(type,note){
	    if(type == "C"||type == "L"){
			$("#viewPreview1").modal();
	    	$("#previewNote1").html(note);
		}else{
			 $("#viewPreview").modal();
			 $("#previewNote").html(note);
		}
   }
 </script>
 
<c:if test="${(fstatus=='N')}">
	<c:set var="ds"  value="<%=desg_id %>"/>
</c:if>
<c:if test="${(fstatus=='E')}">
	<c:set var="ds"  value="${recordList.getDesginationid()}"/>
</c:if>


<body onload="getlocation('<%=loct_id %>'); getDepartment('<%=loct_id %>','<%=dept_id %>'); getEmployee('N'); findDate(); 
serachpage('${fstatus}','${filet}'); getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${ds}','${recordList.getToemp()}'); 
getscroler('${divsize}');" >

	<div class="container-fluid">
        <div id="ftitleHeader" class="page-header"><h4 class="hfont"> <fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.header" /></fmt:bundle></h4></div>
		<form class="form-horizontal" name="file_creation" id="file_creation" target="" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="panel panel-default">
   
	<c:choose>
		<c:when test="${fstatus=='E'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.EDIT}</h3></div></c:when>
		<c:when test="${fstatus=='N'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.NEW}</h3></div></c:when>
		<c:otherwise><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.SEARCH}</h3></div></c:otherwise>
	</c:choose>									

	 <c:if test="${(fstatus=='N') || (fstatus=='E')}">
		<c:set var="req"  value="required-field"/>
	 </c:if>
	      
<div class="panel-body">   
<%-- <c:if test="${(fstatus eq 'N') or (fstatus eq 'E')}"> --%>
	<c:if test="${(fstatus=='N') || (fstatus=='E')}">
	<div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label for="sector" style="font-size: large; font-weight: bold; color: black;" class="col-sm-8 col-form-label">
					NOTE : <font color="red">You can create FILE with/without upload your signature!</font>
				</label>
			</div>
  		</div>
  	</div>
  	</c:if>
<div class="form-group">
	<div class="col-md-12">
		<div class="row">
		    <label class="col-sm-2 col-form-label " for="">Document Type</label>
			<div class="col-sm-4" id="AppType">
				<!-- <input type="radio" id="AppTypeD" value="D" checked="checked" name="AppType">&nbsp;File Draft
				&nbsp;&nbsp; -->
				<input type="radio" class="xfl" id="AppTypeF" value="F" checked="checked" name="AppType">&nbsp;File 			
				&nbsp;&nbsp;
				<input type="radio" class="xfl" id="AppTypeL" value="L" name="AppType">&nbsp;Letter
				&nbsp;&nbsp;
				<input type="radio" class="xfl" id="AppTypeC" value="C" name="AppType">&nbsp;Circular/Notice
			</div>
			
			<c:if test="${(fstatus=='N') || (fstatus=='E')}">
				<div class="col-sm-6">
					<h3 class="panel-title text-left" ><%-- ${ApplicationConstants.SEARCH} --%>
						<a id="collapseHead_1" class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseBody_1" aria-expanded="true" aria-controls=""></a>
					</h3>
				</div>
			</c:if>
			
		</div>
	</div>
</div>

<c:if test="${(fstatus=='N') || (fstatus=='E')}">

 <div class="" style="margin-bottom:10px;border: unset !important;">
           <div id="collapseBody_1" class="panel-collapse collapse">
           <div class="" style="border-color: #439653 !important;">
           
	<div class="form-group">
	<div class="col-md-12">
		<div class="row">
																		
		<label class="col-sm-2 col-form-label " for="fileID"  ><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.id" /></fmt:bundle></label>
			<div class="col-sm-4"> 
			
			<c:if test="${(fstatus=='E')}"> 
				<input type="text" class="form-control" id="fileID" name="fileID"  value="${recordList.getFile_group_id()}" placeholder="" disabled >
			</c:if>	
			
			<c:if test="${(fstatus=='N')}">
				<input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter File/Circular/Notice No." value="${fileId}"  disabled>
			</c:if>
			
			<c:if test="${(fstatus!='N') && (fstatus!='E')}">
				<input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter File/Circular/Notice No." >
			</c:if>
			
			</div> 
			
			<label for="location"  class="col-sm-2 col-form-label required-field" >Location</label>
      		<div class="col-sm-4" >
	      		<select class="form-control" id="location_id" name="location_id" disabled onchange="getDepartment(this.value,'');getDepartmentcheckbox(this.value,'');">
		      		<option value="">Select Location</option>
		      	</select>
	      	</div>
	      	</div>
	      	</div>
	      	</div>
	      	
	 <div class="form-group">
	<div class="col-md-12">
		<div class="row">				       														
		<label class="col-sm-2 col-form-label" for="createdBy"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtdby" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<select   class="form-control" id="createdBy" name="createdBy" disabled >
				<option value=""></option>
				</select>		
				</div>
	      	<label class="col-sm-2 col-form-label required-field" for="">From Department</label>
		<div class="col-sm-4" >
			<select class="form-control" id="frm_departmnt" name="frm_departmnt" disabled>
				<option value="">Select From Department</option>
		
			</select>
           </div>
		 </div><!-- End panel-body -->
	     </div><!-- End Acordian-->
	     </div><!-- End panel-default -->
		
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">		
				    														
      		 <label class="col-sm-2 col-form-label " for="department"><fmt:bundle basename="filemovement">
			<fmt:message key="file_creation_master.designation" /></fmt:bundle></label>
				<div class="col-sm-4">		
					<select  class="form-control" id="desginationid" name="desginationid" ></select>																	
				</div>														
					<label for="startDate" class="col-sm-2 col-form-label ${req}" ><fmt:bundle basename="filemovement">
		       <fmt:message key="file_creation_master.crtn_date" /></fmt:bundle></label>
		       <div class="col-sm-4">
		       <div class="input-group date" id="msg-XSTARTDATE">
		       <div class="input-group-addon">
		       <i class="fa fa-calendar"></i></div>
		       <input readonly="readonly" data-field-id=" " type="text" class="form-control datecalendar from_date" 
		         id="crtn_date" name="crtn_date" placeholder="Creation Date" value="" disabled="disabled" >
		      </div>
		      </div>	 
				 
	  			</div>
      		</div>
		</div> 
		
		</div>
		</div>
</div>

</c:if>
<!-- <hr style="border-top: 1px solid #aeceb4;"> -->


<div class="form-group">
	<div class="col-md-12">
		<div class="row">
			 <c:if test="${(fstatus!='N') && (fstatus!='E')}">
			 <label class="col-sm-2 col-form-label " for="fileID"  ><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.id" /></fmt:bundle></label>
			  <div class="col-sm-4"> 
			     <input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter File/Circular/Notice No." >
			 </div>
			 </c:if>
			
 																			
		<label class="col-sm-2 col-form-label ${req}" for="manualfileNo">
		<%-- <fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.man_no" /></fmt:bundle> --%>
		<span id="manFn">File No.</span>
		</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="manualfileNo" name="manualfileNo"  value="${recordList.getManual_file_id()}${fileId}" placeholder="Enter No." >
			</div>	
			
		  <c:if test="${(fstatus=='N') || (fstatus=='E')}">
		 <label class="col-sm-2 col-form-label ${req}" for="subject"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<input type="text" class="form-control" id="subject" name="subject"  value="${recordList.getSubject()}" placeholder="Subject" >
			</div> 
		</c:if>
		</div>
	</div>
</div>  
   
   	<c:choose>
   <c:when test="${(fstatus=='N')||(fstatus=='E')}"> 
      
  <div class="form-group" style="display:none">
	<div class="col-md-12">
		<div class="row">				       														
		
				<div id="hidetype" >
			<label class="col-sm-2 col-form-label ${req}" for="file type">
			<fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.filetype" /></fmt:bundle></label>
			<div class="col-sm-4">		
			<select  class="form-control" id="file_type" name="file_type">
					<option value="">Select File type</option>
					<c:forEach items="${filetype}" var="filetype">
					<c:choose>
						<c:when test="${recordList.getFile_type()==filetype.getDropid()}">
							<c:set var="sel" value="selected"></c:set>
						</c:when>
					<c:otherwise>
							<c:set var="sel" value=""></c:set>
					</c:otherwise>
					</c:choose>
	  			<option value="${filetype.getDropid()}" ${sel}>${filetype.getDropvalue()}</option>
	  			</c:forEach>
				</select>																	
				</div> 
				</div>
				
	<label class="col-sm-2 col-form-label ${req} " for="action"><fmt:bundle basename="filemovement">
		<fmt:message key="file_creation_master.action" /></fmt:bundle></label>
			<div class="col-sm-4">		
			<select  class="form-control" id="action" name="action">
				<option value="">Select Action</option>
				<c:forEach items="${action}" var="action">				
				<c:choose>
						<c:when test="${recordList.getAction()==action.getDropid()}">
							<c:set var="sel" value="selected"></c:set>
						</c:when>
					<c:otherwise>
							<c:set var="sel" value=""></c:set>
					</c:otherwise>
					</c:choose>
	  			<option value="${action.getDropid()}" ${sel}>${action.getDropvalue()}</option>
	  			</c:forEach>
	  			</select>
	  		</div> 
				
				
				<div id="hidegroup" style="display:none">
			<label class="col-sm-2 col-form-label ${req}"> Group</label>
			<div class="col-sm-4">		
			   <select  class="form-control" id="group_type" name="group_type">
					<option value="">Select Group </option>
					<c:forEach items="${grouptype}" var="grouptype">
						<c:choose>
							<c:when test="${recordList.getGroup_type()==grouptype.getDropid()}">
								<c:set var="sel" value="selected"></c:set>
							</c:when>
							<c:otherwise>
									<c:set var="sel" value=""></c:set>
							</c:otherwise>
						</c:choose>
			  			  <option value="${grouptype.getDropid()}" ${sel}>${grouptype.getDropvalue()}</option>
		  			</c:forEach>
				</select>																	
			 </div> 
		  </div>
		</div>
	</div>
</div> 
      
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">		
				    											
					<label class="col-sm-2 col-form-label ${req}" for="action"><fmt:bundle basename="filemovement">
						<fmt:message key="file_creation_master.priority" /></fmt:bundle>
					</label>
					<div class="col-sm-4">		
						<select  class="form-control" id="priority" name="priority" >
						<option value="">Select Priority</option>
	        			<c:forEach items="${priority}" var="priority">
	        				<c:choose>
								<c:when test="${recordList.getPriority()==priority.getDropid()}">
									<c:set var="sel" value="selected"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="sel" value=""></c:set>
								</c:otherwise>
							</c:choose>
	  						<option value="${priority.getDropid()}" ${sel}>${priority.getDropvalue()}</option>
	  					</c:forEach>
						</select>																			
					</div>
					<div id="showhideletter">
					<c:if test="${dak_list_size ne 0}">
					<label class="col-sm-2 col-form-label" for="dakNo">Letter No.</label>
						<div class="col-sm-4">
						<ul class="form-control" style="height: 85px; padding-top:0px; overflow: auto; 
						border: 1px solid #B2BABB; border-radius: 9px !important; list-style-type: none;">						
							<c:set var="count" value="0"></c:set>				
		        			<c:forEach items="${DAK_NO}" var="dak">
		        			<c:set var="count" value="${count+1}"></c:set>
		        			
		        			<c:set var="sel" value=" "></c:set>
		        			<c:if test="${dak.getFlag().equals('Y')}">
		        				<c:set var="sel" value="checked"></c:set>
		        			</c:if>
		        			
		  						<li><input type="checkbox" class="chkAlign" id="dakId_${count}" name="dakId_${count}" value="${dak.getDakId()}" ${sel}>${dak.getDakName()}</li>								
		  					</c:forEach>
	  					</ul>
					</div>
					</c:if>
					</div>
	  			</div>
      		</div>
		</div>    
        
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="fundtype" class="col-sm-2 col-form-label ${req}">
							<fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.note" /></fmt:bundle>
						</label>
						
						<div class="col-sm-10">
							<textarea id="XDESCRIPTION" name="XDESCRIPTION">${recordList.getNote()}</textarea>
						</div>
					</div>
				</div>
			</div>
      <div class="panel panel-default">
<div class="panel-heading"><h3 class="panel-title text-left">Attached File Details</h3></div>
<div class="panel-body" style="padding: 6px 14px;">


			<div id="dydiv" style="width:100%;overflow: auto;">
      		   <!-- <div class="col-md-6"> -->
				<div id="" style="padding:8px 0px;display:flex;width:100%;">
				<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid" >
				<tr>
				  <!-- <th width="9%" style="text-align:center;">Document Title</th> -->
				  <th width="9%" style="text-align:center;">Document Type</th>
				  <th width="9%" style="text-align:center;">Document No.</th>
				  <th width="15%" style="text-align:center;">Upload Document
				  	<span class="" style="font-size: 13px !important; font-weight: bold; color: red;">(Max. Size Cannot Exceed ${value}${ext}) (Note: Only .pdf, .jpg, .png, & doc files will be allowed for uploading)</span>
				  </th>
				  <th width="20%" style="text-align:center;">File Name</th>
				  <th width="5%" style="text-align:center;">Delete</th>
				</tr>
				<tbody id="searchTable" >
				<c:set var="count" value="0"></c:set>
				<c:if test="${(fstatus=='E')}">
				<c:forEach items="${file}" var="file">
				<c:set var="count" value="${count+1}"></c:set>
				<tr>
				<c:set var="dateParts" value="${fn:split(file.getDoctitle(), '_')}" />
				
				<td>
					<select class="form-control" id="" name="" disabled onchange="getDocTypDetail(this.value, 1);">
						<option value="">${dateParts[0]}</option>
						
					</select>
				</td>
				<td>
					<select class="form-control" id="" disabled name="">
						<option value="">${dateParts[1]}</option>
					</select>
				</td>
				<td>${file.getFilename()}</td>
				
				<td>
					
					<c:if test="${not empty file.getShowPdf() and file.getShowPdf() eq 'Y'}">			 			
						<a onclick="getReport('${file.getAttachmentid()}', '${file.getFilename()}', '${file.getFile_creation_id()}', '');">
							<u>${file.getDoctitle()} (${file.getFilename()})</u>
						</a>							
					</c:if>
					<c:if test="${not empty file.getShowPdf() and file.getShowPdf() eq 'N'}">
						<a target="_blank" href="../downloadfile?filename=${file.getAttachmentid()}_${file.getFilename()}&folderName=${file.getFile_creation_id()}">
							<u>${file.getDoctitle()} (${file.getFilename()})</u>
						</a>
					</c:if>
				</td>
				
				<c:if test="${recordList.getCheckdata()=='N'}">
					<td style="text-align:center;color:RED;cursor:pointer; width:5%; "
						onclick="deleteFile('${file.getAttachmentid()}','${file.getFilename()}', '${file.getFile_creation_id()}',this,'${file.getFilesize()}');">
						<i class="fa fa-trash-o"></i> Delete</td>
				</c:if>
				
				<c:if test="${recordList.getCheckdata()!='N'}">
					<td ></td>
				</c:if>
				
				</tr>
			    </c:forEach>
			    </c:if>
			    <c:if test="${(count==0)}">
			    <tr>
			   
				<input type="hidden" class="form-control" id="hfname1" name="hfname1">
				<input type="hidden" class="form-control" id="fsize1" name="fsize1">
				<!-- </td> -->
				
				<td>
					<select class="form-control" id="doc_typ1" name="doc_typ1" onchange="getDocTypDetail(this.value, 1);">
						<option value="">Select Document Type</option>
						<option value="Flag">Flag</option>
						<option value="Annexure">Annexure</option>
					</select>
				</td>
				<td>
					<select class="form-control" id="doc_typ_no1" name="doc_typ_no1">
						<option value="">Select Document No.</option>
					</select>
				</td>
				
				<td class="text-center">
					<input type="file" id="upldoc1" onchange="sizeChk(1); data(1);" name="upldoc1" class="data">
				</td>
				<td class="text-center"><div id="np1"></div>
				<!-- <input type="hid den" class="form-control" id="docName1" name="docName1" value=""> -->
				</td>
				<td style="text-align:center;color:RED;cursor:pointer; width:5%; " onclick="deletedata(1,this)">
				<i class="fa fa-trash-o"></i> Delete</td>
				</tr>
				</c:if>
 				</tbody>
				</table>
				
				<div class="text-right"style="margin-top:18px;padding:8px;">
				
					<div class="colr-blue-p" id="addmore">
						<c:if test="${view.getIs_to_cc()=='N' }"> disabled="disabled" </c:if>
						<span id="" onClick=""><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span>
					</div>
						
				</div>
				
				</div>
				</div>
				</div>

							<div class="">
								<div class="col-md-12">
									<div class="row" id="">
										<label class="col-sm-2 col-form-label " for="remarks"></label>
										<div class="col-sm-8 text-right m-t-20">
											<div class="errmessage" id="delerrMsg"></div>
										</div>
										
									</div>
								</div>								
							</div>

			<div class="form-group">
				<div class="col-md-12">
					<div class="row" id="">
						<!-- <label class="col-sm-2 col-form-label " for="remarks"></label>
						<div class="col-sm-4">																			
						</div> -->				
					</div>
					</div>	
				</div>
      </div>
      
      </c:when>
      <c:otherwise>
      
      <div class="form-group">
      <div class="col-md-12">
      <div class="row">
       <label for="startDate" class="col-sm-2 col-form-label ${req}" ><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtn_frm" /></fmt:bundle></label>
       <div class="col-sm-4">
    <div class="input-group date" id="msg-XSTARTDATE">
    <div class="input-group-addon">
    <i class="fa fa-calendar"></i></div>
    <input readonly="readonly" data-field-id=" " type="text" class="form-control datecalendar from_date" 
    id="crtn_frm" name="crtn_frm" placeholder="Creation From Date" >
    </div>
    </div>
          <label for="endDate" class="col-sm-2 col-form-label  ${req}"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtn_to" /></fmt:bundle></label>
          <div class="col-sm-4">
    <div class="input-group date" id="msg-XENDDATE">
    <div class="input-group-addon">
    <i class="fa fa-calendar"></i></div>
    <input readonly="readonly" data-field-id="9" type="text" class="form-control datecalendar" 
    id="crtn_to" name="crtn_to" placeholder="Creation To Date"  ></div>
   </div>
      </div>
      </div>
      </div>
      
	<div class="form-group">
		<div class="col-md-12">
			<div class="row">		
		  		<c:if test="${(fstatus!='N') && (fstatus!='E')}">
		 			<label class="col-sm-2 col-form-label ${req}" for="subject"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></label>
						<div class="col-sm-4">																			
							<input type="text" class="form-control" id="subject" name="subject"  value="${recordList.getSubject()}" placeholder="Subject" >
						</div> 
				</c:if>
			</div>
		</div>
	</div>
      
    </c:otherwise>
      </c:choose>
  		
<div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage" id="errMsg"></div>
	</div>
</div> 
		
<div class="form-group m-t-25 m-b-5">
	<div class="col-md-12 text-center">
		<div class="row  m-b-15">

		<c:choose>
			<c:when test="${fstatus=='E'}">
				<c:if test="${recordList.getCheckdata()=='N' && recordList.getToemp()==employee_id}">
   				<button type="button" class="btn btn-view" onclick="showPreview();" id="btnPreview1" >Preview</button>
   				<button type="button" class="btn btn-view" id="btnSave2" >Update</button>
   				</c:if>
     			<button type="button" class="btn btn-view" id="btnBack2" >Back</button>
			</c:when>
			
			<c:when test="${fstatus=='N'}">
				<button type="button" class="btn btn-view" onclick="showPreview();" id="btnPreview1" >Preview</button>
     			<button type="button" class="btn btn-view" id="btnSave2" >Save</button>
     			<button type="button" class="btn btn-view" id="searchnew" >Search</button>
   			</c:when>
   			
			<c:otherwise>                                  
				 <button type="button" class="btn btn-view" id="btnSearch" value="Search">Search</button>
				 <button type="button" class="btn btn-view" id="btnNew" >Back</button>
			 </c:otherwise>
			 
	 	</c:choose>	  
    			 <button type="button" class="btn btn-view"  id="btnReset" >Reset</button>

        </div>
	</div>
</div>
		   
</div><!-- End panel-body -->
	    
	    </div>
	    	
	   		<input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
	   		<%-- <input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
	   		<input type="hidden" name="year" id="year" value="<%=csession_id%>">
            <input type="hidden" name="ddo_id" id="ddo_id" value="<%=ddo_id%>"> --%>
            <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
            <input type= "hidden" id="Semp_id" name="Semp_id" value="${recordList.getToemp()}" >
            <input type= "hidden" id="doclen" value="${value}">
            <input type= "hidden" id="doctyp" value="${ext}" >
            <input type= "hidden" id="filesize" name="filesize" value="${filesize}" >
            <input type= "hidden" id="text" name="text">
	   	    <input type= "hidden" id="fileid" name="fileid">
	   	    <input type= "hidden" id="dpt_id" name="dpt_id" value='<%=dept_id %>'>
	   	    <input type= "hidden" id="desig" name="desig">
	   	    <input type= "hidden" id="cre_id" name="cre_id">
	   	     <c:if test="${(fstatus=='E') && count>0}">
	   	    <input type="hidden" name=index id="index" value="${count}">
	   	    <input type="hidden" name="doc_index" id="doc_index" value="${recordList.getDropid()}">
	   	    </c:if>
	   	    <c:if test="${(fstatus=='E') && count==0}">
	   	    <input type="hidden" name=index id="index" value="1">
	   	    <input type="hidden" name="doc_index" id="doc_index" value="1">
	   	    </c:if>
	   	    <c:if test="${(fstatus=='N')}">
	   	    <input type="hidden" name=index id="index" value="1">
	   	    <input type="hidden" name="doc_index" id="doc_index" value="1">
	   	    </c:if>	   	    
	   	    <input type= "hidden" id="addcount" name="addcount" value="0">
	   	    <input type="hidden" name="file_creation_id" id="file_creation_id" value="${recordList.getFile_creation_id()}">
	   	    <input type="hidden" name="file_name" id="file_name" value="${recordList.getFilename()}">
	   	    <input type="hidden" name="fstatus" id="fstatus" value="${fstatus}">
	   	  
    </form><!-- End panel-default -->
    
     <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -27px;">
		<div class="modal-dialog" style="overflow:scroll !important;width:85%;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
				</div>
				
				<div class="modal-body" style="height: 400px"> <!--Start Modal Body-->
					  <form name="pdfForm" id="pdfForm" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="1_Report" id="1_Report" width="100%;" height="390px" src="" frameborder="0" scrolling="yes"></iframe>							
					</form>
				</div>
				<!--End Modal Body-->
				
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-warning" data-dismiss="modal">Back</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
    
     

<form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off" target="">
<div class="modal fade recomond-btn" id="viewPreview" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
<div class="modal-dialog modal-preview">
<div class="modal-content">

	<div class="modal-header"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
  		<div class="modal-body">
	   	<div class="panel panel-default" style="background: #c9fa9c;">
			<div class="panel-body" style="padding: 10px 5px">
				<img src="../resources/images/ulogo.png"  height="50px" width="70px" style="margin-bottom: opx; margin-left: 23px;">
				<div class="col-sm-12">
				<div class="col-sm-1">
					<h6>मध्य प्रदेश </h6>
					<h6>आयुर्विज्ञान</h6>
					<h6>विश्‍वविद्यालय</h6>
				</div>
				<div class="col-sm-10 datNo">
				<div class="col-sm-9">
					<h5>नस्ती क्रमांक .....................................</h5>
					<h5 class="m-b-20">दिनांक .........................................</h5> 
					<h4 class=""><b>विषय :- </b></h4>
				</div>
				<div class="col-sm-3">
					<h5>शाखा- </h5>
				</div>
				</div>
					<div class="col-sm-1">
						<h6>पृष्ठ क्रमांक</h6>
						<h6>...............</h6>
					</div>
				</div>
				<hr style="margin-bottom: -60px;margin-top: 50px;border: 1px solid black;">
				
					<div class="vl">
						
						<div style="text-align:center;padding-top: 28px;padding-left: 6px;font-size: 15px;">  
							<div style="padding-top: 1px;">
								<!-- <h5 style="text-align: left;padding-left: 5px;">This is India</h5> -->
								<span id="previewNote" style="text-align: left;padding-left: 5px;"></span>
							</div>
				  		</div>
			 		</div>
			 	
			</div> <!-- End of panal body -->
		</div> <!-- End of panal default -->
   		</div> <!-- End of modal body -->
				 
</div> <!-- End of modal content -->
</div> <!-- End of modal-dialog -->
</div> <!-- End of modal class/id at which modal will be open -->

<div class="modal fade recomond-btn" id="viewPreview1" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
<div class="modal-dialog modal-preview">
<div class="modal-content" >

	<div class="modal-header" style="padding: 2px 10px"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
  		<div class="modal-body" style="padding: 0px 10px 10px 10px">
					<div class="vl1">
							
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-sm-2 text-center" style="">
								    		 <img alt="" src="../resources/images/ulogo.png" height="90px" width="110px" style="margin-top: 10%;">
								         </div>
										 <div class="col-sm-8 text-center">
								    		 <h4 class="m-4">मध्य प्रदेश आयुर्विज्ञान विश्वविद्यालय, जबलपुर</h4>
								    		 <h4 class="m-4">Madhya Pradesh Medical Science University, Jabalpur</h4>
								    		 <h5 class="m-4">Address: Medical University Campus, Dhanwantri Nagar, Bhedaghat Road, NH-12 Jabalpur (MP) 482003</h5>
								    		 <h5 class="m-4">Contact : 0761-2670332, 2670334, 2670338, 2670340</h5>
								    		 <h5 class="m-4">Email : mailto:registrarmpmsu@mp.gov.in</h5>
								         </div>
								        <div class="col-sm-2 text-center">
								    		  <img alt="" src="../resources/images/ulogo.png" height="90px" width="110px" style="margin-top: 10%;">
								         </div>
								    </div>
							    </div>
							 </div>  
							 <hr>
							 <div class="" style="height: 600px;overflow-y: auto ">
							 	<p><span id="previewNote1" style="text-align: left;padding-left: 10px;"></span>
							 	</p>
							 </div>
							  <div class="form-group">
								<div class="col-md-12">
									<div class="row">
										 <div class="text-center">
								    		 <h5 class="m-4">विश्वविद्यालय से संबंधित कार्यों/समस्याओं के शीघ्र  निराकरण हेतु ऑनलाइन  GMS पोर्टल का उपयोग करें |</h5>
								    		 <h5 class="m-4">Link : <a href="https://mpmsu.mponline.gov.in/portal/services/MPMSU/CMS/Helpdesk Homw.aspx">https://mpmsu.mponline.gov.in/portal/services/MPMSU/CMS/Helpdesk Homw.aspx</a></h5>
								         </div>
								    </div>
							    </div>
							 </div>  
			 
							
							
							
				  		<!-- </div> -->
			 		</div>
			<!-- </div> --> <!-- End of panal body -->
		<!-- </div> --> <!-- End of panal default -->
   		</div> <!-- End of modal body -->
				 
</div> <!-- End of modal content -->
</div> <!-- End of modal-dialog -->
</div>
</form>
    
    <c:if test="${fstatus!='E' && fstatus!='N'}"> 
		<iframe class="embed-responsive-item" onload="resizeIframe(this)" name="_Report" id="_Report" width="100%;" height="" src="" frameborder="0" scrolling="no" style="overflow-y:hidden; "></iframe>
		</c:if>
</div> <!-- End container-fluid -->
</body>
<script type="text/javascript">
	function resizeIframe(iframe) {
		iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    	window.requestAnimationFrame() = resizeIframe(iframe);
  	}
  	var editor1 = new RichTextEditor("#XDESCRIPTION");
  </script>
</html>