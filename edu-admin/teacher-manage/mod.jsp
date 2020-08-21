<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>

<sql:update dataSource="${snapshot}" var="count">
    UPDATE teacher SET id=<%= request.getParameter("id")%>,name ="<%= request.getParameter("name")%>",password=<%= request.getParameter("password")%>,sex="<%= request.getParameter("sex")%>",college="<%= request.getParameter("college")%>",job="<%= request.getParameter("job")%>" WHERE id = <%= request.getParameter("id")%>;
</sql:update>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from teacher;
</sql:query>
<h1>全部教师</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>姓名</th>
   <th>性别</th>
   <th>学院</th>
   <th>职务</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.sex}"/></td>
   <td><c:out value="${row.college}"/></td>
   <td><c:out value="${row.job}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>