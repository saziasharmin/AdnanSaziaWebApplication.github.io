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
<title>Update Operation</title>
</head>
<body>
	<!-- DataBase Connection  -->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />
	<c:if
		test="${ not empty param.claimid 
			&&  not empty param.serialno && not empty param.productName
			&& not empty param.claimdate && not empty param.damagedescription}">
		<sql:update dataSource="${dbsource}" var="result">          
UPDATE `webappadnansazia`.`claims`
SET serialno =?, productname=?, claimdate=?, damagedescription=?, status=?
            WHERE claimid='${param.claimid}'  
       
	 <sql:param value="${param.serialno}" />
			<sql:param value="${param.productName}" />
			<sql:param value="${param.claimdate}" />
			<sql:param value="${param.damagedescription}" />
			<sql:param value="${param.status}" />
		</sql:update>
	</c:if>
	<c:if test="${result>=1}">
		<c:redirect url="Index.jsp">
		</c:redirect>
	</c:if>

</body>
<!-- Script Section  -->

<script type="text/javascript">

function includePage(fileName)  
{
   $.ajax({
         type: "POST",
         url: fileName,                   
         cache: true,
         success: function(response) {
             $('#loginLink1').html(response);
          }
     });  
}

</script>
<script type="text/javascript">
   
   function changeContent() {
	    $('#loginLink1').load('Login1.jsp');
	}
   
   </script>
<script src="./Scripts/change.js"></script>
</html>
