<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  	<script type="text/javascript" src="../resources/js/filemovement/dak_inward.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
  <style type="text/css">
	
		.tbodynew {
		   /*  height: 140px; */
		    overflow: auto;
		    overflow-x: hidden;
		    display: block;
		    width: 100%;
		}
		 .tbodynew tr {
			display:table;
			width:100%;
			table-layout:fixed;
		}
			.theadnew {
			display:table;
			width:100%;
		} 
		.mod-head{
		padding:0px !important;
		
		}
		.modal-header .close {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
	   td {
	    border-left-width: 0 !important;
	    border-right-width: 0!important;
   }
  
    .red-tip + .tooltip > .tooltip-inner { background-color: #f00; }
    .red-tip + .tooltip > .tooltip-arrow { border-bottom-color:#f00; }
    
    @media screen and (min-width: 500px) {
        .modal-lg {
          width: 500px; /* New width for large modal */
        }
    }
    
    .modal-header .close {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
	
	td.details-control {
    	background: url('http://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
    	cursor: pointer;
	}
	tr.shown td.details-control {
    	background: url('http://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
	}  	
	.col-label{margin:0px;color:blue !important;}
</style>

	<script>
		$(document).ready(function(){
		    $("button").tooltip();
		});
		$(document).ready(function(){
		    $("a").tooltip();
		});
   </script>
</head>

 <body>

   <form class="form-horizontal" name="dak_list_page" id="dak_list_page" method="post" autocomplete="off">
   
	 <div id="searchingTable1" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsg"></div>
          </div>
      </div>
	 <div class="page-header-1 head-1">
	    <div class="col-sm-4 repTitle h5 title-1">List of Received DAK(s)</div>
	    <div class="col-sm-4 repTitle text-center title-2"></div>	
	 </div>	
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>		
				<th style="text-align:center;width:5%;">Select</th>
				<th style="text-align:center;width:5%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<!-- th style="text-align:center;width:5%;">Select</th> -->
				<!-- <th style="text-align:center;width:20%;">DAK No.</th> -->
				<th style="text-align:center;width:15%;">Manual DAK No.</th>
				<th style="text-align:center;width:15%;">Subject</th>
				<th style="text-align:center;width:15%;">Created by (Name/Designation)</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.rptNo" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_dt" /></fmt:bundle></th> --%>
				<th style="text-align:center;width:10%;">Creation Date</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_pendinDay" /></fmt:bundle></th> --%>
				<!-- <th style="text-align:center;width:8%;">Expiry date</th> -->
				<th style="text-align:center;width:10%;">Download/Receive DAK</th>
				<th style="text-align:center;width:10%;">View Remarks</th>
				<th style="text-align:center;width:10%;">Pending Days</th>
				<th style="text-align:center;width:12%;">Return DAK</th>
<!-- 				<th style="text-align:center;width:8%;">File status</th>
 -->				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle></th> --%>
			    <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.lifeCycle" /></fmt:bundle></th> --%>
		        <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.view" /></fmt:bundle></th> --%>
		        <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.close" /></fmt:bundle></th> --%>
		 		<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.open" /></fmt:bundle></th> --%>
		 
		   </tr>
    </thead>	
      <tbody class="tbodynew">
         	<c:forEach items="${searchList}" var="searchList"> 
	        <c:set var="countU" value="${countU+1}"></c:set>
		      <tr <c:choose>
		      		<c:when test="${searchList.getIsRead()=='N' && pendingRule.contains(searchList.getFromDate()) }"> style="background-color:#ff5e00ab;font-weight:bold"  </c:when>
                    <c:when test="${searchList.getIsRead()=='N'}"> style="font-weight:bold;" </c:when>
                    <c:when test="${pendingRule.contains(searchList.getFromDate())}"> style="background-color:#ff5e00ab;" </c:when>                  
					</c:choose>>
				
				<td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox"
							id="checkU_${countU}" name="checkU_${countU}" value="" onclick="">
				
				</td>
					
				<td style="text-align:center;width:5%;">${countU}</td>
				<%-- <td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox" 
						   id="checkU_${countU}" name="checkU_${countU}" value="" onclick="">
				</td>  --%>
			     <%-- <td style="text-align:center;width:20%;">${searchList.getFile_group_id()}</td> --%>
			     <td style="text-align:center;width:15%;">
					<%-- <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the File" class="red-tip" 
			     	onclick="view('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}','V','','${searchList.getIs_to_cc()}', '${searchList.getDesignaton()}', 'I')">
			     	<i aria-hidden="true"></i></a> --%>
			     	${searchList.getDocTitle()}
			     </td>
			     <td style="text-align:center;width:15%; ">${searchList.getSubject()}</td>
			   
			     <td style="text-align:center;width:15%;">${searchList.getFrom_employee()}</td>
			    
			     <td style="text-align:center;width:10%;">${searchList.getIn_date()}</td>			     
			     <%-- <td style="text-align:center;width:10%;">
			     	<c:choose>
			     		<c:when test="${searchList.getTableName()=='dak_file_creation_master'}">
							<c:if test="${not empty searchList.getShowPdf() and searchList.getShowPdf() eq 'Y'}">			 			
				 			<a onclick="getReport('${searchList.getAttachmentid()}', '${searchList.getFileName()}', '${searchList.getFile_creation_id()}', ''); isRead('${searchList.getFileDetailId()}', 'a');">
									<u>${searchList.getDocTitle()}</u>
								</a>							
							</c:if>
				 			<c:if test="${not empty searchList.getShowPdf() and searchList.getShowPdf() eq 'N'}">
				 			<a target="_blank"  href="../downloadfile?filename=${searchList.getAttachmentid()}_${searchList.getFileName()}&folderName=${searchList.getFile_creation_id()}&subFolderName=&FileType=D" 
				 				onclick="isRead('${searchList.getFileDetailId()}', 'b');"><u>${searchList.getDocTitle()}</u>
				 			</a>
				 			</c:if>
             	 		</c:when>
             	 		<c:otherwise>
             	 			<a>No File To Download</a>
             	 		</c:otherwise>
             	 	</c:choose>
			     </td> --%>
			     
			     <td class="details-control"style="text-align:center; width:10%;" onclick="isRead('${searchList.getFileDetailId()}', 'a');"></td>
			     
			   	<td style="text-align:center;width:8%; cursor: pointer;" onclick="getRemarks('${searchList.getFile_creation_id()}');">
			   		<a onclick="">View</a>
			     </td>
			     
			     <td style="text-align:center;width:10%;">${searchList.getFromDate()}</td>
			   	<%-- <c:if test="${searchList.getIsClose()=='Y'}">
			     	<td style="text-align:center;width:8%; color: red;">Closed</td>
			     </c:if>
				 <c:if test="${searchList.getIsClose()=='N'}">
			     	<td style="text-align:center;width:8%; color: green;">Open</td>
			     </c:if> --%>
			     
			     <td style="text-align:center; width:10%; color: green;" >
			     	<a onclick="returnFileToSender('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}');"><i class="fa fa-reply-all" aria-hidden="true"></i></a>			     	
			     </td>
			        
	     	 <input type="hidden" id="U_fcId_${countU}" name="U_fcId_${countU}" value="${searchList.getFile_creation_id()}">
	     	 <input type="hidden" id="U_fdId_${countU}" name="U_fdId_${countU}" value="${searchList.getFileDetailId()}">
	     	 <input type="hidden" id="U_sId_${countU}" name="U_sId_${countU}" value="${searchList.getSenderId()}">
	     	 <input type="hidden" id="U_IsClose_${countU}" name="U_IsClose_${countU}" value="${searchList.getIsClose()}">
	     	 <input type="hidden" id="U_ccId_${countU}" name="U_ccId_${countU}" value="${searchList.getIs_to_cc()}">
	     	 
	     	 </tr>  
	     	  </c:forEach>
       </tbody>
     </table>
     <input type="hidden" id="Uindex" name="Uindex" value="${countU}">
  </div>
  <!-- searching table end div -->
  
  	<div class="col-sm-12">
		<div class="row text-center">
       		<div class="errmessage"  id="errMsgU"></div>
        </div>
	</div>
	<c:if test="${countU > 0 || countU ne null}">
	<div class="form-group m-t-25 m-b-5">
		<div class="col-md-12 text-center">
			<div class="row">
				<%-- <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='Y' && searchList.getIs_to_cc()=='N' }">  disabled = "disabled" </c:if> --%>
		     	<button type="button" class="btn btn-view" id="btnCloseU" onclick="func_close('C','U');" >Close File</button>
				
				<%-- <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='N' && searchList.getIs_to_cc()=='N'}">  disabled = "disabled"</c:if> --%> 
		        <button type="button" class="btn btn-view" id="btnOpenU" onclick="func_close('O','U');" >Re Open File</button>
		        <button type="button" class="btn btn-view" id="btnArchU" onclick="func_close('MA','U');" >Move to Archive</button>				
		   	</div>
    	</div>
	</div>
  </c:if>

  
	<div class="col-sm-12">
		<div class="row text-center">
       		<div class="errmessage"  id="errMsgR"></div>
        </div>
	</div>
  
 <%--  <c:if test="${countR > 0 || countR ne null}">
  
  
  <div class="form-group m-t-25 m-b-5">
		<div class="col-md-12 text-center">
			<div class="row">
				<c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='Y' && searchList.getIs_to_cc()=='N' }">  disabled = "disabled" </c:if>
		     	<button type="button" class="btn btn-view" id="btnCloseR" onclick="func_close('C', 'R');" >Close File</button>				
				<c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='N' && searchList.getIs_to_cc()=='N'}">  disabled = "disabled"</c:if> 
		        <button type="button" class="btn btn-view" id="btnOpenR" onclick="func_close('O', 'R');">Re Open File</button>	
		        <button type="button" class="btn btn-view" id="btnArchR" onclick="func_close('MA','R');" >Move to Archive</button>			
		   	</div>
    	</div>
	</div>
  </c:if> --%>
   <input type="hidden" id="fileid" name="fileid" value="">
   <input type="hidden" id="fileDetId" name="fileDetId" value="">
   <input type="hidden" id="status" name="status" value="">
   <input type="hidden" id="fstatus" name="fstatus" value="">
   <input type="hidden" id="isCC" name="isCC" value="">
   <input type="hidden" id="empid" name="empid" value="${employee_id}">
   <input type="hidden" id="designation" name="designation" value="${designation}">
   
   <input type= "hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">

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
   			"scrollY": "400px",
            
            "paging": false,
            "bInfo" : false,    	    	 
            "ordering": false,

		"searching" : false,
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		
		"scrollX": true,
		"scrollCollapse": true,
		"paging":true,
		"columnDefs": 
	  [{"searchable": false,
		"orderable": false,
		"targets": 0
      }],
      //"order": [[ 1, 'asc' ]], 
	
      	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>",   
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'Inbox_File',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,1,2,3,4] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": [0,6] },						 
					],
		}); 
		t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		cell.innerHTML = i+1; 
		t.cell(cell).invalidate('dom');
		});
		}).draw();
		
		t.on('click', 'td.details-control', function () {
			var tr = $(this).closest('tr');
          	var row = t.row(tr);
			
          	if (row.child.isShown()) {
              	row.child.hide();
              	tr.removeClass('shown');
          	} else {
          		var ticketNo=tr.find("td:eq(2)").text();
              	format(row.child, ticketNo);
              	tr.addClass('shown');
          	}
      	});
		
		</script>  
      </form><!-- End panel-default -->
        
	<div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -60px; top:auto !important;">
		<div class="modal-dialog modal-lg" style="width:85% !important;float: right; margin-right: 10%;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span id="ReloadAfterCheck" class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
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
        
	  
	  <!-- Code For view Pop-Up add Note -->
<div class="modal" id="viewNote">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			
			<!-- Modal Header -->			
			<div class="modal-header text-center mod-head">
				<h4 class="modal-title text-left">
					<h3 style="color: red;">NOTE</h3>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
	 			<form class="form-horizontal" method="post" autocomplete="off">
	  				<div class="panel panel-default">					
	 					<div class="panel-body">
	  						<span id="noteVal"></span>    
			    		</div>  <!-- panel body -->
 					</div>  <!-- panel default -->
	 			</form> 
			</div>
 			
 			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"  data-dismiss="modal">Close</button>
			</div>
			
		</div>
	</div>
</div>
<!-- Code for view Pop-up add note end here -->
  </body>
</html>
    