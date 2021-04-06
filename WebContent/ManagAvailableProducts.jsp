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
           SELECT * FROM webappadnansazia.availableproducts;
        </sql:query>
<h3>Manage Available Products</h3>

<br />
<p>
	<a type="button" class="btn btn-primary btn-sm " href="#"
		onclick="includePage('CreateAvailableProducts.jsp')"> <span
		class="glyphicon glyphicon-plus"></span> <span>Create New
			Product</span>
	</a>

</p>
<br />
<!-- Display The data -->
<table class="table table-condensed table-hover">
	<tr class="table-header">
		<th>Serial No</th>
		<th>Product Name</th>
		<th>Maker</th>
		<th>Date-Added</th>
		<th style="width: 100px;">
			<div class="btn-group " role="group">
				<th style="padding-left: 50px">Operations</th>
		</th>
	</tr>

	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td>${row.serialno}</td>
			<td>${row.productname}</td>
			<td>${row.maker}</td>
			<td>${row.adddate}</td>
			<td>
			<td style="width: 400px;">
				<div class="btn-group" role="group">

					<a type="button" class="btn-success  btn btn-sm" href="#" 
					onclick="includePage('DetailsAvailableProducts.jsp?serialno=${row.serialno}')"> <span
						class="glyphicon glyphicon-list"></span> <span>Details</span>
				
					</a> <a type="button" class="btn-primary  btn btn-sm" href="#"
						onclick="includePage('UpdateAvailableProducts.jsp?serialno=${row.serialno}')">

						<span class="glyphicon glyphicon-pencil"></span> <span>Edit</span>
					</a> <a type="button" class="btn-danger  btn btn-sm" href="#"
						onclick="includePage('DeleteAvailableProducts.jsp?serialno=${row.serialno}')">
						<span class="glyphicon glyphicon-trash"></span> <span>Delete</span>
					</a>

				</div>
			</td>
			</td>
		</tr>
	</c:forEach>
</table>

<hr />
</div>