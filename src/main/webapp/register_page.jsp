<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

	<!-- CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
	<link href="css/mystyle.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
		.banner-background 
		{
			clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 100%, 76% 85%, 39% 95%, 0 85%, 0 0);
		}
		body
				{
					background: url("img/background-images.jpg");
					background-size: cover;
					background-attachment: fixed;
				}
	</style>

</head>
<body>

	<%@ include file="normal_navbar.jsp"%>
	
	<main class="primary-background banner-background" style="padding-bottom: 100px">
	 
	 <div class="container">
	 	
	 	<div class="col-md-6 offset-md-3">
	 		
	 		<div class="card card-background ">
	 			<div class="card-header text-center">
	 				<span class="fa fa-user fa-2x"></span>
	 				<br>
	 					Register here
					</div>
					
						<div class="card-body">
						
							<form id="reg-form" action="RegisterServlet" method="POST">

							<div class="form-group">
								<label for="user_name">User Name</label> 
								<input name="user_name"  type="text" class="form-control" id="user_name" placeholder="Enter User Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<label for="gender">Select Gender </label> 
								<input type="radio" id="gender" name="gender" value="Male"> Male 
								<input type="radio" id="gender" name="gender" value="female"> female
							</div>

							<div class="form-group">
								<textarea name="about" class="form-control" id="" rows="3"
									placeholder="Enter somthing about your self"></textarea>
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1"> 
								<label class="form-check-label" for="exampleCheck1">I agree to the Terms and Conditions</label>
							</div>
							
							<br>
							<div id="loader" class="container text-center" style="display: none;">
								<span class="fa fa-circle-o-notch fa-spin fa-3x"></span>
								<h4>Please wait...</h4>
							
							</div>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						
						</form>
						
						</div>
					
					</div>

				</div>
			</div>
	</main>
	
	
	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<script>
		$(document).ready(function(){
			console.log("loaded.......")
			
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
				
				
				let form = new FormData(this);
				
				$("#submit-btn").hide();
				$("#loader").show();
				//send register servlet:
					
					$.ajax({
						url: "RegisterServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR){
							console.log(data)
							
							$("#submit-btn").show();
							$("#loader").hide();
							
							
							if(data.trim()==='done')
								{
							
							swal("Registered Successfully", "We are going to redirect to login page.", "success")
							.then((value) => {
								  window.location= "login_page.jsp"
								});
								
								}else
									{
										swal('Oops...',data);
										
									}
							
							
						},
						error: function(jqXHR, textStatus, errorThown){
							
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Something went wrong..", "try again");
							
							$("#submit-btn").show();
							$("#loader").hide();
						},
						processData: false,
						contentType: false
					});
			});
			
		});
	
	</script>
	
	<script>
		/* $(document).ready(function() {

			alert("document loaded")
		}) */
	</script>


</body>
</html>