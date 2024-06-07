<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.*"%>
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
  	 <title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>  	 
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	
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
		


<style type="text/css">
		.btn-view {
			color: #ffffff !important;
			background-color: #00799A !important;
			border-color: #687DB4 !important;
			font-size: 15px !important;
			box-shadow: 2px 2px 1px #336376 !important;
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;
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
    
    /* table.tableGrid th {
    background-color: #ffcc33;
    border: 1px solid #439653 !important;
    color: #0c426f;
    font-family: Calibri, courier-new,sans-serif;
    font-size: 13px;
} */
.infoHead{
   text-align: center;
    font-size: 13px;
    font-weight: 700;
    color: #295367;
    font-family: Calibri, courier-new,sans-serif;
    font-size: 13px;
    }
    
    table.tableGrid th {
      background-color: #ffcc33;
      border: 1px solid #439653 !important;
      color:#0c426f;
      font-family: Calibri, courier-new,sans-serif !important;
      font-size: 13px !important;
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
		margin-left:100px;
	}
	.rte-modern.rte-desktop.rte-toolbar-default {
    	min-width: unset !important;
        height: 355px; 
	}
</style>

	<script>
	$(document).ready(function(){
	    $("a").tooltip();
	});
   </script>	

</head>
 
 <body onload="dis('${view.getIs_to_cc()}', '${PagetypB}');showReport(${view.getFile_creation_id()});">

<div class="container-fluid">
   <div id="" class="page-header" style="padding: 0px !important;"><h4 style="font-size: 15px;">File Inbox</h4></div>
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">New Record</h3></div>
			<div class="panel-body" style="padding: 15px 0 0px 0px;">
 	
 			
 	 <!-- ----------------------------Start 1st Panel-------------------------------------- -->
			<div class="col-md-6" style="width: 58%">
			    
			
			 <form class="form-horizontal" name="getNote" id="getNote" method="post" autocomplete="off">
			<%--   
			 <div class="" id="">
			<div class="form-group" style="margin-bottom: 0px;">
						<div class="col-md-12">
							<div class="row">
								<label for="" class="col-sm-6 col-form-label "><b>Manual File No.: </b><span id="no">${viewList.getManual_file_id()}</span></label> 
								<label for="" class="col-sm-6 col-form-label "><b>From Employee: </b><span id="emp">${viewList.getEmpName()}</span></label>
								<!--  <label for="" class="col-sm-4 col-form-label "><b>Department: </b><span id="dept"></span></label> -->
							</div>
						</div>
					</div>
	 			
	 			<div class="form-group" style="margin-bottom: 0px;">
						<div class="col-md-12">
							<div class="row">
								<label for="" class="col-sm-6 col-form-label "><b>Department: </b><span id="dept">${viewList.getFromDepartment()}</span></label>
								<label for="" class="col-sm-6 col-form-label "><b>Date & Time: </b><span id="date">${viewList.getToDate()}</span></label>
							</div>
						</div>
					</div>
	 			</div> --%>
	 	<!-- 		<div class="form-group">
			    <div class="col-sm-6"></div>
			    <div class="col-sm-6">
					<div class="col-md-12">
						<div class="row">
						   <label class="col-sm-6 col-form-label" for="">Move To Page No.</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="moveTo" name="moveTo" placeholder="Page No." onblur="displayNext(this.value);" style="width: 75px;"> 
							</div>
				       </div>
				     </div>
				 </div>
				</div>  
	 			 -->
	 			
	 	 <div class="" id="">
				<div class="panel panel-default" style="margin-bottom: -13px;">
				<div class="panel-body" style="height: ;width: 100%; padding:10px 2px 10px 2px; ">
				
				 
			<!-- 	Insert code here  -->
	 			<div id="xyz">
	 			<div id="abc" style="width:100% !important">	
	 			<c:if test="${forDraft ne 'D'}">
		 			<iframe class="embed-responsive-item" name="file_mov_view" id="file_mov_view" width="100%;" height="" 
	 					frameborder="0" scrolling="no" style="min-height:720px !important;max-height:1000px!important;">
	 				</iframe>
	 			</c:if>
	 			<c:if test="${forDraft eq 'D'}">
	 				<iframe class="embed-responsive-item" name="file_mov_view" id="file_mov_view" width="100%;" height="" 
	 					frameborder="0" scrolling="no" style="min-height:720px !important;max-height:1000px!important;">
	 				</iframe>
	 			</c:if>
<%-- 	 			${viewList}
 --%>	 			<%--  <c:forEach items="${viewList}" var="model">
	 			<c:if test="${model.getNote()!=''}">
	 			<div class="col-sm-12" id="pagination">
	  			${model.getNote()}
	  		
	 			<div class="col-sm-4"></div>
	  			<div  class="col-sm-8" id="noteVal" style="color: blue;padding-top: 10px; ">
	  			
	  		    Name: 
	  			${model.getEmpName()} </br>
	  			Designation: 
	  			${model.getToDesignaton()} </br>
	  			Date & Time: 
	  			${model.getToDate()}
	  			</div>    
			    </div>   
			   
			      <hr style="border:1px solid grey !important;">
			      </c:if>
			 	 </c:forEach>  --%>
 				 
 			</div>
 			</div>
			    </div>
			 </div>
			</div><!-- Close 2st div -->
			
			
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

				   <%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
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
      
     
       <%--  <table border="1" class="col-sm-4" cellpadding="3" cellspacing="3">
          <c:if test="${recordSize!=1}">
        <tr>
        For displaying Previous link except for the 1st page
       <c:if test="${currentPage != 1}">
        <td    style="width: 22%; padding: 0px;"><a href="#"  onclick="view('${viewList.getFile_creation_id()}','${view.getFileDetailId()}','L','${currentPage - 1}')">Previous</a></td>
        </c:if>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td style="width: ; padding: 0px;">${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td style="width: ; padding: 0px;"><a href="#" onclick="view('${viewList.getFile_creation_id()}','${view.getFileDetailId()}','L','${i}')">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage lt noOfPages}">
        <td><a href="#" onclick="view('${viewList.getFile_creation_id()}','${view.getFileDetailId()}','L','${currentPage + 1}')">Next</a></td>
    </c:if>
        </tr>
         </c:if>
    </table> --%>
   
     
    <%--For displaying Next link --%>
    
    	       <%--  <div class="col-sm-5 text-right">
    	       
		         <c:if test="${not empty viewList.getFileSent()}">
		         <a href="../downloadfile?filename=${viewList.getFileName()}&folderName=${viewList.getFileDetailId()}" onclick="showPopUp();"
		         data-toggle="tooltip" data-placement="top" title="" data-original-title="Click here for download the Attachment" class="red-tip" >
		         
		         <b style="border: 1px solid green; border-radius: 7px; padding: 0px 3px; background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#437386), color-stop(100%,#78B9D2));
					   color: #002534;">DOWNLOAD ATTACHMENT</b></a> </c:if>
    	        
				
				  </div> --%>
				  
		<div class="col-sm-4 text-right" style="padding:0px;margin-top: 4px;">
		   <a href="#" onclick="getpdf('${view.getFile_creation_id()}', '${fileTypeFC }');"data-toggle="tooltip" data-placement="top"
		       title="" data-original-title="Click here for download the Notes"
		       class="red-tip">
                     <b style="border: 1px solid green; border-radius: 7px; padding: 4px 4px;
					 color: #ffffff !important; background-color: #00799A !important; border-color: #687DB4 !important; font-size: 15px !important;
			         box-shadow: 2px 2px 1px #336376 !important; background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;">PRINT NOTES</b></a>
		</div>
	</div>
				   
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
			
	   <div class="panel panel-default" style="margin-bottom:5px !important;margin-top: 64px;">
			<div class="panel-body" style="padding:8px;">
					<div class="form-group">
					  <div class="col-md-12">
						   <div class="row">
								<div class="col-sm-12" style="height: 350px;">
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
				   
				   
			  </div><!-- End panel 1st here -->
			  
<!-- ----------------------------Start 2nd Panel-------------------------------------- -->			   
			<!-- <div style="margin-top:37px;"></div> -->
			<div class="col-md-5" style="padding: 0px 5px 0px 0;">
			<div class="panel-body" style="height:  ; overflow-y: auto; overflow-x: hidden; padding:0px;">       
    <form class="form-horizontal" name="addRemarks" id="addRemarks" method="post" autocomplete="off">
	 <!--  <div class="panel panel-default">
				 
	<div class="panel-body"> -->
	  <!-- <div class="col-sm-12 text-center">
        	<div class="row">
	      		<div class="errmessage" id="errMsg1"></div>
          	</div>
		    </div> -->
		    
	<%--  <div class="form-group m-t-25 m-b-5 test">
		<div class="col-md-12 text-center">
			<div class="row">
			    <button type="button" class="btn btn-view" onclick="showPreview();" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnPreview1" >Preview</button>
			    <c:if test="${forDraft ne 'D'}">
			    	<button type="button" class="btn btn-view" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnSave1" >Save</button>
		        </c:if>
		        <button type="button" class="btn btn-view" <c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="btnReset1">Reset</button>
		        <button type="button" class="btn btn-view" id="btnBack1" onclick="back('${PagetypB}');">Back</button>					       
		        <c:if test="${forDraft ne 'D'}">
		        	<button type="button" class="btn btn-view sentColr" id="btnSent1" <c:if test="${view.getNote()==''}"> style="display: none;"  </c:if>>Sent File</button>
		        </c:if>
		        <c:if test="${forDraft eq 'D'}">
					<button type="button" class="btn btn-view sentColr" id="btnApp1">Click Here to Approve Draft</button>
				</c:if>
				           
			</div>
		</div>
	</div> --%>
	
	<%--  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-bottom:5px !important;">
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
				         <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="ManualNo"><span> ${view.getManual_file_id()} </span>
				    		 
				         </div>
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
					   <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.title" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="title">
				    		 
				         </div>
				          <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" id="subject" style="padding-left:0px"><span> ${view.getCreated_by()}</span>
				    		                       
				         </div>
				         
				           <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="designation"><span> ${view.getDesignaton()}</span>
				    		 
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
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
             <h4 class="panel-title">
         File/DAK Attachment Details
         <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
         
        </a>
      </h4>

        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="panel-body" style="overflow:auto;min-height: 50px; max-height: 150px;">
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
			    	<a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count1}" title="Information" ></i></a>
			    	<div id="myForm${count1}" class="hide">
				        <div>				      
				            <label class="popup-font" for="name">Name: ${file2.getEmpName()}</label><br>
				            <label class="popup-font" for="about">Designation: ${file2.getToDesignaton()}</label><br>
				            <label class="popup-font" for="about">Level: ${file2.getSubject()}</label><br>
				            <label class="popup-font" for="about">Date & Time: ${file2.getToDate()}</label>
				           
				        </div>
				   </div>
			    </td>
			  </tr>
             
              </c:forEach>   
			</table>  
            </div>
        </div>
    </div>
    
    <!-- dak detail -->
    
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="heading3">
			<h4 class="panel-title">DAK Attachment Details<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3"></a></h4>
        </div>
        
        <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
			<div class="panel-body" style="overflow:auto;height:100px;">
           		<table>
			  		<tr>
			    		<th class="infoHead">Sr. No.</th>
			    		<th class="infoHead">File Name</th>
			    		<th class="infoHead">Information</th>
			  		</tr>
			    	
			    	<c:set var="count1" value="0"></c:set>
			   			<c:forEach items="${fileAttachment2}" var="file2">
			     			<c:set var="count1" value="${count1+1}"></c:set>
			 					<tr>
			    					<td style="width:20%; text-align:center;font-family: Calibri, courier-new,sans-serif;font-size: 13px;">${count1}</td>			    
			    					<td style="width:50%; text-align:left;font-family: Calibri, courier-new,sans-serif;font-size: 13px;">
			    						 
			    						 target="_blank" href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.geFileName()}&folderName=${fileCreationId}&subFolderName=&FileType=D">
										<a target="_blank" href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.getFileName()}&folderName=${file2.getFile_group_id()}&subFolderName=&FileType=D">
											<u>${file2.getFileName()}</u>
										
										</a>             				             								
             						</td>			 
		       						<td style="width:30%; text-align:center;">
			    						<a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count1}" title="Information" ></i></a>
			    							<div id="myForm${count1}" class="hide">
				        						<div>					      
				            						<label class="popup-font" for="name">Name: ${file2.getEmpName()}</label><br>
				            						<label class="popup-font" for="about">Designation: ${file2.getToDesignaton()}</label><br>
				            						<label class="popup-font" for="about">Level: ${file2.getSubject()}</label><br>
				            						<label class="popup-font" for="about">Date & Time: ${file2.getToDate()}</label>				           
				        						</div>
				   							</div>
			    					</td>
			  					</tr>             
              				</c:forEach>   
				</table>  
        	</div>
		</div>
	</div>
    
    <!-- end dak -->
    <!-- hhhhh -->
    <!-- Modal -->
	
		</div><!-- End of accordion div -->
	 --%>
	 
	<div class="panel panel-default" style="margin-bottom:5px !important;">
           <div class="panel-heading"><h3 class="panel-title text-left">File Note</h3></div>
           
			<div class="panel-body" style="padding:8px;height:710px;margin-bottom: 7px;">
      		
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
			    	<a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count1}" title="Information" ></i></a>
			    	<div id="myForm${count1}" class="hide">
				        <div>				      
				            <label class="popup-font" for="name">Name: ${file2.getEmpName()}</label><br>
				            <label class="popup-font" for="about">Designation: ${file2.getToDesignaton()}</label><br>
				            <label class="popup-font" for="about">Level: ${file2.getSubject()}</label><br>
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
			<div class="panel-body" style="padding:8px;min-height: 390px">
      
		 <div class="form-group" style="margin: 0px;">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-4 col-form-label "  for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label"  style="padding-left:0px"><span> ${view.getFile_group_id()} </span><!-- id="FileId" -->
				    		  
				         </div>
				        <%--  <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</label>
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
					   <%-- <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.title" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="title">
				    		 
				         </div> --%>
				          <label class="col-sm-4 col-form-label " for=""><b><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle>:</b></label>
						 <div class="col-sm-8 col-form-label" id="subject" style="padding-left:0px"><span> ${view.getCreated_by()}</span>
				    		                       
				         </div>
				         <%-- 
				           <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="designation"><span> ${view.getDesignaton()}</span>
				    		 
				         </div>  --%>
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
		<div class="form-group" style="margin:0px;">
			<div class="col-md-12">
				<div class="row">
				<!-- <div class="col-sm-2"></div>	 -->
		        	<!-- <label for="sector" class="col-sm-4 col-form-label ">Additional Upload File</label>
						<div class="col-sm-5" id="fileU">
							<input type="file" class="form-control" id="XFILE" name="XFILE"/> 
 							<img id="imgFileUpload" src="#" alt="" style="height:55px;width:100%;"/>
							<span style="font-size: 13px !important; font-weight: bold; color: red;">Max. Size 20MB</span>
						</div> -->
						<%-- <div class="col-sm-3">
						 <c:if test="${not empty view.getFilestatus()}">
						  <label><a onclick="" href="../downloadfile?filename=${view.getFileSent()}&folderName=${view.getFileDetailId()}"><u>${view.getFilestatus()}</u></a></label>
		               </c:if>
    	             </div> --%>
						
	         	</div>
			</div>
       </div>
       
       <%-- <div class="form-group">
			<div class="col-md-12">
				<div class="row">
							<c:forEach items="${currentEmployeeFileName}" var="file1">
								<div class="col-sm-6">
								
									<label>
										<a href="../downloadfile?filename=${file1.getAttachmentid()}_${file1.getFileName()}&folderName=${view.getFile_creation_id()}&subFolderName=${view.getFileDetailId()}">
											<u>${file1.getFileName()}</u>
										</a>
										<td>
											<a href="#" style="color:red;cursor: pointer;width:15%"onclick="deleteFile('${file1.getAttachmentid()}', 
											'${file1.getFileName()}', '${view.getFile_creation_id()}','${view.getFileDetailId()}');" 
											class="red-tip" title="Click here to Remove the File" >&nbsp; <i  class="fa fa-trash" ></i></a>
		           						</td>
		           						
									</label>
								</div>
							</c:forEach> 
	         	</div>
			</div>
       </div> --%>
      
		 	<%-- <div class="form-group">
			<div class="col-md-12">
				<div class="row">
						<div class="col-sm-12" style="height: 350px;">
							<textarea id="XDESCRIPTION" name="XDESCRIPTION" class="form-control" > ${view.getNote()}</textarea>
							<script>
								CKEDITOR.env.isCompatible = true;
								CKEDITOR.replace( 'XDESCRIPTION' );
							</script> 
						</div>
					</div>
				</div>
			</div> --%>
			
		<!-- dak strt -->
		<%-- <div id="" style="width:100%; padding-top:65px;">
       		<div class="col-xs-12" style="padding:0px">
				<div class="table-responsive">
					<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid" >
						<thead>
							<tr>
								<th style="text-align:center;width:45%;">DAK No.</th>
					  			<th style="text-align:center;width:45%;">Attached DAK</th>
					  			<th style="text-align:center;width:10%;" class="infoHead">Information</th>
							</tr>
						</thead>
						<tbody id="searchTable1" >
							<tr>
								
								<c:set var="dk_id" value="0"></c:set>
								<c:forEach items="${fileAttachment2}" var="file2">
									<c:set var="dk_id" value="${file2.getFile_group_id()}"></c:set>
	     						</c:forEach>
												
	   							<td class="text-left" style="font-family: Calibri, courier-new,sans-serif; font-size: 13px; width:45%;">
										<select  class="form-control" id="dakId" name="dakId" style="width:95%; text-align: center;">
											<option value="">Select DAK No.</option>
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
									</td>
									
									<c:if test="${fileAttachment2.size() == 0}">
										<td style="width:45%; text-align:center;"></td>
										<td style="width:10%; text-align:center;"></td>
									</c:if>
									
									<c:if test="${fileAttachment2.size() > 0}">
									<c:set var="count1" value="0"></c:set>
									<c:forEach items="${fileAttachment2}" var="file2">
	     							<c:set var="count1" value="${count1+1}"></c:set>
									
									<c:if test="${file2.getFileName() ne '' or file2.getFileName() !=''}">
				    					<td style="width:45%; text-align:center; font-family: Calibri, courier-new,sans-serif;font-size: 13px;">
				    						<a target="_blank" href="../downloadfile?filename=${file2.getAttachmentid()}_${file2.getFileName()}&folderName=${file2.getFile_group_id()}&subFolderName=&FileType=D">
												<u>${file2.getFileName()}</u>
											</a>             				             								
	             						</td>			
             						</c:if>
             						<c:if test="${file2.getFileName() eq '' or file2.getFileName() ==''}">
				    					<td style="width:45%; text-align:center; font-family: Calibri, courier-new,sans-serif;font-size: 13px;"></td>			
             						</c:if> 
             						
		       						<td style="width:10%; text-align:center;">
										<a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count1}" title="Information" ></i></a>
		    								<div id="myForm${count1}" class="hide">
				        						<div>					      
				            						<label class="popup-font" for="name">Name: ${file2.getEmpName()}</label><br>
				            						<label class="popup-font" for="about">Designation: ${file2.getToDesignaton()}</label><br>
				            						<label class="popup-font" for="about">Level: ${file2.getSubject()}</label><br>
				            						<label class="popup-font" for="about">Date & Time: ${file2.getToDate()}</label>				           
				        						</div>
				   							</div>
			    					</td>			  					          
              				</c:forEach>
              				</c:if>
              				</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div> --%> 
		<br>
		<!-- dak end  -->
		<c:if test="${forDraft ne 'D'}">
		<%-- <div class="form-group" style="margin-bottom:7px; padding-top:15px;">
			<div class="col-md-12">
				<div class="row">
					<label class="col-sm-2 col-form-label " for=""><b>Remarks :</b></label>
					<div class="col-sm-10">
						<textarea id="remarksInbox" name="remarksInbox" class="form-control" style="height: 60px;">${view.getReceiverRemarks()}</textarea>
					</div>
				</div>
			</div>
		</div> --%>
		
		
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
								
				 				<!-- <td class="text-center">
				 					<input type="text" class="form-control" id="DAKdoctitle1" name="DAKdoctitle1" maxlength="100" onchange="DAKnamechange(1,this.value);" placeholder="Enter Document Title" >
				 					<input type="hidden" class="form-control" id="hfname1" name="hfname1">
				 					<input type="hidden" class="form-control" id="fsize1" name="fsize1">
				 				</td> -->
				 				
				 				<!-- <td class="text-center" style="font-size: 12px;">
				 					<input type="file" id="DAKupldoc1" onchange="DAKdata(1)" name="DAKupldoc1" class="" multiple="multiple" style="width:100%">
				 				</td> -->
				 				<!-- <td class="text-center"style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;">
				 					<div id="DAKnp1"></div>
				 					<div id="DAKLink1"></div>
				 				</td> -->
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
					<%-- <div class="col-sm-2 text-right"style="margin-top:5px;">
					<c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if>
					<div class="colr-blue-p" id="DAKaddmore"><span id="" onClick=""><i class="fa fa-plus-circle fa-2x" style="font-size: 20px;"></i></span></div>
						<button type="button" class="btn btn-view" 
						<c:if test="${view.getIs_to_cc()=='Y' }"> disabled="disabled" </c:if> id="DAKaddmore">Add</button>
					</div> --%>
				</div>
			</div>								
		</div>
			       
	<c:if test="${forDraft ne 'D'}">
			       
       <div id="" style="width:100%;">
       		<div class="col-xs-12" style="padding:0px;display:flex;">
				<div class="table-responsive" style="width:90%;display: contents;">
					<table border="1" cellspacing="1" cellpadding="1" width="100%" class="tableGrid">
					<thead>
				<tr>
					<!-- <th style="text-align:center;width:20%;">Document Title</th> -->
					<th style="text-align:center;width:9%;">Document Type</th>
				    <th style="text-align:center; width:9%;">Document No.</th>
			  		<!-- <th style="text-align:center;width:35%;">Upload Document
			  		 <a href="#"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="tooltip" title="Information" data-original-title="(Max. Size Cannot Exceed 20MB) (Note: Only .pdf, .jpg, .png, &amp; doc files will be allowed for uploading)"></i></a>
			  		 </th> -->
			  		 <th style="text-align:center;width:35%;">Upload Document &nbsp;<a href="javascript void(0);" data-toggle="tooltip" data-placement="right"
				       title="" data-original-title="(Max. Size Cannot Exceed 20MB) (Note: Only .pdf, .jpg, .png, &amp; doc files will be allowed for uploading)"
				       class="red-tip"><i class="fa fa-info-circle fa-lg"></i></a></th>
				  	<th style="text-align:center;width:25%;">File Name</th>
				  	<th style="text-align:center;width:5%;">Delete</th>
				</tr>
			</thead>
		<tbody id="searchTable" >
				<c:set var="count" value="0"></c:set>
				<%-- <c:forEach items="${filesName}" var="file1">
			    	<c:if test="${file1.getTitle()!=''}">
						<c:set var="count" value="${count+1}"></c:set>
							<tr>
								<td class="text-left" style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;">${file1.getTitle()}</td>
								<td class="text-left" style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;">${file1.getFileName()}</td>
								<td class="text-left" style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;">
									<a href="../downloadfile?filename=${file1.getAttachmentid()}_${file1.getFileName()}&folderName=${view.getFile_creation_id()}&subFolderName=${view.getFileDetailId()}">
										<u>${file1.getDocTitle()}</u>
									</a>
								</td>
								<td style="text-align:center;color:RED;cursor:pointer; width:15%;font-size: 12px; " 
								onclick="deleteFile('${file1.getAttachmentid()}', '${file1.getFileName()}', '${view.getFile_creation_id()}','${view.getFileDetailId()}',this,'${file.getFilesize()}');">
								<i class="fa fa-trash-o"></i> Delete</td>
							</tr>
						</c:if>
				</c:forEach> --%>
				
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
				 <td class="text-center" style="font-size: 12px;"><input type="file" id="upldoc1" onchange="data(1)" name="upldoc1" class="" multiple="multiple" style="width:100%"></td>
				 <td class="text-center"style="font-family: Calibri, courier-new,sans-serif;font-size: 13px;"><div id="np1"></div></td>
				 <td style="text-align:center;color:RED;cursor:pointer; width:15%; font-size:12px;" onclick="deletedata(1,this)"><i class="fa fa-trash-o"></i> Delete</td>
				</tr>
				</c:if>
			</tbody>
			</table>
			
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
		</div>
		
		</c:if>
		<!-- <div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage" id="delerrMsg"></div>
	</div>
</div>  -->
		
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
				    </div></div><!-- 2nd panal end -->
		    
				    
			<!-- 	    
		    </div>
	      </div>End panel-body
	       -->
  <div class="modal" id="viewPreview">
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
	 			<%-- </c:forEach> --%>
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
</div>
	      
	   
           <input type="hidden" id="fileid" name="fileid" value="${view.getFile_creation_id()}"> 
	       <input type="hidden" id="fileDetId" name="fileDetId" value="${view.getFileDetailId()}"> 
	       <input type="hidden" id="status" name="status" value="${view.getFilestatus()}">
	       <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	       <input type="hidden" name="note" id="note" >
	       <input type="hidden" name=index id="index" value="1">
	       <input type="hidden" name=DAKindex id="DAKindex" value="1">
	       <input type= "hidden" id="filesize" name="filesize" value="${filesize}">
	       <input type= "hidden" id="count" name="count" value="${count1}" >
	       <input type= "hidden" id="desi" name="desi" value="${designation}" >
	       <input type= "hidden" id="readUnreadStatus" name="readUnreadStatus" value="${readUnreadStatus}" >	      
	       
 </form> 
     	
				
		<div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width:50%; float:right;">
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
</html>