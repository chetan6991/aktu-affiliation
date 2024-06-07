
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
  	<script type="text/javascript" src="../resources/js/filemovement/file_for_approval.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 
</head>
 <body>
	 <div class="container-fluid">

		<div class="page-header" id="ftitleHeader">
			<div class="row">

				<div class="col-sm-12">
					<h4>File For Approval</h4>
				</div>

			</div>
		</div>

   <form class="form-horizontal" name="file_approval_l" id="file_approval_l" target="" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" >New</h3>
				</div>
			
		       
	<div class="panel-body">
	   <div id="searchingTable" class="scr0 botom">
           
	 	    
	 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.L_header" /></fmt:bundle></div>
	 </div>	

         
<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sno" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sentdt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.fileId" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sender" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.receiver" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.frm_dpt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.to_dpt" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.subject" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.apprve" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.view" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.lifecycl" /></fmt:bundle></th>
		        
			</tr>
    </thead>	

      <tbody class="tbodynew">
      <c:set var="count" value="0"></c:set>
	<c:forEach items="${approveList}" var="approveList"> 
	<c:set var="count" value="${count+1}"></c:set>

		      <tr>
			     <td style="text-align:center;width:5%;">${count}</td>
			     <td style="text-align:center;width:8%;">${approveList.getCreated()}</td>
		         <td style="text-align:center;width:10%;">${approveList.getFile_group_id()}</td>
			     <td style="text-align:center;width:10%;">${approveList.getSenderId()}</td>
			     <td style="text-align:center;width:10%;">${approveList.getReceiverId()}</td>
			     <td style="text-align:center;width:10%;">${approveList.getFromDepartment()}</td>
		         <td style="text-align:center;width:10%;">${approveList.getToDepartment()}</td>
		         <td style="text-align:center;width:10%;">${approveList.getSubject()}</td>
		         <td style="text-align:center;width:8%;">
		         <input type="checkbox" class="sec" id="check_${count}" name="check_${count}"  value="${approveList.getFmt_id()}"> <%-- onclick="addValue('${count}');" --%>
		          <input type="hidden" id="status" name="status"  value="Pending">
		         </td>
		         <td style="text-align:center;width:8%; text-decoration: underline;"  onclick="view(${approveList.getFmt_id()},'Pending');"  ><a href="#">View</a></td>
		         <td style="text-align:center;width:10%;text-decoration: underline;" onclick="showlifecycle(${approveList.getFmt_id()});"><a href="#">Life Cycle</a></td>
	     	 </tr>  
	     	 </c:forEach>
       </tbody>
     </table>
     
</div><!-- searching table end div -->
   
   	<div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
			 <div class="form-group m-t-25 m-b-25">
				 <div class="col-md-12 text-center">
					 <div class="row">
					 <button type="button" class="btn btn-view" id="btnApprv" >Approve</button>
					 </div>
				 </div>
			  </div>

 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.L_header1" /></fmt:bundle></div>
	 </div>	
	 
	 
	 <table id="searchTable1" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
<thead class="theadnew">

<tr>
<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sno" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sentdt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.fileId" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.sender" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.receiver" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.frm_dpt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.to_dpt" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_for_approval.subject" /></fmt:bundle></th><!-- 
<th class="text-center">Approve Date</th> -->
<th class="text-center">View</th>
<th class="text-center">Life Cycle</th>

</tr>
</thead>	

<tbody class="tbodynew">


  <c:set var="count" value="0"></c:set>
	<c:forEach items="${approvedList}" var="approvedList"> 
	<c:set var="count" value="${count+1}"></c:set>

		      <tr>
			     <td style="text-align:center;width:5%;">${count}</td>
			     <td style="text-align:center;width:8%;">${approvedList.getCreated()}</td>
		         <td style="text-align:center;width:10%;">${approvedList.getFile_group_id()}</td>
			     <td style="text-align:center;width:10%;">${approvedList.getSenderId()}</td>
			     <td style="text-align:center;width:10%;">${approvedList.getReceiverId()}</td>
			     <td style="text-align:center;width:10%;">${approvedList.getFromDepartment()}</td>
		         <td style="text-align:center;width:10%;">${approvedList.getToDepartment()}</td>
		         <td style="text-align:center;width:10%;">${approvedList.getSubject()}</td>
		         <!-- <td style="text-align:center;width:8%;">
		         
		         </td> -->
		          <input type="hidden" id="statusA" name="statusA"  value="">
		         <td style="text-align:center;width:8%; text-decoration: underline;"  onclick="view(${approvedList.getFmt_id()},'');"  ><a href="#">View</a></td>   
		         <td style="text-align:center;width:10%;text-decoration: underline;" onclick="showlifecycle(${approvedList.getFmt_id()});"><a href="#">Life Cycle</a></td>
	     	 </tr>  
	     	 </c:forEach>
</tbody>
</table>
		    </div>
	      </div><!-- End panel-body -->
	     <input type="hidden" id="fileid" name="fileid" value="">
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
		filename :'File(s) For Approval',
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
		
		var t = $('#searchTable1').DataTable(
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
				filename :'File(s) For Approval',
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
        </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="file_approval_view" id="file_approval_view" width="100%;" height="600px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
</html>
    