<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
  	 <title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>  	 
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../resources/js/common/signature_pad.min.js" ></script>

   	
    <script type="text/javascript" src="../resources/js/filemovement/inbox_file_search.js"></script>
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
    <script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>
	<script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
  
	<!-- Include the JS & CSS-->
	<link href="../resources/assets/plugins/richtexteditor/rte_theme_default.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="../resources/assets/plugins/richtexteditor/rte.js"></script>
	<script type="text/javascript" src='../resources/assets/plugins/richtexteditor/plugins/all_plugins.js'></script>	
		
<style>
		page {
		  background: white;
		  display: block;
		  margin: 0 auto;
		  margin-bottom: 0.5cm;
		  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
		}
		page[size="A4"] {  
		  /* width: 21cm; */
		  height: 29.7cm; 
		}
		page[size="A4"][layout="landscape"] {
		  width: 29.7cm;
		  height: 21cm; 
		} 
		
		canvas {
		  border: solid;
		  margin: auto;
		  display: block;
		  width: auto;
		  background-color: #fff;
		  border-radius: 15px;
		  border: 5px solid black; 
		}
		 
		
		#canvas-wrap {
			position: relative;
		 	
		} 

  		.test {
		    margin-bottom: 10px;
		    margin-top: 0px;
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
		.tbodynew11 {
		    height: 140px;
		    overflow: auto;
		    overflow-x: hidden;
		    display: block;
		    width: 100%;
		}
		 .tbodynew1 tr {
			display:table;
			width:100%;
			table-layout:fixed;
		}
			.theadnew1 {
			display:table;
			width:100%;
		} 
		.mod-head{
		padding:0px !important;
		
		}
		.modal-header .close {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
	.viewNotes{
		padding:0px;
	    text-align:center;
	    font-size:15px;
	    -webkit-transform:scale(1.4,1);
	    font-style: italic !important;
	}
	.sentColr{
	  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#337638), color-stop(100%,#86d278)) !important;
	}
	 
    .red-tip + .tooltip > .tooltip-inner { background-color: #f00; }
    .red-tip + .tooltip > .tooltip-arrow { border-bottom-color:#f00; }
    
     @media screen and (min-width: 500px) {
        .modal-lg {
          width: 500px; /* New width for large modal */
        }
         .modal-preview {
          min-width: 1050px !important; /* New width for large modal */
        }
    }
    
    table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
    border: 1px solid #dddddd !important;
    text-align: left;
    padding: 4px;
    }
  
.infoHead{
   text-align: center;
    font-size: 13px;
    font-weight: 700;
    color: #295367;
    font-family: Calibri, courier-new,sans-serif;
    font-size: 13px;
    }
    
    table.tableGrid th {
      background-color: #583b24;
	  border: 1px solid #439653 !important;
	  color: #fff !important;
	  font-size: 11px !important;
    }
    .m-b-20{
     margin-bottom:20px;
    }
    
    .popup-font{font-family: Calibri, verdana, Arial, Helvetica, sans-serif;
    font-weight: normal;
    font-size: 13px;
    color: #2C427C;"
    }
   .container-fluid{width:100%;}
   
   .cke_resizer_ltr {
    	display: none !important;
    }
    .cke_contents{
    	height: 180px !important;
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
	.rte-modern.rte-desktop.rte-toolbar-default {
    	min-width: 972px;
        height: 345px; 
	}
	@media (min-device-width: 320px) and (max-device-width: 430px) {
	.size-pdf{ 
		width:100%;
	 }
	}
	.close:hover {
		opacity: 1;
	}
	@media (min-device-width: 320px) and (max-device-width: 768px) {
	.file-note{
		width: 100% !important;
		float: unset 
	 }
	}
 
	.datNo{margin-top: -45px;}
	 hr{border-top: 2px solid #a59f9f;}
 
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tip").tooltip();

	});
	
	/* var tibcoserverUrl = 'http://120.138.8.41:8081/jasperserver/flow.html';
	var tibcoserverUsername='jasperadmin';
	var tibcoserverPassword ='jasperadmin'; */
	var folder_name ='/reports/mpsu_fms/';
	var jaspername='fms_letter_notice_creation';
	function showReport(file_creation_id,fmt_id,file_type,tibcoserverUrl,tibcoserverUsername,tibcoserverPassword){
		//    var file_creation_id=1;
		    if(file_creation_id==""){file_creation_id='%';}
			
			//var fmt_id=5;
		    if(fmt_id==""){fmt_id='%';}
			
			var downloadtype="pdf";
			if(file_type == 'F'){jaspername="fms_file_creation_new";}

		    	var url=tibcoserverUrl+"?_flowId=viewReportFlow&_flowId=viewReportFlow&ParentFolderUri=%2Freports&reportUnit="+folder_name
				 		+jaspername+"&standAlone=true&output="+downloadtype+"&j_username="
				 		+tibcoserverUsername+"&j_password="+tibcoserverPassword+"&file_creation_id="+file_creation_id
				 		+"&fmt_id="+fmt_id;
			
			console.log("JasperUrl>>>>>>");
			console.log(url);
		//	$("#reportframe").show();
			document.getElementById("file_mov_vie").src = url;
	}
</script>

</head>
 
 <body onload="recNumber('${recType}', '${recNo}');dis('${view.getIs_to_cc()}', '${PagetypB}');
   showReport('${fileCreationId}','${fmt_id}','${fileTypeFC}','<fmt:bundle basename="filemovement"><fmt:message key="jasper.url" /></fmt:bundle>',
   '<fmt:bundle basename="filemovement"><fmt:message key="jasper.username" /></fmt:bundle>',
   '<fmt:bundle basename="filemovement"><fmt:message key="jasper.password" /></fmt:bundle>');">

<div class="container-fluid">
   <div id="" class="page-header" style="padding: 0px !important;"><h4 style="font-size: 15px;">File Inbox</h4></div>
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">New Record</h3></div>
			<div class="panel-body" style="padding: 15px 0 0px 0px;">
 	
 			
 	 <!-- ----------------------------Start 1st Panel-------------------------------------- -->
			<div class="col-md-6 size-pdf" style="width:">
			    
			
			 <form class="form-horizontal" name="getNote" id="getNote" method="post" autocomplete="off">
			
	 	 <div class="" id="">
				<div class="panel panel-default">
				<div class="panel-body" style="height: ;width: 100%; padding:10px 2px 10px 2px; ">
				
				 
			<!-- 	Insert code here  -->
	 			<div id="xyz">
	 			<div id="abc" style="width:100% !important">	
	 			<c:if test="${forDraft ne 'D'}">
		 			<iframe class="embed-responsive-item" name="file_mov_vie" id="file_mov_vie" width="100%;" height="" 
	 					frameborder="0" scrolling="no" style="min-height:720px !important;max-height:1000px!important;">
	 				</iframe> 
	 			</c:if>
	 			<c:if test="${forDraft eq 'D'}">
	 				<iframe class="embed-responsive-item" name="file_mov_vie" id="file_mov_vie" width="100%;" height="" 
	 					frameborder="0" scrolling="no" style="min-height:720px !important;max-height:1000px!important;">
	 				</iframe> 
	 			</c:if>
 				 
 			</div>
 			</div>
			    </div>
			 </div>
			</div><!-- Close 2st div -->
			
		<%-- 	
			<ul class="col-sm-4 pagination"style="margin-top:26px;margin-bottom:5px;">
				<li class="page-item"  id="disableanchor">
					<a class="page-link"   href="#"  onclick="displayPrevious();" style="padding-top: 0px !important; padding-bottom:1px !important;">
						<i class="fa fa-angle-double-left fa-2x" aria-hidden="true"></i>
					</a>
					
			    	<span style="padding: 5px 5px 5px 5px !important; border-radius: unset;" id="pageShowNo" >${sessionScope.totalPages+1}</span>
			    </li>
			   <li class="page-item disabled" id="disableanchorNext">
					<a class="page-link disabled" id="disHref" href="#" onclick="displayNext();" style="padding-top: 0px !important;padding-bottom:1px !important;"><i class="fa fa-angle-double-right fa-2x" aria-hidden="true" style=""></i></a>
				</li>
			</ul>

				   For displaying Page numbers. 
    The when condition does not display a link for the current page
    <div class="col-sm-8" style="margin-top:26px;margin-bottom:5px;padding:0px;">
      
	<div class="col-sm-8">
		<div class="">
			<div class="row">
				<div class="col-sm-6" style="padding-right: 0px; padding-left: 35px;">
					<input type="text" class="form-control text-right" id="moveTo" name="moveTo" placeholder="Move To Page No." onblur="displayNext(this.value);" style="height: 29px;width:120px;"> 
				</div>
				<div class="col-sm-1"></div>
		   	</div>
		</div>			
	</div>
		  
		<div class="col-sm-4 text-right" style="padding:0px;margin-top: 4px;">
		   <a href="javascript:void(0);" onclick="getpdf('${view.getFile_creation_id()}', '${fileTypeFC }');"data-toggle="tooltip" data-placement="top"
		       title="" data-original-title="Click here for download the Notes"
		       class="red-tip">
                     <b style="border: 1px solid green; border-radius: 7px; padding: 4px 4px;
					 color: #ffffff !important; background-color: #00799A !important; border-color: #687DB4 !important; font-size: 15px !important;
			         box-shadow: 2px 2px 1px #336376 !important; background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;">PRINT NOTES</b></a>
		</div>
	</div> --%>
				   
           <input type="hidden" id="fileid" name="fileid" value="${view.getFile_creation_id()}"> 
	       <input type="hidden" id="fileDetId" name="fileDetId" value="${view.getFileDetailId()}"> 
	       <input type="hidden" id="status" name="status" value="${view.getFilestatus()}">
	       <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>"> 
	       <input type="hidden" name="pageName" id="pageName" value="viewNote"> 
           <input type="hidden" id="pageNo" name="pageNo" value="${sessionScope.totalPages}">
           <input type="hidden" id="totalPage" name="totalPage" value="${sessionScope.totalPages}">
           <input type="hidden" id="isToCC" name="isToCC" value="${view.getIs_to_cc()}">
           <input type="hidden" id="fileTypeFC" name="fileTypeFC" value="${fileTypeFC }">
      
		</form>
				 <!-- Add CK Editor here -->  
			
	   <!-- <div class="panel panel-default" style="margin-bottom:5px !important;margin-top: 64px;">
			<div class="panel-body" style="padding:8px;"> -->
			<%-- <div class="panel" style="margin-bottom:5px !important;margin-top: 15px;">
				<div>
					<div class="form-group">
					  <div class="col-md-11">
						   <div class="row">
								<div class="col-sm-11" style="height: 350px;width:100%">
									<textarea id="XDESCRIPTION" name="XDESCRIPTION" class="form-control" > ${view.getNote()}</textarea>
									<!-- <script>
										CKEDITOR.env.isCompatible = true;
										CKEDITOR.replace( 'XDESCRIPTION' );
									</script> -->
								</div>
							</div>
						</div>
					</div>	   
				  </div>
			 </div>  --%>
				   
				   
			  </div><!-- End panel 1st here -->
			  
<!-- ----------------------------Start 2nd Panel-------------------------------------- -->			   
			<!-- <div style="margin-top:37px;"></div> -->
			<div class="col-md-6" style="padding: 0px 5px">
			<div class="panel-body" style="height:  ; overflow-y: auto; overflow-x: hidden; padding:0px;">       
    <form class="form-horizontal" name="addRemarks" id="addRemarks" method="post" autocomplete="off">
	
	 <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-bottom:5px !important;">
     <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
             <h4 class="panel-title">
         File Creation Details <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        
        </a>
      </h4>

        </div>
       <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body" style="padding: 0px 26px;"> 
		
       <div class="form-group" style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-4 col-form-label "  for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label"  style="padding-left:0px"><span> ${view.getFile_group_id()} </span><!-- id="FileId" -->
				    		  
				         </div>
				         <%-- <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="ManualNo"><span> ${view.getManual_file_id()} </span>
				    		 
				         </div> --%>
					</div>
		        </div>
		    </div> 
		    
		     <div class="form-group" style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
				         <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" style="padding-left:0px" id="ManualNo"><span> ${view.getManual_file_id()} </span>
				    		 
				         </div> 
					</div>
		        </div>
		    </div> 
		    
      <div class="form-group" style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
				          <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" id="subject" style="padding-left:0px"><span> ${view.getCreated_by()}</span>
				    		                       
				         </div>
					</div>
		        </div>
		    </div> 
		    
		     <div class="form-group"  style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
				       
				           <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" id="designation" style="padding-left:0px"><span> ${view.getDesignaton()}</span>
				    		 
				         </div>  
					</div>
		        </div>
		    </div> 
		    
		    
		    <div class="form-group"  style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
				          <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" id="opendate" style="padding-left:0px"><span>${view.getSubject()}</span>
				    		 
				         </div>
					</div>
		        </div>
		    </div> 
		 
		 </div>
        </div>
    </div>
   </div>
	 
	<div class="panel panel-default" style="margin-bottom:5px !important;">
           <div class="panel-heading"><h3 class="panel-title text-left">File Note</h3></div>
           
			<div class="panel-body" style="padding:8px;max-height:320px;margin-bottom: 7px; overflow:auto;">
     
      		<table>
			  <tr>
			    <th class="infoHead">Sr. No.</th>
			    <th class="infoHead">File Name</th>
			    <th class="infoHead">Information</th>
			  </tr>
			    <c:set var="count1" value="0"></c:set>
			   <c:forEach items="${fileAttachment1}" var="file2">
			     <c:set var="count1" value="${count1+1}"></c:set>
			 
			    <tr>
			    <td style="width:10%; text-align:center;font-family: Calibri, courier-new,sans-serif;font-size: 13px;">${count1}</td>
			    
			    <td style="width:50%; text-align:left;font-family: Calibri, courier-new,sans-serif;font-size: 13px;">
			    	<c:choose>
			    		<c:when test="${file2.getTableName()=='fms_file_creation_master'}">
							<c:if test="${not empty file2.getShowPdf() and file2.getShowPdf() eq 'Y'}">																
								<a onclick="getReport('${file2.getAttachmentid()}', '${file2.getFileName()}', '${fileCreationId}', '')">
									<u>${file2.getDocTitle()}</u>
								</a>							
							</c:if>
							<c:if test="${not empty file2.getShowPdf() and file2.getShowPdf() eq 'N'}">
								<a href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.getFileName()}&folderName=${file2.getFmt_id()}&subFolderName=&FileType=${file2.getStatus()}">
									<u>${file2.getDocTitle()}</u>
								</a>             				
             				</c:if>
             			</c:when>
             			<c:otherwise>
             				
             				<c:if test="${not empty file2.getShowPdf() and file2.getShowPdf() eq 'Y'}">																
								<c:if test="${file2.getStatus() eq 'F'}">
									<a onclick="getReport('${file2.getAttachmentid()}', '${file2.getFileName()}', '${fileCreationId}', '${file2.getFmt_id()}', '${file2.getStatus()}')">
										<u>${file2.getDocTitle()}</u>
									</a>
								</c:if>
								<c:if test="${file2.getStatus() eq 'D'}">
									<a onclick="getReport('${file2.getAttachmentid()}', '${file2.getFileName()}', '${file2.getFmt_id()}', '${file2.getFmt_id()}', '${file2.getStatus()}')">
										<u>${file2.getDocTitle()}</u>
									</a>
								</c:if>
							</c:if>
							
							<c:if test="${not empty file2.getShowPdf() and file2.getShowPdf() eq 'N'}">
								<c:if test="${file2.getStatus() eq 'F'}">
									<a href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.getFileName()}&folderName=${fileCreationId}&subFolderName=${file2.getFmt_id()}">
										<u>${file2.getDocTitle()}</u>
									</a>             			
								</c:if>
								<c:if test="${file2.getStatus() eq 'D'}">
									<a href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.getFileName()}&folderName=${file2.getFmt_id()}&subFolderName=&FileType=D">
										<u>${file2.getDocTitle()}</u>
									</a>             				             								
             					</c:if>
             				</c:if>             			
             			</c:otherwise>
             		</c:choose>
             	</td>
			 
		       <td style="width:10%; text-align:center;">
			    	<a ><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count1}" title="Information" ></i></a>
			    	<div id="myForm${count1}" class="hide">
				        <div>				      
				            <label class="popup-font" for="name">Name: ${file2.getEmpName()}</label><br>
				            <label class="popup-font" for="about">Department: ${file2.getToDepartment()}</label><br>
				            <label class="popup-font" for="about">Designation: ${file2.getToDesignaton()}</label><br>
				            <label class="popup-font" for="about">Date & Time: ${file2.getToDate()}</label>
				           
				        </div>
				   </div>
			    </td>
			  </tr>
             
              </c:forEach>   
			</table>  
      	</div>
     </div>
	
	
	
	
		  
		<div class="panel panel-default" style="margin-bottom:5px !important;">
           <div class="panel-heading"><h3 class="panel-title text-left">File Note</h3></div>
			<div class="panel-body" style="padding:8px;min-height: 333px">
      
		 
		<c:if test="${forDraft ne 'D'}">
		
		
		<div id="" style="width:100%;">
       		<div class="col-xs-12" style="padding:0px;display:flex;margin-top:7px;">
				<div class="table-responsive" style="width:100%;">
					<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid">
						<thead>
							<tr>
								<th style="text-align:center;width:30%;">Letter No.</th>
			  					<!-- <th style="text-align:center;width:35%;">Upload Document
			  						<p class="" style="font-size: 13px !important; font-weight: bold; color: red;margin: 0px 0 0px;">(Max. Size 20MB)</p>
			  					</th> -->
				  				<!-- <th style="text-align:center;width:25%;">Letter Name</th> -->
				  				<th style="text-align:center;width:10%;">Delete</th>
							</tr>
						</thead>
						<tbody id="searchTableDAK">	
							<tr>
									<td class="text-left" style="font-family: Calibri, courier-new,sans-serif; font-size: 15px; width:30%;">
										<select  class="form-control" id="dakId1" name="dakId1" style="width:95%; text-align: center;"> 
										<!-- onchange="getlink(this.value, '1');"> -->
											<option value="">Select Letter No.</option>
							        			<c:forEach items="${DAK_NO}" var="dak">
							        				<c:choose>
														<c:when test="${dak.getDakId() eq dk_id}">
															<c:set var="sel" value="selected"></c:set>
															<c:set var="dis" value="disabled"></c:set>
														</c:when>
														<c:otherwise>
															<c:set var="sel" value=""></c:set>
															<c:set var="dis" value=""></c:set>
														</c:otherwise>
													</c:choose>
							  						<option value="${dak.getDakId()}" ${sel}>${dak.getDakName()}</option>
							  					</c:forEach>
										</select>
										<input type="hidden" class="form-control" id="DAKhfname1" name="DAKhfname1">
				 						<input type="hidden" class="form-control" id="DAKfsize1" name="DAKfsize1">
									</td>
								
				 				
				 				<td style="text-align:center;color:RED;cursor:pointer; width:15%; font-size:12px;" onclick="DAKdeletedata(1, this)"><i class="fa fa-trash-o"></i> Delete</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-1 text-right"style="margin-top:18px;">
				 <c:choose>
                    <c:when test="${view.getIs_to_cc()=='Y' }"></c:when>
                    <c:otherwise>
                        <div class="colr-blue-p" id="DAKaddmore"><span id="" onClick="" ><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span></div>
                    </c:otherwise>
                </c:choose>
				</div>
				
			</div>
		</div>
		</c:if>
		<div class="form-group" style="margin: 5px;">
			<div class="col-md-12">
				<div class="row" id="">
					<label class="col-sm-2 col-form-label " for="DAKremarks"></label>
					<div class="col-sm-8 text-right m-t-20">
						<div class="errmessage" id="DAKdelerrMsg"></div>
					</div>
					
				</div>
			</div>								
		</div>
			       
	<c:if test="${forDraft ne 'D'}">
			       
       <div id="" style="width:100%;">
       		<div class="col-sm-12" style="padding: 0px;">
				<div class="table-responsive col-sm-11" style="width:91.5%;padding: 0px;">
					<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid" style="width: 150%; overflow: scroll;">
					<thead>
				<tr>
					<!-- <th style="text-align:center;width:20%;">Document Title</th> -->
					<th style="text-align:center;width:9%;">Document Type</th>
				    <th style="text-align:center; width:9%;">Document No.</th>
			  		<!-- <th style="text-align:center;width:35%;">Upload Document
			  		 <a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="tooltip" title="Information" data-original-title="(Max. Size Cannot Exceed 20MB) (Note: Only .pdf, .jpg, .png, &amp; doc files will be allowed for uploading)"></i></a>
			  		 </th> -->
			  		 <th style="text-align:center;width:35%;">Upload Document &nbsp;<span id="tip" data-toggle="tooltip" data-placement="left"
				       title="" data-original-title="(Max. Size Cannot Exceed 20MB) (Note: Only .pdf, .jpg, .png, &amp; doc files will be allowed for uploading)"
				       class="red-tip"><i class="fa fa-info-circle fa-lg"></i></span></th>
				  	<th style="text-align:center;width:25%;">File Name</th>
				  	<th style="text-align:center;width:5%;">Delete</th>
				</tr>
			</thead>
		<tbody id="searchTable" >
				<c:set var="count" value="0"></c:set>
				
				<c:if test="${(count==0)}">	
				<tr>
				 <!-- <td class="text-center"><input type="text" class="form-control" id="doctitle1" name="doctitle1" 
				 maxlength="100" onchange="namechange(1,this.value);" placeholder="Enter Document Title" > -->
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
				 <td class="text-center" style="font-size: 12px;"><input type="file" id="upldoc1" onchange=" sizeChk(1); data(1)" name="upldoc1" class="" style="width:100%"></td>
				 <td class="text-center"style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;"><div id="np1"></div></td>
				 <td style="text-align:center;color:RED;cursor:pointer; width:15%; font-size:12px;" onclick="deletedata(1,this)"><i class="fa fa-trash-o"></i> Delete</td>
				</tr>
				</c:if>
			</tbody>
			</table>
			</div>
			
			  <div class="col-sm-1 text-right"style="margin-top:20px;">
				 <c:choose>
                    <c:when test="${view.getIs_to_cc()=='Y' }"></c:when>
                    <c:otherwise>
                        <div class="colr-blue-p" id="addmore">
							<span id="" onClick=""><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span>
						</div>
                    </c:otherwise>
                </c:choose>
				</div>
		
		
		</div>
		</div>
		
		</c:if>
		
							<div class="form-group"style="margin: 5px;">
								<div class="col-md-12">
									<div class="row" id="">
										<label class="col-sm-2 col-form-label " for="remarks"></label>
										<div class="col-sm-8 text-right m-t-20">
											<div class="errmessage" id="delerrMsg"></div>
										</div>
										<%-- <div class="col-sm-2 text-right" style="margin-top:5px;">
											<button type="button" class="btn btn-view" 
											<c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="addmore">Add</button>
											<c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if>
											<div class="colr-blue-p" id="addmore"><span id="" onClick=""><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span></div>
										</div> --%>
									</div>
								</div>
								
							</div>

			
		 
		    <div class="col-sm-12 text-center">
        	<div class="row">
	      		<div class="errmessage" id="errMsg"></div>
          	</div>
		    </div> 
					 <div class="form-group m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <button type="button" class="btn btn-view" onclick="showPreview();" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnPreview" >Preview</button>
						    <c:if test="${forDraft ne 'D'}">
						    	<button type="button" class="btn btn-view" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnSave" >Save</button>
					        </c:if>
					        <button type="button" class="btn btn-view" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnReset">Reset</button>
					        <button type="button" class="btn btn-view" id="btnBack" onclick="back('${PagetypB}');">Back</button>
					        <c:if test="${forDraft ne 'D'}">
					        	<button type="button" class="btn btn-view sentColr" id="btnSent" <c:if test="${view.getNote()==''}"> style="display: none;"  </c:if>>Send File</button>
							</c:if>
							<c:if test="${forDraft eq 'D'}">
								<button type="button" class="btn btn-view sentColr" id="btnApp">Approved</button>
							</c:if>
				           </div>
				       </div>
				    </div>
				    
				    
				    
				    
				    
				     
				    
				    </div>
				    
				    	 
			
				    </div><!-- 2nd panal end -->
		    
				<div class="form-group m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <span  data-toggle="modal" data-target=".recomond-btn11"  style="font-size: 20px;color: blue; margin: 20px 0px;"><b> <a >Click Here for Signature</a></b></span>
				           </div>
				       </div>
				    </div>    
			<!-- 	    
		    </div>
	      </div>End panel-body
	       -->
		
	       
	       
  <%-- <div class="modal" id="viewPreview">
	<div class="modal-dialog modal-lg" role="document" style="width: 94%;">
		<div class="modal-content">
			
			<!-- Modal Header -->			
			<!-- <div class="modal-header text-center mod-head">
				<h4 class="modal-title text-left">
					<h3 style="color: red;">Preview</h3>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div> -->
			<div class="modal-header"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
			

					<!-- Modal body -->
			<div class="modal-body">
			
			<div class="panel panel-default" style="background: #c9fa9c;">
			 <div class="panel-body">
			   <hr style="margin-bottom: -60px;margin-top: 50px;border: 1px solid black;">
				<div class="vl">
					
	 			<div id="xyz">
	 			<div id="abc">
	 				 <div style="text-align:center;padding-top: 23px;padding-left: 6px;font-size: 15px;">NOTES & ORDERS
					  <div style="padding-top: 20px;">
	 			  	<div class="form-group" style="margin-bottom: 0px; margin-left: 10px;margin-right: 10px;">
						<div class="col-md-12">
							<div class="row">
								<span id="previewNote">
								</span>
							</div>
						</div>
					</div>
				    </div></div>
	 			</c:forEach>
 			</div>
 			</div>
			</div>	
 			<!-- Modal footer -->
			<!-- <div class="modal-footer">
				<button type="button" class="btn btn-danger"  data-dismiss="modal">Close</button>
			</div> -->
			</div></div></div>
		</div>
	</div>
