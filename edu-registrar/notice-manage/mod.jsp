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
    UPDATE notice SET id='<%= request.getParameter("id")%>',tittle ="<%= request.getParameter("tittle")%>",content='<%= request.getParameter("content")%>',author='<%= request.getParameter("author")%>',date='<%= request.getParameter("date")%>',time='<%= request.getParameter("time")%>' WHERE id = '<%= request.getParameter("id")%>';
</sql:update>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from notice WHERE id = '<%= request.getParameter("id")%>';
</sql:query>
<h1>全部管理员</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>标题</th>
   <th>内容</th>
   <th>作者</th>
   <th>日期</th>
   <th>时间</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.tittle}"/></td>
   <td><c:out value="${row.content}"/></td>
   <td><c:out value="${row.author}"/></td>
   <td><c:out value="${row.date}"/></td>
   <td><c:out value="${row.time}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>