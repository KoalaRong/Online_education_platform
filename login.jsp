<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>判断登录</title>
</head>
<body>
	<%
	Statement stmt =null;
	ResultSet rs = null;
	Connection con = null;
	String name = null;
	String userid = request.getParameter("id").trim();
	String password = request.getParameter("password").trim();
	String identity = request.getParameter("identity").trim();
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/edu?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","edu","qwer1234!@#$");
		stmt = con.createStatement();
			rs=stmt.executeQuery("select * from "+identity+" where id='"+userid+"'");
			if(rs.next()){
				rs=stmt.executeQuery("select * from "+identity+" where id='"+userid+"' and password='"+password+"'");
				if(rs.next()){
					name=rs.getString("name");
					session.setAttribute("userid",userid);
					session.setAttribute("name",name);
					response.sendRedirect("edu-"+identity+"/index.jsp");
					return;
				}else{
					out.print("密码输入错误！！！<br>"+"重新<a href=\"login.jsp\">登录</a>");
				}
			}else{
				out.print("<font color=red>"+userid+"</font>用户不存在！！！<br>"+"请点击<a href=\"login.jsp\">返回</a>");
			}
		}catch(Exception e){
			out.print(e);
		}finally{
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
		}
	%>
	
</body>
</html>