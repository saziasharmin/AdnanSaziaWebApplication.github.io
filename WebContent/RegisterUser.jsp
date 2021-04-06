<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!-- Start contatiner  -->
<div id="second">
	<div class="myform form ">
		<div class="logo mb-3">
			<div class="col-md-12 text-center">
				<h1>User Registration</h1>
			</div>
		</div>
		<form action="insertUserDb.jsp" method="post">
			<div class="form-group">
				<!-- Labels and inputs, required for validate empty input boxes  -->
				<label for="firstname">First Name</label> <input type="text"
					name="firstname" class="form-control" id="firstname"
					placeholder="Enter Firstname" required>
			</div>
			<div class="form-group">
				<label for="lastname">Last Name</label> <input type="text"
					name="lastname" class="form-control" id="lastname"
					placeholder="Enter Lastname" required>
			</div>
			<div class="form-group">
				<label for=""userName"">User Name</label> <input type="text"
					name="userName" class="form-control" id="userName"
					placeholder="Enter userName" required>
			</div>
			<div class="form-group">
				<label for="email">Email address</label> <input type="text"
					name="email" class="form-control" id="email"
					aria-describedby="emailHelp" placeholder="Enter email" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					name="password" id="password" class="form-control"
					placeholder="Enter Password" required>
			</div>
			<div class="form-group">
				<label for="repassword">Confirmed Password</label> <input
					type="password" name="repassword" id="repassword"
					class="form-control" placeholder="Enter Confirmed Password"
					required>
				<!-- Labels and inputs, required for validate empty input boxes  -->
				<c:if test="${param.password!=param.repassword}">
					<font color="red"> Please, Password and repassword must be
						the same </font>
				</c:if>
			</div>
			<div class="form-group">
				<label for=""cellPhone"">CellPhone No</label> <input type="text"
					name="cellPhone" class="form-control" id="cellPhone"
					placeholder="Enter cellPhone" required>
			</div>
			<div class="form-group">
				<label for=""address"">Address</label> <input type="text"
					name="address" class="form-control" id="address"
					placeholder="Enter Address" required>
			</div>
			<div class="col-md-12 text-center mb-3">
				<input type="submit" class=" btn btn-block mybtn btn-primary tx-tfm" />
			</div>
			<div class="col-md-12 ">
				<div class="form-group">
					<p class="text-center">
						<a href="#" id="signin" onclick="includePage('Login.jsp')">Already have an account?</a>
					</p>
				</div>
			</div>
	</div>
	</form>
</div>
