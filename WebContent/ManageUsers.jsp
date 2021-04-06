<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!--Html  -->
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page - Humber Insurance System</title>
<link href="./Content/bootstrap.css" rel="stylesheet" />
<link href="./Content/site.css" rel="stylesheet" />
</head>
<!-- DataBase Connection  and Query-->
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
	password="123456" />
<sql:query dataSource="${dbsource}" var="result">
           SELECT * FROM webappadnansazia.users;
        </sql:query>
<h3>Manage Users</h3>

<br />

<br />
<!-- Display The data -->
<table class="table table-condensed table-hover">
	<tr class="table-header">
		<th>UserName</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		
		<th>CellPhone</th>
		
		
		<th style="width: 100px;">
			<div class="btn-group " role="group">
				<th style="padding-left: 50px">Operations</th>
		</th>
	</tr>

	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td>${row.username}</td>
			<td>${row.firstname}</td>
			<td>${row.lastname}</td>
			<td>${row.email}</td>
			
			<td>${row.cellphone}</td>
			
			<td>
			<td style="width: 400px;">
				<div class="btn-group" role="group">

					<a type="button" class="btn-success  btn btn-sm" href="#" 
					onclick="includePage('DetailsAdminUser.jsp?username=${row.username}')"> <span
						class="glyphicon glyphicon-list"></span> <span>Details</span>
				
					</a> <a type="button" class="btn-primary  btn btn-sm" href="#"
						onclick="includePage('DetailsAdminUserRegisteredProducts.jsp?username=${row.username}')">

						<span class="glyphicon glyphicon-pencil"></span> <span>product</span>
					</a> <a type="button" class="btn-danger  btn btn-sm" href="#"
						onclick="includePage('DetailsAdminUserClaims.jsp?username=${row.username}')">
						<span class="glyphicon glyphicon-trash"></span> <span>Claims</span>
					</a>

				</div>
			</td>
			</td>
		</tr>
	</c:forEach>
</table>

<hr />
</div>