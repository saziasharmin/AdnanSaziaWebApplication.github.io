
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
<title>JINSERT Operation</title>
</head>
<body>
	<c:if
		test="${empty param.userName &&  empty param.serialno
			&&  empty param.productName &&  empty param.maker && empty param.purchaseDate}">
		<c:redirect url="ManagRegisteredProducts.jsp">
			<c:param name="errMsg" value="Please Enter Product and Quantity" />
		</c:redirect>
	</c:if>
	<!-- DataBase Connection  and operation-->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />
	<c:if
		test="${ not empty param.userName && not empty param.serialno
			&& not empty param.productName && not empty param.maker && not empty param.purchaseDate}">
		<sql:update dataSource="${dbsource}" var="result">
  INSERT INTO `webappadnansazia`.`registeredproducts`(username,serialno,productname,maker,purchasedate)VALUES(?,?,?,?,?)
        <sql:param value="${param.userName}" />
			<sql:param value="${param.serialno}" />
			<sql:param value="${param.productName}" />
			<sql:param value="${param.maker}" />
			<sql:param value="${param.purchaseDate}" />
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

