<%@page import="com.sits.general.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../myCks.jsp"%>
<!DOCTYPE html> 
<html lang="en">
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
  	 <title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>  	 
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
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
	
	td {
	    border-left-width: 0 !important;
	    border-right-width: 0!important;
   }
	</style>	
</head>
 <body>
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">
					<h4>File Life Cycle</h4>
				</div>
			</div>
		</div>

   <form class="form-horizontal" name="advancesearch_l2" id="advancesearch_l2" method="post" autocomplete="off">
	 <div id="searchingTable" class="scr0 botom">
     
 
      <%--  <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					  
				         <label class="col-sm-2 col-form-label" for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.man_no" /></fmt:bundle></label>
						 <div class="col-sm-2 col-form-label" id="manualfileNo" name="manualfileNo" >
				    	<span>${lifecycle.get(0).getManual_file_id()}</span>
				         </div>
				         <label class="col-sm-2 col-form-label" for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.subject" /></fmt:bundle></label>
					  <div class="col-sm-2 col-form-label" id="subject" name="subject">
						 <span>${lifecycle.get(0).getSubject()}</span>
					  </div>
					  
					 <label class="col-sm-2 col-form-label" for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.crtn_date" /></fmt:bundle></label>
					  <div class="col-sm-2 col-form-label" id="crtn_date" name="crtn_date" >
						${lifecycle.get(0).getCreated()}
					  </div>
			 </div>
					</div>
		        </div> --%>
		  	
 <table id="searchTable1" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sendBy" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.departmnt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sendOn" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sentTo" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.ToDepartment" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.ToDesignation" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.note" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.document" /></fmt:bundle></th>
		      <%--   <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.remarks" /></fmt:bundle></th> --%>
			 <%--    <th class="text-center"><fmt:bundle basename="filemovement">Receiver <fmt:message key="file_inward_movement.remarks" /></fmt:bundle></th> --%>
			</tr>
    </thead>	
      <tbody class="tbodynew">
       <c:set var="count" value="0"></c:set>
	          <c:forEach items="${lifecycle}" var="lifecycle"> 
	          <c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:3%;">${count}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getSenderId()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getDesignaton()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getSender_dpt()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getCreated()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getReceiverId()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getTo_department()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getToDesignaton()}</td>
		         <td style="text-align:center;width:10%;text-decoration: underline;">
		          <c:if test="${not empty lifecycle.getDptName()}">
		         <a href="#" onclick="view('','${count}','N')">View</a> </c:if>
		         </td>
		         <td style="text-align:center;width:10%; text-decoration: underline;"><span>
		         <c:if test="${not empty lifecycle.getFileName()}">
		         <a target="_blank" href="../downloadfile?filename=${lifecycle.getFileDetailId()}_${lifecycle.getFileName()}&folderName=${lifecycle.getFileDetailId()}" >View</a> </c:if></span>
		         </td>
		      
	         <%--  <td style="text-align:center;width:10%;">${lifecycle.getRemarks()}</td> --%>
	        <%--   <td style="text-align:center;width:10%;">${lifecycle.getReceiverRemarks()}</td> --%>
	          <input type="hidden" id="noteValid${count}" name="noteValid${count}"  value='${lifecycle.getDptName()}'>
	     	 </tr> 
	     	   
	     	   <input type="hidden" id="fileid" name="fileid" value="${lifecycle.getFile_creation_id()}"> 
	     	    <input type="hidden" id="fstatus" name="fstatus" value="P">
	     	     <input type="hidden" id="flag" name="flag" value="L">
	     	     <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	     	 </c:forEach>
       </tbody>
     </table>
 
  
              <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnBack" >Back</button>
				     <input type="hidden" name="pageName" id="pageName" value="searchPage"> 
				     <!-- <button type="button" class="btn btn-view" id="btnLifeCyclePdf" > View PDF</button> -->
				   </div>
			     </div>
			  </div>
  
  
       </div>  
       
     </form><!-- End panel-default -->
  
         <!-- jQuery (necessary for Bootstrap's JavaScript plugin) -->
	<script src="../resources/assets/sits/DataTable/1.10.15/js/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="../resources/assets/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
	<script src="../resources/assets/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
	<script src="../resources/assets/sits/DataTable/1.4.2/js/jszip.min.js"></script>
	<script>
	      //$("#searchTable").dataTable();
		       var t = $('#searchTable1').DataTable({
		  		"searching" : false,
		 		  "lengthMenu": [[10, 25, 50, 100, 250, 500, '-1'], [10, 25, 50, 100, 250, 500, 'All']],
		  		"scrollY": "200px",
		         "scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		          "order": [[ 1, 'asc' ]], 
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				/* filename: '', */
				className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2,3,4,5,6,7,8,9]
				},
				},
				],                      	       	
			     	columnDefs: [  { orderable: false, "targets": [0,8,9]},
								   
								],
				        	 }); 
		       
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	     </script>  
	      <input type="hidden" id="fstatus" name="fstatus" value=""> 
    
      	  <!-- Code For view Pop-Up add Note -->
<div class="modal" id="viewNote">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			
			<!-- Modal Header -->			
			<div class="modal-header text-center mod-head">
				<h4 class="modal-title text-left">
					<h3 style="color: red;">NOTE</h3>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
	 			<form class="form-horizontal" method="post" autocomplete="off">
	  				<div class="panel panel-default">					
	 					<div class="panel-body">
	  						<span id="noteVal"></span>    
			    		</div>  <!-- panel body -->
 					</div>  <!-- panel default -->
	 			</form> 
			</div>
 			
 			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"  data-dismiss="modal">Close</button>
			</div>
			
		</div>
	</div>
</div>
<!-- Code for view Pop-up add note end here -->


  </body>
</html>
    