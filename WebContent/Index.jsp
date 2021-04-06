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
<link href="./Content/bootstrap.css" rel="stylesheet" />
<link href="./Content/site.css" rel="stylesheet" />
</head>
<body style="padding-top: 60px; padding-bottom: 60px">
	<div class=" header1 navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="Index.jsp"> Humber Insurance</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- This Menue for Customers operations -->
					<li class="dropdown" data-user-menu><a href="#"> Customers
							<span class="glyphicon glyphicon-circle-arrow-down"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="#"
								onclick="includePage('ManagRegisteredProducts.jsp')">&nbsp;&nbsp;
									Register Products</a></li>
							<li class="divider"></li>
							<li><a href="#"
								onclick="includePage('ManagCustomerClaims.jsp')">&nbsp;&nbsp;
									Claims Management&Status</a></li>
							<li class="divider"></li>

							<li><a href="#">&nbsp;&nbsp; LogOut</a></li>
							<li class="divider"></li>
						</ul></li>
					<!-- This Menue for Admin operations -->
					<c:choose>
						<c:when test="${param.firstname != 'admin'}">
							<li class="dropdown" style="visibility: hidden;" data-admin-menu>
								<a href="#"> Admin <span
									class="glyphicon glyphicon-circle-arrow-down"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li class="divider"></li>
									<li><a href="#">&nbsp;&nbsp; Customers List</a></li>
									<li class="divider"></li>
									<li><a href="#">&nbsp;&nbsp; Registered Products List</a></li>
									<li class="divider"></li>
									<li><a href="#"
										onclick="includePage('ManagAdminClaims.jsp')">&nbsp;&nbsp;
											Claim Management</a></li>
									<li class="divider"></li>
									<li><a href="#"
										onclick="includePage('ManagAvailableProducts.jsp')">&nbsp;&nbsp;
											Available Products List</a></li>
									<li class="divider"></li>
								</ul>
							</li>
				</ul>
				</c:when>
				<c:when test="${param.firstname == 'admin'}">
					<li class="dropdown" style="visibility: true;" data-admin-menu>
						<a href="#"> Admin <span
							class="glyphicon glyphicon-circle-arrow-down"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="#" onclick="includePage('ManageUsers.jsp')">&nbsp;&nbsp;
									Manage Customers </a></li>
							<li class="divider"></li>


							<li><a href="#">&nbsp;&nbsp; Registered Products List</a></li>
							<li class="divider"></li>
							<li><a href="#"
								onclick="includePage('ManagAdminClaims.jsp')">&nbsp;&nbsp;
									Claim Management</a></li>
							<li class="divider"></li>
							<li><a href="#"
								onclick="includePage('ManagAvailableProducts.jsp')">&nbsp;&nbsp;
									Available Products List</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					</ul>
				</c:when>
				</c:choose>
				<!-- Current User To disply in login -->
				<% String currentUser="LogIn";%>
				<% currentUser="Hello "+(String)session.getAttribute("user2");%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" id="registerLink"
						onclick="includePage('RegisterUser.jsp')">Register</a></li>
					<li><a href="#" id="loginLink"
						onclick="includePage('Login.jsp')"><%=currentUser %></a></li>
					<% currentUser="Hello "+(String)session.getAttribute("user2");%>

				</ul>

			</div>
		</div>
	</div>
	<div class="container body-content">
		<h1 class="text-center">Humber Insurance System</h1>
		<!-- Start Form -->
		<form action="/" method="get">
			<br />
			<div class="row">
				<div class="pull-right" style="padding-right: 15px;">
					<button type="submit" value="Search" class="btn btn-sm btn-primary">
						<span class="glyphicon glyphicon-search"></span>Search
					</button>
				</div>
				<div class="pull-right">
					<input class="form-control input-sm text-box single-line"
						id="search" name="search" type="text" value="" />
				</div>
			</div>
			<br />
		</form>
		<div class="row">
			<!-- This Div To include  Many Parts -->
			<div id="loginLink1"></div>
		</div>
	</div>
	<!-- 	Connection String -->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />
	<!-- 	Start Query and validation -->
	<c:if test="${not empty param.firstname}">
		<sql:query dataSource="${dbsource}" var="result">
 SELECT * FROM webappadnansazia.users where username=?;
     <sql:param value="${param.firstname}" />
		</sql:query>

		<c:set var="username" value="${param.firstname}" />
	</c:if>

	<% String adminUser=request.getParameter("firstname"); %>
	<!-- fetch the data and send Attribute and identify user login-->
	<c:forEach var="row" items="${result.rows}">
		<c:choose>
			<c:when test="${row.username == username}">
				<% String user1=request.getParameter("firstname"); %>
				<% String user2="${row.username}"; %>
				<% session.setAttribute("user2",user1); %>
			</c:when>
		</c:choose>
	</c:forEach>
	<!--  send Attribute and identify Admin login-->
	<c:if test="${param.firstname == 'admin'}">
		<% session.setAttribute("user2","admin"); %>
	</c:if>

	<!-- Script Section to handle scripts -->
	<script type="text/javascript">
/* This function used as include, to include pages inside Index as single page 
 */
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
