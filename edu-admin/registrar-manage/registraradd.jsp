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
<title>添加教务人员信息</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>
<%
String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
String job = new String((request.getParameter("job")).getBytes("ISO-8859-1"),"UTF-8");
%>
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO registrar (id,password,name,job) VALUES (<%= request.getParameter("id")%>, <%= request.getParameter("password")%>,'<%=name%>', '<%=job%>');
</sql:update>
<h1>使用 POST 方法读取数据</h1>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from registrar;
</sql:query>
<h1>添加教务人员</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>姓名</th>
   <th>职务</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.job}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>