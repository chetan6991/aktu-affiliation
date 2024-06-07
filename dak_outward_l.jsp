<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="java.sql.Date"%>
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
  	<script type="text/javascript" src="../resources/js/filemovement/dak-outward.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  	
<style type="text/css">



 td {
	    border-left-width: 0 !important;
	    border-right-width: 0!important;
   }
   
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
   
</style>
<script>
		$(document).ready(function(){
		    $("a").tooltip();
		});
   </script>
 
</head>
 <body>

   <form class="form-horizontal" name="file_outward_l" id="file_outward_l" method="post" autocomplete="off">
   
				<div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
				    
	 <div id="searchingTable1" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsg"></div>
          </div>
      </div>
	 	    
	 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5">List of DAK(s)</div>
	   <div class="col-sm-4 repTitle text-center ">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
	  </div>

         
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>
				<th class="text-center">S No.</th>
				<th class="text-center">Manual DAK No.</th>
				<th class="text-center">Subject</th>
				<th class="text-center">Sender Name</th>
				<th class="text-center">Sender Designation</th>
				<th class="text-center">Sender Date and Time</th>
				<th class="text-center">Receiver Name</th>
				<th class="text-center">Receiver Designation</th>
				<th class="text-center">Receiver Date and Time</th>
				<!-- <th class="text-center">Download DAK</th> -->
				<th class="text-center">Pull Back</th>
			</tr>
    </thead>	

      <tbody class="tbodynew">

	<c:forEach items="${outwardList}" var="outwardList"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center; width: 5%">${count}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getFile_group_id()}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getSubject()}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getSenderId()}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getDesigId()}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getS_date()}</td>
		         <td style="text-align:center; width: 10%">${outwardList.getReciever_id()}</td>
		         <input type="hidden" name="empId" id="empId" value="${outwardList.getReciever_id()}">
		         <td style="text-align:center; width: 10%">${outwardList.getToDesignaton()}</td>
			     <td style="text-align:center; width: 10%">${outwardList.getR_date()}</td>
			     <%-- <td style="width:15%; text-align:center;">
			     	<c:choose>
			    		<c:when test="${outwardList.getTableName()=='dak_file_creation_master'}">																
							<a onclick="getReport('${outwardList.getAttachmentid()}', '${outwardList.getDFileName()}', '${fileCreationId}', '')"> 
								<u>${outwardList.getDocTitle()}</u>
							</a>						
							
							<c:if test="${not empty outwardList.getShowPdf() and outwardList.getShowPdf() eq 'Y'}">			 			
				 				<a onclick="getReport('${outwardList.getAttachmentid()}', '${outwardList.getDFileName()}', '${outwardList.getFile_creation_id()}', '');">
									<u>${outwardList.getDocTitle()}</u>
								</a>							
							</c:if>
				 			<c:if test="${not empty outwardList.getShowPdf() and outwardList.getShowPdf() eq 'N'}">
					 			<a target="_blank" href="../downloadfile?filename=${outwardList.getAttachmentid()}_${outwardList.getDFileName()}&folderName=${outwardList.getFile_creation_id()}&subFolderName=&FileType=D">
									<u>${outwardList.getDocTitle()}</u>
								</a>
							</c:if>
             			</c:when>
             			<c:otherwise>
             				<a>No File To Download</a>             				             				             		
             			</c:otherwise>
             		</c:choose>
			     </td> --%>
		     	 
		     	  <c:choose>
		       		<c:when test="${outwardList.getIsRead() eq 'N' and outwardList.getIs_pullBack() eq 'N'}">
						<td style="text-align:center; width: 10%; text-decoration:underline" onclick="PullUp('${outwardList.getFile_creation_id()}', '${outwardList.getSender_id()}');"
						    class="red-tip"><a  data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here for pull back"><i class="fa fa-reply fa-lg" aria-hidden="true"></i></a>
						</td>
			     	</c:when>
	     			<c:otherwise>
	     	  			<td style="text-align:center; width: 10%"></td>
	     	  		</c:otherwise>
	     		</c:choose>

	     	 </tr>
	     	 </c:forEach>
       </tbody>
     </table>
  </div><!-- searching table end div -->
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
	var t = $('#searchTable').DataTable({
		"searching":false,
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		"scrollY":"300px",
		"scrollX":true,
		"scrollCollapse":true,
		"paging":true,
		"columnDefs":[{
		"searchable": false,
		"orderable": false,
		"targets": 0}],
      	"order": [[ 1, 'asc' ]],
		dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>"+"<'row'<'col-sm-5'i><'col-sm-7'p>>",
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'File Outward Movement',
		className:'btn btn-view',
		//text	 :'Download',
		exportOptions:{columns : [ 0,1,2,3,4,5,6] },},],                      	       	
		columnDefs:[{ orderable: false, "targets": 0 },
				 	//{ orderable: false, "targets": 10 }
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
      
      <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -27px;">
		<div class="modal-dialog" style="width:85% !important;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Preview File</h4>
				</div>
				
				<div class="modal-body" style="height: 400px"> <!--Start Modal Body-->
					  <form name="pdfForm" id="pdfForm" method="get" autocomplete="off" style="padding: 0px !important;">
						<iframe class="embed-responsive-item" name="1_Report" id="1_Report" width="100%;" height="400px" src="" frameborder="0" scrolling="yes"></iframe>							
					</form>  
				</div>
				<!--End Modal Body-->
				
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
      
            
  </body>
</html>