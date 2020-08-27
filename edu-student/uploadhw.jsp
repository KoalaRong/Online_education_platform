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
String wordtype = new String((request.getParameter("wordtype")).getBytes("ISO-8859-1"),"UTF-8");
java.util.Date nowtime=new java.util.Date();
java.text.SimpleDateFormat formattertime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
String time = new String((formattertime.format(nowtime)));
%>
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO shomework (studentid,studentname,homeworkid,content,time) VALUES (<%=session.getAttribute("userid")%>,'<%=session.getAttribute("name")%>',<%= request.getParameter("id")%>, '<%=wordtype%>','<%=time%>');
</sql:update>
成功
</body>
</html>