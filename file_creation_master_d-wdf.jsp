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
    <script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/file_creation.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>		
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
 

 
 	table.tableGrid th {
      background-color: #ffcc33;
      border: 1px solid #439653 !important;
      color:#0c426f;
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
		margin-left:100px;
	}
 </style>
 
<c:if test="${(fstatus=='N')}">
	<c:set var="ds"  value="<%=desg_id %>"/>
</c:if>
<c:if test="${(fstatus=='E')}">
	<c:set var="ds"  value="${recordList.getDesginationid()}"/>
</c:if>

<body onload="getlocation('<%=loct_id %>'); getDepartment('<%=loct_id %>','<%=dept_id %>'); getEmployee('N'); findDate(); 
serachpage('${fstatus}','${filet}'); 
getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${ds}','${recordList.getToemp()}'); 
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

<div class="form-group">
	<div class="col-md-12">
		<div class="row">
		    <label class="col-sm-2 col-form-label " for="">File Type</label>
			<div class="col-sm-4" id="AppType">
				<input type="radio" id="AppTypeF" value="F" checked="checked" name="AppType">&nbsp;File 			
				&nbsp;&nbsp;
				<input type="radio" id="AppTypeD" value="D" name="AppType">&nbsp;File Draft
				&nbsp;&nbsp;
				<input type="radio" id="AppTypeC" value="C" name="AppType">&nbsp;Circular/Notice
				&nbsp;&nbsp;
				<input type="radio" id="AppTypeL" value="L" name="AppType">&nbsp;Letter
			</div>
		</div>
	</div>
</div>

<%-- </c:if> --%>


<div class="form-group">
	<div class="col-md-12">
		<div class="row">
																		
		<label class="col-sm-2 col-form-label " for="fileID"  ><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.id" /></fmt:bundle></label>
			<div class="col-sm-4"> 
			<c:if test="${(fstatus=='E')}"> 
				<input type="text" class="form-control" id="fileID" name="fileID"  value="${recordList.getFile_group_id()}" placeholder="" disabled >
				 </c:if>	
				  <c:if test="${(fstatus=='N')}">
				 <input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter File/Circular/Notice No." value="${fileId}"  disabled></c:if>
			 <c:if test="${(fstatus!='N') && (fstatus!='E')}">
			 <input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter File/Circular/Notice No." >
			 </c:if>
			</div> 
			
 																			
		<label class="col-sm-2 col-form-label ${req}" for="manualfileNo"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.man_no" /></fmt:bundle></label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="manualfileNo" name="manualfileNo"  value="${recordList.getManual_file_id()}" placeholder="Manual File/Circular/Notice No." >
			</div>		        			             
		</div>
	</div>
