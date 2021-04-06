<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!-- Html  -->
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page - Humber Insurance System</title>
<link href="./Content/bootstrap.css" rel="stylesheet" />
<link href="./Content/site.css" rel="stylesheet" />
</head>
<!-- DataBase Connection  -->
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
	password="123456" />
<sql:query dataSource="${dbsource}" var="result">
           SELECT * FROM webappadnansazia.registeredproducts where username=?;
           <sql:param value="${param.username}" />;
        </sql:query>
<h3>User Registered Products</h3>
<br />

<br />
<table class="table table-condensed table-hover">
	<tr class="table-header">

		<th>UserName</th>
		<th>SerialNo</th>
		<th>Product Name</th>
		<th>Maker</th>
		<th>PurchaseDate</th>
		<th style="width: 100px;">
			<div class="btn-group " role="group">
				<th style="padding-left: 50px"></th>
		</th>
	</tr>

	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td>${row.username}</td>
			<td>${row.serialno}</td>
			<td>${row.productname}</td>
			<td>${row.maker}</td>
			<td>${row.purchasedate}</td>
			<td>
			<td style="width: 400px;">
				<div class="btn-group" role="group">
                   <%--
					<a type="button" class="btn-success  btn btn-sm" href="#"
						onclick="includePage('DetailsRegisteredProducts.jsp?serialno=${row.serialno}')">
						<span class="glyphicon glyphicon-list"></span> <span>Details</span>

					</a>  <a type="button" class="btn-primary  btn btn-sm" href="#"
						onclick="includePage('UpdateRegisteredProducts.jsp?serialno=${row.serialno}')">
						<span class="glyphicon glyphicon-pencil"></span> <span>Edit</span>
					</a> <a type="button" class="btn-danger  btn btn-sm" href="#"
						onclick="includePage('DeleteRegisteredProducts.jsp?serialno=${row.serialno}')">
						<span class="glyphicon glyphicon-trash"></span> <span>Delete</span>
					</a> --%>
				</div>
			</td>
			</td>
		</tr>
	</c:forEach>
</table>
	<br />
			<div class="form-group">
				<div class=" col-md-10">
				
					<a type="button" class="btn btn-primary btn-sm " href="#"
						onclick="includePage('ManageUsers.jsp')"> <span
						class="glyphicon glyphicon-list"></span> <span>Back To List</span>

					</a>
				</div>
			</div>
<hr />
</div>