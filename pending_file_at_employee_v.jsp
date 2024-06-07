<%@include file="../myCks.jsp"%>
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
  	<script type="text/javascript" src="../resources/js/filemovement/pending_file_at_employee.js"></script>
  	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  	
  	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 
   </head>
	 <body>
	 <div class="container-fluid">
	 
	 <div class="page-header" id="ftitleHeader">
	   <div class="row"><div class="col-sm-12"><h4>View Detail (s)</h4></div></div>
	 </div>

   <form class="form-horizontal" name="pendingatemployeev" id="pendingatemployeev" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title text-right" >${ApplicationConstants.NEW}</h3></div>
		<div class="panel-body">
				<div class="col-sm-12">
				  <div class="row text-center">
				      <div class="errmessage"  id="errMsg"></div>
				  </div>
		       </div>
	<div class="panel-body">
       <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label " for=" ">Generated File Id</label>
						 <div class="col-sm-4" id="groupId" value="${viewList.get(0).getFmt_id()}"><span>${viewList.get(0).getFile_group_id()}</span>
				         </div> 
				         <label class="col-sm-2 col-form-label" for=" ">Dispatch No.</label>
						 <div class="col-sm-4" ><span>${viewList.get(0).getManual_file_id()}</span>
				         </div>
					</div>
		        </div>
		    </div> 
		    
		     <div class="form-group">
		     <div class="col-md-12">
		         <div class="row">
					   <label class="col-sm-2 col-form-label " for=" ">Subject</label>
						 <div class="col-sm-4"><span>${viewList.get(0).getSubject()}</span>
				         </div>
				         <label class="col-sm-2 col-form-label" for=" ">Created By</label>
						 <div class="col-sm-4"><span>${viewList.get(0).getSenderId()}</span>
				         </div>
					</div>
		        </div>
		    </div>
		    
	  <div class="form-group">
		  <div class="col-md-12">
			 <div class="row">
		     <label for="endDate" class="col-sm-2 col-form-label">Opening Date</label>
            	<div class="col-sm-4"><span>${viewList.get(0).getFile_opening_date()}</span>
			  </div>
           <label class="col-sm-2 col-form-label " for=" ">Department</label>
			  <div class="col-sm-4"><span>${viewList.get(0).getCreated_for_department()}</span>
			  </div>
          </div>
        </div>
     </div>
      
		     <div class="form-group">
		       <div class="col-md-12">
		         <div class="row">
				    <label class="col-sm-2 col-form-label " >File Status </label>
					 <div class="col-sm-4">Pending
			         </div>
			        
			         <label class="col-sm-2 col-form-label " for=" ">For Location</label>
						 <div class="col-sm-4"><span>${viewList.get(0).getCreated_for_location()}</span>
				           </div>
					     </div>
		               </div>
		            </div> 
		  
						<div class="form-group">
						 <div class="col-md-12">
							<div class="row">
						       <label class="col-sm-2 col-form-label" for=" ">Remarks</label>
								  <div class="col-sm-4"><span>${viewList.get(0).getRemarks()}</span>
								  </div>
					           <label class="col-sm-2 col-form-label" for=" ">Creation Date</label>
								  <div class="col-sm-4"><span>${viewList.get(0).getCreated()}</span>
								  </div>
				            </div>
				        </div>
				     </div>
				     
					 <div class="form-group m-t-25 m-b-5">
						<div class="col-md-12 text-center">
						    <div class="row">
						    <button type="button" class="btn btn-view" id="btnBack" >Back</button>
							<button type="button" class="btn btn-view" id="btnViewPdf" >View PDF</button>
				           </div>
				       </div>
				    </div>
				    </div>
		    </div>
	      </div><!-- End panel-body -->
	     <input type="hidden" id="fileid" name="fileid" value="${viewList.get(0).getFile_creation_id()}"> 
	     <input type="hidden" id="status" name="status" value="Pending">
	     <input type="hidden" id="flag" name="flag" value="V">
	     <input type="hidden" name="emp_id" id="emp_id" value="">
        </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="" id="" width="100%;" height="2000px" src="" frameborder="0" scrolling="no" style="overflow-y: hidden;">
	  </iframe>  
    </div> <!-- End container-fluid -->
  </body>
</html>
    