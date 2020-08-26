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
<title>添加作业</title>
</head>
<body>
<%
    String classid = request.getParameter("classid");
    String tittle = new String((request.getParameter("tittle")).getBytes("ISO-8859-1"),"UTF-8");
    String content = new String((request.getParameter("content")).getBytes("ISO-8859-1"),"UTF-8");
    String author = new String((request.getParameter("author")).getBytes("ISO-8859-1"),"UTF-8");
    java.util.Date nowtime=new java.util.Date();
    java.text.SimpleDateFormat formattertime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    String time = new String((formattertime.format(nowtime)));
%>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
    url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from student WHERE id = <%= request.getParameter("id")%>;
</sql:query>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO homework (classid,tittle,content,author,time) VALUES ('<%=classid%>', '<%=tittle%>', '<%=content%>', '<%=author%>', '<%=time%>');
</sql:update>
<h1>添加成功</h1>
</body>
</html>