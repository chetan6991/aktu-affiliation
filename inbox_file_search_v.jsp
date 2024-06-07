<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.*"%>
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
  	 <title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>  	 
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	
    <script type="text/javascript" src="../resources/js/filemovement/inbox_file_search.js"></script>
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
	.viewNotes{
		padding:0px;
	    text-align:center;
	    font-size:15px;
	    -webkit-transform:scale(1.4,1);
	    font-style: italic !important;
	}
	</style>	

</head>
 <body>
 
 
 
	 <div class="container-fluid">
		<!-- <div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">			
					<h4>Receipt Details</h4>
				</div>
			</div>
		</div>
 -->
   <form class="form-horizontal" name="addRemarks" id="addRemarks" method="post" autocomplete="off">
	 <!--  <div class="panel panel-default">
				 
	<div class="panel-body"> -->
	 <br>
	 
	  <div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">

	<div>
		 
		<div class="panel panel-default">
				<div class="panel-heading panel-group" role="tab" id="headingOne" style="">
          		<h3 class="panel-title text-left col-sm-6" style="padding-left: 0px;">File Creation Details</h3>
									<h3 class="panel-title text-right"> 
										<a class="colr-indianred font-s-15" role="button" data-toggle="collapse"	data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne" style="  text-decoration: none;" >
											File Creation Detail<i class="short-full glyphicon glyphicon-plus "></i>
										</a>
									</h3>
								</div>
		
         <div id="collapseOne" class="panel-collapse collapse"
			role="tabpanel" aria-labelledby="headingOne">
									
		
		<div class="panel-body" style="padding: 0px 26px;"> 
		
       <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" ><span> ${viewList.get(0).getFile_group_id()} </span><!-- id="FileId" -->
				    		  
				         </div>
				         <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.man_no" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="ManualNo"><span> ${viewList.get(0).getManual_file_id()} </span>
				    		 
				         </div>
					</div>
		        </div>
		    </div> 
		    
      <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <%-- <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.title" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="title">
				    		 
				         </div> --%>
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.from_emp" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="subject"><span> ${viewList.get(0).getSenderId()}</span>
				    		                       
				         </div>
				         
				           <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="designation"><span>${viewList.get(0).getDesignaton()}</span>
				    		 
				         </div> 
					</div>
		        </div>
		    </div> 
		    
		    <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					  <%--  <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.crtd_by" /></fmt:bundle></label>
						 <div class="col-sm-4 col-form-label" id="createdby"><span>${viewList.get(0).getCreated_by()}</span>
				    		 
				         </div> --%>
				         
				         <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.departmnt" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="department"><span> ${viewList.get(0).getSender_dpt()}</span>
				         	 
				         </div>
				         
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle>:</label>
						 <div class="col-sm-4 col-form-label" id="opendate"><span>${viewList.get(0).getSubject()}</span>
				    		 
				         </div>
					</div>
		        </div>
		    </div> 

			<div class="form-group">
      			<div class="col-md-12">
              		<div class="row">
						<label class="col-sm-2 col-form-label">Previous Upload File</label>
							<div class="col-sm-4 col-form-label">
								<label><a target="_blank" onclick="" href="../downloadfile?filename=${viewList.get(0).getFileName()}"><u>${viewList.get(0).getDocTitle()}</u></a></label>
								<!-- Download Previous Uploaded File -->
							</div>							       						
  						<%-- <label class="col-sm-2 col-form-label">Document Title</label>
  							<div class="col-sm-4 col-form-label"><span>${viewList.get(0).getDocTitle()}</span></div> --%>
			         </div>
				</div>
	       	</div>

	<%-- 	 
		 <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					
				          <label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="advance_file_search.rmrks" /></fmt:bundle>:</label>
						  <div class="col-sm-4 col-form-label" id="rmks"><span> ${viewList.get(0).getRemarks()}</span>
				    		 
				         </div>
				        
					</div>
		        </div>
		    </div> --%>
		 
		 </div></div>
		</div></div><!-- End of 1st panel --> 
		 </div>
		  
		<div class="panel panel-default">
           <div class="panel-heading"><h3 class="panel-title text-left">File Movement</h3></div>
			<div class="panel-body">
      
		
		<%-- <div class="form-group">
     		<div class="col-md-12">
         		<div class="row">
         		<div class="col-sm-2"></div>		
		        	<label class="col-sm-2 col-form-label" for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.file" /></fmt:bundle>:</label>		         		
	         			<div class="col-sm-4 col-form-label" id="status">
	         				<span>${viewList.get(0).getFileName()}
					      		<c:if test="${not empty viewList.get(0).getFileName()}">
	         					<a href="../downloadfile?filename=${viewList.get(0).getFile_creation_id()}_${viewList.get(0).getFileName()}" style="text-align:center;width:10%; text-decoration: underline;">&nbsp;&nbsp;<b>View</b></a> </c:if>
					 		</span>
				 		</div>
				 		<div class="col-sm-5">
			    			<select class="form-control" id="selFile" name="selFile" >
						 		<option value="">Select Previous Uploaded File</option>
						 		 <c:forEach items="${DropData}" var="obj">
        					 		<option value="${obj.getFile_creation_id()}">${obj.getFileName()}</option>
          						</c:forEach>
				   			</select>
				   			<!-- <div id="viewFile"></div>	 -->
			          	</div>
			          	<div class="col-sm-3">
				   			<div id="viewFile"></div>	
			          	</div>
			          			          			 							
					  <label class="col-sm-3 col-form-label " for="">Uploaded<fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.note" /></fmt:bundle>:</label>
		         		<div class="col-sm-1 col-form-label" id="status">
		         			<span>
					 			<c:if test="${not empty viewList.get(0).getDptName()}">
	         					<a href="#" onclick="viewnote('','1','N')" style="text-align:center;width:10%; text-decoration: underline;">&nbsp;&nbsp;<b>View</b></a> </c:if>
						 	</span>
					 	</div> 
					    	<input type="hidden" id="noteValid1" name="noteValid1"  value='${viewList.get(0).getDptName()}'>  
					</div>
		        </div>
		</div> 
	
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
				<div class="col-sm-2"></div>	
		        	<label for="sector" class="col-sm-2 col-form-label required-field">Additional Upload File</label>
						<div class="col-sm-5" id="fileU">
							<input type="file" class="form-control" id="XFILE" name="XFILE"/> 
 							<img id="imgFileUpload" src="#" alt="" style="height:55px;width:100%;"/>
							<span style="font-size: 13px !important; font-weight: bold; color: red;">Max. Size 20MB</span>
						</div>
	         	</div>
			</div>
       </div> --%>
		  
		  	<%-- <div class="form-group">
     		<div class="col-md-12">
         		<div class="row">
         		<div class="col-sm-2"></div>
         			<label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.note" /></fmt:bundle>:</label>
		         		<div class="col-sm-5 col-form-label" id="status">
		         			<span>
					 			<c:if test="${not empty viewList.get(0).getDptName()}">
	         					<a href="#" onclick="viewnote('','1','N')" style="text-align:center;width:10%; text-decoration: underline;">&nbsp;&nbsp;<b>View</b></a> </c:if>
						 	</span>
						 	
						 	<span>
	         					<a href="#" onclick="getpdf();" style="text-align:center;width:10%; ">&nbsp;&nbsp;<i class="fa fa-print fa-2x"></i></a> </c:if>
						 	</span>
					 	</div> 
		        </div>
		     </div>
	    </div> --%>
	    
	    
	    
	    <div class="form-group">
     		<div class="col-md-12">
         		<div class="row">
         		<div class="col-sm-2"></div>
         			<label class="col-sm-2 col-form-label " for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.note" /></fmt:bundle>:</label>
		         		<div class="col-sm-5 col-form-label" id="status">
		         			<div class="col-sm-5 viewNotes">
					 		<%-- 	<c:if test="${not empty viewList.get(0).getDptName()}"> --%>
	         					<a href="#" onclick="viewnote('','1','N')" >&nbsp;&nbsp;<b>View  Added Notes</b></a> <%-- </c:if> --%>
						 	</div>
						 	
						 	<div class="col-sm-5">
	         					<a href="#" onclick="getpdf();" style="text-align:center;width:10%; ">&nbsp;&nbsp;<i class="fa fa-print fa-2x"></i></a> <%-- </c:if> --%>
						 	</div>
					 	</div> 
		        </div>
		     </div>
	    </div>
		
		  
		  
		   <%--  <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					
				          <label class="col-sm-2 col-form-label required-field" for=""><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.addremarks" /></fmt:bundle>:</label>
						 <div class="col-sm-4" id="rmks">
						   <textarea  class="form-control remarks" id="XREMARKS" name="XREMARKS"   placeholder="Enter Remarks" >
						   ${viewList.get(0).getReceiverRemarks()} 
						   </textarea>
						  
                          <textarea class="form-control" rows="5" id="comment" maxlength="255"
                           style="height: 70px; overflow-y: scroll;">${viewList.get(0).getReceiverRemarks()}</textarea>
                     
				         </div>
				        
					</div>
		        </div>
		    </div>  --%>
		 
		    <div class="col-sm-12 text-center">
        	<div class="row">
	      		<div class="errmessage" id="errMsg"></div>
          	</div>
		    </div> 
					 <div class="form-group m-t-25 m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <button type="button" class="btn btn-view" id="btnSave" >Save</button>
					        <button type="button" class="btn btn-view" id="btnReset">Reset</button>
					        <button type="button" class="btn btn-view" id="btnBack">Back</button>
							 	
				           </div>
				       </div>
				    </div>
				    </div></div><!-- 2nd panal end -->
		    
				    
			<!-- 	    
		    </div>
	      </div>End panel-body
	       -->
	      
	      <input type="hidden" id="fileid" name="fileid" value="${viewList.get(0).getFile_creation_id()}"> 
	       <input type="hidden" id="fileDetId" name="fileDetId" value="${fileDetId}"> 
	       <input type="hidden" id="status" name="status" value="${viewList.get(0).getFilestatus()}">
	       <input type="hidden" name="emp_id" id="emp_id" value="<%=employee_id%>"> 
	       <input type="hidden" name="pageName" id="pageName" value="viewNote"> 
      
     
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
	 			<form class="form-horizontal" id="Q_A" method="post" autocomplete="off">
	 			<div id="xyz">
	 			<div id="abc">
	 			<div class="form-group" style="margin-bottom: 0px;">
						<div class="col-md-12">
							<div class="row">
								<label for="" class="col-sm-6 col-form-label "><b>Dispatch No.: </b><span id="no"></span></label> 
								<label for="" class="col-sm-6 col-form-label "><b>From Employee: </b><span id="emp"></span></label>
								<!--  <label for="" class="col-sm-4 col-form-label "><b>Department: </b><span id="dept"></span></label> -->
							</div>
						</div>
					</div>
	 			
	 			<div class="form-group" style="margin-bottom: 0px;">
						<div class="col-md-12">
							<div class="row">
								<label for="" class="col-sm-6 col-form-label "><b>Department: </b><span id="dept"></span></label>
								<label for="" class="col-sm-6 col-form-label "><b>Date & Time:</b><span id="date"></span></label>
							</div>
						</div>
					</div>
	 			
	 			
	  				<div class="panel panel-default" style="margin-bottom: 0px;">					
	 					<div class="panel-body">
	  						<span id="noteVal"></span>    
			    		</div>  <!-- panel body -->
 					</div>  <!-- panel default -->
 			</div>
 			</div>
 			
 					
 			<h5><b>Add Note(Receiver)</b></h5>
			<div class="form-group">
			<div class="col-md-12">
				<div class="row">
						<div class="col-sm-12">
							<textarea id="XDESCRIPTION" name="XDESCRIPTION" class="form-control" >${viewList.get(0).getNote()}</textarea>
							<script>
								CKEDITOR.env.isCompatible = true;
								CKEDITOR.replace( 'XDESCRIPTION' );
							</script> 
						</div>
					</div>
				</div>
			</div>
      
      <div class="col-sm-12 text-center">
	<div class="row">
	<div class="errmessage" id="errMsgnote"></div>
	</div>
    </div> 
      
 		<div class="form-group m-t-25 m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <button type="button" class="btn btn-view" onclick="notedata();" >Save</button>
					        <button type="button" class="btn btn-view" id="btnReset">Reset</button>
					        <button type="button" class="btn btn-view" id="btnBack">Back</button>
							 <input type="hidden" id="notedetail" name="notedetail" value="${fileDetId}">
				           </div>
				       </div>
				    </div>
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
 
       <iframe class="embed-responsive-item" name="" id="" width="100%;" height="460px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
     <script>
	function toggleIcon(e) { 
       	 $(e.target)
            .prev('.panel-heading')
            .find(".short-full")
            .toggleClass('glyphicon-plus glyphicon-minus');
    }
    $('.panel-group').on('hidden.bs.collapse', toggleIcon);
    $('.panel-group').on('shown.bs.collapse', toggleIcon);
</script>
    
  </body>
</html>
    