</div>  
   
   	<c:choose>
   <c:when test="${(fstatus=='N')||(fstatus=='E')}"> 
   <div class="form-group">
	<div class="col-md-12">
		<div class="row">				       														
		<label for="location"  class="col-sm-2 col-form-label required-field" >Location</label>
      		<div class="col-sm-4" >
	      		<select class="form-control" id="location_id" name="location_id" onchange="getDepartment(this.value,'');getDepartmentcheckbox(this.value,'');">
		      		<option value="">Select Location</option>
		      	</select>
	      	</div>
      <label class="col-sm-2 col-form-label ${req}" for="subject"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<input type="text" class="form-control" id="subject" name="subject"  value="${recordList.getSubject()}" placeholder="Subject" >
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
				<div id="hidetype">
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
				
	   <label class="col-sm-2 col-form-label required-field" for="">From Department</label>
		<div class="col-sm-4" >
			<select class="form-control" id="frm_departmnt" name="frm_departmnt">
				<option value="">Select From Department</option>
		
			</select>
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
	  </div>
      </div>
      </div>  
      
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">		
				    														
      		       	<label class="col-sm-2 col-form-label " for="department"><fmt:bundle basename="filemovement">
			<fmt:message key="file_creation_master.designation" /></fmt:bundle></label>
				<div class="col-sm-4">		
					<select  class="form-control" id="desginationid" name="desginationid" ></select>																	
				</div>														
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
				
					<%-- <label class="col-sm-2 col-form-label" for="dakNo">DAK No.</label>
						<div class="col-sm-4">
						<!-- <select  class="form-control" id="dakId" name="dakId" > -->
						<!-- <option value="">Select DAK No.</option> -->
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
					</div> --%>
	  			</div>
      		</div>
		</div>    
        
        <div class="form-group">
			<div class="col-md-12">
				<div class="row">
        
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
        
       <%--  <div id="2">
		<div id="1">				
		    
    <div class="form-group">
	<div class="col-md-12">
		<div class="row" id="">
		<label class="col-sm-2 col-form-label ${req} for="documnet_upload">
		<fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.upload" /></fmt:bundle></label>
								<div class="col-sm-4">
									<div class="fileUpload">
										<input type="file" id="upldoc"  name="upldoc" class="" multiple="multiple">
									</div>
									<div class="instruc_text ">
										<span class="" style="font-size: 13px !important; font-weight: bold; color: red;">Max. Size ${value}${ext}</span>
									</div>
									</div>
		<label class="col-sm-2 col-form-label ${req} " for="remarks"><fmt:bundle basename="filemovement">
		   <fmt:message key="file_creation_master.doctitle" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<input type="text" class="form-control" id="doctitle"name="doctitle" 
				maxlength="<fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.doctitle_len" /></fmt:bundle>" 
		   		value="${recordList.getDoctitle()}" placeholder="Enter Document Title" >
			</div>				
			</div>
			</div>
			</div>
							</div>
									</div>	
		 --%>	



 			<%-- <c:if test="${(fstatus=='E')}">
   				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<!-- <label for="sector" class="col-sm-2 col-form-label"> </label> -->
							<c:forEach items="${file}" var="file">
							<c:set var="count" value="${count+1}"></c:set>
							<c:if test="${count%3==1 }">
							<label for="sector" class="col-sm-2 col-form-label"> </label>
							</c:if>
							<div class="col-sm-3">
							<label><a href="../downloadfile?filename=${file.getAttachmentid()}_${file.getFilename()}&folderName=${file.getFile_creation_id()}">
							<u>${file.getDoctitle()} (${file.getFilename()})</u></a></label>
							<c:if test="${recordList.getCheckdata()=='N'}">
							<td>
							<a href="#" style="color:red;cursor: pointer;width:15%"
							onclick="deleteFile('${file.getAttachmentid()}','${file.getFilename()}', '${file.getFile_creation_id()}');"
								class="red-tip" title="Click here to Remove the File" >&nbsp; <i class="fa fa-trash" ></i></a>
							</td>
							</c:if>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if> --%>
			<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="fundtype" class="col-sm-2 col-form-label ${req}">
					<fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.note" /></fmt:bundle></label>
						<div class="col-sm-10">
							<textarea id="XDESCRIPTION" name="XDESCRIPTION" class="form-control" >
							${recordList.getNote()}</textarea>
							<script>
								CKEDITOR.env.isCompatible = true;
								CKEDITOR.replace( 'XDESCRIPTION' );
								/* CKEDITOR.instances.XDESCRIPTION.on('paste', function(evt) {
								    evt.cancel();
								}); */
							</script>
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
				  <th width="9%" style="text-align:center;">Document Title</th>
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
				<td>${dateParts[0]}
				<%-- ${file.getDoctitle()} --%>
				<!-- 
				<input type="hid den" class="form-control" id="hfname1" name="hfname1">
				<input type="hid den" class="form-control" id="fsize1" name="fsize1"></td>
				 -->
				</td>
				<td>
					<select class="form-control" id="" name="" disabled onchange="getDocTypDetail(this.value, 1);">
						<option value="">${dateParts[1]}</option>
						
					</select>
				</td>
				<td>
					<select class="form-control" id="" disabled name="">
						<option value="">${dateParts[2]}</option>
					</select>
				</td>
				<td>${file.getFilename()}</td>
				
				<td>
					<%-- <a target="_blank" href="../downloadfile?filename=${file.getAttachmentid()}_${file.getFilename()}&folderName=${file.getFile_creation_id()}">
						<u>${file.getDoctitle()} (${file.getFilename()})</u>
					</a> --%>
					
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
					<%-- <input type="hidden" class="form-control" id="doc Name${count }" name="docName${count }" value="${file.getFilename()}"> --%>
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
			    <td class="text-center"><input type="text" class="form-control" id="doctitle1" 
			    onchange="namechange('1',this.value)" name="doctitle1" maxlength="100" placeholder="Enter Document Title" >
				<input type="hidden" class="form-control" id="hfname1" name="hfname1">
				<input type="hidden" class="form-control" id="fsize1" name="fsize1"></td>
				
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
					<input type="file" id="upldoc1" onchange="sizeChk(1); data(1);" name="upldoc1" class="" multiple="multiple">
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
				<!-- <div id="END1" class="dataEntryDiv"></div> -->
				<!-- <div class="col-sm-1 text-right m-t-20">
					<button type="button" class="btn btn-view" id="addmore">Add</button>
				</div> -->
				<div class="text-right"style="margin-top:18px;padding:8px;">
				
					<div class="colr-blue-p" id="addmore">
						<c:if test="${view.getIs_to_cc()=='N' }"> disabled="disabled" </c:if>
						<span id="" onClick=""><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span>
					</div>
						<%-- <button type="button" class="btn btn-view" 
						<c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="DAKaddmore">Add</button> --%>
				</div>
				
				</div>
				</div>
				</div>
