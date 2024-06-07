<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
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
  	<script type="text/javascript" src="../resources/js/filemovement/file_creation.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
 <body>
<form name="" id="myform1" action="" method="post" autocomlete="off">
	<div id="searchingTable" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">List of Pending File(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : </div>	
	   </div>	
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
      <thead class="theadnew">
			<tr>
				<th class="text-center">S.No.</th>
				<th class="text-center">Employee Name</th>
				<th class="text-center">Designation</th>
				<th class="text-center">Received</th>
				<th class="text-center">Inward Pending</th>
				<th class="text-center">OutWard Pending</th>
			</tr>
    </thead>	
      <tbody class="tbodynew">
      <c:set var="count" value="0"></c:set>
	<c:forEach items="${pending}" var="pending"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:15%;">${count}</td>
			     <td style="text-align:center;width:20;">${pending.getEmpName()}</td>
		         <td style="text-align:center;width:15%;">${pending.getDesignation()}</td>
			     <td style="text-align:center;width:15%;">${pending.getReceived()}</td>
			     <td style="text-align:center;width:15%;">${pending.getInwrdPending()}</td>
			     <td style="text-align:center;width:20%;">${pending.getOutPending()}</td>
	     	 </tr>  
	     	 </c:forEach>
       </tbody>
     </table>
 </div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugin) -->
	<script src="../assets/sits/DataTable/1.10.15/js/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../assets/sits/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="../assets/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
	<script src="../assets/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
	<script src="../assets/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
	<script src="../assets/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
	<script src="../assets/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
	<script src="../assets/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
	<script src="../assets/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
	<script src="../assets/sits/DataTable/1.4.2/js/jszip.min.js"></script>
	<script>
	      //$("#searchTable").dataTable();
		       var t = $('#searchTable').DataTable({
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
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
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
				columns: [ 0,1,2,3,4,5]
				},
				},
				],                      	       	
			     	columnDefs: [{ orderable: false, "targets": 0 }						 
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
	</body>
</html> 