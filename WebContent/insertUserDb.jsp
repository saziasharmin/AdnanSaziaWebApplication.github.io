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
<body>
	<c:if test="${ empty param.lastname or empty param.firstname}">
		<c:redirect url="insertUserDb.jsp">
			<c:param name="errMsg" value="Please Enter Product and Quantity" />
		</c:redirect>
	</c:if>
	<!-- DataBase Connection  and Insert -->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />
	<c:if
		test="${not empty param.userName &&  not empty param.firstname
			&&  not empty param.lastname &&  not empty param.email &&  not empty param.password
			&&  not empty param.cellPhone && not  empty param.address && param.password==param.repassword}">
		<sql:update dataSource="${dbsource}" var="result">
     INSERT INTO `webappadnansazia`.`users` (username,firstname,lastname,email,password,cellphone,address)VALUES(?,?,?,?,?,?,?)
          <sql:param value="${param.userName}" />
			<sql:param value="${param.firstname}" />
			<sql:param value="${param.lastname}" />
			<sql:param value="${param.email}" />
			<sql:param value="${param.password}" />
			<sql:param value="${param.cellPhone}" />
			<sql:param value="${param.address}" />
		</sql:update>
	</c:if>
	<c:if test="${result>=1}">
		<c:redirect url="Index.jsp">
			<c:param name="susMsg"
				value="Congratulations ! You are Registered 
            successfully." />
		</c:redirect> 
	</c:if>
</body>
</html>
>
