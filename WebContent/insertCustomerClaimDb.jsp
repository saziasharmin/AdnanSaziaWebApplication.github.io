<!-- page and Library Declaration  -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>INSERT Operation</title>
</head>

<!-- Testing and Connection  -->
<body>
	<c:if
		test="${empty param.userName && empty param.serialno
			&& empty param.productName && empty param.claimDate 
			&& empty param.damageDescription}">
		<c:redirect url="CreateCustomerClaims.jsp">
			<c:param name="errMsg" value="Please Enter Product and Quantity" />
		</c:redirect>
	</c:if>
	<!-- DataBase Connection  -->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />

	<c:if
		test="${ not empty param.userName && not empty param.serialno
			&& not empty param.productName && not empty param.claimDate && not empty param.damageDescription}">
		<sql:update dataSource="${dbsource}" var="result">
  INSERT INTO `webappadnansazia`.`claims`(username,serialno,productname,claimdate,damagedescription,status)VALUES(?,?,?,?,?,?) 
        <sql:param value="${param.userName}" />
			<sql:param value="${param.serialno}" />
			<sql:param value="${param.productName}" />
			<sql:param value="${param.claimDate}" />
			<sql:param value="${param.damageDescription}" />
			<sql:param value="request" />
		</sql:update>
	</c:if>
	<c:if test="${result>=1}">
		<c:redirect url="Index.jsp">
			<c:param name="susMsg"
				value="Congratulations ! Data inserted
            successfully." />
		</c:redirect>
	</c:if>
</body>
</html>

