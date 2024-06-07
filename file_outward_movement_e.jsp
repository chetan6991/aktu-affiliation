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
    <script type="text/javascript" src="../resources/js/filemovement/file_outward_movement.js"></script>
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
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="../resources/assets/plugins/datepicker/datepicker3.css"  type="text/css">
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>  	
 	<script type="text/javascript" src="../resources/assets/plugins/ckeditor/ckeditor.js" charset="UTF=16"></script>  
 	<script src="../resources/assets/plugins/ckeditor/adapters/jquery.js"></script>
  	
<style type="text/css">
	.filter{
		    padding: 2px 5px;
		    background: #fff;
		    font-size: 20px;
	 }
	  .indicate{
	  	color:red;
	  }
	.neon  {
	    margin: 1rem auto;
	    animation: neon 1s ease infinite;
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

.col-form-label{
	padding: 0 10px 0 10px;
 }
 .panel-title > a:before {
    float: left !important;
    font-family: FontAwesome;
    content:"\f068";
    padding-right: 5px;
	}
 .panel-title > a.collapsed:before {
    float: left !important;
    content:"\f067";
  }
 
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
	
 	input[type=password].form-control.valid + label:after,
	input[type=password].form-control:focus.valid + label:after,
	input[type=password].form-control.invalid + label:after,
	input[type=password].form-control:focus.invalid + label:after {
    top: 3.75rem !important;
   }

	span.field-icon {
	  position: absolute;
	  display: inline-block;
	  cursor: pointer;
	  right: 2.5rem;
	  top: 0.7rem;
	  color: $input-label-color;
	  z-index: 2;
    }
   .fa-lg {
    font-size: 1.33333333em;
    line-height: 1.75em;
    vertical-align: -15%;
    padding-left: 3px;
  }
  .required-field:after{
    color: #d00;
    content: "*";
    position: relative;
    margin-left: 2px;
    top: 1px;
  } 
  .p-0{padding: 0px;} 
</style>
<script>
	$(document).ready(function() {
		$('.toggle-password').on('click', function() {
			  $(this).toggleClass('fa-eye fa-eye-slash');
			  let input = $($(this).attr('toggle'));
			  if (input.attr('type') == 'password') {
			    input.attr('type', 'text');
			  }
			  else {
			    input.attr('type', 'password');
			  }
	     });		  
		 $("a").tooltip();
	});
</script>
	
</head>
<body onload=" getlocation('<%=loct_id %>'); 
<%-- getToLocation('${map_loc}'); --%> 
getDepartment(1, '<%=loct_id %>','<%=dept_id %>'); 
 getEmployee(), getDesByEmpandDept('<%=employee_id %>', '<%=dept_id %>', '${fromdesgn}'), 
 <%-- setEmployee('${editList.getReciever_id()}','${editList.getDesignaton() }');  --%>
 getEmployeeByFileType('${file_creation_id}'); getSelDak('${requestFrom}', '${DakIdInwrd}');
 setEmployee('${editList.getReciever_id()}', '${editList.getEmpId()}', '${editList.getDesignaton() }', '${editList.getDesigId()}', '${editList.getTo_department() }');
 getfiletypesend('${fileTypes}')">
 <!-- onload="getLocation(); getDepartment(); getEmployee(); getDDO();"> getDakId(''); -->
 
 <div class="container-fluid">
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">
					<h4 class="hfont"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.header" /></fmt:bundle></h4>
				</div>

			</div>
		</div>

   <form class="form-horizontal" name="fileOut" id="fileOut"  target="" action="" method="post" autocomplete="off">			
	  <div class="panel panel-default">
				<c:choose>
					<c:when test="${EDIT=='edit' or requestFrom eq 'requestComeFromInward'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">View Record</h3></div>
						<c:set var="dis" value="disabled"/>
					</c:when>
					<c:otherwise><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.NEW}</h3></div></c:otherwise>
				</c:choose>
	 <div class="panel-body">
	    
	 
	<div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label for="sector" style="font-size: large; font-weight: bold; color: black;" class="col-sm-8 col-form-label">
					NOTE : <font color="red">You can send FILE with/without upload your signature!</font>
				</label>
			</div>
  		</div>
  	</div>
	 <br>
	 <div class="form-group">
	<div class="col-md-12">
		<div class="row">
		    <label class="col-sm-2 col-form-label " for="">Document Type</label>
			<div class="col-sm-4" id="AppType">      
				<!-- <input type="radio" class= "xfl" id="AppTypeD" value="D" checked="checked" name="AppType" onchange="getfileIdDropDown('D');">&nbsp;File Draft
				&nbsp;&nbsp; fileTypeFC-->
				<c:if test="${requestFrom ne 'requestComeFromInward'}">
				<input type="radio" class= "xfl" id="AppTypeF" value="F" checked="checked" name="AppType" onchange="getfileIdDropDown('F');" >&nbsp;File 			
				&nbsp;&nbsp;
				<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				<input type="radio" class= "xfl" id="AppTypeL" value="L" name="AppType" onchange="getfileIdDropDown('L');">&nbsp;Letter
				<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				&nbsp;&nbsp;
				<input type="radio" class= "xfl" id="AppTypeC" value="C" name="AppType" onchange="getfileIdDropDown('C');">&nbsp;Circular/Notice
				</c:if>
				
				<c:if test="${requestFrom eq 'requestComeFromInward'}">
					<c:if test="${fileTypeFC eq 'F'}">
						<input type="radio" class= "xfl" id="AppTypeF" value="F" checked="checked" name="AppType" onchange="getfileIdDropDown('F');" >&nbsp;File 			
					</c:if>
					<c:if test="${fileTypeFC eq 'L'}">
						<input type="radio" class= "xfl" id="AppTypeL" value="L" name="AppType" onchange="getfileIdDropDown('L');">&nbsp;Letter
					</c:if>
				</c:if>
			</div>
			<label class="col-sm-2 col-form-label required-field" for="cdate">File Title</label>
						   <div id ="" name="" class="col-sm-4">
				    		<select class="form-control" id="fileId" name="fileId" ${dis} ${disableFields }>
								 <option value="">Select File</option>
				   				 <c:forEach items="${fileIdList}" var="obj">
        					 		<option value="${obj.getFile_creation_id()}" <c:if test="${obj.getFile_creation_id()==file_creation_id}">  selected </c:if> >${obj.getFile_group_id()}</option>
          						 </c:forEach>
				            </select>
				           </div>
					</div>
				</div>
			</div>
		    <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
					  
					 <label class="col-sm-2 col-form-label required-field" for="severity"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.serv" /></fmt:bundle></label>
						 <div class="col-sm-4">
				    		<select class="form-control" id="severity" name="severity" ${dis} ${disableFields }>
								 <option value="">Select Priority</option>
				   				 <c:forEach items="${serv}" var="obj">
        					 		<option value="${obj.getServId()}"  <c:if test="${obj.getServId()==severity}">  selected </c:if>>${obj.getServName()}</option>
          						 </c:forEach>
				            </select>
				         </div>
					
					<div id="hidegroup" style="display: none;">
						<label class="col-sm-2 col-form-label"> Group</label>
						<div class="col-sm-3">		
						   <select  class="form-control" id="group_type" name="group_type">
								<option value="">Select Group </option>
								<c:forEach items="${grouptype}" var="obj">
        					 		<option value="${obj.getFile_group_id()}" <%-- <c:if test="${obj.getFile_creation_id()==file_creation_id}">  selected </c:if> --%> >${obj.getFileName()}</option>
          						 </c:forEach>
							</select>																	
						 </div> 
						 <button id="display_eye" type="button" class="btn col-sm-1" ${disableFields }onclick="showemployeelist();"><i class="fa fa-eye fa-lg"></i></button> 
		            	
					  </div>
					
					
					<div id="select_employee">
						<label class="col-sm-2 col-form-label required-field" for="toEmployee">Select Employee</label>						 
					    <div class="col-sm-4" >
					    	<!-- <button id="viewmag1" type="button" class="btn " id="myBtn" style="padding: 4px 28px; background: aqua;">
					    		<i class="fa fa-search"></i>
					    	</button> -->
					    	<span class="col-sm-12 p-0">
					    	<span class="col-sm-6 p-0"><input type="radio" class="raEmp" name="empMapping" value="A" checked> All Employee</span>
					    	<span class="col-sm-6 p-0"><input type="radio" class="raEmp" name="empMapping" value="M"> Mapping Employee</span>
					    	</span>
					    	<button type="button" class="btn filter" ${disableFields }>
					    		<i class="fa fa-hand-o-right indicate"></i>
					    	</button>  
							<a href="javascript:void(0);" id="viewmag1"  class="neon" style="vertical-align: middle;">Click here to get employee</a> 
					    </div>
					   </div> 
		        </div>
		    </div> 
		  </div>
		  <div class="col-md-6" style="padding-left:0px;margin-bottom:10px;">
		  <h3 class="panel-title text-left" style="color:green; margin-bottom:10px;" ><%-- ${ApplicationConstants.SEARCH} --%>
				<a id="collapseHead_1" class="collapsed" data-toggle="collapse" data-parent="#accordion" 
				href="#collapseBody_1" aria-expanded="true" aria-controls=""></a>
			</h3>
			<div class="" style="margin-bottom:10px;
   
    border: unset !important;">
           <div id="collapseBody_1" class="panel-collapse collapse">
           <div class="" style="border-color: #439653 !important;">
		  <div class="form-group">
	<div class="col-md-12">
		<div class="row">				       														
		<label for="location"  class="col-sm-4 col-form-label required-field" >From Location</label>
      		<div class="col-sm-8" >
	      		<select class="form-control" id="frm_location_id" name="frm_location_id">
		      		<option value="">Select From Location</option>
		      	</select>
	      	</div>
	      	  </div>
      </div>
      </div>
       <div class="form-group">
	<div class="col-md-12">
		<div class="row">	
	      	 <label class="col-sm-4 col-form-label required-field" for="">From Department</label>
							<div class="col-sm-8" >
								<select class="form-control" id="frm_departmnt" name="frm_departmnt">
									<option value="">Select From Department</option>
								</select>
					           </div>
      
	  </div>
      </div>
      </div>
      <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		            <label class="col-sm-4 col-form-label required-field" for="designation">From <fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.desg" /></fmt:bundle></label>
						 <div class="col-sm-8">
				    		<select class="form-control" id="desginationid" name="desginationid" ${disableFields }>
				            </select>
				         </div>
				         
      </div>
      </div>
      </div>
       <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		               <label class="col-sm-4 col-form-label required-field" for="loc"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.from_emp" /></fmt:bundle></label>
						 <div class="col-sm-8">
				    		<select class="form-control" id="fromEmployee" name="" disabled ${disableFields }>
								 <option value="">Select Employee</option>
				            </select>
				         </div>
				         </div>
				         </div>
				         </div>
      </div>
      </div>
      </div>
      
      	<div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
		            	<label for="reg" class="col-sm-4 col-form-label">CC To</label> 
							<div class="col-sm-7" >
								<div class="sel_reg_id" id="chkbox">
									<ul class="form-control" id="test_cc" style="height: 85px; padding-top:0px;overflow: auto; border: 1px solid #B2BABB; border-radius: 9px !important; list-style-type: none;" ${disableFields }>
										<c:set var="count" value="0"></c:set>
											<c:forEach items="${editListCC}" var="ccList">
												<li>${ccList.getReciever_id()}</li>
						 					</c:forEach>
									</ul>
								</div>	
				      		</div>
			      		<button id="viewcc" type="button" class="btn col-sm-1" ${disableFields }><i class="fa fa-search"></i></button>  
      </div>
      </div>
      </div>
      
      </div>
       <div class="col-md-6"> 
       
          <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
      <label for="location"  class="col-sm-4 col-form-label required-field" >To Location</label>
      		<div class="col-sm-8" >
	      		<select class="form-control" id="to_location_id" name="to_location_id">
		      		<option value="">Select To Location</option>
		      	</select>
	      	</div>
		  </div>
		  </div>
		  </div>
		  
				        <div class="form-group">
		       <div class="col-md-12">
		            <div class="row">
				           <label class="col-sm-4 col-form-label required-field" for="">To Department</label>
							  <div class="col-sm-8" >
								<select class="form-control" id="todepartment" name="todepartment" ${disableFields }>
									<option value="">Select To Department</option>
									<c:if test="${toDepartmentData.size()>0}">									
				   				 		<c:forEach var="i" begin="0" end="${toDepartmentData.size()-1}">
        					 				<option value="${toDepartmentData.get(i).get('ID')}" selected >${toDepartmentData.get(i).get('NAME')}</option>
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
				         <label class="col-sm-4 col-form-label required-field" for="toEmployee"><fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.to_emp" /></fmt:bundle></label>
						 <div class="col-sm-8" >
				    		<select class="form-control" id="toEmployee" name="toEmployee" ${dis} ${disableFields }>
								  <option value="">Select To Employee</option>
								  <c:if test="${toEmployeeData.size()>0}">
				   				 <c:forEach var="i" begin="0" end="${toEmployeeData.size()-1}">
        					 		<option value="${toEmployeeData.get(i).get('ID')}" selected>${toEmployeeData.get(i).get('NAME')}</option>
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
		                <label class="col-sm-4 col-form-label required-field" for="designation">To <fmt:bundle basename="filemovement"><fmt:message key="file_outward_movement.desg" /></fmt:bundle></label>
						 <div class="col-sm-8">
				    		<select class="form-control" id="toDesign" name="toDesign" ${disableFields } >
								 <option value="">Select To Designation</option>
				            </select>
				         </div>
				         </div>
				         </div>
				         </div>
		
		<div class="form-group">
      		<div class="col-md-12">
            	<div class="row">
		            	<c:if test="${showRemarks eq 'YES'}">
							<label class="col-sm-2 col-form-label" for="remarks">Remarks</label>
								<div class="col-sm-4">
						    		<textarea class="form-control" id="remarks" name="remarks" placeholder="Enter Remarks" style="height: 80px; width: 295px;"></textarea>  
						        </div>
						</c:if>	
		            	<c:if test="${showRemarks eq 'NO'}">
		            		<div style="display: none;">
		            			<label class="col-sm-2 col-form-label" for="remarks">Remarks</label>
									<div class="col-sm-4">
						    			<textarea class="form-control" id="remarks" name="remarks" placeholder="Enter Remarks" style="height: 80px; width: 295px;"></textarea>  
						        	</div>
							</div>
						</c:if>
						
					</div>
		        </div>
		    </div> 
		   </div> 
		    
		<div class="col-sm-12 text-center">
        	<div class="row">
	      		<div class="errmessage2" id="errMsg"></div>
          	</div>
		</div> 
		
		<div class="form-group m-t-25 m-b-5">
			<div class="col-md-12 text-center">
	       		<div class="row">
	       		  	<c:if test="${EDIT !='edit'}">
		     		<button type="button" class="btn btn-view" id="btnSend" >Send</button>
			     	</c:if>
			     	<c:if test="${requestFrom=='requestComeFromInward'}">
			     	 	<button type="button" class="btn btn-view" id="btnBack" >Back</button> 
			     	</c:if>			     	
			     	<c:if test="${EDIT != 'edit' and requestFrom!='requestComeFromInward'}">
			     		<button type="button" class="btn btn-view" id="btnSearch" >Search</button>
				    </c:if>
				    <c:if test="${EDIT == 'edit'}">
			     		<button type="button" class="btn btn-view" id="btnBack1" >Back</button>
				    </c:if>
				    <button type="button" class="btn btn-view" id="btnReset" >Reset</button>				     					
			   	
			   		<c:if test="${requestFrom=='requestComeFromInward'}">
						<div class="col-sm-12 text-right" style="padding:0px;margin-top: 4px;">
							<a href="#" onclick="getpdf('${file_creation_id}', '${fileTypeFC }');"data-toggle="tooltip" data-placement="top" 
								title="" data-original-title="Click here for download the Notes"class="red-tip">
								<b style="border: 1px solid green; border-radius: 7px; padding: 4px 4px; color: #ffffff !important; 
									background-color: #00799A !important; border-color: #687DB4 !important; font-size: 15px !important; 
									box-shadow: 2px 2px 1px #336376 !important; 
									background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;">
									PRINT NOTES
								</b>
							</a>
						</div>
					</c:if>
			   	
			   	</div>
				<input type="hidden" name="fileid" id="fileid" value="">
				<input type="hidden" name="chkboxcnt" id="chkboxcnt" value="">
				<input type="hidden" name="fdept_id" id="fdept_id" value="<%=dept_id%>">				
	     	</div>
		</div>
		
		        </div>
		    </div> 
		    </div>	  
	  
		<!-- Code For view Pop-Up -->
		<div class=" filterable">
