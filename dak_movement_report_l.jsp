<%@include file="../myCks.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="utf-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
  
  	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  
  	<script type="text/javascript" src="../resources/js/common.js"></script>
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
  	<script type="text/javascript" src="../resources/js/gen.js"></script>
  	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
  	<script type="text/javascript" src="../resources/js/filemovement/dak_movement_report.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />
</head>
<script>
		$(document).ready(function(){
		    $("a").tooltip();
		});
   </script>
   <style>

</style>
 <body>
<form name="file_mov_l" id="file_mov_l" action="" method="post" autocomlete="off">
	<div id="searchingTable1" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1 head-1">
		    <div class="col-sm-4 repTitle title-1">List of DAK(s)</div>
		    <div class="col-sm-4 repTitle text-center title-1">Run Date :<%= (new java.util.Date().toLocaleString()) %> </div>	
	   </div>	
<div class="row ">
<div class="col-xs-12">
<div class="table-responsive">	
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
      <thead class="theadnew">
			<tr>
				<th class="text-center">S.No.</th>
				<th class="text-center">Manual Dak No.</th>
				<th class="text-center">Subject</th>
				<!-- <th class="text-center">From Department</th> -->
				<th class="text-center">From Employee</th>
				<th class="text-center">Send Date</th>
				<!-- <th class="text-center">To Department</th> -->
				<th class="text-center">To Employee</th>
				<!-- <th class="text-center">Received Date</th> -->
		        <th class="text-center">View dak Detail</th>
		        <th class="text-center">Life Cycle</th>
			</tr>
      </thead>	
      <tbody class="tbodynew">
      <c:set var="count" value="0"></c:set>
	<c:forEach items="${searchList}" var="list"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:5%;">${count}</td>
			    
			     <td style="text-align:center;width:8%;">${list.getManual_file_id()}</td>
			     <td style="text-align:center;width:8%;">${list.getSubject()}</td>
			     			     
			     <%-- <td style="text-align:center;width:8%;">${list.getFile_group_id()}</td> --%>
		         <%-- <td style="text-align:center;width:12%;">${list.getFromDepartment()}</td> --%>
			     <td style="text-align:center;width:15%;">${list.getSenderId()}</td>
			     <td style="text-align:center;width:8%;">${list.getCreated()}</td>
			     <%-- <td style="text-align:center;width:8%;">${list.getTo_department()}</td> --%>
		         <td style="text-align:center;width:15%;">${list.getReceiverId()}</td>
		        <%--  <td style="text-align:center;width:10%;">${list.getReceived_date()}</td> --%>
		         <td style="text-align:center;width:6%;text-decoration: underline;" onclick="view(${list.getFile_creation_id()},${fstatus});">
		         <a href="#"  data-toggle="tooltip" data-placement="left"
			       title="" data-original-title="Click here to view the File"
			       class="red-tip" ><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td>
		         <td style="text-align:center;width:6%;text-decoration: underline;" onclick="showlifecycle(${list.getFile_creation_id()},${fstatus});">
		         <a href="#" data-toggle="tooltip" data-placement="left"
			       title="" data-original-title="Click here to view the Life Cycle"
			       class="red-tip"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td>
	     	 </tr>  
	     	 </c:forEach>
       </tbody>
     </table>
	</div>
   </div>
  </div>
 </div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugin) -->
	<input type="hidden" id="fileid" name="fileid" value="">
	<input type="hidden" id="file_status" name="file_status" >
	<input type="hidden" id="flag" name="flag" value="">
	
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
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		  		"scrollY": "500px",
		         "scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		        //"order": [[ 1, 'asc' ]],
		
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
				columns: [ 0,1,2,3,4,5,6]
				},
				},
				],                      	       	
			     	columnDefs: [{ orderable: false, "targets": 0 },						 
								 { orderable: false, "targets": 5},
								 { orderable: false, "targets": 6},
								 { orderable: false, "targets": 7}
								],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	     </script>   
	   </form>
	   <iframe class="embed-responsive-item" name="file_mov_view" id="file_mov_view" width="100%;" height="600px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>
	</body>
</html> 