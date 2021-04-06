<!-- page and Library Declaration  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!-- Start Html  -->

<div class="container body-content" style="width: 600px;">

	<h2>Add Product</h2>

	<form action="insertAvailableProductDb.jsp" method="post">
		<div class="form-horizontal">
			<div class="row"
				style="border: 1px solid #bbb9b9; border-radius: 5px; padding-top: 25px;">
				<div class="col-sm-12">

					<div class="form-group">
						<label class="control-label col-md-3" for="serialno">Serial
							No</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="serialno"
								name="serialno" type="text" value="" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3" for="productName">Product
							name</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="productName"
								name="productName" type="text" value="" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3" for="Maker">Maker</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="Maker"
								name="Maker" type="text" value="" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3" for="dateAdded">
							Date Added</label>
						<div class="col-md-9">
							<input class="form-control text-box single-line" id="dateAdded"
								name="dateAdded" type="text" type="date" value="" />
						</div>
					</div>

				</div>
			</div>
			<br />
			<div class="form-group">
				<div class=" col-md-10">
					<input type="submit" value="Create" class="btn btn-success btn-sm" />
					<a type="button" class="btn btn-primary btn-sm " href="#"
						onclick="includePage('ManagAvailableProducts.jsp')"> <span
						class="glyphicon glyphicon-list"></span> <span>Back To List</span>

					</a>
				</div>
			</div>
		</div>
	</form>

</div>