<div class="modal" id="viewModal">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
					
								<!-- Modal Header -->
		<div class="modal-header text-center mod-head">
		  <h4 class="modal-title text-left">
			<h3 style="color: red;">Employee Search For CC</h3></h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
								<!-- Modal body -->
	<div class="modal-body">
	 <form class="form-horizontal" name="" id="" method="post" autocomplete="off">
	  <div class="panel panel-default">
		
	 <div class="panel-body">
	
	<div class='row_emp'>
	<div class='col-md-12'>
		<div class="col-xs-12">
			<div class="table-responsive"style="width:99.9%;height:220px;overflow:scroll;">
			<!-- <div id="table1" > -->				
			<table class="table table-striped" class="tableGrid1" cellspacing="1" cellpadding="1" width="100%">
				<thead class="theadnew12">
				    <tr class="filters" style="border: 1px solid green !important;">
				    	<th style="width:4%">Sr.No.</th> 
				    	<th style="width:10%">Select</th>
					    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Location">Location</th>
					    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Employee Name">Employee Name</th>
					    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Designation">Designation</th> 
					    <th style="width:15%;text-align:center;"><input type="text" class="form-control" placeholder="Search Department">Department</th> 
				    </tr>
				</thead>
			    	<tbody class="tbodynew12" id="tbodyid_emp"></tbody>
				</table>
			<!-- </div> -->
			</div>
			</div>
			</div>
	        </div>
	 <div class="col-sm-12 text-center">
	       <div class="row">
		      <div class="errmessage2" id="errMsgList"></div>
	          </div>
     </div> 
      <div class="form-group  m-t-25" >
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <button type="button" class="btn btn-view" id="selectempforcc" style="" >Select</button>
				     <input type="hidden" id="rowcntemp" name="rowcnt" value="">
				   </div>
			     </div>
			  </div>
		  
		     <div class="form-group m-t-25 m-b-5">
		         <div class="col-md-12 text-center">
			       <div class="row">
				     <input type="hidden" name="modal_typ" id="modal_typ" value="">
				   	 <input type="hidden" name="modal_typ_cc" id="modal_typ_cc" value="">
				   	 <input type="hidden" name="chk" id="chk" value="A">
				   </div>
			     </div>
			  </div>
	 </div>  <!-- panel body -->
	 </div>  <!-- panel default -->
	 </form> 
	</div>
 
		    <!-- Modal footer -->
			<div class="modal-footer">
			<button type="button" class="btn btn-danger" id="closepopupforcc" data-dismiss="modal">Close</button>
			</div>

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
			
			<div>
		    	<input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">
		    	<input type="hidden" name="senLevel" id="senLevel" value="<fmt:bundle basename="filemovement"><fmt:message key="seniority_level" /></fmt:bundle>">
	      	</div><!-- End panel-body -->
	        
	         <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>">
	         <input type="hidden" name="ddo_id" id="ddo_id" value="">
	         <input type="hidden" name="loct_id" id="loct_id" value="">
	         <input type="hidden" name="noteValid" id="noteValid" value="">	  
	         <input type="hidden" name="pageName" id="pageName" value="${requestFrom}">
	         <input type="hidden" name="map_loc" id="map_loc" value="">
	         <input type="hidden" name="map_dept" id="map_dept" value="">
	         <input type="hidden" name="map_desg" id="map_desg" value="">
	         <input type="hidden" name="map_emp" id="map_emp" value="">
	         <input type="hidden" name="xdesigID" id="xdesigID" value="<%=General.checknull((String)session.getAttribute("designation_id")).trim()%>">
	                    
	         <input type="hidden" name="BackButtonVal" id="BackButtonVal" value="${statusBack}">
        </form>
        
        <!-- -----code for list of employee --------------------------------------------- -->
     <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -60px; top:auto !important;">
		<div class="modal-dialog modal-lg" style="width:85% !important;float: right; margin-right: 10%;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span id="ReloadAfterCheck" class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Attached DAK</h4>
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
	<!-- chetan 17-1pr-23 -->
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
	
	<div class="modal fade recomond-btn" id="reportDiolog_chetan" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -60px; top:auto !important;">
		<div class="modal-dialog modal-lg" style="width:50% !important;float: right; margin-right: 25%;">
			<div class="modal-content">
				<%-- <div class="modal-header text-center">
					<!-- =<span id="ReloadAfterCheck" class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Enter Your Security PIN</h4> -->
					<center>
					<h1 style="color:green;padding:13px;">Enter Your Security PIN</h1>		
				</center>
				</div> --%>
				<center>
					<h1 style="color:green;padding:0px;">Enter Your Security PIN</h1>		
				</center>
				<div class="modal-body">
				
			   <div class="panel panel-default">
     			<div class="panel-body">
 
				<!-- -------------------------------Write content inside this modal------------------------------------------- -->
				  <div class="form-group">
					 <div class="row">
					   <div class="col-sm-12">
						<label class="col-sm-5 col-form-label required-field" for="" style="margin-top: 5px;">PIN</label>
						<div class="col-sm-6" style="padding:0px;">
							 <input type="password" name="pwd" id="pwd" maxlength="6" onkeypress="return onlyNumberKey(event);" class="form-control validate" placeholder="Enter PIN" required autocomplete="off"> 
							<span toggle="#pwd" class="fa fa-eye field-icon toggle-password"></span>
						</div>						 
					    </div>
					  </div>
					</div>

				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="btnSendF">Submit</button>
				</div>
			<!-- -------------------------------End Here (Write content inside this modal)------------------------------------------- -->
			</div> <!-- End of panal body -->
			</div> <!-- End of panal default -->
					
				</div>
				
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-warning" id="ReloadAfterCheck_Chetan" data-dismiss="modal">Back</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
<div class="modal-body" style="height: 400px">
	<form name="pdfForm" id="pdfForm" method="get" autocomplete="off" style="padding: 0px !important;">
		<iframe class="embed-responsive-item" name="_Report" id="_Report" width="100%;" height="400px" src="" frameborder="0" scrolling="yes"></iframe>							
	</form>
</div>
        <!-- End panel-default -->
       
    </div> <!-- End container-fluid -->
    
    <script>
		function onlyNumberKey(evt) {
			
			// Only ASCII character in that range allowed
			var ASCIICode = (evt.which) ? evt.which : evt.keyCode
			if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
				return false;
			return true;
		}
	</script>
  </body>
</html>