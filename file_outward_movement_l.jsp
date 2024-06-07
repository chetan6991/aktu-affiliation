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
  	<script type="text/javascript" src="../resources/js/filemovement/file_outward_movement.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
<style type="text/css">
 
  
 td {
	    border-left-width: 0 !important;
	    border-right-width: 0!important;
   }
   
   .fa-wpforms{font-size:24px;color: #bd6622;}
	.fa-leanpub{font-size:24px;color: #097011;}
	.fa-copy{font-size:24px;color:#ff0000;}
	
	.list-fa-wpforms{font-size:15px !important;color: #bd6622;}
	.list-fa-leanpub{font-size:15px !important;color: #097011;}
	.list-fa-copy{font-size:15px !important;color:#ff0000;}
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
				      <div class="errmessage2"  id="errMsg"></div>
				  </div>
		       </div>
				    
	 <div id="searchingTable1" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage2"  id="errMsg"></div>
          </div>
      </div>
	 	    
	 <div class="page-header-1 head-1">
	    <div class="col-sm-4 repTitle h5 title-1">List of Outwarded File(s)</div>
	   <div class="col-sm-4 repTitle text-center title-2">Run Date : <%= (new java.util.Date().toLocaleString()) %> </div>
	  </div>

<div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label for="sector" style="font-size: large; font-weight: bold; color: black;" class="col-sm-8 col-form-label">
					<i class="fa fa-wpforms"></i> Letter &nbsp;
					<i class="fa fa-leanpub"></i> File&nbsp;
					<i class="fa fa-copy"></i> Circular/Notice
				</label>
			</div>
  		</div>
  	</div>
         
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">

			<tr>
				<th style="text-align:center; width: 3%" class="text-center">S No.</th>
				<th style="text-align:center; width: 8%" class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.man_no" /></fmt:bundle></th>
				<th style="text-align:center; width: 8%" class="text-center">Receipt No.</th>
				<th style="text-align:center; width: 15%" class="text-center">Receiver</th>
				<th style="text-align:center; width: 10%" class="text-center">Designation</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.to_departmnt" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.to_loc" /></fmt:bundle></th> --%>
				<th style="text-align:center; width: 15%" class="text-center">Subject</th>
				<!-- <th class="text-center">Action</th> -->
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.to_emp" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.rmrks" /></fmt:bundle></th> --%>
				
				<!-- <th class="text-center">Download</th>
				<!-- <th class="text-center">Life Cycle</th> -->
				<!-- <th class="text-center">Edit</th> -->
				<th style="text-align:center; width: 8%" class="text-center">File Send Date and time</th>
				<th style="text-align:center; width: 8%" class="text-center">Pull Back</th>
				<th style="text-align:center; width: 8%" class="text-center">Request For Return File</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.cancel" /></fmt:bundle></th> --%>		        
			</tr>
    </thead>	

      <tbody class="tbodynew">

	<c:forEach items="${outwardList}" var="outwardList"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width: 3%">${count}</td>
			     <td style="text-align:center;width:8%;word-break: break-all;">${outwardList.getManual_file_id()}<br>
				 <i <c:choose>
			     	<c:when test="${outwardList.getFilestatus()=='F'}"> class="fa fa-leanpub list-fa-leanpub"</c:when>
	                <c:when test="${outwardList.getFilestatus()=='L'}"> class="fa fa-wpforms list-fa-wpforms"</c:when>   
	                <c:when test="${outwardList.getFilestatus()=='C'}"> class="fa fa-copy list-fa-copy"</c:when>                 
				 </c:choose>></i>
			     </td>
			     <td style="text-align:center; width: 8%">${outwardList.getRecptNo()}</td>
		         <td style="text-align:center; width: 15%">${outwardList.getReciever_id()}</td>
		         <input type="hidden" name="empId" id="empId" value="${outwardList.getReciever_id()}">
		         <td style="text-align:center; width: 10%">${outwardList.getDesigId()}</td>
			     <%-- <td style="text-align:center;">${outwardList.getTo_department()}</td> --%>
			     <td style="text-align:center; width: 15%">${outwardList.getSubject()}</td>
			     <%-- <td style="text-align:center;width: 8%">${outwardList.getAction()}</td> --%>
			     <td style="text-align:center;width: 8%">${outwardList.getOutwardDate()}</td>
			     
			     <%-- <c:choose>
		       		<c:when test="${outwardList.getIs_pullBack() == 'N'}">			     			     
					     <td style="text-align:center;width:7%; text-decoration: underline;">
					     	<a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="" class="red-tip test" 
					     	onclick="view('${outwardList.getFmt_id()}','${outwardList.getFile_creation_id()}','${outwardList.getSender_id()}');">
					     	<i class="fa fa-edit p-l-3" aria-hidden="true">Edit</i>
					       </a>
				       	</td>		       	
			     	</c:when>
	     			<c:otherwise>
	     	  			<td style="text-align:center; width: 8%">  </td>
	     	  		</c:otherwise>
	     	  	</c:choose> --%>
			     <c:choose>
<%-- 		       		<c:when test="${outwardList.getIsRead() == 'N'  && outwardList.getIs_pullBack() == 'N' && appTyp != 'C' && outwardList.getRemarks() ne 'requestComeFromInward'}">
 --%>
 		       		<c:when test="${outwardList.getIsRead() == 'N'  && outwardList.getIs_pullBack() == 'N' && appTyp != 'C'}">
 
 
 		       			<%-- <c:if test="${outwardList.getIs_pullBack() == 'N'}"> --%>
		       				<td style="text-align:center; width: 8%; text-decoration:underline" onclick="PullUp('${outwardList.getFile_creation_id()}', '${outwardList.getSender_id()}', '${outwardList.getFmt_id()}', 'P', '${appTyp }');"
						       class="red-tip"><a  data-toggle="tooltip" data-placement="left"
						       title="" data-original-title="Click here for pull back"><i class="fa fa-reply fa-lg" aria-hidden="true"></i></a></td>
		       			<%-- </c:if> --%>
			     		<%-- <td style="text-align:center;"><label><a href="../downloadfile?filename=${outwardList.getFileName()}&folderName=${outwardList.getFmt_id()}"><u>Download File</u></a></label></td> --%>
			     		<%-- <td style="text-align:center;"><label><a href="../downloadfile?filename=${outwardList.getFileName()}"><u>Download File</u></a></label></td> --%>			     		
			     	</c:when>
	     			<c:otherwise>
	     	  			<td style="text-align:center; width: 8%">  </td>
	     	  		</c:otherwise>
	     		</c:choose>
				<c:choose>
		       		<c:when test="${outwardList.getIs_closed() eq 'N' && outwardList.getIsRead() == 'Y' && outwardList.getIs_pullBack() == 'N' 
		       		&& appTyp != 'C' && outwardList.getIs_return_req() eq 'N' && outwardList.getSeverity() eq 'N'}">
	       				<td style="text-align:center; width: 8%; text-decoration:underline" class="red-tip">
	       					<a data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here for Request Return File"
	       					onclick="PullUp('${outwardList.getFile_creation_id()}', '${outwardList.getSender_id()}', '${outwardList.getFmt_id()}', 'R', '${appTyp }');">
	       					<i class="fa fa-retweet fa-lg" aria-hidden="true"></i></a>
	       				</td>
			     	</c:when>
	     			<c:otherwise>
	     				<c:if test="${outwardList.getIs_return_req() == 'Y' && appTyp != 'C' && outwardList.getIs_return_completed() eq 'N'}">
	     	  				<td style="text-align:center; width: 8%">
	     	  					<span style="color: red; font-weight: bold;">
	     	  						Request Submitted
	     	  					</span>
	     	  				</td>
     	  				</c:if>
     	  				<c:if test="${outwardList.getIs_return_req() == 'Y' && appTyp != 'C' && outwardList.getIs_return_completed() eq 'Y'}">
	     	  				<td style="text-align:center; width: 8%">
	     	  					<span style="color: green; font-weight: bold;">
	     	  						Return Successfully
	     	  					</span>
	     	  				</td>
     	  				</c:if>
     	  				<c:if test="${outwardList.getIs_return_req() == 'Y' && appTyp != 'C' && outwardList.getIs_return_completed() eq 'R'}">
	     	  				<td style="text-align:center; width: 8%">
	     	  					<span style="color: red; font-weight: bold;">
	     	  						Rejected
	     	  					</span>
	     	  				</td>
     	  				</c:if>
     	  				<c:if test="${outwardList.getIs_return_req() == 'N'}">
     	  				<td style="text-align:center; width: 8%">  </td>
     	  				</c:if>
	     	  		</c:otherwise>
	     		</c:choose>
	     	 </tr>  
	     	 </c:forEach>
       </tbody>
     </table>
  </div><!-- searching table end div -->
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
	var t = $('#searchTable').DataTable({
		"searching":false,
		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		"scrollY":"575px",
		"scrollX":true,
		"scrollCollapse":true,
		"paging":true,
		"columnDefs":[{
		"searchable": false,
		"orderable": false,
		"targets": 0}],
      	//"order": [[ 6, 'desc' ]],
		dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'>>" +
			 "<'row'<'col-sm-6'l><'col-sm-6'>><'row'<'col-sm-12'tr>>"+"<'row'<'col-sm-5'i><'col-sm-7'p>>",
		buttons  : [{	
		extend   :'excelHtml5',
		filename :'File Outward Movement',
		className:'btn btn-view',
		//text	 :'Download',
		exportOptions:{columns : [ 0,1,2,3,4,5,6] },},],                      	       	
		columnDefs:[{ orderable: false, "targets": 0 },
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
      
	<!-- <iframe class="embed-responsive-item" name="pending_file_view" id="pending_file_view" width="100%;" height="460px" src="" frameborder="0" scrolling="no" style="overflow-y: scroll;">
  	</iframe> -->
  </body>
</html>