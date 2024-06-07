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
  
  	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  
  	<script type="text/javascript" src="../resources/js/common.js"></script>
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
  	<script type="text/javascript" src="../resources/js/gen.js"></script>
  	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
  	<script type="text/javascript" src="../resources/js/filemovement/emp-approvel-level-mapping.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
 <style>

 </style>
<body>
 
<form name="empapprovl" id="empapprovl" method="post" autocomlete="off">
<div id="searchingTable1" class="scr0">
<div class="col-sm-12">
				<div class="row">
					<div class="errmessage text-center" id="errMsg"></div>
				</div>
			</div>
			<div class="page-header-1">
				<div class="col-sm-4 repTitle h5 ">List of File Type Approval Level Mapping</div>
				<div class="col-sm-4 repTitle h6 text-center">Run Date :<%= (new java.util.Date().toLocaleString()) %></div>
			</div>
    <table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" style="">
			<thead>
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">File Type</th>
					<th class="text-center">Order Level Count</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
			</thead>
			<tbody> 
	<c:set var="count" value="0"></c:set>
	<c:forEach items="${data}" var="data"> 
	<c:set var="count" value="${count+1}"></c:set>
	<tr>
		<td class="text-center" style="width: 10%;">${count}</td>	            
		<td class="text-center">${data.getFilename()}</td>
		<td class="text-center"><a style="cursor:pointer;" onClick="detailpage('${data.getFiletype()}')">${data.getOrdercount()}</a></td>
		<td  class="text-center colr-blue-p" style="width: 15%;"><span id="EDIT_RECORD_${count}" 
		onclick="editRecord('${data.getFiletype()}') ;">
		<i  class="fa fa-edit p-l-3"></i>Edit</span></td>
		<td style="text-align:center;color:RED;cursor:pointer; width:15%; " onclick="delRecord('${data.getFiletype()}') ">
		<i class="fa fa-trash-o"></i> Delete</td>		
	</tr> 
	</c:forEach>
</tbody>				
			
		</table>
	</div>
	<input type="hidden" id="filetype" name="filetype" >	
</form>
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
      $(document).ready(function() {
    	    var t = $('#searchTable').DataTable( {
    	    	"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
    	    	"searching" : false,
       			"scrollY": "300px",
                "scrollX": true,
                "scrollCollapse": true,
                "paging": true,
               // "rowsGroup": [2],
    	    	"columnDefs": [ {
    	            "searchable": false,
    	            "orderable": false,
    	            "targets": 0
    	        } ],
    	        dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
            	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
       		  "<'row'<'col-sm-12'tr>>" +
        	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
	        	buttons: [
	            	{	
   	                	extend: 'excelHtml5',
   	                	filename: '',
   	                	className: 'btn btn-view',
   	                	text	:'Download',
   	                	exportOptions: {
   	                    	columns: [ 0,1,2]
   	                	},
   	           		 }
	        	],
    	        columnDefs: [{ orderable: false, "targets": [0,3,4] },
   				  
   				 ],
    	        "order": [[ 1, 'asc' ]]
    	    } );
    	    t.on( 'order.dt search.dt', function () {
    	    	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    	    	cell.innerHTML = i+1;
    	    	t.cell(cell).invalidate('dom');
    	    	});
    	    	}).draw();
    	} );
      
</script>
</body>
</html>