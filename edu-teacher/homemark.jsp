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
<title>所有作业</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from shomework WHERE homeworkid = <%= request.getParameter("homeworkid")%>;
</sql:query>
   <h1>学生作业</h1>
   <table border="1" width="100%">
   <tr>
     <th>学生姓名</th>
     <th>学生学号</th>
     <th>提交时间</th>
     <th>分数</th>
     <th>操作</th>
   </tr>
   <c:forEach var="row" items="${result.rows}">
   <tr>
     <td><c:out value="${row.studentname}"/></td>
     <td><c:out value="${row.studentid}"/></td>
     <td><c:out value="${row.time}"/></td>
     <td><c:out value="${row.grade}"/></td>
     <td><a href="mark.jsp?id=<c:out value="${row.id}"/>">批改</a></td>
   </tr>
   </c:forEach>
   </table>

</body>
</html>