</div> --%>

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
	      
		
	   
           <input type="hidden" id="fileid" name="fileid" value="${view.getFile_creation_id()}"> 
	       <input type="hidden" id="fileDetId" name="fileDetId" value="${view.getFileDetailId()}"> 
	       <input type="hidden" id="status" name="status" value="${view.getFilestatus()}">
	       <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	       <input type="hidden" name="note" id="note" >
	       <input type="hidden" name=index id="index" value="1">
	       <input type="hidden" name="indexs" id="indexs" value="1">
	       <input type="hidden" name=DAKindex id="DAKindex" value="1">
	       <input type= "hidden" id="filesize" name="filesize" value="${filesize}">
	       <input type= "hidden" id="count" name="count" value="${count1}" >
	       <input type= "hidden" id="desi" name="desi" value="${designation}" >
	       <input type= "hidden" id="readUnreadStatus" name="readUnreadStatus" value="${readUnreadStatus}" >	      
	       
 </form> 
     	
 <form class="form-horizontal" name="frmCat" id="frmCat" action="" target="">
    <div class="modal fade recomond-btn11" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" >
	 <div class="modal-dialog">
		<div class="modal-content">
			
			  <div class="modal-body">
			  <div class="modal-header" style="margin: 0px;padding: 0px;"> 
			  <button style="margin:2px 0px;padding: 0px;" type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red;">X</button>
			</div>
			   <div class="panel panel-default">
     			<div class="panel-body">
	 <div id="canvas-wrap">
			<canvas id="AVI_SIGN"></canvas> 
			
			 <!--  <div id="buttons">
			       <div id="text">Please sign above</div>
			       <input type="button" id="download" value="Save as PNG"/>
			     
			  </div> -->
			</div>
				<div class="col-md-12 text-center m-t-20">
				 	<button type="button" class="btn btn-view" id="clear" onClick="">Clear</button> 
				</div>
   			</div>
   		</div>
   	 </div>
   	</div>
		</div><!-- End panel-body -->
	</div><!-- End panel-default -->
	</form>
     	
     	
				
		<div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true">
		<div class="modal-dialog modal-lg file-note" style="width:50%; float:right;">
			<!-- <div class="modal-dialog modal-lg" style="overflow:scroll !important; float: right; margin-right: 10%;"> -->
			<div class="modal-content">
				<div class="modal-header text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
				</div>
				
				<div class="modal-body" style="height: 100%"> <!--Start Modal Body-->
					<form name="pdfForm" id="pdfForm" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="_Report" id="_Report" width="100%;" height="650px" src="" frameborder="0" scrolling="yes" style="overflow-y:hidden;"></iframe>
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
	
			  
			  </div>
			</div><!-- End panel 2nd here -->
			 
			 <div class="panel">
				<div>
					<div class="form-group">
					  <div class="col-md-12" style="margin-bottom:5px !important;padding-top: 10px;">
						   <div class="row">
								<div class="col-sm-12" style="width:100%">
									<textarea id="XDESCRIPTION" name="XDESCRIPTION" class="form-control" > ${view.getNote()}</textarea>
									<!-- <script>
										CKEDITOR.env.isCompatible = true;
										CKEDITOR.replace( 'XDESCRIPTION' );
									</script> -->
								</div>
							</div>
						</div>
					</div>	   
				  </div>
			 </div> 
			 
			</div>
		</div>
   </div>
   
   </body>
    <script>
	function toggleIcon(e) { 
       	 $(e.target)
            .prev('.panel-heading')
            .find(".short-full")
            .toggleClass('glyphicon-plus glyphicon-minus');
    }
    $('.panel-group').on('hidden.bs.collapse', toggleIcon);
    $('.panel-group').on('shown.bs.collapse', toggleIcon);
