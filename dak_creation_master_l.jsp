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
  	<script type="text/javascript" src="../resources/js/filemovement/dak_creation.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />
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
	
<div id="searchingTable" class="scr0">

	<div class="col-sm-12">
		<div class="row text-center">
				<div class="errmessage"  id="errMsg">
			</div>
		</div>
	</div>
	
	  <div class="page-header-1 head-1">      
	    <div class="col-sm-4 repTitle title-1" >List of DAK(s)</div>
	    <div class="col-sm-4 repTitle text-center title-2">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
	  </div>	
	
<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
	<thead  >
		<tr> 
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.S_no" /></fmt:bundle></th>
			<th class="text-center">DAK No.</th>
			<th class="text-center">Manual DAK No.</th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtdby" /></fmt:bundle></th>
			<!-- <th class="text-center">Attached DAK</th> -->
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.edit" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.del" /></fmt:bundle></th>
		</tr>
	</thead>	
			
<tbody> 
	<c:set var="count" value="0"></c:set>
	<c:forEach items="${createList}" var="createList"> 
	<c:set var="count" value="${count+1}"></c:set>
	<tr>
		<td class="text-center">${count}</td>	            
		<td class="text-center">${createList.getFile_group_id()}</td>
		<td class="text-center">${createList.getManual_file_id()}</td>
		<td class="text-center">${createList.getSubject()}</td>
		<td class="text-center">${createList.getCreated_by()}</td>
		
		<%-- <td style="width:15%; text-align:center;">
			  <c:if test="${not empty createList.getShowPdf() and createList.getShowPdf() eq 'Y'}">			 			
				<a data-target=".recomond-btn" data-toggle="modal" onclick="getReport('${createList.getAttachmentid()}', '${createList.getFilename()}', '${createList.getFile_creation_id()}', '');">
					<u>${createList.getFilename()}</u>
				</a>							
			</c:if>
			<c:if test="${not empty createList.getShowPdf() and createList.getShowPdf() eq 'N'}">
				<a data-target=".recomond-btn" data-toggle="modal" target="_blank" href="../downloadfile?filename=${createList.getAttachmentid()}_${createList.getFilename()}&folderName=${createList.getFile_creation_id()}&subFolderName=&FileType=D">
					<u>${createList.getFilename()}</u>
				</a>
			</c:if>  
		</td> --%>		
		<td  class="text-center colr-blue-p"><span id="EDIT_RECORD_${count}" onclick="editRecord('${createList.getFile_creation_id()}' ,'E','${createList.getCreated_by()}') ;"><i  class="fa fa-edit p-l-3"></i>Edit</span></td>
		<td style="text-align:center;color:RED;cursor:pointer;" onclick="delRecord('${createList.getFile_creation_id()}' , 'D') "><i class="fa fa-trash-o"></i> Delete</td>		
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
		filename :'File Creation Master',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,1,2,3,4] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
					 { orderable: false, "targets": 5 },
 					 //{ orderable: false, "targets": 6 }
					 ],
		}); 
		t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		cell.innerHTML = i+1; 
		t.cell(cell).invalidate('dom');
		});
		}).draw();
</script>
   
<input type="hidden" id="cid" name="cid" value="">	
	<input type="hidden" name="user_id" id="user_id" value="">
		
</form>

	<!-- <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -24px;">
		<div class="modal-dialog modal-lg1" style="width:85% !important;">
			<div class="modal-content">
				<div class="modal-header1 text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
				</div>				
				<div class="modal-body" style="height: 400px"> Start Modal Body
					<form name="pdfForm1" id="pdfForm1" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="1_Report" id="1_Report" width="100%;" height="400px" src="" frameborder="0" scrolling="yes"></iframe>							
					</form>
				</div>End Modal Body				
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-warning" data-dismiss="modal">Back</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div> -->

</body> <!-- body end  -->
</html> 