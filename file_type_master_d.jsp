<%@include file="../myCks.jsp"%>
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
 	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/file-type-master.js"></script>
     <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
   
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/ablue.css" rel="stylesheet" type="text/css" />	
	
</head> 
 <style>

 </style>
<body onload="serachlist();">
	<div class="container-fluid">
		<div class="page-header" id="ftitleHeader">
			<div class="row">
				<div class="col-sm-12">
					<h4 class="hfont"><fmt:bundle basename="filemovement"><fmt:message key="file_type_master.header" /></fmt:bundle></h4>
				</div>
			</div>
		</div>

		<form class="form-horizontal" name="filetypeD" id="filetypeD" method="post" target='filetypeframe' autocomplete="off">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right">${ApplicationConstants.SEARCH}</h3>
				</div>
				<div class="panel-body">

					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label" for="fileType">
								<fmt:bundle basename="filemovement"><fmt:message key="file_type_master.filetype" /></fmt:bundle></label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="filetype" name="filetype" 
									maxlength="<fmt:bundle basename="filemovement"><fmt:message key="file_type_master.filetype_len" /></fmt:bundle>" 
									placeholder=" File Type" />
								</div>

								<%-- <label class="col-sm-2 col-form-label" for="sectionCode">
								<fmt:bundle basename="filemovement"><fmt:message key="file_type_master.remarks" /></fmt:bundle>
								</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="remarks" name="remarks" 
									maxlength="<fmt:bundle basename="filemovement"><fmt:message key="file_type_master.remarks_len" /></fmt:bundle>" 
									 placeholder=" Enter Remarks">
								</div> --%>
							</div>
						</div>
					</div>
									
					<div class="form-group m-t-25 m-b-5">
						<div class="col-md-12 text-center">
							<div class="row">
								<button type="button" class="btn btn-view" id="btnSearch">Search</button>
								<button type="button" class="btn btn-view" id="backNew" >Back</button>
								<button type="button" class="btn btn-view" id="btnReset">Reset</button> 
							</div>
						</div>
					</div>
				</div>
				<!-- End panel-body -->
			</div>
			<!-- End panel-default -->
		</form>

		<iframe class="embed-responsive-item" onload="resizeIframe(this)" name="filetypeframe"	id="filetypeframe" width="100%;" height="" src=""
			frameborder="0" scrolling="no" style="overflow-y: hidden !important;">
		</iframe>
	</div>
	<!-- End container-fluid -->
</body>
 <script type="text/javascript">
  function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame() = resizeIframe(iframe);
  }
  </script>
</html>