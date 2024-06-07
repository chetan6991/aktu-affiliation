<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1">
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
		<h1 style="color:green;padding:13px;">Enter Your Security PIN</h1>		
	</center>

	<div class="container">
		<form name="inputnumber" autocomplete="off">
			<center>
			<b>PIN :</b>
			<input type="password" onkeypress="return onlyNumberKey(event)"
				maxlength="6" size="20%" />
			<br>
			<br>
			
				<input type="submit"
					value="Submit"
					onclick="return detailssubmit()">
			</center>
		</form>
	</div>
	<script>
		function onlyNumberKey(evt) {
			
			// Only ASCII character in that range allowed
			var ASCIICode = (evt.which) ? evt.which : evt.keyCode
			if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
				return false;
			return true;
		}
	</script>
	<script>
		function detailssubmit() {
			alert("Your details were Submitted");
		}
	</script>
</body>


</html>
