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

   <form class="form-horizontal" name="advance_search_l" id="advance_search_l" method="post" autocomplete="off">
   
	 <div id="searchingTable1" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsg"></div>
          </div>
      </div>
	 <div class="page-header-1 head-1">
	    <div class="col-sm-4 repTitle h5 title-1">List of DAK(s)</div>
	    <div class="col-sm-4 repTitle text-center title-2"></div>	
	 </div>	
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>		
				<th style="text-align:center;width:5%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<th style="text-align:center;width:5%;">Select</th>
				<th style="text-align:center;width:10%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle></th>
				<th style="text-align:center;width:20%;">File Name/Subject</th>
				<th style="text-align:center;width:8%;">Priority</th>
				<th style="text-align:center;width:20%;">Sent by (Name) (Designation)</th>
				<th style="text-align:center;width:8%;">Action required</th>
				<th style="text-align:center;width:8%;">Send On (Date)</th>
				<th style="text-align:center;width:8%;">Pending days</th>
				<th style="text-align:center;width:8%;">File Status</th>				
		   </tr>
    </thead>	
      <tbody class="tbodynew">
         	<c:forEach items="${searchListA}" var="searchListA"> 
	        <c:set var="countA" value="${countA+1}"></c:set>
		      <tr <c:choose>
		      		<c:when test="${searchListA.getIsRead()=='N' && pendingRule.contains(searchListA.getFromDate()) }"> style="background-color:#ff5e00ab;font-weight:bold"  </c:when>
                    <c:when test="${searchListA.getIsRead()=='N'}"> style="font-weight:bold;" </c:when>
                    <c:when test="${pendingRule.contains(searchListA.getFromDate())}"> style="background-color:#ff5e00ab;" </c:when>                  
					</c:choose>>
					
				<td style="text-align:center;width:5%;">${countA}</td>
				<td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox" 
						   id="checkA_${countA}" name="checkA_${countA}" value="" onclick="">
				</td> 
			     <td style="text-align:center;width:10%;">${searchListA.getFile_group_id()}</td>
			     <td style="text-align:center;width:20%; text-decoration: underline;">
					<a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the File" class="red-tip" 
			     	onclick="view('${searchListA.getFile_creation_id()}','${searchListA.getFileDetailId()}','V','','${searchListA.getIs_to_cc()}', '${searchListA.getDesignaton()}', 'A')">
			     	<i aria-hidden="true"></i>${searchListA.getSubject()}</a>
			     </td>
			     <td style="text-align:center;width:8%;">${searchListA.getPriority()}</td>
			     <td style="text-align:center;width:20%;">${searchListA.getFrom_employee()}</td>
			     <td style="text-align:center;width:8%;">${searchListA.getStatus()}</td>
			     <td style="text-align:center;width:8%;">${searchListA.getIn_date()}</td>
			     <td style="text-align:center;width:8%;">${searchListA.getFromDate()}</td>
			     
			     <c:if test="${searchListA.getIsClose()=='Y'}">
			     	<td style="text-align:center;width:8%; color: red;">Closed</td>
			     </c:if>
				 <c:if test="${searchListA.getIsClose()=='N'}">
			     	<td style="text-align:center;width:8%; color: green;">Open</td>
			     </c:if>
	     	   
	     	 <input type="hidden" id="A_fcId_${countA}" name="A_fcId_${countA}" value="${searchListA.getFile_creation_id()}">
	     	 <input type="hidden" id="A_fdId_${countA}" name="A_fdId_${countA}" value="${searchListA.getFileDetailId()}">
	     	 <input type="hidden" id="A_sId_${countA}" name="A_sId_${countA}" value="${searchListA.getSenderId()}">
	     	 <input type="hidden" id="A_IsClose_${countA}" name="A_IsClose_${countA}" value="${searchListA.getIsClose()}">
	     	 <input type="hidden" id="A_ccId_${countA}" name="A_ccId_${countA}" value="${searchListA.getIs_to_cc()}">	     	
	     	 </tr>
	     	 </c:forEach>
       </tbody>
     </table>
     <input type="hidden" id="Aindex" name="Aindex" value="${countA}">
  </div>
  
  <!-- searching table end div -->
  
  	<div class="col-sm-12">
		<div class="row text-center">
       		<div class="errmessage"  id="errMsgA"></div>
        </div>
	</div>
	 
	<c:if test="${countA > 0 || countA ne null}">
	<div class="form-group m-t-25 m-b-15" style="margin-bottom:30px !important;padding-bottom:20px">
		<div class="col-md-12 text-center">
			<div class="row">
		     	<button type="button" class="btn btn-view" id="btnCloseA" onclick="func_close('C','A');" >Close File</button>
		        <button type="button" class="btn btn-view" id="btnOpenA" onclick="func_close('O','A');" >Re Open File</button> 
		        <button type="button" class="btn btn-view" id="btnArchA" onclick="func_close('MI','A');" >Move to Inbox</button>				
		   	</div>
    	</div>
	</div>
  </c:if>
  
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
   			"scrollY": "600px",
            
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
      "order": [[ 1, 'asc' ]], 
	
      	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-5'i><'col-sm-7'p>>",   
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'Inbox_File',
		className:'btn btn-view',
		text	 :'Download',
		exportOptions: { columns  :[ 0,2,3,4,5,6,7,8] },
					},
					],                      	       	
		columnDefs: [{ orderable: false, "targets": [0,1,8] },						 
					],
		}); 
		t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		cell.innerHTML = i+1; 
		t.cell(cell).invalidate('dom');
		});
		}).draw();
		
</script>  
      </form><!-- End panel-default -->
        
	  
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
    