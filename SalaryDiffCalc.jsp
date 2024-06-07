<!DOCTYPE html>
<html lang="en">

<head>
<head>
  <meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />

	<script src="../resources/js/jquery-3.2.1.js"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		div {
			width: 350px;
			height: 80px;
			border: 3px solid black;
			padding: 20px;
			position: absolute;
			left: 36%;
		}
	</style>
</head>

<body>
	<center>
		<h1 style="color:green;padding:13px;">Hike Diffrence Calculator</h1>		
	</center>

	<div class="container" style="height: 140px; width: 333px;">
		<form name="inputnumber" autocomplete="off">
			<center>
			<b>Package :</b>
			<input type="text" id="amt" onkeypress="return onlyNumberKey(event);" placeholder="In Lacs Eg. (250000)" maxlength="10" size="20%" style="height: 15px; width: 150px;     font-weight: bold;" />
			<br>
			<br>
			<b>CTC :</b>
			<input type="text" id="ctc" readonly="readonly" onkeypress="return onlyNumberKey(event);" maxlength="10" size="20%" style="height: 15px; width: 127px; color: red;     font-weight: bold;" />
			<br>
			<br>
			<b>In-Hand :</b>
			<input type="text" id="in_hand" readonly="readonly" onkeypress="return onlyNumberKey(event);" maxlength="10" size="20%"  style="height: 15px; width: 150px; color: green;     font-weight: bold;"/>
				<br>
			<br>
				<input type="button" value="Check" onclick="return detailssubmit()">
				
			</center>
		</form>
	</div>
	<script>
	$(document).ready(function(){
		   $(document).bind("contextmenu",function(e){
		      return false;
		   });
		   
		   document.onkeydown = (e) => {
			    if (e.key == 123) {
			        e.preventDefault();
			    }
			    if (e.ctrlKey && e.shiftKey && e.key == 'I') {
			        e.preventDefault();
			    }
			    if (e.ctrlKey && e.shiftKey && e.key == 'C') {
			        e.preventDefault();
			    }
			    if (e.ctrlKey && e.shiftKey && e.key == 'J') {
			        e.preventDefault();
			    }
			    if (e.ctrlKey && e.key == 'U') {
			        e.preventDefault();
			    }
			    if (event.keyCode === 13) {
			    	detailssubmit();
		        }
			}
		   
		});
	
		function onlyNumberKey(evt) {
			// Only ASCII character in that range allowed
			var ASCIICode = (evt.which) ? evt.which : evt.keyCode;
			if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
				return false;
			return true;
		}
	</script>
	<script>
		function detailssubmit() {
			var amt = $("#amt").val();
			if(amt==""){
				alert("Please Enter The amount");
			}else{
				var ctc = parseInt(amt)/12;
				$("#ctc").val(ctc);
				var inHand = parseInt(ctc)-parseInt(3800);
				$("#in_hand").val(inHand);
			}
			
		}
	</script>
</body>


</html>
