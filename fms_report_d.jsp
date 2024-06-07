<%@include file="../myCks.jsp"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />	
  	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
 	
 	<link rel="stylesheet" href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> 
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>   	
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>    
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/gen.js"></script>
   	<script type="text/javascript" src="../resources/js/filemovement/file_for_approval.js"></script>    
	<%
		response.setHeader("Cache-Control","no-store");  // HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache");        // HTTP 1.0
		response.setDateHeader("Expires", -1);        // Prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />		
    <script type="text/javascript" src="../resources/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
    
<style type="text/css">
 
 
 	table.tableGrid th {
      background-color: #ffcc33;
      border: 1px solid #439653 !important;
      color:#0c426f;
    }
    .m-b-20{
     margin-bottom:20px;
    }
    
    
  	@media screen and (min-width: 500px) {
        .modal-lg1 {
          width: 500px; /* New width for large modal */
        }
    }
    
    .modal-header1 .close1 {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
.close {
    opacity: 1 !important;
    color: red !important;
    padding-right: 10px;
}
  	</style>
    
</head>
<body>
<div class="container-fluid">
<div id="ftitleHeader" class="page-header"><h4 class="hfont">Employee Wise File Report</h4></div>
	<form class="form-horizontal" name="file_creation" id="file_creation" target="_Report" method="post" autocomplete="off" >
		<div class="panel panel-default">
   
	<c:choose>
		<c:when test="${fstatus=='E'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.EDIT}</h3></div></c:when>
		<c:when test="${fstatus=='N'}"><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.NEW}</h3></div></c:when>
		<c:otherwise><div class="panel-heading"><h3 class="panel-title text-right" id="frmstatus">${ApplicationConstants.SEARCH}</h3></div></c:otherwise>
	</c:choose>									

	 <c:if test="${(fstatus=='N') || (fstatus=='E')}">
		<c:set var="req"  value="required-field"/>
	 </c:if>

<div class="panel-body">
<div class="form-group">
	<div class="col-md-12">
		<div class="row">
			<label class="col-sm-2 col-form-label " for="fileID" >Report Type</label>
			<div class="col-sm-4">
				<select  class="form-control" id="reportType" name="reportType" >
					<option value="">Select Report Type</option>
					<!-- <option value="">Fastest File turnaround</option> -->
					<option value="pf">Pending Files</option>
					<!-- <option value="dc">Top DAK creators</option> -->
					<option value="fc">Top File Creators</option>				
				</select>	
			</div> 
			<div class="col-sm-4">
			</div>		        			             
		</div>
	</div>
</div>  	
<div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage" id="errMsg"></div>
	</div>
</div> 
	<div class="form-group m-t-25 m-b-5">
	<div class="col-md-12 text-center">
		<div class="row">
     	<button type="button" class="btn btn-view" id="btnReport" >Search</button>
   	    </div>
	</div>
</div>
</div><!-- End panel-body -->
</div>
</form>
<iframe class="embed-responsive-item" onload="resizeIframe(this)" name="_Report" id="_Report" width="100%;" scrolling="no" height="" src="" frameborder="0" scrolling="yes" style="overflow-y:hidden; "></iframe>
</div> <!-- End container-fluid -->
</body>
 <script type="text/javascript">
  function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame() = resizeIframe(iframe);
  }
  </script>
</html>