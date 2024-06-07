<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<%@include file="../myCks.jsp"%>
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
  	<!-- <meta http-equiv="refresh" content="30"> -->

  	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.css"  type="text/css">
  	<link href="../resources/assets/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  
  	<script type="text/javascript" src="../resources/js/common.js"></script>
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
  	<script type="text/javascript" src="../resources/js/gen.js"></script>
  	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
  	<script type="text/javascript" src="../resources/js/filemovement/inbox_file_search.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		
		.blink {
  			animation: blink-animation 1s steps(5, start) infinite;
  		}
		
		@keyframes blink-animation {
			to {
				visibility: hidden;
			}
		}
		
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
	
	  div.dataTables_wrapper div.dataTables_paginate {
    margin: 1px 0 !important;font-size: 11px !important;
	  }
	  #searchingTable {
	      height: unset !important; 
	  }
	  div.dataTables_wrapper div.dataTables_paginate {
	    height: 26px !important;
	 }
	 table.dataTable.nowrap td {
	 white-space: unset;
	 }
	.fa-wpforms{font-size:24px;color: #bd6622;}
	.fa-leanpub{font-size:24px;color: #097011;}
	.fa-copy{font-size:24px;color:#ff0000;}
	.fa-refresh{font-size:24px;color:#ff6161;}
	
	.list-fa-wpforms{font-size:15px !important;color: #bd6622;}
	.list-fa-leanpub{font-size:15px !important;color: #097011;}
	.list-fa-copy{font-size:15px !important;color:#ff0000;}
	</style>
 <style type="text/css"> 
        .content { 
            position: absolute; 
            top: 50%; 
            left: 50%; 
            transform: translate(-50%, -50%); 
            width: 500px; 
            height: 200px; 
            text-align: center; 
            background-color: #e8eae6; 
            box-sizing: border-box; 
            padding: 10px; 
            z-index: 100; 
            display: none; 
            /*to hide popup initially*/ 
        } 
          
        .close-btn { 
            position: absolute; 
            right: 5px; 
            top: 4px; 
            background-color: red; 
            color: white; 
            border-radius: 38%; 
            padding: 4px;
            cursor:pointer; 
        } 
    </style>
	<script>
		$(document).ready(function(){
		    $("button").tooltip();
		});
		$(document).ready(function(){
		    $("a").tooltip();
		});
		/* setTimeout(function(){
			window.location.reload(1);
		}, 30000); */
   </script>
</head>

 <body>

   <form class="form-horizontal" name="advance_search_l" id="advance_search_l" method="post" autocomplete="off">
   <div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label for="sector" style="font-size: large; font-weight: bold; color: black;" class="col-sm-10 col-form-label">
					<i class="fa fa-wpforms"></i> Letter &nbsp;
					<i class="fa fa-leanpub"></i> File&nbsp;
					<i class="fa fa-copy"></i> Circular/Notice&nbsp;&nbsp;
					<i class="fa fa-refresh" id="btnReset" name="btnReset"></i> Refresh Page
				</label>
			</div>
  		</div>
  	</div>
	 <%-- <div id="searchingTable" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsg"></div>
          </div>
      </div>
      <!-- draft  -->
		<div class="page-header-1"  style="padding: 0px!important;margin: 0px 0px !important;">
	    <div class="col-sm-4 repTitle h5">List of Draft (s)</div>
	    <div class="col-sm-4 repTitle text-center"></div>	
	 </div>	
 <table id="searchTableD" class="table table-striped table-bordered table-hover display  " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>		
				<th style="text-align:center;width:5%;">S.No.</th>
				<!-- <th style="text-align:center;width:5%;">Select</th> -->
				<th style="text-align:center;width:10%;">Dispatch No.</th>
				<th style="text-align:center;width:20%;">Subject</th>
				<th style="text-align:center;width:8%;">Priority</th>
				<th style="text-align:center;width:20%;">Sent by (Name) (Designation)</th>
				<th style="text-align:center;width:8%;">Action required</th>				
				<th style="text-align:center;width:8%;">Send On (Date)</th>
				<th style="text-align:center;width:8%;">Pending days</th>		 		
		   </tr>
    </thead>	
		<tbody class="tbodynew">
			<c:forEach items="${searchListD}" var="searchList"> 
	        <c:set var="countD" value="${countD+1}"></c:set>
		      <tr 
		      	<c:choose>
		      		<c:when test="${searchList.getIsRead()=='N' && pendingRule.contains(searchList.getFromDate()) }"> style="background-color:#ff5e00ab;font-weight:bold"  </c:when>
					<c:when test="${searchList.getIsRead()=='N'}"> style="font-weight:bold;" </c:when>
					<c:when test="${pendingRule.contains(searchList.getFromDate())}"> style="background-color:#ff5e00ab;" </c:when>                  
				</c:choose>>
					
				<td style="text-align:center;width:5%;">${countD}</td>
				<td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox" 
						   id="checkD_${countD}" name="checkD_${countD}" value="" onclick="">
				</td>
			     <td style="text-align:center;width:10%;word-break: break-all;">${searchList.getManual_file_id()}</td>
			     <td style="text-align:center;width:20%; text-decoration: underline;">
					<a href="javascript:void(0);" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the Draft" class="red-tip" 
			     	onclick="
			     	view('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}','V','','${searchList.getIs_to_cc()}', '${searchList.getDesignaton()}', 'ID'); 			     	
			     	setSessionVar('${searchList.getFileDetailId()}');">
			     	<i aria-hidden="true"></i>${searchList.getSubject()}</a>
			     </td>
			     <td style="text-align:center;width:8%;">${searchList.getPriority()}</td>
			     <td style="text-align:center;width:20%;">${searchList.getFrom_employee()}</td>
			     <td style="text-align:center;width:8%;">${searchList.getStatus()}</td>
			     <td style="text-align:center;width:8%;">${searchList.getIn_date()}</td>
			     <td style="text-align:center;width:8%;">${searchList.getFromDate()}</td>
			     
	     	 <input type="hidden" id="D_fcId_${countD}" name="D_fcId_${countD}" value="${searchList.getFile_creation_id()}">
	     	 <input type="hidden" id="D_fdId_${countD}" name="D_fdId_${countD}" value="${searchList.getFileDetailId()}">
	     	 <input type="hidden" id="D_sId_${countD}" name="D_sId_${countD}" value="${searchList.getSenderId()}">
	     	 <input type="hidden" id="D_IsClose_${countD}" name="D_IsClose_${countD}" value="${searchList.getIsClose()}">
	     	 <input type="hidden" id="D_ccId_${countD}" name="D_ccId_${countD}" value="${searchList.getIs_to_cc()}">
	     	 </tr>  
	     	  </c:forEach>
       </tbody>
     </table>
     <input type="hidden" id="Dindex" name="Dindex" value="${countD}">
      <!-- draft -->
     </div> --%>
     
     <div id="searchingTable" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage2"  id="errMsg1"></div>
          </div>
      </div>
      
      
	 <div class="page-header-1"  style="padding: 0px!important;margin: 0px 0px !important;">
	    <div class="col-sm-4 repTitle h5">List of Unread File(s)</div>
	    <div class="col-sm-4 repTitle text-center"></div>	
	 </div>	
 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>		
				<th style="text-align:center;width:3%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<!-- <th style="text-align:center;width:5%;">Select</th> -->
				<th style="text-align:center;width:10%;">Manual <fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle></th>
				<th style="text-align:center;width:15%;">Subject</th>
				<th style="text-align:center;width:6%;">Priority</th>
				<th style="text-align:center;width:15%;">Sent by (Name) (Designation)</th>
				<!-- <th style="text-align:center;width:8%;">Action required</th> -->				
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.rptNo" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_dt" /></fmt:bundle></th> --%>
				<th style="text-align:center;width:8%;">Send On (Date)</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_pendinDay" /></fmt:bundle></th> --%>
				<!-- <th style="text-align:center;width:8%;">Expiry date</th> -->
				<th style="text-align:center;width:8%;">Pending days</th>
				<th style="text-align:center;width:8%;">File Status</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle></th> --%>
			    <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.lifeCycle" /></fmt:bundle></th> --%>
		        <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.view" /></fmt:bundle></th> --%>
		        <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.close" /></fmt:bundle></th> --%>
		 		<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.open" /></fmt:bundle></th> --%>
		 		<th style="text-align:center;width:8%;">Return File</th>
		   </tr>
    </thead>	
      <tbody class="tbodynew">
         	<c:forEach items="${searchList}" var="searchList"> 
	        <c:set var="countU" value="${countU+1}"></c:set>
	        <c:set var="count1" value="0"></c:set>
		      <tr <c:choose>
		      		<c:when test="${searchList.getIsRead()=='N' && pendingRule.contains(searchList.getFromDate()) }"> style="background-color:#ff5e00ab;font-weight:bold"  </c:when>
                    <c:when test="${searchList.getIsRead()=='N'}"> style="font-weight:bold;" </c:when>
                    <c:when test="${pendingRule.contains(searchList.getFromDate())}"> style="background-color:#ff5e00ab;" </c:when>                  
					</c:choose>>
					
				<td style="text-align:center;width:3%;">${countU}</td>
				
				<%-- <c:if test="${searchList.getIs_to_cc()=='N'}">
	     	 		<td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox" 
						   id="checkU_${countU}" name="checkU_${countU}" value="" onclick="">
				</td>
	     	 	</c:if>
	     	 	<c:if test="${searchList.getIs_to_cc()=='Y'}">
		     	 	<td style="text-align:center; width:5%;"></td>
			    </c:if> --%>
				
				
				
			     <td style="text-align:center;width:10%;word-break: break-all;">${searchList.getManual_file_id()}<br>
				     <i <c:choose>
			      		<c:when test="${searchList.getTitle()=='F'}"> class="fa fa-leanpub list-fa-leanpub" </c:when>
	                    <c:when test="${searchList.getTitle()=='L'}"> class="fa fa-wpforms list-fa-wpforms" </c:when>   
	                    <c:when test="${searchList.getTitle()=='C'}"> class="fa fa-copy list-fa-copy" </c:when>                 
					</c:choose>></i>
			     </td>
			     <td style="text-align:center;width:15%; text-decoration: underline;">
					<a href="javascript:void(0);" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the File" class="red-tip" 
			     	onclick="view('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}','V','','${searchList.getIs_to_cc()}', '${searchList.getDesignaton()}', 'I','R'); setSessionVar('${searchList.getFileDetailId()}');">
			     	<i aria-hidden="true"></i>${searchList.getSubject()}</a>
			     </td>
			     <%-- <td style="text-align:center;width:20%;">${searchList.getSubject()}</td> --%>
			     <td style="text-align:center;width:6%;">${searchList.getPriority()}</td>
			     <td style="text-align:center;width:15%;">${searchList.getFrom_employee()}</td>
			     <%-- <td style="text-align:center;width:8%;">${searchList.getStatus()}</td> --%>
			     <td style="text-align:center;width:8%;">${searchList.getIn_date()}</td>
			     <!-- <td style="text-align:center;width:8%;"></td> -->
			     <td style="text-align:center;width:8%;">${searchList.getFromDate()}</td>
			     
			     <c:if test="${searchList.getIsClose()=='Y'}">
			     	<td style="text-align:center;width:8%; color: red;">Closed</td>
			     </c:if>
				 <c:if test="${searchList.getIsClose()=='N'}">
			     	<td style="text-align:center;width:8%; color: green;">Open</td>
			     </c:if>

			      <%-- <td style="text-align:center;width:10%;">${searchList.getToDesignaton()}</td> --%>
			     <%-- <td style="text-align:center;width:20%;">${search	List.getSubject()}</td> --%>
			     <%-- <td style="text-align:center;width:10%;">${searchList.getSubject()}</td>
			     
			  
		         <td style="text-align:center;width:10%; text-decoration: underline;"><span>
		          <c:if test="${not empty searchList.getFileName()}"><a href="../downloadfile?filename=${searchList.getFileDetailId()}_${searchList.getFileName()}&folderName=${searchList.getFile_creation_id()}" ><i class="fa fa-download p-l-3"></i></a>
		         
		         </c:if></span></td>
		         <td style="text-align:center;width:10%;text-decoration: underline;">
		          <c:if test="${not empty searchList.getDptName()}"><a href="#" onclick="view('','${countU}','N')">View Note</a>
		          </c:if>  
		          
		           </td>
		            <input type="hidden" id="noteValid${countU}" name="noteValid${countU}"  value='${searchList.getDptName()}'> --%>
		         
		         <%--  <td style="text-align:center;width:10%; text-decoration: underline;"><a href="#" onclick="view('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}','L','')">View</a></td> --%>
		         
		         <%--  <td style="text-align:center;width:7%; text-decoration: underline;">
		          <a href="#" data-toggle="tooltip" data-placement="left"
			       title="" data-original-title="Click here to view the File"
			       class="red-tip" onclick="view('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}','V','','${searchList.getIs_to_cc()}','${searchList.getDesignaton()}')"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td>
		          --%>          		
               	<%-- <c:if test="${searchList.getIs_to_cc()=='N'}">
                
		         <td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="close" data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to close the File"style="padding: 0px 5px !important;"
	    	       class="red-tip"  onclick="func_close('C','${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}');"
		           <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='Y' && searchList.getIs_to_cc()=='N' }">  disabled = "disabled" </c:if>>Close File</button></td>
	     	 
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="open"  data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to Re-open the File"style="padding: 0px 5px !important;"
	    	       class="red-tip"  onclick="func_close('O','${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}');"
		           <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='N' && searchList.getIs_to_cc()=='N'}">  disabled = "disabled" </c:if>>Re Open File</button></td>
	     	 	</c:if>
	     	 	
	     	 	<c:if test="${searchList.getIs_to_cc()=='Y'}">
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="close" data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to close the File"style="padding: 0px 5px !important;"
	    	       class="red-tip" disabled="disabled" >Close File</button></td>
	     	 
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="open"  data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to Re-open the File"style="padding: 0px 5px !important;"
	    	       class="red-tip" disabled="disabled" >Re Open File</button></td>
	     	 	</c:if> --%>
	     	 
	     		<c:if test="${searchList.getIs_to_cc()=='N' && searchList.getIs_return_req()=='Y'}">
		     	 	
   	 	<td style="text-align: center; width: 8%;">
  			 <span><i class="fa fa-plus idiv1" onclick="returnFileToSender('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}', '${countU}');"  id="idiv1_${countU}" name="idiv1_${countU}" > <input type="hidden" class="abc" value="'${countU}'"/></i></span>
  			 <span><i class="fa fa-minus idiv2" onclick="jsp_script('${countU}','M');" style="display:none;" id="idiv2_${countU}" name="idiv2_${countU}">  <input type="hidden" class="abc"  value="${countU}"/></i></span>
		</td> 
		     	 	
		     	 	
		     	 	
		     	 	<%-- <td style="text-align:center; width:10%;">
				    	<a class="blink" onclick="returnFileToSender('${searchList.getFile_creation_id()}','${searchList.getFileDetailId()}', '${countU}');">
				    	<i title="Return File To Sender" class="fa fa-reply" aria-hidden="true"></i>
				    	</a>			     	
				    </td> --%>
			    </c:if>
			    <c:if test="${searchList.getIs_to_cc()=='Y' || (searchList.getIs_to_cc()=='N' && searchList.getIs_return_req()=='N')}">
		     	 	<td style="text-align:center; width:8%; color: green;"></td>
			    </c:if> 
	     	 <input type="hidden" id="U_fcId_${countU}" name="U_fcId_${countU}" value="${searchList.getFile_creation_id()}">
	     	 <input type="hidden" id="U_fdId_${countU}" name="U_fdId_${countU}" value="${searchList.getFileDetailId()}">
	     	 <input type="hidden" id="U_sId_${countU}" name="U_sId_${countU}" value="${searchList.getSenderId()}">
	     	 <input type="hidden" id="U_IsClose_${countU}" name="U_IsClose_${countU}" value="${searchList.getIsClose()}">
	     	 <input type="hidden" id="U_ccId_${countU}" name="U_ccId_${countU}" value="${searchList.getIs_to_cc()}">
	     	 </tr> 
	     	 <c:set var="count1" value="${countU}"></c:set> 
   	 <tr>
   	 <td id="hide-area_${countU}" style="display: none;">
   	 	 <%-- <td id="hide-area_${countU}" style="display:none;background:;"> --%>
<!--        <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off">
 -->       		
       			 <div class="modal-body" style="height: 140px">	
	<div class="form-group">
		<div class="row"> 
            <div class="col-md-12">
           	<label class="col-sm-2 col-form-label required-field" for="type">File Return Request</label>
            <div class="col-sm-4" >
            	<select class="form-control" id="type${countU}" name="type${countU}">
            		<option value="">Select Type</option>
            		<option value="A">Approve</option>
            		<option value="R">Reject</option>
            	</select>
			</div>
	    	<label class="col-sm-2 col-form-label required-field" for="remarks">Remarks</label>
			<div class="col-sm-4" >
   				<textarea class="form-control" id="pop_up_remarks${countU}" name="pop_up_remarks${countU}" placeholder="Enter Remarks" style="height: 75px; width: 333px;"></textarea>  
   			</div>
			</div>
		 </div>
	</div>
	<div class="col-sm-12">
         <div class="row text-center">
            <div class="errmessage2"  id="errMsgsend${countU}"></div>
         </div>
    </div>
      		<div class="modal-footer" style="text-align: center;">
				<button type="button" class="btn btn-view" id="btnSendrem" onclick="sendReturnFile();" >Send</button>
				<button type="button" class="btn btn-danger" onclick="jsp_script('${countU}','M');">Close</button>
				<input type="hidden" id="s_fid" value="">
				<input type="hidden" id="s_did" value="">
				<input type="hidden" id="s_trn" value="">
			</div>
			</div>
       		
	   <div class="form-group text-center ">
			<div class="row">
	<!-- BUTTONS -->
			</div>
	   </div>
<!-- 	   </form>
 -->       </td>
   	 </tr>
	     	  </c:forEach>
       </tbody>
     </table>
     <input type="hidden" id="Uindex" name="Uindex" value="${countU}">
  </div>
  <!-- searching table end div -->
  
  	<div class="col-sm-12">
		<div class="row text-center">
       		<div class="errmessage2"  id="errMsgU"></div>
        </div>
	</div>
	<%-- <c:if test="${countU > 0 || countU ne null}">
	<div class="form-group m-t-25 m-b-5">
		<div class="col-md-12 text-center">
			<div class="row">
		     	<button type="button" class="btn btn-view" id="btnCloseU" onclick="func_close('C','U');" >Close File</button>
		        <button type="button" class="btn btn-view" id="btnOpenU" onclick="func_close('O','U');" >Re Open File</button>
		        <button type="button" class="btn btn-view" id="btnArchU" onclick="func_close('MA','U');" >Move to Safe Custody</button>				
		   	</div>
    	</div>
	</div>
  </c:if> --%>
<div id="searchingTable" class="scr0 botom">
       <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage2"  id="errMsg1"></div>
          </div>
      </div>
	 <div class="page-header-1" style="padding: 0px!important;margin: 0px 0px !important;">
	    <div class="col-sm-4 repTitle h5" style="margin: 0px; padding: 0px;">List of Read File(s)</div>
	    <div class="col-sm-4 repTitle text-center"></div>	
	 </div>
 <table id="searchTable1" class="table table-striped table-bordered table-hover display nowrap " cellspacing="0" width="100%">
     <thead class="theadnew">
			<tr>		
				<th style="text-align:center;width:3%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.sno" /></fmt:bundle></th>
				<th style="text-align:center;width:5%;">Select</th>
				<th style="text-align:center;width:8%;">Manual <fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.fileNo" /></fmt:bundle></th>
				<th style="text-align:center;width:15%;">Subject</th>
				<th style="text-align:center;width:6%;">Priority</th>
				<th style="text-align:center;width:15%;">Sent by (Name) (Designation)</th>
				<!-- <th style="text-align:center;width:8%;">Action required</th> -->				
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.rptNo" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_dt" /></fmt:bundle></th> --%>
				<th style="text-align:center;width:8%;">Send On (Date)</th>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.inwrd_pendinDay" /></fmt:bundle></th> --%>
				<!-- <th style="text-align:center;width:8%;">Expiry date</th> -->
				<th style="text-align:center;width:8%;">Pending days</th>
				<th style="text-align:center;width:8%;">File Status</th>
				<th style="text-align:center;width:8%;">Remarks</th>
				<!-- <th style="text-align:center;width:8%;">Return File</th> -->
				
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.designation" /></fmt:bundle></th> --%>
			    <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.subject" /></fmt:bundle></th> --%>
				<%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.lifeCycle" /></fmt:bundle></th> --%>
		        <%-- <th class="text-center"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.view" /></fmt:bundle></th> --%>
		        <%-- <th style="text-align:center;width:7%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.close" /></fmt:bundle></th> --%>
		 		<%-- <th style="text-align:center;width:7%;"><fmt:bundle basename="filemovement"><fmt:message key="file_inward_movement.open" /></fmt:bundle></th> --%>
		 
		   </tr>
    </thead>	
      <tbody class="tbodynew">
         	<c:forEach items="${searchListR}" var="searchListR"> 
	        <c:set var="countR" value="${countR+1}"></c:set>
	      		<tr<c:choose>
      				<c:when test="${searchListR.getIsRead()=='N' && pendingRule.contains(searchListR.getFromDate()) }"> style="background-color:#ff5e00ab;font-weight:bold"  </c:when>
                    <c:when test="${searchListR.getIsRead()=='N'}"> style="font-weight:bold;" </c:when>
                    <c:when test="${pendingRule.contains(searchListR.getFromDate())}"> style="background-color:#ff5e00ab;" </c:when>                  
				</c:choose>>
					
				<td style="text-align:center;width:3%;">${countR}</td>
				
				<c:if test="${searchListR.getIs_to_cc()=='N'}">
	     	 		<td style="text-align:center; width:5%;">
					<input type="checkbox" style="min-height:unset !important; display:inline-block !important;" class="checkbox" 
						   id="checkR_${countR}" name="checkR_${countR}" value="" onclick="">
				</td> 
	     	 	</c:if>
	     	 	<c:if test="${searchListR.getIs_to_cc()=='Y'}">
		     	 	<td style="text-align:center; width:5%;"></td>
			    </c:if>
				
				
			     
				<td style="text-align:center;width:8%;word-break: break-all;"><span id="manFile${countR}">${searchListR.getManual_file_id()}
			   	<i <c:choose>
			      		<c:when test="${searchListR.getTitle()=='F'}"> class="fa fa-leanpub list-fa-leanpub"</c:when>
	                    <c:when test="${searchListR.getTitle()=='L'}"> class="fa fa-wpforms list-fa-wpforms"</c:when>
	                    <c:when test="${searchListR.getTitle()=='C'}"> class="fa fa-copy list-fa-copy"</c:when>                 
					</c:choose>></i></span>
			    </td>
			     <td style="text-align:center;width:15%; text-decoration: underline;"> 
			     	<a href="javascript:void(0);" data-toggle="tooltip" data-placement="left" title="" data-original-title="Click here to view the File" class="red-tip" 
			     	onclick="view('${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}','V','','${searchListR.getIs_to_cc()}', '${searchListR.getDesignaton()}', 'I',''); setSessionVar('${searchListR.getFileDetailId()}');">
			     	<i aria-hidden="true"></i><span id="subFile${countR}">${searchListR.getSubject()}</span></a></td>
			     <%-- <td style="text-align:center;width:20%;">${searchListR.getSubject()}</td> --%>
			     <td style="text-align:center;width:6%;">${searchListR.getPriority()}</td>
			     <td style="text-align:center;width:15%;">${searchListR.getFrom_employee()}</td>
			     <%-- <td style="text-align:center;width:8%;">${searchListR.getStatus()}</td> --%>
			     <td style="text-align:center;width:8%;">${searchListR.getIn_date()}</td>
			     <!-- <td style="text-align:center;width:8%;"></td> -->
			     <td style="text-align:center;width:8%;">${searchListR.getFromDate()}</td>
			     
			     
				<c:if test="${searchListR.getIsClose()=='Y'}">
			     	<td style="text-align:center;width:8%; color: red;">Closed</td>
			     </c:if>
				 <c:if test="${searchListR.getIsClose()=='N'}">
			     	<td style="text-align:center;width:8%; color: green;">Open</td>
			     </c:if>

			     <%-- <td style="text-align:center;width:10%;">${searchListR.getReceiptNo()}</td> --%>
			     
			     
			     <%-- <td style="text-align:center;width:10%;">${searchListR.getStatus()}</td> --%>
			      <%-- <td style="text-align:center;width:10%;">${searchListR.getToDesignaton()}</td> --%>
			     <%-- <td style="text-align:center;width:20%;">${searchListR.getSubject()}</td> --%>
			     <%-- <td style="text-align:center;width:10%;">${searchListR.getSubject()}</td>
			     
			  
		         <td style="text-align:center;width:10%; text-decoration: underline;"><span>
		          <c:if test="${not empty searchListR.getFileName()}"><a href="../downloadfile?filename=${searchListR.getFileDetailId()}_${searchListR.getFileName()}&folderName=${searchListR.getFile_creation_id()}" ><i class="fa fa-download p-l-3"></i></a>
		         
		         </c:if></span></td>
		         <td style="text-align:center;width:10%;text-decoration: underline;">
		          <c:if test="${not empty searchListR.getDptName()}"><a href="#" onclick="view('','${countR}','N')">View Note</a>
		          </c:if>  
		           </td>
		            <input type="hidden" id="noteValid${countR}" name="noteValid${countR}"  value='${searchListR.getDptName()}'> --%>
		         <%--  <td style="text-align:center;width:10%; text-decoration: underline;"><a href="#" onclick="view('${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}','L','')">View</a></td> --%>
		          <%-- <td style="text-align:center;width:7%; text-decoration: underline;">
		          <a href="#" data-toggle="tooltip" data-placement="left"
			       title="" data-original-title="Click here to view the File"
			       class="red-tip" onclick="view('${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}','V','','${searchListR.getIs_to_cc()}','${searchListR.getDesignaton()}')"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a></td>
		           --%>         		
               	<%-- <c:if test="${searchListR.getIs_to_cc()=='N'}">
                
		         <td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="close" data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to close the File"style="padding: 0px 5px !important;"
	    	       class="red-tip"  onclick="func_close('C','${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}');"
		           <c:if test="${searchListR.getSenderId()=='Y' || searchListR.getIsClose()=='Y' && searchListR.getIs_to_cc()=='N' }">  disabled = "disabled" </c:if>>Close File</button></td>
	     	 
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="open"  data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to Re-open the File"style="padding: 0px 5px !important;"
	    	       class="red-tip"  onclick="func_close('O','${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}');"
		           <c:if test="${searchListR.getSenderId()=='Y' || searchListR.getIsClose()=='N' && searchListR.getIs_to_cc()=='N'}">  disabled = "disabled" </c:if>>Re Open File</button></td>
	     	 	</c:if>
	     	 	<c:if test="${searchListR.getIs_to_cc()=='Y'}">
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="close" data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to close the File"style="padding: 0px 5px !important;"
	    	       class="red-tip" disabled="disabled" >Close File</button></td>
	     	 
	     	 	<td style="text-align:center;width:7%;"><button type="button" class="btn btn-danger" id="open"  data-toggle="tooltip" data-placement="left"
	    	       title="" data-original-title="Click here to Re-open the File"style="padding: 0px 5px !important;"
	    	       class="red-tip" disabled="disabled" >Re Open File</button></td>
	     	 	</c:if> --%>	     	 
	     	 
	     	 	<%-- <c:if test="${searchListR.getIs_to_cc()=='N'}">
	     	 		<td style="text-align:center; width:10%; color: green;" >
			     		<a onclick="returnFileToSender('${searchListR.getFile_creation_id()}','${searchListR.getFileDetailId()}');"><i class="fa fa-reply-all" aria-hidden="true"></i></a>			     	
			     	</td>
	     	 	</c:if>
	     	 	<c:if test="${searchListR.getIs_to_cc()=='Y'}">
		     	 	<td style="text-align:center; width:10%; color: green;" ></td>
			    </c:if> --%>
			    <td style="text-align:center;width:8%;">
			    
			    <c:if test="${searchListR.getIsClose()=='Y'}">
			       <a onclick="togglePopup('${countR}');" style="cursor:pointer;">View Remarks</a>
			       <input type="hidden" id="close_remarks${countR}" value="${searchListR.getClose_remarks()}">
			     </c:if>
				 <c:if test="${searchListR.getIsClose()=='N'}">
				   <a onclick="togglePopup('${countR}');" style="cursor:pointer;">Add Remarks</a>
			       <input type="hidden" id="close_remarks${countR}" value="">
			     </c:if>
			    </td>
	     	 <input type="hidden" id="R_fcId_${countR}" name="R_fcId_${countR}" value="${searchListR.getFile_creation_id()}">
	     	 <input type="hidden" id="R_fdId_${countR}" name="R_fdId_${countR}" value="${searchListR.getFileDetailId()}">
	     	 <input type="hidden" id="R_sId_${countR}" name="R_sId_${countR}" value="${searchListR.getSenderId()}">
	     	 <input type="hidden" id="R_IsClose_${countR}" name="R_IsClose_${countR}" value="${searchListR.getIsClose()}">
	     	 <input type="hidden" id="R_ccId_${countR}" name="R_ccId_${countR}" value="${searchListR.getIs_to_cc()}">
	     	  </tr>  
	     	  
	     	   </c:forEach>	 
	     	    <input type= "hidden" id="count" name="count" value="${count1}" >    	   
       </tbody>
     </table>
     <input type="hidden" id="Rindex" name="Rindex" value="${countR}">
  </div><!-- searching table end div -->
  
	<div class="col-sm-12">
		<div class="row text-center">
       		<div class="errmessage2"  id="errMsgR"></div>
        </div>
	</div>
	
	<div class="content"> 
        <div onclick="togglePopup('N');" class="close-btn">×</div>
        <span ><b>Manual File No (Subject) :</b> &nbsp;&nbsp;&nbsp;</span><span id="filn"></span> 
        <div id="remarksClose"></div>
    </div> 
  
  <c:if test="${countR > 0 || countR ne null}">
  
  
  <div class="form-group">
		<div class="col-md-12 text-center m-b-15" style="margin-bottom:15px;">
			<div class="row">
				<%-- <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='Y' && searchList.getIs_to_cc()=='N' }">  disabled = "disabled" </c:if> --%>
		     	<button type="button" class="btn btn-view" id="btnCloseR" onclick="func_close('C', 'R');" >Close File</button>				
				<%-- <c:if test="${searchList.getSenderId()=='Y' || searchList.getIsClose()=='N' && searchList.getIs_to_cc()=='N'}">  disabled = "disabled"</c:if> --%> 
		        <button type="button" class="btn btn-view" id="btnOpenR" onclick="func_close('O', 'R');">Re Open File</button>	
		        <button type="button" class="btn btn-view" id="btnArchR" onclick="func_close('MA','R');" >Move to Safe Custody</button>	
		        <!-- <button type="button" class="btn btn-view" id="btnAllFileDown" onclick="filesFolderDownload();" >Backup Download</button> -->
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
   <input type="hidden" name=hrmsApi id="hrmsApi" value="<fmt:bundle basename="filemovement"><fmt:message key="hrms-api.url" /></fmt:bundle>">

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
		// "lengthMenu": [[10, 25, 50, 100, 250, 500, '-1'], [10, 25, 50, 100, 250, 500, 'All']],
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
		
		var t = $('#searchTable1').DataTable(
				{
		   			"scrollY": "600px",
		            
		            "paging": false,
		            "bInfo" : false,    	    	 
		            "ordering": false,

				"searching" : false,
				"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
				// "lengthMenu": [[10, 25, 50, 100, 250, 500, '-1'], [10, 25, 50, 100, 250, 500, 'All']],
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
		
		var t = $('#searchTableD').DataTable(
				{
				"searching" : false,
				"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
				"scrollY": "600px",
				"scrollX": true,
				 "paging": false,
		            "bInfo" : false,    	    	 
		            "ordering": false,

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
        
	  <!-- <div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: 50px;">
		<div class="modal-dialog modal-lg" style="width:40% !important;float: right; margin-right: 10%;">
			<div class="modal-content">
				<div class="modal-header text-center">
					<span id="ReloadAfterCheck" class="close" data-dismiss="modal" aria-label="Close close-cross" aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title">Enter Remarks and Return The File</h4>
				</div>
		 <div class="modal-body" style="height: 160px">	
			<div class="form-group">
			<div class="row"> 
            <div class="col-md-12">
	    		<label class="col-sm-2 col-form-label" for="remarks">Remarks</label>
			<div class="col-sm-4">
    			<textarea class="form-control" id="pop_up_remarks" name="pop_up_remarks" placeholder="Enter Remarks" style="height: 80px; width: 295px;"></textarea>  
     		</div>
			</div>
		 	</div>
		 	</div>
	        
	        
	   <div class="col-sm-12">
          <div class="row text-center">
            <div class="errmessage"  id="errMsgsend"></div>
          </div>
      </div>
	        
      		<div class="modal-footer" style="text-align: center;">
				<button type="button" class="btn btn-view" id="btnSendrem" >Send</button>
				<button type="button" class="btn btn-danger"  data-dismiss="modal">Close</button>
				<input type="hidden" id="s_fid" value="">
				<input type="hidden" id="s_did" value="">
				<input type="hidden" id="s_trn" value="">
			</div>
			</div>
		</div>
	</div>
	</div> -->
	  
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
    