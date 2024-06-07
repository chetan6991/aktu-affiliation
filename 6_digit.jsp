<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />
	<meta http-equiv="refresh" content="30">


	<link href="../resources/assets/sits/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!--Include the JS & CSS-->
	<link href="../resources/assets/plugins/richtexteditor/rte_theme_default.css" rel="stylesheet" type="text/css" />
	<link href="../resources/assets/plugins/richtexteditor/runtime/richtexteditor_content.css" rel="stylesheet" type="text/css" /> 	
	 
	<script type="text/javascript" src="../resources/assets/plugins/richtexteditor/rte.js"></script>
	<script type="text/javascript" src='../resources/assets/plugins/richtexteditor/plugins/all_plugins.js'></script>	
	
    <link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
  	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	
 <style>
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
</style>
<script>
	/* $(document).ready(function() {
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
	}); */
</script>
	
</head> 

<body>
 <div class="container-fluid" style="margin-top: 2%;">
 <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off">
    <div class="panel panel-default">
     <!-- <div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div> -->
			<div class="panel-body">
			
				  <div class="form-group">
					 <div class="row">
					   <div class="col-sm-12">
						<label class="col-sm-5 col-form-label required-field" for="" style="margin-top: 5px;">PIN</label>
						<div class="col-sm-6" style="padding:0px;">
							 <input type="password" name="pwd" id="pwd" maxlength="6" class="form-control validate" placeholder="Enter Password" required autocomplete="off"> 
							<span toggle="#pwd" class="fa fa-eye field-icon toggle-password"></span>
						</div>						 
					    </div>
					  </div>
					</div>
			 
			 <div class="form-group">
		<div class="col-md-12">
			<div class="row">
				 <label class="col-sm-2 col-form-label" for="">Note Description</label>
				 <div class="col-sm-4">
						
					<div id="div_editor1"></div>
				</div>
			</div>
		</div>
	</div>
			 
				 <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg"></div>
					</div>
				</div>

				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="">Submit</button>
				</div>
				
			</div>
		</div>
   </form>
   </div>
   </body>
   
	<script>
		var editor1 = new RichTextEditor("#div_editor1");
	</script>
   </html>
 --%>
 
 
<!DOCTYPE html>
<html>
  <head>
    <title>Title of the document</title>
    <style>
      .button {
        background-color: #1c87c9;
        -webkit-border-radius: 60px;
        border-radius: 60px;
        border: none;
        color: #eeeeee;
        cursor: pointer;
        display: inline-block;
        font-family: sans-serif;
        font-size: 20px;
        padding: 5px 15px;
        text-align: center;
        text-decoration: none;
      }
      @keyframes glowing {
        0% {
          background-color: #2ba805;
          box-shadow: 0 0 5px #2ba805;
        }
        50% {
          background-color: #49e819;
          box-shadow: 0 0 20px #49e819;
        }
        100% {
          background-color: #2ba805;
          box-shadow: 0 0 5px #2ba805;
        }
      }
      .button {
        animation: glowing 1300ms infinite;
      }
    </style>
  </head>
  <body>
    <h2>Create flashing/glowing button</h2>
    <a class="button" href="#">Click here!</a>
    <button type="submit" class="button">Click here!</button>
  </body>
</html>