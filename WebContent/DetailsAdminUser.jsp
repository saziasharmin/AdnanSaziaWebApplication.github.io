<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!-- DataBase Connection and operation -->
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
	password="123456" />
<sql:query dataSource="${dbsource}" var="result">
            SELECT * FROM webappadnansazia.users where username=?;
           <sql:param value="${param.username}" />
</sql:query>

<div class="container body-content" style="width: 600px;">
	<h2>User Details</h2>
	<form method="post">
		<div class="form-horizontal"">
			<div class="row"
				style="border: 1px solid #bbb9b9; border-radius: 5px; padding-top: 25px;">
				<div class="col-sm-12">
					<c:forEach var="row" items="${result.rows}">
						<div class="form-group">
							<label class=" control-label col-md-3" for="username">User Name
								</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="username"
									name="username" type="text" value="${row.username}"
									readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class=" control-label col-md-3" for="firstName">First
								Name</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="firstName"
									name="firstName" type="text" value="${row.firstname}"
									readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3" for="lastName">Last Name
								</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="lastName"
									name="lastName" type="text" value="${row.lastname}"
									readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3" for="productName">Email
								</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line"
									id="email" name="email" type="text"
									value="${row.email}" readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="password">Password
								Date</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="password"
									name="password" type="text" value="${row.password}"
									readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="status">
								CellPhone</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="cellphone"
									name="cellphone" type="text" value="${row.cellphone}"
									readonly="readonly" />
							</div>
						</div>

					<div class="form-group">
							<label class="control-label col-md-3" for="status">
								Address</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="address"
									name="address" type="text" value="${row.address}"
									readonly="readonly" />
							</div>
						</div>
				</div>
			</div>
			<br />
			<div class="form-group">
				<div class=" col-md-10">

					<a type="button" class="btn btn-primary btn-sm " href="#"
						onclick="includePage('ManageUsers.jsp')"> <span
						class="glyphicon glyphicon-list"></span> <span>Back To List</span>

					</a>
				</div>
			</div>
		</div>
		</c:forEach>
	</form>

</div>