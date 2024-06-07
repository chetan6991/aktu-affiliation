<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 	
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
   	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/dak-outward.js"></script>
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
 	<script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>  
 	<script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
  	
<style type="text/css">
 

 
		.tbodynew11 {
		    height: 140px;
		    overflow: auto;
		    overflow-x: hidden;
		    display: block;
		    width: 100%;
		}
		 .tbodynew1 tr {
			display:table;
			width:100%;
			table-layout:fixed;
		}
			.theadnew1 {
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
	@keyframes neon {
	    0%,
	    100% {
	        text-shadow: 0 0 2px #c1eaf9a8, 0 0 2px #c1eaf9a8, 0 0 2px #c1eaf9a8, 0 0 2px #c1eaf9a8, 0 0 2px #c1eaf9a8, 0px 0px 0px #806914;
	        color: blue;
	    }
	    50% {
	        text-shadow: 0 0 0px #800e0b, 0 0 0px #800e0b, 0 0 0px #800e0b, 0 0 0px #800e0b, 0 0 0px #800e0b, 0px 0px 0px #ac9a60;
	        color: #9d684b;
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
	
	</style>
	
</head>
 <body onload="getEmployee('<%=employee_id%>'), getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${fromdesgn}'), 
  getEmployeeByFileType('${file_creation_id}'); 
	setEmployee('${editList.getReciever_id()}', '${editList.getEmpId()}', '${editList.getDesignaton() }', '${editList.getDesigId()}', '${editList.getTo_department() }');"> 
 
<div class="container-fluid">
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				
				<div class="col-sm-12">
					<h4>DAK Outward</h4>
				</div>

			</div>
		</div>

   <form class="form-horizontal" name="" id="fileOut" method="post" autocomplete="off">			
	  <div class="panel panel-default">
				<c:choose>
					<c:when test="${EDIT=='edit'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">View Record</h3></div>
						<c:set var="dis" value="disabled"/>
					</c:when>
					<c:otherwise><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.NEW}</h3></div></c:otherwise>
				</c:choose>
	 <div class="panel-body">
	    <br>
	 
		    <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					  <label class="col-sm-2 col-form-label required-field" for="cdate">DAK Name</label>
						   <div class="col-sm-4">
				    		<select class="form-control" id="fileId" name="fileId" ${dis} ${disableFields}>
								 <option value="">Select DAK Name</option>
				   				 <c:forEach items="${fileIdList}" var="obj">
        					 		<option value="${obj.getFile_creation_id()}" <c:if test="${obj.getFile_creation_id()==file_creation_id}">  selected </c:if> >${obj.getFile_group_id()}</option>
          						 </c:forEach>
				            </select>
				         </div>
				         <label class="col-sm-2 col-form-label required-field" for="toEmployee">Forward <fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.to_emp" /></fmt:bundle></label>
						 <div class="col-sm-3" style="width: 29% !important;">
				    		<select class="form-control" id="toEmployee" name="toEmployee" disabled >
								  <option value="">Select Forward  To Employee</option>
								  <c:if test="${toEmployeeData.size()>0}">
				   				 <c:forEach var="i" begin="0" end="${toEmployeeData.size()-1}">
        					 		<option value="${toEmployeeData.get(i).get('ID')}" selected>${toEmployeeData.get(i).get('NAME')}</option>
          						 </c:forEach> 
          						 </c:if>
				            </select>
				         </div>
				         <button  id="viewmag1"  type="button" class="btn " >
				          <i class="fa fa-search"></i></button> 
				         
		        </div>
		    </div> 
		  </div>
		  
		     <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		               <label class="col-sm-2 col-form-label required-field" for="loc"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.from_emp" /></fmt:bundle></label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="fromEmployee" name="" disabled >
								 <option value="">Select Employee</option>
				            </select>
				         </div>
		                  <label class="col-sm-2 col-form-label required-field" for="">Forward to Department</label>
							  <div class="col-sm-4" >
								<select class="form-control" id="todepartment" name="todepartment" disabled>
									<option value="">Select Forward To Department</option>
									<c:if test="${toDepartmentData.size()>0}">									
				   				 		<c:forEach var="i" begin="0" end="${toDepartmentData.size()-1}">
        					 				<option value="${toDepartmentData.get(i).get('ID')}" >${toDepartmentData.get(i).get('NAME')}</option>
          						 		</c:forEach> 
          						 	</c:if>
								</select>
				           </div>
				          
					</div>
		        </div>
		    </div> 
		    
		    <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		            <label class="col-sm-2 col-form-label required-field" for="designation">From <fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.desg" /></fmt:bundle></label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="desginationid" name="desginationid" ${disableFields}>
				            </select>
				         </div>
		                <label class="col-sm-2 col-form-label required-field" for="designation">Forward To <fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.desg" /></fmt:bundle></label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="toDesign" name="toDesign" disabled>
								 <option value="">Select Forward To Designation</option>
				            </select>
				         </div>				         
					</div>
		        </div>
		    </div>
		    
		    <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		            <label class="col-sm-2 col-form-label" for="remarks">Remarks</label>
					 <div class="col-sm-10">
			    		<textarea class="form-control" id="remarks" name="remarks" placeholder="Enter Remarks" style="height: 55px; width: 100%;"></textarea>  
			         </div>		            				        
					</div>
		        </div>
		    </div>
		
		<div class="col-sm-12 text-center">
        	<div class="row">
	      		<div class="errmessage" id="errMsg"></div>
          	</div>
		</div> 
		<input type="hidden" id="dept_ids" value="${dept_ids}">
		<input type="hidden" id="designation_ids" value="${designation_ids}">
 		<div class="form-group m-t-25 m-b-5">
			<div class="col-md-12 text-center">
	       		<div class="row">
	       		  	<c:if test="${EDIT !='edit'}">
		     		<button type="button" class="btn btn-view" id="btnSend" >Send</button>
			     	</c:if>
			     	<c:if test="${requestFrom=='requestComeFromInward'}">
			     	 	<button type="button" class="btn btn-view" id="btnBackInward" >Back</button> 
			     	</c:if>
			     	<c:if test="${EDIT != 'edit' and requestFrom!='requestComeFromInward'}">
			     		<button type="button" class="btn btn-view" id="btnSearch" >Search</button>
				    </c:if>
				    <c:if test="${EDIT == 'edit'}">
			     		<button type="button" class="btn btn-view" id="btnBack1" >Back</button>
				    </c:if>
				    <button type="button" class="btn btn-view" id="btnReset" >Reset</button>				     					
			   	</div>
				<input type="hidden" name="fileid" id="fileid" value="">
				<input type="hidden" name="chkboxcnt" id="chkboxcnt" value="">
				<input type="hidden" name="fdept_id" id="fdept_id" value="<%=dept_id%>">				
	     	</div>
		</div>
			  
		<!-- Code For view Pop-Up -->
		<div class="modal" id="viewModal">
		<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
					
								<!-- Modal Header -->
					<div class="modal-header text-center mod-head">
					<h4 class="modal-title text-left">
				<h3 style="color: red;">Employee Search</h3>
				</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

																	<!-- Modal body -->
				<div class="modal-body">
				 <form class="form-horizontal" name="" id="" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" >Searching Criteria</h3>
				</div>
				
	 <div class="panel-body">
	
	  		<div class="form-group">
		    	<div class="col-md-12">
		            <div class="row">
				         <label class="col-sm-2 col-form-label required-field" for="">Designation</label>
						 	<div class="col-sm-4">
				    			<select class="form-control" id="modal_design" name="modal_design" >
									 <option value="">Select Designation</option>				   				
				            	</select>
				         	</div>
				         	
				         	<label class="col-sm-2 col-form-label required-field" for="">Employee Code</label>
					   		<div class="col-sm-4">
				    			<select class="form-control" id="empCode" name="empCode" >
							 		<option value="">Select Employee Code</option>				   				 
				            	</select>
				         	</div>
					</div>
		        </div>
		    </div> 
		    
			<div class="form-group">
      			<div class="col-md-12">
	         		<div class="row">
		          				          
		          		<label class="col-sm-2 col-form-label required-field" for="">Department</label>
					  		<div class="col-sm-4" >
								<select class="form-control" id="department" name="department">
									<option value="">Select Department</option>
								</select>
							</div>
					</div>
     			</div>
		    </div> 
		    
		      <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
				          <label class="col-sm-2 col-form-label"style="display:none;" for="">Employee Code(M)</label>
						  <div class="col-sm-4">
							  <input type="text" class="form-control" id="empCodeM" name="empCodeM" placeholder="Manual Employee Code" style="display:none;">  
						  </div>
					</div>
		        </div>
		    </div> 
		    
		     <div class="form-group" style="display:none;">
		       <div class="col-md-12">
		         <div class="row">
		         
		         <label class="col-sm-2 col-form-label" for="">Employee Name</label>
						   <div class="col-sm-4">
								 <input type="text" class="form-control" id="empName" name="empName" placeholder="Employee Name" val="">  
						  </div>
					</div>
		        </div>
		    </div> 
		   
		      <div class="col-sm-12 text-center">
	          <div class="row">
		      <div class="errmessage" id="errMsg1"></div>
	          </div>
     </div> 
     
		  
		     <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnView" >View</button>
				     <button type="button" class="btn btn-view"  onclick="funcreset();" >Reset</button>
				   	 <input type="hidden" name="modal_typ" id="modal_typ" value="">
				   	 <input type="hidden" name="modal_typ_cc" id="modal_typ_cc" value="">
				   	 <input type="hidden" name="chk" id="chk" value="A">
				   </div>
			     </div>
			  </div>
		    
		    
	 </div>  <!-- panel body -->
	 </div>  <!-- panel default -->
	 </form> 

			<form id='formModal' method='post' action=''>
		    
	 <div class="page-header-1">
	    <div class="col-sm-4 repTitle h5">List Of Employee Detail(s)</div>
	 </div>	
				<!-- use a row class -->
					<div class='row'>
					<div class='col-md-12'>
					<div class="col-xs-12">
					<div class="table-responsive"style="width:99.9%;height:220px;overflow:scroll;">
					 <div id="table1" >
					 
	<table id="searchTable"  class="table table-bordered table-hover table-striped">
	 <thead class="theadnew1">
			<tr>
			    <th class="text-center"style="width:12% ">Select</th>
				<th class="text-center"style="width:12% ">S.No.</th>
				<th class="text-center"style="width:12% ">Employee Code(M)</th>
				<th class="text-center"style="width:12% ">Employee Name</th>
				<th class="text-center"style="width:13% ">Designation</th>        
			</tr>
    </thead>

      <tbody class="tbodynew1" id="tbodyid">

       </tbody>
				</table>
				</div>
				</div>
				</div>

				</div>
		        </div>
		        
		        <div class="col-sm-12 text-center">
	        		<div class="row">
	      				<div class="errmessage" id="errMsgList"></div>
          			</div>
				</div>
		        
		        <div class="form-group  m-t-25" >
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="btnSelect" style="display:none;" >Select & Send</button>
				     <input type="hidden" id="rowcnt" name="rowcnt"/>
				   </div>
			     </div>
			  </div>
		        
				</form>
				</div>
 
		    <!-- Modal footer -->
			<div class="modal-footer">
			<button type="button" class="btn btn-danger" id="close" data-dismiss="modal">Close</button>
			</div>

				</div>
				</div>

			</div>
			
<!-- Code for view Pop-up end here -->
			  
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
			
			</div>
		    	<input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
		    	<input type="hidden" name="senLevel" id="senLevel" value="<fmt:bundle basename="filemovement"><fmt:message key="seniority_level" /></fmt:bundle>">
	      	</div><!-- End panel-body -->
	        
	         <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	         <input type="hidden" name="ddo_id" id="ddo_id" value="">
	         <input type="hidden" name="loct_id" id="loct_id" value="">
	         <input type="hidden" name="noteValid" id="noteValid" value="">	  
	         <input type="hidden" name="pageName" id="pageName" value="${requestFrom}">	           
        </form><!-- End panel-default -->  
        
        <div class=" filterable">
	<div class="modal" id="viewModal_chetan">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center mod-head">
				<h4 class="modal-title text-left">
					<h3 style="color: red;">Employee Search</h3>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
			<form id='formModal_chetan' method='post' action=''>
		    
			<!-- <div class="page-header-1">
				<div class="col-sm-4 repTitle h5">List Of Employee Detail(s)</div>
			</div> -->	
			<!-- use a row class -->
			<div class='row'>
			<div class='col-md-12'>
			<div class="col-xs-12">
			<div class="table-responsive"style="width:99.9%;height:220px;overflow:scroll;">
			<!-- <div id="table1" > -->				
				<table class="table table-striped" class="tableGrid" cellspacing="1" cellpadding="1" width="100%">
				    <thead class="theadnew1">
					    <tr class="filters" style="border: 1px solid green !important;">
					    	<th style="width:4%">Sr.No.</th> 
					    	<th style="width:10%">Select</th>
						    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Location">Location</th>
						    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Employee Name">Employee Name</th>
						    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Designation">Designation</th> 
						    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Department">Department</th> 
					    </tr>
				    </thead>
			    	<tbody class="tbodynew1" id="tbodyid_empsearch"></tbody>
				</table>
			<!-- </div> -->
			</div>
			</div>
			</div>
	        </div>

			<!-- <div class="form-group  m-t-25" >
				<div class="col-md-12 text-center">
 					<div class="row">
					<button type="button" class="btn btn-view" id="btnSelect" style="display:none;" >Select & Send</button>
    				<input type="hidden" id="rowcnt" name="rowcnt"/>
  					</div>
   				</div>
			</div> -->
		        
			</form>
			</div>
 
			    <!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="close_modal" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	</div>
    </div> <!-- End container-fluid -->
  </body>
</html>