<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
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
  	<script type="text/javascript" src="../resources/js/filemovement/file_creation.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
  	
</head> <!-- Head end -->
<style>
	
		
	.sentColr{
	  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#337638), color-stop(100%,#86d278));
	}
		
	.vl {
		border-left: 2px solid black;
		min-height: 300px;
		margin-left:90px;
		padding-left: 5px;
	}
	.vl1 {
		/* border-left: 2px solid black; */
		min-height: 400px;
		margin-left:60px;
	}
 </style>

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
	    <div class="col-sm-4 repTitle title-1" ><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.L_header" /></fmt:bundle></div>
	    <div class="col-sm-4 repTitle text-center title-2">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
	  </div>	
	  
	<!-- Define table field name  -->
	
	<!-- table body start -->
<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
	<thead  >
		<tr> 
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.S_no" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.id" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.man_no" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.subject" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.opening_dt" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.crtdby" /></fmt:bundle></th>
			<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.departmnt" /></fmt:bundle></th> --%>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.edit" /></fmt:bundle></th>
			<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_creation_master.del" /></fmt:bundle></th>			
			<!-- <th class="text-center">To Outward</th> -->
		</tr>
	</thead>	
			
<tbody> 
	<c:set var="count" value="0"></c:set>
	<c:forEach items="${createList}" var="createList"> 
	<c:set var="count" value="${count+1}"></c:set>
	<tr>
		<td class="text-center">${count}</td>
		<td class="text-center">
			<a onclick="openModel(${count},'${apptype}');" href="javascript:void(0)">${createList.getFile_group_id()}</a>
		</td>
		<td class="text-center">${createList.getManual_file_id()}</td>
		<td class="text-center">${createList.getSubject()}</td>
		<td class="text-center">${createList.getFile_opening_date()}</td>
		<td class="text-center">${createList.getCreated_by()}</td>
		<%-- <td class="text-center">${createList.getDpt_id()}</td> --%>
		 <%-- <c:if test="${FileCreationModel.}"> --%>
		<c:if test="${apptype eq 'D'}">
			<td class="text-center colr-blue-p">
				<span id="EDIT_RECORD_${count}" onclick="editRecord('${createList.getFile_creation_id()}' ,'E','${createList.getCreated_by()}') ;"><i  class="fa fa-edit p-l-3"></i>Edit</span>
			</td>
			<c:choose>
				<c:when test="${createList.getRemarks() =='' or createList.getRemarks() ==null}">
					<td style="text-align:center;color:RED;cursor:pointer;" onclick="delRecord('${createList.getFile_creation_id()}' , 'D') "><i class="fa fa-trash-o"></i> Delete</td>		
					<%-- <td class="text-center">
						<button type="button" class="btn btn-view sentColr" id="btnSent" 
						onclick="sentToOutward('${createList.getFile_creation_id()}', '${createList.getDesginationid()}','${apptype}');">Sent File</button>		
					</td> --%>
				</c:when>
				<c:otherwise>
					<td></td>
					<td></td>
				</c:otherwise>
			</c:choose>
			
			<%-- <c:if test="${createList.getRemarks() ne ''}">
				<td style="text-align:center;color:RED;cursor:pointer;" onclick="delRecord('${createList.getFile_creation_id()}' , 'D') "><i class="fa fa-trash-o"></i> Delete</td>		
				<td class="text-center">
					<button type="button" class="btn btn-view sentColr" id="btnSent" 
					onclick="sentToOutward('${createList.getFile_creation_id()}', '${createList.getDesginationid()}','${apptype}');">Sent File</button>		
				</td>
			</c:if>
			<c:if test="${createList.getRemarks() eq ''}">
				<td></td>
				<td></td>
			</c:if> --%>
		</c:if>
		<c:if test="${apptype ne 'D'}">
			<td  class="text-center colr-blue-p"><span id="EDIT_RECORD_${count}" onclick="editRecord('${createList.getFile_creation_id()}' ,'E','${createList.getCreated_by()}') ;"><i  class="fa fa-edit p-l-3"></i>Edit</span></td>
			<td style="text-align:center;color:RED;cursor:pointer;" onclick="delRecord('${createList.getFile_creation_id()}' , 'D') "><i class="fa fa-trash-o"></i> Delete</td>		
			<%-- <td class="text-center">
				<button type="button" class="btn btn-view sentColr" id="btnSent" 
				onclick="sentToOutward('${createList.getFile_creation_id()}', '${createList.getDesginationid()}','${apptype}');">Sent File</button>		
			</td> --%>
		</c:if>
		<div style="display:none" id="note_hide_${count}">
		  <input type="hidden" id="note_${count}" name="note_${count}" value='${createList.getNote()}'>
		</div>
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
		"scrollY": "550px",
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
		exportOptions: { columns  :[ 0,1,2,3,4,5] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": 0 },						 
					 { orderable: false, "targets": 5 },
					 { orderable: false, "targets": 6 },
					 { orderable: false, "targets": 7 }],
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

<div class="modal fade recomond-btn" id="reportDiologN" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -27px;padding-left:0px !important;margin-bottom: 15px;">
		<div class="modal-dialog" style="width:100%;max-height: 84%;">
			<div class="modal-content">
				
		 <div class="modal-header text-center">
			<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="padding-right: 10px; margin-top: 0px !important;">&times;</span>
		 </div>
	  	  <div class="modal-body" style="padding: 5px;">
		   	<div class="panel panel-default" style="background: #c9fa9c;">
				<div class="panel-body">
					<hr style="margin-bottom: -55px;margin-top: 50px;border: 1px solid black;">
					<div class="vl">
					 <div style="text-align:center;padding: 20px 0px 20px 6px !important; font-size: 15px;"><span>NOTES & ORDER</span></div>
						  <form name="pdfFormN" id="pdfFormN" method="get" autocomplete="off" style="padding: 0px !important;">
								<iframe class="embed-responsive-item" name="1_ReportN" id="1_ReportN" width="100%;" height="390px" src="" frameborder="0" scrolling="yes"></iframe>							
						  </form>
					  </div> <!--End of vl -->
				   </div> <!--End panel Body-->
				</div> <!--End panel-deafult-->
			</div> <!--End Modal Body-->
				
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-warning" data-dismiss="modal">Back</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
<div class="modal fade recomond-btn" id="viewPreview2" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
<div class="modal-dialog modal-preview" style="width:100%;max-height: 84%;">
<div class="modal-content">

	<div class="modal-header"> <button type="button" class="close cross" data-dismiss="modal" aria-hidden="true">×</button></div>
  		<div class="modal-body">
					<div class="vl1">
							<div style="padding-top: 1px;">
								<span id="previewNote2" style="text-align: left;padding-left: 5px;"></span>
							</div>
			 		</div>
   		</div> <!-- End of modal body -->
				 
</div> <!-- End of modal content -->
</div> <!-- End of modal-dialog -->
</div>

</body> <!-- body end  -->
</html> 