<!-- </div> -->

<!-- <div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage" id="delerrMsg"></div>
	</div>
</div>  -->
							<div class="">
								<div class="col-md-12">
									<div class="row" id="">
										<label class="col-sm-2 col-form-label " for="remarks"></label>
										<div class="col-sm-8 text-right m-t-20">
											<div class="errmessage" id="delerrMsg"></div>
										</div>
										<!-- <div class="col-sm-2 text-right m-t-20">
											<button type="button" class="btn btn-view" id="addmore">Add</button>
										</div> -->
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
      
    </c:otherwise>
      </c:choose>
  		
<div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage" id="errMsg"></div>
	</div>
</div> 
		
<div class="form-group m-t-25 m-b-5">
	<div class="col-md-12 text-center">
		<div class="row">

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
	   	    </c:if>
	   	    <c:if test="${(fstatus=='E') && count==0}">
	   	    <input type="hidden" name=index id="index" value="1">
	   	    </c:if>
	   	    <c:if test="${(fstatus=='N')}">
	   	    <input type="hidden" name=index id="index" value="1">
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
    
     <%-- <div class="modal" id="viewPreview">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			
			<!-- Modal Header -->			
			<div class="modal-header text-center mod-head">
				<h4 class="modal-title text-left">
					<h3 style="color: red;">Preview</h3>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

					<!-- Modal body -->
			<div class="modal-body">
	 			<div id="xyz">
	 			<div id="abc">
	 				 <c:forEach items="${attachmentList}" var="obj">
	 			  	<div class="form-group" style="margin-bottom: 0px; margin-left: 10px;margin-right: 10px;">
						<div class="col-md-12">
							<div class="row">
								<span id="previewNote">
								</span>
							</div>
						</div>
					</div>
	 			</c:forEach>
 			</div>
 			</div>
			</div>	
 			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"  data-dismiss="modal">Close</button>
			</div>
			
		</div>
	</div>
</div> --%>

<form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off" target="">
<div class="modal fade recomond-btn" id="viewPreview" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
<div class="modal-dialog modal-preview">
<div class="modal-content">

	<div class="modal-header"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
  		<div class="modal-body">
	   	<div class="panel panel-default" style="background: #c9fa9c;">
			<div class="panel-body">
				
				<hr style="margin-bottom: -60px;margin-top: 50px;border: 1px solid black;">
				
					<div class="vl">
						<div style="text-align:center;padding-top: 23px;padding-left: 6px;font-size: 15px;">NOTES & ORDERS</span>
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
<div class="modal-content">

	<div class="modal-header"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
  		<div class="modal-body">
	   	<div class="panel panel-default" >
			<div class="panel-body">
				
				<hr style="margin-bottom: -60px;margin-top: 50px;border: 1px solid black;">
				
					<div class="vl">
						<div style="text-align:center;padding-top: 23px;padding-left: 6px;font-size: 15px;">NOTICE
							<div style="padding-top: 1px;">
								<!-- <h5 style="text-align: left;padding-left: 5px;">This is India</h5> -->
								<span id="previewNote1" style="text-align: left;padding-left: 5px;"></span>
							</div>
				  		</div>
			 		</div>
			</div> <!-- End of panal body -->
		</div> <!-- End of panal default -->
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
  </script>
</html>