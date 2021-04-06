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
<!-- DataBase Connection  and Operation-->
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
	password="123456" />
<sql:query dataSource="${dbsource}" var="result">
           SELECT * FROM webappadnansazia.claims  where username=?;
           <sql:param value="${param.username}" />;
        </sql:query>
<h3>User Claims</h3>

<br />

<br />
<!-- Display Claim  -->

<table class="table table-condensed table-hover">
	<tr class="table-header">
		<th>Claim Id</th>
		<th>User Name</th>
		<th>SerialNo</th>
		<th>Product Name</th>
		<th>Claim Date</th>
		<!--  <th>
            Damage Description
        </th> -->
		<th>Status</th>
		<th style="width: 100px;">
			<div class="btn-group " role="group">
				<th style="padding-left: 50px"></th>
		</th>
	</tr>
	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td>${row.claimid}</td>
			<td>${row.username}</td>
			<td>${row.serialno}</td>
			<td>${row.productname}</td>
			<td>${row.claimdate}</td>

			<%--  <td>
        ${row.damagedescription}
    </td> --%>
			<c:choose>
				<c:when test="${row.status == 'request'}">
					<td style="color: blue;">${row.status}</td>
				</c:when>
				<c:when test="${row.status == 'approved'}">
					<td style="color: green;">${row.status}</td>
				</c:when>
				<c:when test="${row.status == 'rejected'}">
					<td style="color: red;">${row.status}</td>
				</c:when>
			</c:choose>
			<td>
			<td style="width: 400px;">
				<div class="btn-group" role="group">

				<%-- 	<a type="button" class="btn-info  btn btn-sm" href="#"
						onclick="includePage('DetailsCustomerClaim.jsp?claimid=${row.claimid}')">
						<span class="glyphicon glyphicon-list"></span> <span>Details</span>
					</a> <a type="button" class="btn-primary  btn btn-sm" href="#"
						onclick="includePage('UpdateCustomerClaim.jsp?claimid=${row.claimid}')">

						<span class="glyphicon glyphicon-pencil"></span> <span>Edit</span>
					</a> <a type="button" class="btn-danger  btn btn-sm" href="#"
						onclick="includePage('DeleteCustomerClaim.jsp?claimid=${row.claimid}')">
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