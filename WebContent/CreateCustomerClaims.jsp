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
           SELECT * FROM webappadnansazia.registeredproducts;
        </sql:query>
<div class="container body-content" style="width: 600px;">
	<h2>Create Claim</h2>
	<form action="insertCustomerClaimDb.jsp" method="post">
		<div class="form-horizontal">
			<div class="row"
				style="border: 1px solid #bbb9b9; border-radius: 5px; padding-top: 25px;">
				<div class="col-sm-12">
					<div class="form-group">
						<label class=" control-label col-md-3" for="userName">User
							Name</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="userName"
								name="userName" type="text" />
						</div>
					</div>
					<!-- This loop to fill dropdownlist -->
					<div class="form-group">
						<label class="control-label col-md-3" for="serialno">Serial
							No </label>
						<div class="col-md-9">
							<select class="form-control" id="serialno" name="serialno">
								<c:forEach var="col" items="${result.rows}">
									<option value="${col.serialno}">${col.serialno}</option>
								</c:forEach>

							</select>
						</div>
					</div>
					<!-- This loop to fill dropdownlist -->

					<div class="form-group">
						<label class="control-label col-md-3" for="productName">Product
							Name</label>
						<div class="col-md-9">
							<select class="form-control" id="productName" name="productName">
								<c:forEach var="col" items="${result.rows}">
									<option value="${col.productName}">${col.productName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3" for="maker">Maker</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="maker"
								name="maker" type="text" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3" for="claimDate">Claim
							Date</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="claimDate"
								name="claimDate" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3" for="damageDescription">Description</label>
						<div class="col-md-9">
							<textarea class="form-control" cols="20" id="damageDescription"
								name="damageDescription" rows="2" style="height: 150px;">
                        </textarea>
						</div>
					</div>

				</div>
			</div>
			<br />
			<div class="form-group">
				<div class=" col-md-10">
					<input type="submit" value="Create" class="btn btn-success btn-sm" />
					<a type="button" class="btn btn-primary btn-sm " href="#"
						onclick="includePage('ManagCustomerClaims.jsp')"> <span
						class="glyphicon glyphicon-list"></span> <span>Back To List</span>

					</a>
				</div>
			</div>
		</div>
	</form>

</div>