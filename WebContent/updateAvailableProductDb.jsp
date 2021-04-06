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
	<c:if
		test="${ empty param.serialno && empty param.productName
			&& empty param.Maker && empty param.dateAdded}">
		<c:redirect url="UpdateAvailableProducts.jsp">
			<c:param name="errMsg" value="Please Enter Product and Quantity" />
		</c:redirect>
	</c:if>
	<!-- DataBase Connection  -->
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webappadnansazia" user="root"
		password="123456" />
	<c:if
		test="${ not empty param.serialno && not empty param.productName
			&& not empty param.Maker && not empty param.dateAdded}">
		<sql:update dataSource="${dbsource}" var="result">          
UPDATE `webappadnansazia`.`availableproducts` 
SET productname = ?, maker=?,adddate=?
            WHERE serialno='${param.serialno}' 

		<sql:param value="${param.productName}" />
			<sql:param value="${param.Maker}" />
			<sql:param value="${param.dateAdded}" />
		</sql:update>

	</c:if>
	<c:if test="${result>=1}">
		<c:redirect url="Index.jsp">

		</c:redirect>
	</c:if>

</body>
<!-- Script Section --> 
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

