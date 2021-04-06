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
            SELECT * FROM webappadnansazia.claims where claimid=?;
           <sql:param value="${param.claimid}" readonly="readonly" />
</sql:query>

<div class="container body-content" style="width: 600px;">

	<h2>Delete Customer Claim</h2>

	<form action="deleteAdminClaimDb.jsp" method="get">
		<div class="form-horizontal">
			<div class="row"
				style="border: 1px solid #bbb9b9; border-radius: 5px; padding-top: 25px;">
				<div class="col-sm-12">
					<c:forEach var="row" items="${result.rows}">
						<div class="form-group">
							<label class=" control-label col-md-3" for="claimid">Claim
								Id</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="claimid"
									name="claimid" type="text" value="${row.claimid}"
									readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class=" control-label col-md-3" for="userName">User
								Name</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="userName"
									name="userName" type="text" value="${row.userName}"
									readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="serialno">Serial
								No</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="serialno"
									name="serialno" type="text" value="${row.serialno}"
									readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3" for="productName">Product
								name</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line"
									id="productName" name="productName" type="text"
									value="${row.productname}" readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="claimdate">Claim
								Date</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="claimdate"
									name="claimdate" type="text" value="${row.claimdate}"
									readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="status">
								Status</label>
							<div class="col-md-9">
								<input class="form-control text-box single-line" id="status"
									name="status" type="text" value="${row.status}"
									readonly="readonly" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3" for="damagedescription">Description</label>
							<div class="col-md-9">
								<textarea class="form-control" cols="20" id="damagedescription"
									name="damagedescription" value="${row.damagedescription}"
									rows="2" style="height: 150px;">
                       <c:out value="${row.damagedescription}"
										readonly="readonly" />
                        </textarea>
							</div>
						</div>
				</div>
			</div>
			<br />
			<div class="form-group">
				<div class=" col-md-10">
					<input type="submit" value="Delete" class="btn btn-danger btn-sm" />
					<a type="button" class="btn btn-primary btn-sm " href="#"
						onclick="includePage('ManagAdminClaims.jsp')"> <span
						class="glyphicon glyphicon-list"></span> <span>Back To List</span>

					</a>
				</div>
			</div>
		</div>
		</c:forEach>
	</form>

</div>