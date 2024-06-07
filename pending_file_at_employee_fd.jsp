<%@include file="../myCks.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  	<script type="text/javascript" src="../resources/js/filemovement/pending_file_at_employee.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>

 <body>
	<form name="pending_Emp_l" id="pending_Emp_l" action="" method="post" autocomplete="off">
	<%--    <div id="searchingTable" class="table1 scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">List of Pending File(s) At Employee Level</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : </div>	
	  </div>	
	 <table id="searchTable2" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew">
			<tr>
				<th class="text-center">S.No.</th>
				<th class="text-center">Employee Name</th>
				<th class="text-center">Total No. Of Files</th>
				<th class="text-center">File details</th>
				<!-- <th class="text-center">Print</th> -->
			</tr>
    </thead>	
      <tbody class="tbodynew">
       <c:set var="count" value="0"></c:set>
	<c:forEach items="${pendingEmp}" var="pendingEmp"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:15%;">${count}</td>
			     <td style="text-align:center;width:25%;">${pendingEmp.getReceiverId()}</td>
		         <td style="text-align:center;width:25%;">${pendingEmp.getTotal_file()}</td>
			     <td style="text-align:center;width:25%;text-decoration:underline"><a href="#" class="fileDetails" onclick="getDetails()">File Details</a></td>
			     <!-- <td style="text-align:center;width:20%;text-decoration:underline"><a href="#">Print</a></td> -->
	     	 </tr>
	     	 </c:forEach>  
      </tbody>
	</table> 
	  </div>--%>
	<div id="searchingTable" class="table2 scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">List of Searched File(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : </div>	
	  </div>	
	<table id="searchTable1" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew">
			<tr>
				<th class="text-center">S.No.2</th>
				<th class="text-center">File No.</th>
				<th class="text-center">Subject</th>
				<th class="text-center">Received Date</th>
				<th class="text-center">Send From</th>
		        <th class="text-center">View Details</th>
		        <th class="text-center">Life Cycle</th>
			</tr>
      </thead>	
      <tbody class="tbodynew">
       <c:set var="count" value="0"></c:set>
	<c:forEach items="${pendingEmp}" var="pendingEmp"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:10%;">${count}</td>
			     <td style="text-align:center;width:12%;">${pendingEmp.getFile_group_id()}</td>
		         <td style="text-align:center;width:15%;">${pendingEmp.getSubject()}</td>
			     <td style="text-align:center;width:12%;">${pendingEmp.getReceived_date()}</td>
			     <td style="text-align:center;width:12%;">${pendingEmp.getSenderId()}</td>
			     <td style="text-align:center;width:15%;text-decoration:underline" onclick="view(${pendingEmp.getFile_creation_id()});"><a href="#">View Details</a></td>
		         <td style="text-align:center;width:15%;text-decoration:underline" onclick="showlifecycle(${pendingEmp.getFile_creation_id()});"><a href="#">Life Cycle</a></td>
	     	     <input type="hidden" name="empId" id="empId" value="${pendingEmp.getReceiverId()}">
	     	 </tr> 
	     	 </c:forEach> 
       </tbody>
	</table>
	</div>
	<input type="hidden" id="fileid" name="fileid" value="">
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
		        "order": [[ 0, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				 filename: 'Pending_File_at_Employee_Level', 
				className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2]
				},
				},
				],                      	       	
			     	columnDefs: [{ orderable: false, "targets": 0 }	,
			     	{ orderable: false, "targets": 2 }	,
			     	{ orderable: false, "targets": 3 }	
								],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
			        
			        /* var t = $('#searchTable2').DataTable({
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
						filename: 'Pending_File_at_Employee_Level', 
						className: 'btn btn-view',
						text	:'Download',
						exportOptions: {
						columns: [ 0,1,2,3,4]
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
					 	}).draw(); */
	       </script>  
      </form>
      <iframe class="embed-responsive-item" name="pending_file_view" id="pending_file_view" width="100%;" height="2000px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>
  </body>
</html> 