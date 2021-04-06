<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!-- Html --> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page - Humber Insurance System</title>
    <link href="./Content/bootstrap.css" rel="stylesheet"/>

<link href="./Content/site.css" rel="stylesheet"/>

</head>
<body style="padding-top:60px; padding-bottom:60px">
<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Login</h1>
						 </div>
					</div>
                   <form action=" Index.jsp" method="get" name="login">
                           <div class="form-group">
                              <label for="firstname">User Name</label>
                              <input type="text" name="firstname"  class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="Enter UserName">
                           </div>
                           <div class="form-group">
                              <label for="password">Password</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                           <hr>
			<div class="form-group">
				<label for="role">Role </label> <select name="role" id="role">
					<div class="dropdown-menu">
						<option class="dropdown-item" value="admin">Admin</option>
						<option class="dropdown-item" value="user">User</option>
					</div>
				</select>
			</div>
			<hr>
                           <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                           </div>
                           <div class="col-md-12 text-center ">
                              <input type="submit" value="Login" class=" btn btn-block mybtn btn-primary tx-tfm"/>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                
                              </div>
                           </div>
                           <div class="form-group">
                              <p class="text-center">Don't have account? <a href="#" id="signup" onclick="includePage('RegisterUser.jsp')">Sign up here</a></p>
                           </div>
                        </form>
                 
				</div>
				 	
 	<script type="text/javascript">

function includePage(fileName)  
{

   $.ajax({
         type: "POST",
         url: fileName,                   
         cache: true,
         success: function(response) {
             $('#loginLink1').html(response);
          }
     });  
}



</script>
  <script type="text/javascript">
  
  function displayMenue()  
  {

	   document.getElementById("meneu1").style.color ="red";
  }
  
   </script>
  


 <script src="./Scripts/jquery-3.4.1.js"></script>

 <script src="./Scripts/bootstrap.js"></script>
<script src="./Scripts/AdminMenu.js"></script>
<script src="./Scripts/UserMenu.js"></script>
    
</body>
</html>
