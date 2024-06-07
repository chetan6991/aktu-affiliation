
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
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>    
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/gen.js"></script>
   	<script type="text/javascript" src="../resources/js/filemovement/dak_creation.js"></script>    
	<%
		response.setHeader("Cache-Control","no-store");  // HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache");        // HTTP 1.0
		response.setDateHeader("Expires", -1);        // Prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />		
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
    
<style type="text/css">
	
 	table.tableGrid th {
      background-color: #583b24;
	  border: 1px solid #439653 !important;
	  color: #f9f9f9;
	  font-size: 13px;
    }
    .m-b-20{
     margin-bottom:20px;
    }
    
    
  	@media screen and (min-width: 500px) {
        .modal-lg1 {
          width: 500px; /* New width for large modal */
        }
    }
    
    .modal-header1 .close1 {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
.close {
    opacity: 1 !important;
    color: red !important;
    padding-right: 10px;
}
  	</style>
    
</head>
<body onload="getEmployee('N'); findDate(); serachpage('${fstatus}'); 
getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${recordList.getDesginationid()}','${recordList.getToemp()}');
getscroler('${divsize}');" >

 
	<div class="container-fluid">
        <div id="ftitleHeader" class="page-header"><h4 class="hfont">DAK Creation</h4></div>
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
<div class="form-group">
	<div class="col-md-12">
		<div class="row">
																		
		<label class="col-sm-2 col-form-label " for="fileID" >DAK No.</label>
			<div class="col-sm-4">
			<c:if test="${(fstatus=='E')}"> 
				<input type="text" class="form-control" id="fileID" name="fileID"  value="${recordList.getFile_group_id()}" placeholder="Enter DAK No." disabled >
				 </c:if>	
				  <c:if test="${(fstatus=='N')}">
				 <input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter DAK No." value="${fileId}"  disabled></c:if>
			 <c:if test="${(fstatus!='N') && (fstatus!='E')}">
			 <input type="text" class="form-control" id="fileID" name="fileID"   placeholder="Enter DAK No." >
			 </c:if>
			</div> 
			
 																			
		<label class="col-sm-2 col-form-label ${req}" for="manualfileNo">Manual DAK No.</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="manualfileNo" name="manualfileNo"  value="${recordList.getManual_file_id()}" placeholder="Manual DAK No." >
			</div>		        			             
		</div>
	</div>
</div>  
   
   	<c:choose>
   <c:when test="${(fstatus=='N')||(fstatus=='E')}"> 
   <div class="form-group">
	<div class="col-md-12">
		<div class="row">				       														
		<label class="col-sm-2 col-form-label" for="createdBy"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtdby" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<select   class="form-control" id="createdBy" name="createdBy" disabled >
				<option value=""></option>
				</select>		
				</div>
			
      <label class="col-sm-2 col-form-label ${req}" for="subject"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></label>
			<div class="col-sm-4">																			
				<input type="text" class="form-control" id="subject" name="subject"  value="${recordList.getSubject()}" placeholder="Subject" maxlength="150">
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
			<select  class="form-control" id="desginationid" name="desginationid" >
				</select>																	
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
<%-- 
	<div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label for="upload" class="col-sm-2 col-form-label ${req}" >Attache DAK</label>  
					<div class="col-sm-3">
						<input type="file" id="upldoc1"  name="upldoc1" class="" >
						<p class="errMsg" style="color:red;">Max File Size 20 MB (Note: Only .pdf, .jpg, .png, & doc files will be allowed for uploading)</p><!-- onchange="data(1)" -->
					</div>
					
					<c:if test='${recordList.getFilename() != ""}'>					
						<div class="col-sm-6">
							<a target="1_blank" href="../downloadfile?filename=${recordList.getAttachmentid()}_${recordList.getFilename()}&folderName=${recordList.getFile_creation_id()}&subFolderName=&FileType=D"><u>${recordList.getFilename()}</u></a>		
						</div>
						
						<c:if test="${not empty recordList.getShowPdf() and recordList.getShowPdf() eq 'Y'}">			 			
							<div class="col-sm-6">
								<a data-target=".recomond-btn" data-toggle="modal" onclick="getReport('${recordList.getAttachmentid()}', '${recordList.getFilename()}', '${recordList.getFile_creation_id()}', '');">
									<u>${recordList.getFilename()}</u>
								</a>
							</div>							
						</c:if>
						<c:if test="${not empty recordList.getShowPdf() and recordList.getShowPdf() eq 'N'}">
							<div class="col-sm-6">
								<a data-target=".recomond-btn" data-toggle="modal" target="_blank" href="../downloadfile?filename=${recordList.getAttachmentid()}_${recordList.getFilename()}&folderName=${recordList.getFile_creation_id()}&subFolderName=&FileType=D">
									<u>${recordList.getFilename()}</u>
								</a>
							</div>
						</c:if>
						
					</c:if>
			</div>
		</div>
	</div>
 --%>	     <div class="panel panel-default">
<div class="panel-heading"><h3 class="panel-title text-left">Attached DAK Details</h3></div>
<div class="panel-body" style="padding: 6px 14px;">


			<div id="dydiv" style="width:100%;overflow: auto;">
      		   <!-- <div class="col-md-6"> -->
				<div id="" style="padding:8px 0px;display:flex;width:100%;">
				<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid" >
				<tr>
				  <th width="9%" style="text-align:center;">Document Title</th>
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
				
				<td>${file.getDoctitle()}
				<!-- 
				<input type="hid den" class="form-control" id="hfname1" name="hfname1">
				<input type="hid den" class="form-control" id="fsize1" name="fsize1"></td>
				 -->
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
						<a  target="_blank" href="../downloadfile?filename=${file.getAttachmentid()}_${file.getFilename()}&folderName=${file.getFile_creation_id()}&subFolderName=&FileType=D">
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
				<td class="text-center"><input type="file" id="upldoc1" onchange="sizeChk(1); data(1);" name="upldoc1" class="" ></td>
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
   				<button type="button" class="btn btn-view" id="btnSave2" >Update</button>
   				</c:if>
     			<button type="button" class="btn btn-view" id="btnBack2" >Back</button>
			</c:when>
			
			<c:when test="${fstatus=='N'}">
			
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
	   	    
	   	    <input type= "hidden" id="faId" name="faId" value="${recordList.getAttachmentid()}">
	   	    <input type= "hidden" id="fName" name="fName" value="${recordList.getFilename()}">
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
    
    <c:if test="${fstatus!='E' && fstatus!='N'}"> 
		<iframe class="embed-responsive-item" name="_Report" id="_Report" width="100%;" height="480px" src="" frameborder="0" scrolling="no" style="overflow-y:hidden; "></iframe>
	</c:if>
	
	<div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -24px;">
		<div class="modal-dialog modal-lg1" style="width: 1000px !important;">
			<div class="modal-content">
				<div class="modal-header1 text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
				</div>				
				<div class="modal-body" style="height: 550px"> <!--Start Modal Body-->
					<form name="pdfForm1" id="pdfForm1" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="1_Report" id="1_Report" width="100%;" height="480px" src="" frameborder="0" scrolling="yes"></iframe>							
					</form>
				</div><!--End Modal Body-->				
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
	
</div> <!-- End container-fluid -->
</body>
</html>