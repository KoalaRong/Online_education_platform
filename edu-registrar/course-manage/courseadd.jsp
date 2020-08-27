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
<title>添加管理员信息</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>
<%
String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
String college = new String((request.getParameter("college")).getBytes("ISO-8859-1"),"UTF-8");
String teachername = new String((request.getParameter("teachername")).getBytes("ISO-8859-1"),"UTF-8");
String introduction = new String((request.getParameter("introduction")).getBytes("ISO-8859-1"),"UTF-8");
String time = new String((request.getParameter("time")).getBytes("ISO-8859-1"),"UTF-8");
String place = new String((request.getParameter("place")).getBytes("ISO-8859-1"),"UTF-8");
String exam = new String((request.getParameter("exam")).getBytes("ISO-8859-1"),"UTF-8");
String type = new String((request.getParameter("type")).getBytes("ISO-8859-1"),"UTF-8");
%>
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO class (classid,classname,college,teacherid,teachername,introduction,time,place,exam,type,credit) VALUES ('<%= request.getParameter("id")%>', '<%=name%>','<%=college%>',<%= request.getParameter("teacherid")%>,'<%=teachername%>','<%=introduction%>','<%=time%>', '<%=place%>','<%=exam%>','<%=type%>',<%= request.getParameter("credit")%>);
</sql:update>
成功
</body>
</html>