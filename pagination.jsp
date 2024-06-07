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

<style type="text/css">
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
	</style>	

</head>
 <body>
 
 
 
	 <div class="container-fluid">
		<!-- <div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">			
					<h4>Receipt Details</h4>
				</div>
			</div>
		</div>
 -->
   <form class="form-horizontal" name="addRemarks" id="addRemarks" method="post" autocomplete="off">
	 <!--  <div class="panel panel-default">
				 
	<div class="panel-body"> -->
	
		<div class="panel panel-default">
				<div class="panel-heading panel-group" role="tab" id="headingOne" style="">
          		<h3 class="panel-title text-left col-sm-6" style="padding-left: 0px;">File Creation Details</h3>
		   </div>
		
         </div>
		<div class="panel-body" style="padding: 0px 26px;"> 
		
       <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" ><span> ${viewList.getFile_group_id()} </span><!-- id="FileId" -->
				    		  
				         </div>
				         <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="ManualNo"><span> ${viewList.getManual_file_id()} </span>
				    		 
				         </div>
					</div>
		        </div>
		    </div> 
		    
      <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <%-- <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.title" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="title">
				    		 
				         </div> --%>
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="subject"><span> ${viewList.getSenderId()}</span>
				    		                       
				         </div>
				         
				           <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="designation"><span>${viewList.getDesignaton()}</span>
				    		 
				         </div> 
					</div>
		        </div>
		    </div> 
		    
		    <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					  <%--  <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.crtd_by" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="createdby"><span>${viewList.get(0).getCreated_by()}</span>
				    		 
				         </div> --%>
				         
				         <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.departmnt" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="department"><span> ${viewList.getSender_dpt()}</span>
				         	 
				         </div>
				         
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="opendate"><span>${viewList.getSubject()}</span>
				    		 
				         </div>
					</div>
		        </div>
		    </div> 

			<div class="form-group">
      			<div class="col-md-12">
              		<div class="row">
						<label class="col-sm-2 col-form-label">Previous Upload File</label>
							<div class="col-sm-4 col-form-label">
								<label><a onclick="" href="../downloadfile?filename=${viewList.getFileName()}"><u>${viewList.getDocTitle()}</u></a></label>
								<!-- Download Previous Uploaded File -->
							</div>							       						
  						<%-- <label class="col-sm-2 col-form-label">Document Title</label>
  							<div class="col-sm-4 col-form-label"><span>${viewList.get(0).getDocTitle()}</span></div> --%>
			         </div>
				</div>
	       	</div>

	<%-- 	 
		 <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.rmrks" /></fmt:bundle>:</label>
						  <div class="col-sm-4 col-form-label" id="rmks"><span> ${viewList.get(0).getRemarks()}</span>
				    		 
				         </div>
				        
					</div>
		        </div>
		    </div> --%>
		 
		 </div>

 
    
 
    <%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
    <table border="1" cellpadding="5" cellspacing="5">
        <tr>
        <%--For displaying Previous link except for the 1st page --%>
       <c:if test="${currentPage != 1}">
        <td><a href="#"  onclick="view('${viewList.getFile_creation_id()}','${viewList.getFileDetailId()}','L','${currentPage - 1}')">Previous</a></td>
        </c:if>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td>${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="#" onclick="view('${viewList.getFile_creation_id()}','${viewList.getFileDetailId()}','L','${i}')">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage lt noOfPages}">
        <td><a href="#" onclick="view('${viewList.getFile_creation_id()}','${viewList.getFileDetailId()}','L','${currentPage + 1}')">Next</a></td>
    </c:if>
        </tr>
    </table>
      <input type="hidden" id="fileid" name="fileid" value="">
      <input type="hidden" id="fileDetId" name="fileDetId" value="">
      <input type="hidden" id="fstatus" name="fstatus" value="">
      <input type="hidden" id="page" name="page" value="">
    <%--For displaying Next link --%>
    
</form>
<!-- End panel-default -->
 </div> <!-- End container-fluid -->
</body>
</html>