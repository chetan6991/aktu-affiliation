<%@include file="../myCks.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="utf-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
  
  	
  	<script type="text/javascript" src="../resources/js/common.js"></script>
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
  	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="../resources/js/gen.js"></script>
  	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
  	<script type="text/javascript" src="../resources/js/filemovement/file_movement_report.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<script>
		$(document).ready(function(){
		    $("#tip").tooltip();
		});
		
		
   </script>
   <style type="text/css">

		 .red-tip + .tooltip > .tooltip-inner { background-color: #f00; }
    .red-tip + .tooltip > .tooltip-arrow { border-bottom-color:#f00; }
    
     @media screen and (min-width: 500px) {
        .modal-lg {
          width: 500px; /* New width for large modal */
        }
    }
      .popup-font{font-family: Calibri, verdana, Arial, Helvetica, sans-serif;
    font-weight: normal;
    font-size: 13px;
    color: #2C427C;"
    }
    
    
    
</style>
 <body>
<form name="file_mov_l" id="file_mov_l" action="" method="post" autocomlete="off">
	<div id="searchingTable" class="scr0" style="height: fit-content !important;padding-bottom: 50px;">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage"  id="errMsg"></div>
			 </div>
		   </div>
	   <div class="page-header-1 head-1">
		    <div class="col-sm-4 repTitle title-1">List of File(s)</div>
		    <div class="col-sm-4 repTitle text-center title-2">Run Date :<%= (new java.util.Date().toLocaleString()) %> </div>	
	   </div>	
	<div class=" filterable">
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
      <thead class="theadnew">
			<tr class="filters">
				<th class="text-center">S.No.</th>
				<th class="text-center">Dispatch No.</th>
				<th class="text-center">Subject
				<input type="text" class="form-control" placeholder="Search by Subject">
				</th>
				<!-- <th class="text-center">From Department</th> -->
				<th class="text-center">From Employee</th>
				<th class="text-center">Send Date</th>
				<!-- <th class="text-center">To Department</th> -->
				<th class="text-center">To Employee</th>
				<!-- <th class="text-center">Received Date</th> -->
		        <th class="text-center">View file Detail</th>
		        <th class="text-center">Life Cycle</th>
		        <th class="text-center">Attached Letter</th>
		        <th class="text-center">Download Attachment</th>
		        <th class="text-center">Download File</th>
			</tr>
      </thead>	
      <tbody class="tbodynew">
		      <c:set var="count" value="0"></c:set>
		      <c:set var="count1" value="0"></c:set>
			<c:forEach items="${searchList}" var="list"> 
			<c:set var="count" value="${count+1}"></c:set>
				      <tr>
					     <td style="text-align:center;width:5%;">${count}</td>
					     <td style="text-align:center;width:8%;">${list.getManual_file_id()}</td>
					     <td style="text-align:center;width:8%;">${list.getSubject()}</td>
				         <%-- <td style="text-align:center;width:12%;">${list.getFromDepartment()}</td> --%>
					     <td style="text-align:center;width:15%;">${list.getSenderId()}</td>
					     <td style="text-align:center;width:8%;">${list.getCreated()}</td>
					     <%-- <td style="text-align:center;width:8%;">${list.getTo_department()}</td> --%>
				         <td style="text-align:center;width:15%;">${list.getReceiverId()}</td>
				        <%--  <td style="text-align:center;width:10%;">${list.getReceived_date()}</td> --%>
				       
				        <%--  <td style="text-align:center;width:6%;text-decoration: underline;" onclick="view(${list.getFile_creation_id()},${fstatus});">
				         <a href="#"  data-toggle="tooltip" data-placement="left"
					       title="" data-original-title="Click here to view the File"
					       class="red-tip" ><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td> --%>
				      
				        <td style="width:6%; text-align:center;">
					    	<span id="tip"><i class="fa fa-info-circle fa-lg" aria-hidden="true" data-toggle="popover${count}" title="Information" ></i></span>
					    	<div id="myForm${count}" class="hide">
						      <div>				      
						        <label class="popup-font" for="name">Generated File Id: ${list.getDet_gen_file_id()}</label><br>
						        <label class="popup-font" for="about">Manual File No: ${list.getDet_man_file_no()}</label><br>
						        <label class="popup-font" for="about">Subject: ${list.getDet_subject()}</label><br>
						        <label class="popup-font" for="about">Created By: ${list.getDet_created_by()}</label>				            
						        <label class="popup-font" for="about">Creation Date: ${list.getDet_creation_date()}</label>				           
						      </div>
						   </div>
					    </td>   
				        
				        <%--  <td style="text-align:center;width:6%;text-decoration: underline;" onclick="showlifecycle(${list.getFile_creation_id()},${fstatus});">
				         <a href="#" data-toggle="tooltip" data-placement="left"
					       title="" data-original-title="Click here to view the Life Cycle"
					       class="red-tip"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td> --%>
					     <td style="text-align:center;width:6%;text-decoration: underline;" onclick="showlifecycle(${list.getFile_creation_id()},${fstatus});">
				         <a href="#" data-toggle="modal"  data-target=""><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a>
				         </td>
					    
					    <c:if test="${list.getDakName() ne ''}">
					    	<td style="width:6%; text-align:center;">
					    	<span>
		     					<i class="fa fa-plus idL1" onclick="jsp_scriptL('${count}','P'); 
		     					showattachletter('${list.getDakName()}','${count}','${list.getLetter_file_attch_id()}','${list.getLetter_creation_id()}');" id="idL1_${count}" name="idL1_${count}" >
		     						<input type="hidden" class="abc" value="'${count}'"/>
		     					</i>
		     				</span>     			 	
		     			 	<span>
		     			 		<i class="fa fa-minus idL2" onclick="jsp_scriptL('${count}','M');" 
		     			 		style="display:none;" id="idL2_${count}" name="idL2_${count}">  
		     			 			<input type="hidden" class="abc"  value="${count}"/>
		     			 		</i>
		     			 	</span>
					    	</td>
					    </c:if>
					    <c:if test="${list.getDakName() eq ''}">
					    	<td style="width:6%; text-align:center;">
					    		<span style="color: red; font-size: 11px; font-style: italic; font-family: emoji;">
					    			No Attached Letter
					    		</span>
					    	</td>
					    </c:if>
					    
					    <td style="text-align: center; width: 6%;">
		     				<span>
		     					<i class="fa fa-plus idiv1" onclick="jsp_script('${count}','P'); showattachfile(${list.getFile_creation_id()},${count});" id="idiv1_${count}" name="idiv1_${count}" >
		     						<input type="hidden" class="abc" value="'${count}'"/>
		     					</i>
		     				</span>
		     			 	
		     			 	<span>
		     			 		<i class="fa fa-minus idiv2" onclick="jsp_script('${count}','M');" style="display:none;" id="idiv2_${count}" name="idiv2_${count}">  
		     			 			<input type="hidden" class="abc"  value="${count}"/>
		     			 		</i>
		     			 	</span>
						</td> 
					    
					   <%--   <td style="text-align:center;width:6%;text-decoration: underline;" onclick="showattachfile(${list.getFile_creation_id()},${fstatus});" >
				         <a href="#" data-toggle="tooltip" data-placement="left"
					       title="" data-original-title="Click here to view the File Attached"
					       class="red-tip"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td> --%>
			     	 
			     	 
			     	 	<td style="text-align:center;width:6%;text-decoration: underline;" onclick="getpdf('${list.getFile_creation_id()}', '${list.getStatus() }','${list.getFmt_id()}',
			     	 	   '<fmt:bundle basename="filemovement"><fmt:message key="jasper.url" /></fmt:bundle>',
						   '<fmt:bundle basename="filemovement"><fmt:message key="jasper.username" /></fmt:bundle>',
						   '<fmt:bundle basename="filemovement"><fmt:message key="jasper.password" /></fmt:bundle>');">
			         		<a href="#" data-toggle="tooltip" data-placement="left" title="" 
			         		data-original-title="Click here to download the Notes" class="red-tip">
			         		<i class="fa fa-download fa-lg" aria-hidden="true"></i>
					       </a>
			     		</td>
			     	 </tr>  
			    <c:set var="count1" value="${count}"></c:set>
				<tr>
		       <td colspan="11" id="hide-area_${count}" style="display: none;">
		       
			   <table id="searchTableshowdivdetail${count}" class="table table-striped table-bordered table-hover display nowrap " 
			   cellspacing="0" width="100%">
				  
		  	  </table>
		  	  
		  	    <%-- <div class="form-group m-t-25 m-b-5">
					<div class="col-md-12 text-center">
				     		<button type="button" class="btn btn-view" id="" onclick="jsp_script('${count}','M');">Back</button>
				     	</div>
				     </div> --%>
		       </td>
		       
				<td colspan="11" id="hide-areaL_${count}" style="display: none;">
		       		<table id="searchTableshowdivdetailL${count}" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%"></table>
				</td>
		    </tr>
				</c:forEach>
			    <input type= "hidden" id="count" name="count" value="${count1}" >
       </tbody>
     </table>
 </div>
 </div>
 
 <!-- Modal -->
<div class="modal fade" id="eopenModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="width: 90%">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <h5 class="modal-title" id="ModalTitle">List of File(s)</h5> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <iframe class="embed-responsive-item" name="file_mov_view1" id="file_mov_view1" width="100%;" height="500px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>
	  
				    
      </div>
    </div>
  </div>
</div>
 
	<!-- jQuery (necessary for Bootstrap's JavaScript plugin) -->
	<input type="hidden" id="fileid" name="fileid" value="">
	<input type="hidden" id="file_status" name="file_status" >
	<input type="hidden" id="flag" name="flag" value="">
	
	
	 <script src="../resources/assets/sits/DataTable/1.10.15/js/jquery.js"></script>  
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="../resources/assets/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
	<script src="../resources/assets/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
	<!-- <script src="../resources/assets/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
	<script src="../resources/assets/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
	<script src="../resources/assets/sits/DataTable/1.4.2/js/jszip.min.js"></script> -->
	<script>
	      //$("#searchTable").dataTable();
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		  		"scrollY": "500px",
		         //"scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		        "order": [[ 1, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
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
			     	columnDefs: [{ orderable: false, "targets": 0 },						 
								 { orderable: false, "targets": 5},
								 { orderable: false, "targets": 6}
								],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	     </script> 

<script >
function jsp_script(j,flg){

if(flg=='P'){
   var cnt = $("#count").val();
	var i;
 	for(i=0;i<cnt;i++){
		$("#hide-area_"+i).hide(); 
		  $("#idiv1_"+i).show();
		  $("#idiv2_"+i).hide();
		  
		  $("#hide-areaL_"+i).hide(); 
			$("#idL1_"+i).show();
			$("#idL2_"+i).hide();
		  
			}
		  $("#hide-area_"+j).show();
		  $("#idiv1_"+j).hide();
		  $("#idiv2_"+j).show();
	}else if(flg=='M'){
		  $("#hide-area_"+j).hide                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ();
		  $("#idiv2_"+j).hide();
		  $("#idiv1_"+j).show();
	}
}

function jsp_scriptL(j, flg){
	if(flg=='P'){
		var cnt = $("#count").val();
		var i;
	 	for(i=0;i<cnt;i++){
			$("#hide-areaL_"+i).hide(); 
			$("#idL1_"+i).show();
			$("#idL2_"+i).hide();
			
			$("#hide-area_"+i).hide(); 
			$("#idiv1_"+i).show();
			$("#idiv2_"+i).hide();
		}
		$("#hide-areaL_"+j).show();
		$("#idL1_"+j).hide();
		$("#idL2_"+j).show();
	}else if(flg=='M'){
		$("#hide-areaL_"+j).hide                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ();
		$("#idL2_"+j).hide();
		$("#idL1_"+j).show();
	}
}

$('.filterable .filters input').keyup(function(e){
	/*   / Ignore tab key / */
	  var code = e.keyCode || e.which;
	  if (code == '9') return;
	  /* / Useful DOM data and selectors / */
	  var $input = $(this),
	  inputContent = $input.val().toLowerCase(),
	  $panel = $input.parents('.filterable'),
	  column = $panel.find('.filters th').index($input.parents('th')),
	  $table = $panel.find('.table'),
	  $rows = $table.find('tbody tr');
	  /* / Dirtiest filter function ever ;) / */
	  var $filteredRows = $rows.filter(function(){
	    var value = $(this).find('td').eq(column).text().toLowerCase();
	    return value.indexOf(inputContent) === -1;
	  });
	 /*  / Clean previous no-result if exist / */
	  $table.find('tbody .no-result').remove();
	  /*  Show all rows, hide filtered ones (never do that outside of a demo ! xD)  */
	  $rows.show();
	  $filteredRows.hide();
	  /* / Prepend no-result row if all rows are filtered / */
	  if ($filteredRows.length === $rows.length) {
	    $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
	  }
});
</script>   
	   </form>
	   <iframe class="embed-responsive-item" name="file_mov_view" id="file_mov_view" width="100%;" height="600px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>
	</body>
</html> 