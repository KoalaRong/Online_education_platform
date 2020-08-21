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
<title>修改管理员信息</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from notice WHERE id = '<%= request.getParameter("id")%>';
</sql:query>
<h1>全部管理员</h1>
<table border="1" width="100%">
<c:forEach var="row" items="${result.rows}">
<form action="mod.jsp" method="get">
  <p>管理员ID:<input type="text" name="id" value="${row.id}"/></p>
  <p>标题:<input type="text" name="tittle" value="${row.tittle}"/></p>
  <p>内容:<textarea class="form-control" name="content" rows="3">${row.content}</textarea></p>
  <p>发布者:<input type="text" name="author" value="${row.author}"/></p>
  <p>日期:<input type="text" name="date" value="${row.date}"/></p>
  <p>时间:<input type="text" name="time" value="${row.time}"/></p>
  <input type="submit" value="修改" />
</form>
</c:forEach>
</body>
</html>