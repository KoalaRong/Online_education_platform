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
<title>修改课程介绍</title>
</head>
<body>
<%
String introduction = new String((request.getParameter("introduction")).getBytes("ISO-8859-1"),"UTF-8");
%>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
    url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>
<sql:update dataSource="${snapshot}" var="count">
    UPDATE class SET introduction='<%= introduction%>' WHERE classid = '<%= request.getParameter("classid")%>';
</sql:update>
成功
</body>
</html>