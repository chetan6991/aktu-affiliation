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
  	<script type="text/javascript" src="../resources/js/filemovement/file_movement_report.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">

</style>
 <body>
	<form name="filemovementlc" id="filemovementlc" action="" method="post" autocomlete="off">
	<div id="searchingTable" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1 head-1">
		    <div class="col-sm-4 repTitle title-1">File Life Cycle(s)</div>
		    <div class="col-sm-4 repTitle text-center title-2">Run Date : <%= (new java.util.Date().toLocaleString()) %></div>	
	   </div>	
	   <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
		     <thead class="theadnew">
					<tr>
						<th class="text-center">S.No.</th>
						<th class="text-center">Send By</th>
						<th class="text-center">Dispatch No.</th> 
						<!-- <th class="text-center">Send Location </th> -->
						<th class="text-center">Send Date</th>
						<!-- <th class="text-center">Received Date</th> -->
						<th class="text-center">Received By</th>
						<th class="text-center">Received No.</th>
						<!-- <th class="text-center">Received Department</th> -->
						<!-- <th class="text-center">Received Location</th> -->
						<!-- <th class="text-center">Remarks</th>
						<th class="text-center">Receiver Remarks</th> -->
						<th class="text-center">Received Date</th>
					</tr>
		    </thead>	
       		<tbody class="tbodynew">
       		<c:set var="count" value="0"></c:set>
				
				<c:forEach items="${lifecycle}" var="lifeCycle1"> 					
					<c:set var="count" value="${count+1}"></c:set>
		
		      <tr>		      
			     <td style="text-align:center;width:5%;">${count}</td>
			     <td style="text-align:center;width:20%;">${lifeCycle1.getSenderId()}</td>
			     <td style="text-align:center;width:10%;">${lifeCycle1.getDispach_no()}</td>
			     <%-- <td style="text-align:center;width:10%;">${lifecycle.getSender_loc()}</td> --%>
			     <td style="text-align:center;width:8%;">
			     <c:if test="${lifeCycle1.getIs_closed() eq 'N'}">
		         	<span style="color:#e91227;"><b>Dispatch Date</b></span><br>
		         </c:if>
		         <c:if test="${lifeCycle1.getIs_closed() eq 'Y'}">
		         	<span style="color:#e91227;"><b>File Closed</b></span><br>
		         </c:if>
			     ${lifeCycle1.getCreated()}
			     </td>
			     <%-- <td style="text-align:center;width:10%;">${lifecycle.getReceived_date()}</td> --%>
			     <td style="text-align:center;width:20%;">${lifeCycle1.getReceiverId()}</td>
			     <td style="text-align:center;width:10%;">${lifeCycle1.getReceive_no()}</td>
			    <%--  <td style="text-align:center;width:10%;">${lifecycle.getTo_location()}</td> --%>
		         <%-- <td style="text-align:center;width:10%;">${lifecycle.getRemarks()}</td> --%>
		         
				<%-- <td style="text-align:center;width:6%;text-decoration: underline;" onclick="showAttachedDak(${lifeCycle1.getFile_creation_id()});">
					<a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the Attached DAK" class="red-tip">
						<i class="fa fa-eye fa-lg" aria-hidden="true"></i>
					</a>
				</td> --%>
		         
		         <input type="hidden" id="fileid" name="fileid" value="${lifeCycle1.getFile_creation_id()}"></td>
		         <%-- <td style="text-align:center;width:10%;">${lifecycle.getReciver_remarks()}</td> --%>
		         <td style="text-align:center;width:8%;">
		         <c:if test="${lifeCycle1.getIs_read() eq 'Y'}">
		        
		         <c:if test="${lifeCycle1.getIs_closed() eq 'N'}">
		          <span style="color:#3bcb3b;"><b>Received Date</b></span><br>
		         </c:if>
		         <c:if test="${lifeCycle1.getIs_closed() eq 'Y'}">
		          <span style="color:#e91227;"><b>File Closed</b></span><br>
		         </c:if>
		         ${lifeCycle1.getRec_dt()}
		         </c:if>
		         <c:if test="${lifeCycle1.getIs_read() eq 'N'}">
		         	<span style="color:#2635e7;"><b>File Not Read By Receiver</b></span><br>
		         </c:if>
		         </td>
	     	 </tr> 
	     	 
	     	 </c:forEach> 
     	 </tbody>
  	  </table>
  	   <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
<!-- 				     <button type="button" class="btn btn-view" id="btnBack" >Back</button>
 -->				     <button type="button" class="btn btn-view" id="btnLifeCyclePdf" > View PDF</button>
				       <input type="hidden" id="flag" name="flag" value="L">
	     	            <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	     	            <!--  <input type="hidden" id="fileid" name="fileid" value=""></td> -->
				   </div>
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
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		"scrollY": "300px",
		"scrollX": true,
		"scrollCollapse": true,
		"paging":true,
		"columnDefs": 
	  [{"searchable": false,
		"orderable": false,
		"targets": 0
      }],
      	//"order": [[ 1, 'asc' ]],
	
      	dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'Final_Approval_Configuration',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[0,1,2,3] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
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
	   
	   <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -60px; top:auto !important;">
		<div class="modal-dialog modal-lg" style="width:85% !important;float: right; margin-right: 10%;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span id="ReloadAfterCheck" class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Attached DAK</h4>
				</div>
				
				<div class="modal-body" style="height: 400px">
					<form name="pdfForm" id="pdfForm" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="_Report" id="_Report" width="100%;" height="400px" src="" frameborder="0" scrolling="yes"></iframe>							
					</form>
				</div>
				
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-warning" id="ReloadAfterCheck_B" data-dismiss="modal">Back</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	   
	</body>
</html> 