</script>
<script>
$(document).ready(function(){
	function resizeIframe(iframe) {
		iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
	    window.requestAnimationFrame() = resizeIframe(iframe);
	}	
	var editor1 = new RichTextEditor("#XDESCRIPTION");
});
</script>


   <script>
          //var canvas = document.getElementById("AVI_SIGN");

         /*  function resizeCanvas() {alert("avi");
              var ratio = Math.max(window.devicePixelRatio || 1, 1);
              canvas.width = canvas.offsetWidth * ratio;
              canvas.height = canvas.offsetHeight * ratio;
              canvas.getContext("2d").scale(ratio, ratio);
          } */
          /* window.onresize = resizeCanvas;
          resizeCanvas(); */

          
           //var signaturePad = new SignaturePad(canvas, {
        //   backgroundColor: 'rgb(255,255,255)'
          //}); 

          //document.getElementById("clear").addEventListener('click', function(){
          // signaturePad.clear();
          //})
          
          
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

function square() {
  ctx.rect(100, 25, 100, 100);
  ctx.lineWidth = 5;
 
  
  var canvas = document.getElementById("AVI_SIGN");
  var signaturePad = new SignaturePad(canvas, {
 
   }); 
  document.getElementById("clear").addEventListener('click', function(){
    signaturePad.clear();
   })
}

square();

/* const inp1 = document.getElementsByTagName("input")[0],
  inp2 = document.getElementsByTagName("input")[1],
  p = document.querySelector("p");

inp1.checked = true;
inp1.addEventListener("click", () => {
  inp2.checked = false;
  canvas.width = 300;
  canvas.height = 150;
  square();
});

inp2.addEventListener("click", () => {
  inp1.checked = false;
  canvas.width = 600;
  canvas.height = 300;
  square();
});
 */
   </script>

</html>