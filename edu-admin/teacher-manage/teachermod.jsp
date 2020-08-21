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
SELECT * from teacher WHERE id = <%= request.getParameter("id")%>;
</sql:query>
<h1>全部管理员</h1>
<table border="1" width="100%">
<c:forEach var="row" items="${result.rows}">
<form action="mod.jsp" method="get">
  <p>管理员ID:<input type="text" name="id" value="${row.id}"/></p>
  <p>姓名:<input type="text" name="name" value="${row.name}"/></p>
  <p>密码:<input type="password" name="password" value="${row.password}"/></p>
  <p>性别:<input type="text" name="sex" value="${row.sex}"/></p>
  <p>学院:<input type="text" name="college" value="${row.college}"/></p>
  <p>职务:<input type="text" name="job" value="${row.job}"/></p>
  <input type="submit" value="修改" />
</form>
</c:forEach>

</table>
</body>
</html>