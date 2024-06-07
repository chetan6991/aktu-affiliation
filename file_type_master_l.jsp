<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file="../myCks.jsp"%>
<!DOCTYPE html>

<html lang="en">

<head> 

	<meta charset="utf-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
  
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/file-type-master.js"></script>
    <link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
   	<script type="text/javascript" src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
   
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />
  	
</head> <!-- Head end -->
 <style>

 </style>
<body> <!-- Body Start -->
<form name="editfile" id="editfile"  method="POST"  autocomplete="off" >
	
<div id="searchingTable" class="scr0">

	<div class="col-sm-12">
		<div class="row text-center">
				<div class="errmessage"  id="errMsg">
			</div>
		</div>
	</div>
	
	  <div class="page-header-1 head-1">      
	    <div class="col-sm-4 repTitle title-1" >
	    <fmt:bundle basename="filemovement"><fmt:message key="file_type_master.dt_header" /></fmt:bundle></div>
	    <div class="col-sm-4 repTitle text-center title-2">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
	  </div>	
	  
	<!-- Define table field name  -->
	
	<!-- table body start -->
<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
	<thead>
		<tr> 
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.dt_S.no." /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.dt_filetype" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.dt_remarks" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.edit" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.delete" /></fmt:bundle></th>
		</tr>
	</thead>	
			
<tbody> 
	<c:set var="count" value="0"></c:set>
	<c:forEach items="${data}" var="data"> 
	<c:set var="count" value="${count+1}"></c:set>
	<tr>
		<td class="text-center" style="width:5%">${count}</td>	            
		<td class="text-center" style="width:25%">${data.getFiletype()}</td>
		<td class="text-center" style="width:25%">${data.getRemarks()}</td>
		<td class="text-center colr-blue-p" style="width:12%"><span id="EDIT_RECORD_${count}" onclick="editRecord('${data.getMastid()}' ,'E') ;"><i  class="fa fa-edit p-l-3"></i>Edit</span></td>
		<td style="text-align:center;color:RED;cursor:pointer;width:12%" onclick="delRecord('${data.getMastid()}') "><i class="fa fa-trash-o"></i> Delete</td>		
	</tr> 
	</c:forEach>
</tbody>
</table>  <!-- table body ends -->


</div>
	
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
	var t = $('#searchTable').DataTable(
		{
		"searching" : false,
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		"scrollY": "500px",
		"scrollX": true,
		"scrollCollapse": true,
		"paging":true,
		"columnDefs": 
	  [{"searchable": false,
		"orderable": false,
		"targets": 0
      }],
      	"order": [[ 1, 'asc' ]],
	
      	dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'File Type Master',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,1,2] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
					 { orderable: false, "targets": 3 },
 					 { orderable: false, "targets": 4 }],
		}); 
		t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		cell.innerHTML = i+1; 
		t.cell(cell).invalidate('dom');
		});
		}).draw();
</script>
   
<input type="hidden" name="mastid" id="mastid" value="" style="width:10px;" readOnly/>
		
</form>
</body> <!-- body end  -->
</html> 