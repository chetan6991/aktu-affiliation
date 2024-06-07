<%@include file="../myCks.jsp"%>
<%@page import ="com.sits.general.*"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 

    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
    <link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
    	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <script type="text/javascript" src="../resources/js/filemovement/employee_mapping.js"></script>
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
</head>
<style>
	.table > thead > tr > th, .table > tfoot > tr > th {
       border: 1px solid green !important;
    }
	 

 
</style>
<body onload="getlocation('');getfiletype('${fileid}');getgroups('Y','${group}','${fstatus}');">
<c:choose>
	<c:when test="${fstatus!='E'}">
		<c:set var="OPT_VALUE" value="${ApplicationConstants.NEW}"></c:set>
		<c:set var="status" value="N"></c:set>
		<c:set var="sel" value=""></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="OPT_VALUE" value="${ApplicationConstants.EDIT}"></c:set>
		<c:set var="status" value="E"></c:set>
		<c:set var="sel" value="disabled"></c:set>
	</c:otherwise>
</c:choose>


<div class="container-fluid">
   <div id="" class="page-header"><h4 style="float:left;"><fmt:bundle basename="filemovement"><fmt:message key="create_and_manage_group_for_circular.header" /></fmt:bundle></h4>
    <span id="" class="text-right ">
		 <h4><a href="javascript void(0);" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;"> <span>Advance Search</span>
		 	<i class="fa fa-search"></i></a>
		 </h4>
	</span>
   </div>
    <form class="form-horizontal" name="eForm" id="eForm"  method="post" autocomplete="off">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">${OPT_VALUE}</h3></div>
			<div class="panel-body">
			    <div class="form-group" >
					<div class="col-md-12">
						<div class="row"Style="display:none">
						    <label class="col-sm-2 col-form-label required-field" for="">Is Group </label>
							  <div class="col-sm-4">
							  	<input type=checkbox  id="group_by" name="group_by" >
						     </div>	
						     <div id="hidetype">			  
								<label class="col-sm-2 col-form-label required-field" for="">File Type</label>
								  <div class="col-sm-4">
								  	<select class="form-control" id="filetype" name="filetype" ${sel} onchange="getdata(this.value);">
										<option value="">Select File Type</option>
									</select>
							     </div>
						     </div>
					    </div>
				    </div>
				</div>				
				<div class="form-group">
					<div class="col-md-12">
					   <div class="row">
						    <label class="col-sm-2 col-form-label required-field" for="">Group</label>
							<div class="col-sm-4" >
								<input class="form-control" type="text" id="group" name="group" placeholder="Enter Group name">
				            </div>
						   <!-- <label for="location"  class="col-sm-2 col-form-label  required-field "  id="abc">From Location</label>
		      			     <div class="col-sm-4" >
		      			         <select class="form-control" id="FFROMLCT" name="FFROMLCT" onchange="getDepartment(this.value,'');">
			      				    <option value="">Select From Location</option>
			      			     </select>
		      				 </div> -->
		      				<!-- <label for="location"  class="col-sm-2 col-form-label required-field" >To Location</label>
		      			     <div class="col-sm-4" >
		      			         <select class="form-control" id="TFROMLCT" name="TFROMLCT" onchange="getDepartmentcheckbox(this.value,'');">
			      				    <option value="">Select To Location</option>
			      			     </select>
		      				 </div> -->
					   </div>
				    </div>
				</div>
                <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						   <div id="fdep">
						  		<label class="col-sm-2 col-form-label required-field" for="">From Department</label>
								<div class="col-sm-4" >
									<select class="form-control" id="frm_departmnt" name="frm_departmnt">
										<option value="">Select From Department</option>
									</select>
				                </div>
				           </div>
				           <div id="grp" Style="display:none">
						  <!-- <label class="col-sm-2 col-form-label required-field" for="">Group</label>
							<div class="col-sm-4" >
								<input class="form-control" type="text" id="group" name="group" placeholder="Enter Group name">
				            </div> -->
				           </div>
				             <label for="location"  class="col-sm-2 col-form-label required-field" >To Location</label>
		      			     <div class="col-sm-4" >
		      			         <select class="form-control" id="TFROMLCT" name="TFROMLCT" onchange="">
			      				    <option value="">Select To Location</option>
			      			     </select>
		      				 </div>
				             <label class="col-sm-2 col-form-label required-field" for="">To Department</label>
							  <!-- <div class="col-sm-4" >
								<select class="form-control" id="todepartmnt" name="todepartmnt">
									<option value="">Select To Department</option>
								</select>
				           </div> -->
				           <div class="col-sm-4 " >
								<div class="sel_dept" id="sel_dept">
									<ul class="form-control"  style="height: 85px; padding-top:0px;overflow: auto; border: 1px solid #B2BABB; border-radius: 9px !important; list-style-type: none;">
										<li >Select Department</li>
									</ul>
								</div>
						   </div>
					    </div>
				    </div>
				</div>
				
				 <!-- <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Employee Name</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frmempCode" name="frmempCode">
									<option value="">Select From Employee Name</option>
									
								</select>
				           </div>
				           <label class="col-sm-2 col-form-label required-field" for="">To Employee Name</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="toempCode" name="toempCode">
									<option value="">Select To Employee Name</option>
								</select>
									<div class="toempCode" id="toempCode">
									<ul class="form-control"  style="height: 85px; padding-top:0px;overflow: auto; border: 1px solid #B2BABB; border-radius: 9px !important; list-style-type: none;">
										<li >Select To Employee Name</li>
									</ul>
								</div>
				           </div>
					   </div>
				   </div>
				</div> -->
				       
				<!--  <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						  <label class="col-sm-2 col-form-label required-field" for="">From Designation</label>
							<div class="col-sm-4" >
								<select class="form-control" id="frm_design" name="frm_design">
									<option value="">Select From Designation</option>
								</select>
				           </div>
				           <label class="col-sm-2 col-form-label required-field" for="">To Designation</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="to_design" name="to_design">
									<option value="">Select To Designation</option>
								</select>
				           </div>
					   </div>
				   </div>
				</div> -->
				      
				<br>
			    <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg1"></div>
					</div>
				</div>
			    <div class="col-md-12 text-center m-t-20" style="padding-right:0px;margin-bottom:15px;">
					<button type="button" class="btn btn-view" id="addRow" >Add Employee</button>
				</div>	
		<div class="row "><!--open comment here -->
		<div class="col-xs-12">
		<div class="table-responsive">  
		<div class=" filterable">	 
		  <table class="table table-striped" class="tableGrid" cellspacing="1" cellpadding="1" width="100%">
		    <thead>
			   <tr style="background-color:cyan;width: 98.5%;border: 1px solid green !important;">
			        <th style=""></th>
			        <th class="fromdp" style=""></th>
			        <th class="fromdp" colspan="3">From Employee</th>
			        <th class="fgrup" colspan="3" style="display:none;">Group</th>
			        <th style="width:5%"></th>
			        <th colspan="3">To Employee</th>
			        <th style=""></th>
			    </tr> 
			    <tr class="filters" style="border: 1px solid green !important;">
			    	<th style="width:5%">Sr.No.</th> 
			    	<th class="fromdp">File Type</th> 
			    	<th class="fgrup" colspan="3" style="display:none;"></th>
				    <th class="fromdp">
				    <input type="text" class="form-control" placeholder="Search by Name">
				    From Employee Name</th> 
				    <th class="fromdp">
				    <input type="text" class="form-control" placeholder="Search by Designation">
				    From Designation</th> 
				    <th class="fromdp">
				     <input type="text" class="form-control" placeholder="Search by Department">
				    From Department</th> 
				    
				    <th></th>
				    <th>
				     <input type="text" class="form-control" placeholder="Search To Employee Name">
				    To Employee Name</th> 
				    <th>
				     <input type="text" class="form-control" placeholder="Search To Designation">
				    To Designation</th> 
				    <th>
				     <input type="text" class="form-control" placeholder="Search  To Department">
				    To Department</th> 
				    <th>Remove</th>  
			    </tr>

		    </thead>
		    <tbody id="searchTable">
		    <c:set var="count" value="0"></c:set>
				<c:forEach items="${data}" var="data"> 
				<c:set var="count" value="${count+1}"></c:set>
				<c:set var="fileType" value="${data.getFiletype()}"></c:set>
				<tr>
				<tr ><td class="text-center" id="${count}">${count}</td>
		        <td class="text-center fromdp"><input type="hidden" class="form-control" id="fileType${count}" value="${data.getFiletype()}" >
				<span id="fileTypeName${count}">${data.getFileTypeName()}</span></td>
				<td class="text-center fgrup"  colspan="3" style="display:none;"><input type="hidden" class="form-control" id="group${count}" value="${data.getGroup()}">
				<span id="">${data.getGroup()}</span></td>
				<td class="text-center fromdp"><input type="hidden" class="form-control" id="frmempCode${count}" value="${data.getFrom_employee()}">
				<span id="fromEmpName${count}">${data.getFromEmpName()}</span></td>
				<td class="text-center fromdp"><input type="hidden" class="form-control" id="frmDesiCode${count}" value="${data.getFrom_designation()}" readonly="readonly">
				<span id="fromDesiName${count}">${data.getFromDesiName()}</span></td>
				<td class="text-center fromdp"><input type="hidden" class="form-control" id="frmDeptCode${count}" value="${data.getFrom_department()}" readonly="readonly">
				<span id="fromDeptName${count}">${data.getFromDeptName()}</span></td>
				<td class="text-center"></td>
				<td class="text-center"><input type="hidden" class="form-control" id="toempCode${count}" value="${data.getTo_employee()}">
				<span id="toEmpName${count}">${data.getToEmpName()}</span></td>
				<td class="text-center"><input type="hidden" class="form-control" id="toDesiCode${count}" value="${data.getTo_designation()}" readonly="readonly">
				<span id="toDesiName${count}">${data.getToDesiName()}</span></td>
				<td class="text-center"><input type="hidden" class="form-control" id="toDeptCode${count}" value="${data.getTo_department()}" readonly="readonly">
				<span id="toDeptName${count}">${data.getToDeptName()}</span></td>
				<td style="text-align:center;color:RED;cursor:pointer; width:5%; " onclick="deleteRow(${count},'${data.getFiletype()}','${data.getFileId()}','${data.getIs_group()}','${data.getGroup()}')">
				<i class="fa fa-trash-o"></i> Delete</td>
			   </tr>
			 </c:forEach>
		   </tbody>	    
		  </table>
		 </div>
		 
		</div>
		</div>
		</div><!--open comment here -->
				 <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg"></div>
					</div>
				 </div>
				 <div class="col-md-12 text-center m-t-20" style="padding-right:0px;margin-bottom:15px;">
		            <c:choose>
					<c:when test="${fstatus=='E'}">
						<button type="button" class="btn btn-view" id="saveMappingData" >Update</button>
						<button type="button" class="btn btn-view" id="btnBack">Back</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-view" id="saveMappingData" >Save</button>
					</c:otherwise>
					</c:choose>
			            <button type="button" class="btn btn-view" id="excel">Excel</button>
						<button type="button" class="btn btn-view" id="btnReset">Reset</button>
				 </div>
				   <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
			</div>
		</div>	
		<input type="hidden" name=index id="index" value="${count}">
		<input type="hidden" name=fstatus id="fstatus" value="${status}">
	    <input type="hidden" name="fileType" id="fileType" value="${fileType}">
	    <input type="hidden" name="indexx"   id="indexx"   value="0">
	    <input type="hidden" name="indexs"  id="indexs"  value="0">
	    <input type="hidden" name="indexss" id="indexss" value="0">
	    <input type="hidden" name="is_group" id="is_group" value="Y">	
      </form>
      <form class="form-horizontal" name="frmefillingD" id="frmefillingD" action="" method="post" autocomplete="off" target="">
       <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
	     <div class="modal-dialog modal-lg">
		  <div class="modal-content">
			<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red;opacity: 1;">×</button></div>
			  <div class="modal-body">
			   <div class="panel panel-default">
                <div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div>
     			<div class="panel-body">
		<!-- -------------------------------Write content inside this modal------------------------------------------- -->
			   <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label " for="">Group Name</label>
						<div class="col-sm-4" >
							<input class="form-control" type="text" id="Xgroup" name="Xgroup" placeholder="Enter Group name">
			            </div>
						</div>
					</div>
			   </div>
		    
			 <div class="col-md-12 text-center">
				<button type="button" class="btn btn-view" id="btnSearch" data-dismiss="modal" onclick="getsearchlist();">Search</button>
				<button type="button" class="btn btn-view" id="xxbtnReset" onclick="">Reset</button> 				
			 </div>
			<!-- -------------------------------End Here (Write content inside this modal)------------------------------------------- -->
			</div> <!-- End of panal body    -->
			</div> <!-- End of panal default -->
		    </div> <!-- End of modal body    -->	 
			</div> <!-- End of modal content -->
		</div>     <!-- End of modal-dialog  -->
	 </div> <!-- End of modal class/id at which modal will be open -->
	
	</form>
	<iframe class="embed-responsive-item "  onload="resizeIframe(this)" name="btmefillingl" id="btmefillingl"  width="100%;"
	  height="" src="" frameborder="0" scrolling="no"></iframe>
	
   </div>
  </body>
    <script>
    function resizeIframe(iframe) {
	    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
	    window.requestAnimationFrame(() => resizeIframe(iframe));
    };
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
</html>
 