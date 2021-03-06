
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
	User user = (User)session.getAttribute("currentUser");
	if(user==null)
		{
			response.sendRedirect("login_page.jsp");	
		}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JSP Page</title>
		
		
		<!-- CSS -->
		<link rel="stylesheet"
			  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			  crossorigin="anonymous">
	
		<link href="css/mystyle.css" rel="stylesheet" type="text/css">
	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
		
		<!-- starting of navbar -->
				
		<nav class="navbar navbar-expand-lg navbar-dark secondary-background">
	
			<a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
	
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">
						<span class="fa fa-drivers-license"></span> LearnCode
						<span class="sr-only">(current)</span></a>
					</li>
			
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="fa fa-shopping-bag"></span> Categories </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Programming Language</a> 
								<a class="dropdown-item" href="#">Project Implementation</a>
							<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Data Structure</a>
						</div>
					</li>
			
				<li class="nav-item">
					<a class="nav-link" href="#"><span class="fa fa-mobile-phone"></span> Contect</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-fighter-jet"></span> Do Post</a>
				</li>
				
				
				</ul>
		
				<ul class="navbar-nav mr-right">
					<li class="nav-item">
						<a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle-o"></span> <%= user.getName() %></a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-white" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
					</li>
				</ul>
			
			</div>
		</nav>
			
		<!-- end of navbar -->	
		
		<!-- msg -->

		<%
			Message m = (Message) session.getAttribute("msg");
			if (m != null) {
		%>
			<div class="alert <%=m.getCssClass()%>" role="alert">

		<%=m.getContect()%>

			</div>
		<%
			session.removeAttribute("msg");
			}
		%>


	<!-- end of msg -->
	
	
	<!-- main body of the page -->

	<main>
		<div class="container">
			<div class="row mt-4">
				<!-- first col -->
				<div class="col-md-4">
					<!-- categories -->
					<div class="list-group">
						<a href="#" onclick="getPost(0, this)" class=" c-link list-group-item list-group-item-action active">All Posts</a>
						<!-- cate -->
						<%
						PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.getAllCategories();
						for (Category cc : list1) {
						%>
						<a href="#" onclick="getPost(<%= cc.getCid() %>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
						<%
						}
						%>
					</div>

				</div>
				<!-- Seconf col -->
				<div class="col-md-8">
					<!-- posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid" id="post-container">
					
					</div>

				</div>
			</div>
		</div>
	</main>

<!-- End main body of the page -->
	
	
		
		<!-- Profile Model -->
		
		
		<!-- Button trigger modal -->
					<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
 						 Launch demo modal
					</button> -->

		<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%= user.getProfile() %>" class="img-fluid"
							style="border-radius: 50%; max-width: 100px">
						<h5 class="model-title" id="exampleModalLabel"><%= user.getName() %></h5>


						<!-- details -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>

									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>

								</tbody>
							</table>
						</div>

						<!-- Profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td> <input type="email" class="form-control" name="user_email" value=<%= user.getEmail() %>> </td>
									</tr>
									
									<tr>
										<td>Name :</td>
										<td> <input type="text" class="form-control" name="user_name" value=<%= user.getName()%>> </td>
									</tr>
									
									<tr>
										<td>Password :</td>
										<td> <input type="password" class="form-control" name="user_password" value=<%= user.getPassword() %>> </td>
									</tr>
									
									<tr>
										<td>Gender :</td>
										<td> <%= user.getGender().toUpperCase() %> </td>
									</tr>
									<tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
									<tr>
										<td>New Profile:</td>
										<td>
											<input type="file" name="image" class="form-control">
										</td>
									</tr>
									
								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

							<!-- Profile edit End -->


						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End of Profile Model -->
	
	
	
	
	

	<!-- add Post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for(Category c: list)
								{
								%>
								<option value="<%= c.getCid()%>"><%= c.getName()%></option>
								
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 150px" placeholder="Enter your content"></textarea>
						</div>

						<div class="form-group">
							<textarea name="pcode" class="form-control" style="height: 150px"
								placeholder="Enter your program (if any)"></textarea>
						</div>

						<div class="form-group">
							<label>Select your file:</label> 
							<br> 
							<input name="pic" type="file" />
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
							<button type="button" class="btn btn-outline-primary" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">Close</span>
							</button>
						</div>
						<!-- <div id="error_message" class="ajax_response" style="float:left"></div>
						<div id="success_message" class="ajax_response" style="float:left"></div> -->
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- End of post modal -->
	
	
	
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
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

		<script src="js/myjs.js" type="text/javascript"></script>
		
		
		

		<script>
		
			$(document).ready(function() {
				
				let editStatus = false;
				
				$('#edit-profile-button').click(function(){
					
					//toggel
					if(editStatus == false)
					{
// 						alert("button-clicked")
						$("#profile-details").hide()
						
						$("#profile-edit").show();
						editStatus = true;
						$(this).text("Back")
					}else
					{
						$("#profile-details").show()
						
						$("#profile-edit").hide();
						editStatus = false;
						$(this).text("EDIT")
					}

				})

			})
		</script>
		
		 <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim()==='done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <!--loading post using ajax-->
	
	<!-- <script>
		$(document).ready(function(e) {
			$("#add-post-form").submit(function(e) {
				e.preventDefault();

				if (name == "" || comment == "") {
					$("#error_message").show().html("All Fields are Required");
				} else {
					$("#error_message").html("").hide();
					//now requesting to server
					$.ajax({
						url : "AddPostServlet",
						type : 'POST',
						data : form,
						success : function(data, textStatus, jqXHR) {
							//success ..
							console.log(data);
							$('#success_message').fadeIn().html(data);
							setTimeout(function() {
								$('#success_message').fadeOut("slow");
							}, 5000);

						},
						error : function(jqXHR, textStatus, errorThrown) {
							//error..

						},
						processData : false,
						contentType : false
					})
				}
			})
		})
	</script> -->
	
	<!-- loading post using ajax -->
	<script>
		function getPost(catId, temp) {
			$("#loader").show();
			$("#post-container").hide()
			
			$(".c-link").removeClass('active')
			
			$.ajax({
				url : "load_posts.jsp",
				data : {cid:catId},
				success : function(data, textStatus, jqXHR) {
					//console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$('#post-container').html(data)
					$(temp).addClass('active')
				}
			})
		}

		$(document).ready(function(e) {
			
			let allPostRef = $('.c-link')[0]
			getPost(0, allPostRef)

		})
	</script>

</body>
</html>