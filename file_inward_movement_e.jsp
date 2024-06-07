<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="utf-8">
 
 <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />		 
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet">
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/file_inward_movement.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
   
	<%
		response.setHeader("Cache-Control","no-store");  // HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache");        // HTTP 1.0
		response.setDateHeader ("Expires", -1);        // Prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="../resources/assets/plugins/datepicker/datepicker3.css"  type="text/css">
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
 
</head>
 <body >
	 <div class="container-fluid">

		

   <form class="form-horizontal" name="" id="" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" ></h3>
				</div>
				
	<div class="panel-body">
        
	<div id="searchingTable" class="scr0 botom">
      
	 	    
	 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.L_header" /></fmt:bundle></div>
	 </div>	

         
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">

			<tr>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_dt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_departmnt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.receive" /></fmt:bundle></th>
			</tr>
    </thead>	

      <tbody class="tbodynew">
<c:set var="count" value="0"></c:set>
	<c:forEach items="${searchList}" var="searchList"> 
	<c:set var="count" value="${count+1}"></c:set>
		      <tr>
			     <td style="text-align:center;width:10%;">${count}</td>
			     <td style="text-align:center;width:10%;">${searchList.getIn_date()}</td>
		         <td style="text-align:center;width:10%;">${searchList.getFile_group_id()}</td>
			     <td style="text-align:center;width:10%;">${searchList.getFrom_employee()}</td>
			     <td style="text-align:center;width:10%;">${searchList.getFrom_department()}</td>
			     <td style="text-align:center;width:10%;">${searchList.getSubject()}</td>
		         <td style="text-align:center;width:10%;">
			     <input type="checkbox" class="sec" id="chck_${count}" name="chck_${count}"   value="${searchList.getFile_creation_id()}">  <%-- onclick="addValue('${count}')" --%>
                 </td>
	     	 </tr>  
	     	 </c:forEach>
      </tbody>
   </table>
   <input type="hidden" id="fileid" name="fileid">file
</div><!-- searching table end div -->
 
 <div class="form-group m-t-25 m-b-5">  
   <div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
   </div>
	 <div class="form-group m-t-25 m-b-5">
		 <div class="col-md-12 text-center">
			 <div class="row">
			 <button type="button" class="btn btn-view" id="btnRcv">Receive</button>
			 </div>
		 </div>
	  </div>
				    
	 <div id="searchingTable" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsg"></div>
          </div>
      </div>
	 	    
	 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.L_header2" /></fmt:bundle></div>
	 </div>	

         
 <table id="searchTable2" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">

			<tr>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_dt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_departmnt" /></fmt:bundle></th>
				<th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle></th>
		        <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.close" /></fmt:bundle></th>
			</tr>
			
    </thead>	

      <tbody class="tbodynew">
      
<c:set var="count" value="0"></c:set>
	<c:forEach items="${inwardList}" var="inwardList"> 
	<c:set var="count" value="${count+1}"></c:set>
	
		      <tr>
			     <td style="text-align:center;width:10%;">${count}</td>
			     <td style="text-align:center;width:12%;">${inwardList.getIn_date()}</td>
		         <td style="text-align:center;width:12%;">${inwardList.getFile_group_id()}</td>
			     <td style="text-align:center;width:12%;">${inwardList.getFrom_employee()}</td>
			     <td style="text-align:center;width:12%;">${inwardList.getFrom_department()}</td>
			     <td style="text-align:center;width:12%;">${inwardList.getSubject()}</td>
			   <c:choose>
		         <c:when test="${inwardList.getFlag()==false}"> 
			     <td><button type="button" class="btn btn-view" id="close" onclick="func_close('${inwardList.getFile_creation_id()}');">Close File</button></td>
		   </c:when>
			     <c:otherwise>
			     <td style="text-align:center;width:12%;"></td>
			     </c:otherwise>
			     </c:choose> 
	     	 </tr>  
	     	 </c:forEach>
       </tbody>
     </table>
  </div><!-- searching table end div -->
     
		    </div>
	      </div><!-- End panel-body -->
	             
         	<!-- jQuery (necessary for Bootstrap's JavaScript plugin) -->
	<script src="../assets/sits/DataTable/1.10.15/js/jquery.js"></script>
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
		var t = $('#searchTable2').DataTable(
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
		      	"order": [[ 1, 'asc' ]],
			
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
        </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="" id="" width="100%;" height="300px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
</html>
    