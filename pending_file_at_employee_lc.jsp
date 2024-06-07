<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
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
  	<script type="text/javascript" src="../resources/js/filemovement/pending_file_at_employee.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 
</head>
 <body>
	<form name="pendingatemployeelc" id="pendingatemployeelc" action="" method="post" autocomplete="off">
	<div id="searchingTable" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">File Life Cycle(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : </div>	
	   </div>	
	   <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
		     <thead class="theadnew">
					<tr>
						<th class="text-center">S.No.</th>
						<th class="text-center">Send By</th>
						<th class="text-center">Send Department</th>
						<th class="text-center">Send Location </th>
						<th class="text-center">Send Date</th>
						<th class="text-center">Received Date</th>
						<th class="text-center">Received By</th>
						<th class="text-center">Received Department</th>
						<th class="text-center">Received Location</th>
						<th class="text-center">Remarks</th>
					</tr>
		    </thead>	
       <tbody class="tbodynew">
       <c:set var="count" value="0"></c:set>
	<c:forEach items="${lifecycle}" var="lifecycle"> 
	<c:set var="count" value="${count+1}"></c:set>
       
		      <tr>
			     <td style="text-align:center;width:10%;">${count}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getSenderId()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getSender_dpt()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getSender_loc()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getCreated()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getReceived_date()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getReceiverId()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getTo_department()}</td>
			     <td style="text-align:center;width:10%;">${lifecycle.getTo_location()}</td>
		         <td style="text-align:center;width:10%;">${lifecycle.getRemarks()}</td>
		          <input type="hidden" id="fileid" name="fileid" value="${lifecycle.getFile_creation_id()}"> 
	     	 </tr>
	     	 
						  
		                     <input type="hidden" id="flag" name="flag" value="L">
	     	                 <input type="hidden" name="emp_id" id="emp_id" value="${emp}">
	     	 </c:forEach> 
     	 </tbody>
  	  </table>
	</div>
	<div class="form-group m-t-25 m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <button type="button" class="btn btn-view" id="btnBack" >Back</button>
							<button type="button" class="btn btn-view" id="btnLifeCyclePdf" >View PDF</button>
						
				           </div>
				       </div>
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
		"lengthMenu": [[10, 25, 50, 100, 250, 500, '-1'], [10, 25, 50, 100, 250, 500, 'All']],
		"scrollY": "200px",
		"scrollX": true,
		"scrollCollapse": true,
		"paging":true,
		"columnDefs": 
	  [{"searchable": false,
		"orderable": false,
		"targets": 0
      }],
      	"order": [[ 0, 'asc' ]],
	
      	dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'Final_Approval_Configuration',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,1,2,3,4] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
					 { orderable: false, "targets": 5 },
 					 { orderable: false, "targets": 6 }],
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