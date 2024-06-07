<%@include file="../myCks.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
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
  	<script type="text/javascript" src="../resources/js/filemovement/file_for_approval.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  	<style type="text/css">

 
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
</head> <!-- Head end -->
<body> <!-- Body Start -->
<form name="file_creation_l" id="file_creation_l"  method="POST"  autocomplete="off" >
<div id="searchingTable1" class="scr0">
<div class="page-header-1">    
<%String header=""; %>  
<div class="col-sm-4 repTitle">List of File(s)</div>
<div class="col-sm-4 repTitle text-center ">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
</div>	

<!-- check kr lete hai  -->

	<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
	<thead  >
		<tr> 
		    <th class="text-center">S.No</th>
			<th class="text-center">Employee</th>
			<c:if test="${reportType=='dc'}">
			<th class="text-center">Dak</th>
			<% header="DAK Creators list"; %>
			</c:if>
			<c:if test="${reportType=='fc'}">
			<th class="text-center">File</th>
		    <% header="File Creators list"; %>
			</c:if>
			<c:if test="${reportType=='pf'}">
			<th class="text-center">File</th>
			</c:if>
			<th class="text-center">Department</th>
			<c:if test="${reportType=='fc' || reportType=='dc'}">
			<th class="text-center">Count</th>
			</c:if>
			<c:if test="${reportType=='pf'}">
			<th class="text-center">Pending Days</th>
			<% header="Pending File List"; %>
 			</c:if>
		</tr>
	</thead>	
	<tbody> 
	<c:forEach items="${createList}" var="createList1"> 
	<tr>       
		<td class="text-center" style="text-align:center;width:5%;"></td>
		<td class="text-center" style="text-align:center;width:25%;">${createList1.getFRM_EMP()}</td>
		<td class="text-center" style="text-align:center;width:30%;word-break: break-all;">${createList1.getFilename()}</td>
		<td class="text-center" style="text-align:center;width:30%;">${createList1.getFromDepartment()}</td>
		<c:if test="${reportType=='fc' || reportType=='dc'}">
		<td class="text-center" style="text-align:center;width:10%;">${createList1.getFilesize()}</td>
		</c:if>
		<c:if test="${reportType=='pf'}">
		<td class="text-center" style="text-align:center;width:10%;">${createList1.getPending_days()}</td>
		</c:if>
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
	var t = $('#searchTable').DataTable(
		{
		"searching" : false,
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		"scrollY": "320px",
		"scrollX": true,
		"scrollCollapse": true,
		"paging":true,
		"columnDefs": 
	  [{"searchable": false,
		"orderable": false,
		"targets": 0
      }],
      	"order": [[ 1, 'asc' ]],
	    dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
		buttons  : [{	
		extend   :'excelHtml5',
		title    :'<%=header %>'   ,
		filename :'employee_wise_report',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,1,2,3,4] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
					 { orderable: false, "targets": 1 },
 					 { orderable: false, "targets": 2 },
 					{ orderable: false, "targets": 3 },{ orderable: false, "targets": 4 }],
		}); 
		t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		cell.innerHTML = i+1; 
		t.cell(cell).invalidate('dom');
		});
		}).draw();
</script>		
</form>
</body> <!-- body end  -->
</html> 