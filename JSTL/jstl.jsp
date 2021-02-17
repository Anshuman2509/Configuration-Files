<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:set var="a1" value="BMW X7" scope="application"></c:set>
<c:out value="${a1 }">Default Value</c:out><br>
<c:remove var="a1"/>
<c:out value="${a1 }">Default Value</c:out>

<c:set value="29" var="a2"></c:set>
<c:if test="${a2==29}">
<p>The value of a2 is 29</p>
</c:if>


<c:set var="car" value="10"></c:set>

<c:choose>
<c:when test="${car==1 }">
<p>BMW is the selected car</p>
</c:when>
<c:when test="${car==2 }">
<p>Audi is the selected car</p>
</c:when>
<c:otherwise>
<p>Mercedes is the selected car</p>
</c:otherwise>
</c:choose>

<c:forEach var="l" begin="1" end="4">
<p>The value of l is <c:out value="${l }"></c:out><p>
</c:forEach>


<c:forEach var="b1" items="BMW,AUDI">
<p>The car value is <c:out value="${b1 }">Default Value</c:out><p>
</c:forEach>


<c:url var="myUrl" value="https://www.google.com/search">
<c:param name="q" value="bmw and audi"></c:param>
</c:url>

<c:if test="${2==3 }">
<c:redirect url="${myUrl }"/>
</c:if>

<c:set var="am" value="Welcome"/>
<p>Length of Car is <c:out value="${fn:length(am) }"></c:out>
<p>In Uppercase <c:out value="${fn:toUpperCase(am) }"/> </p>
<p>Contains condition <c:out value="${fn:contains(am,'co') }"/> </p>


<p>SQL JSTL TAGS</p>
<sql:setDataSource
var="io"
driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/rough"
user="root"
password="password"
/>
<sql:query dataSource="${io }"  var="rs">select * from emp;</sql:query>
<table>
<tr><th>ID</th><th>Name</th><th>Department</th><th>Age</th></tr>
<c:forEach var="row" items="${rs.rows }">
<tr>
<td><c:out value="${row.id }"/> </td>
<td><c:out value="${row.emp_name }"/> </td>
<td><c:out value="${row.department }"/> </td>
<td><c:out value="${row.age }"/> </td>
</tr>
</c:forEach>
</table>
</body>
</html>