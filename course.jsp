<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://static.koalarong.com/css/edustyle.css" />
    <link
      rel="icon"
      type="image/png"
      href="https://static.koalarong.com/img/favicon.svg"
    />
    <title>在线教育平台-课程建设</title>
  </head>

  <body>

  <sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>
     <%
      String classid = request.getParameter("classid");   //获取url中的参数值
     %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">
        <img
          src="https://static.koalarong.com/img/favicon.svg"
          width="30"
          height="30"
          class="d-inline-block align-top"
          alt=""
        />
        在线教育平台
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.html"
              >主页 <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">基本信息</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">单元学习</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">课程资源</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">课程活动</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">课程讨论</a>
          </li>
        </ul>
        <form class="form-inline">
          <input
            class="form-control mr-sm-2"
            type="search"
            placeholder="请输入搜索内容"
            aria-label="Search"
          />
          <button class="btn btn-outline-info my-2 my-sm-0" type="submit">
            搜索
          </button>
        </form>
        <div>
          <span style="color: azure;">&nbsp;|&nbsp;</span>
        </div>
        <div class="my-2 my-sm-0">
          <a href="../logout.jsp">
          <button
            type="button"
            class="btn btn-outline-info"
          >
            注销
          </button>
          </a>
        </div>
      </div>
    </nav>
    <!- 导航栏 ->

    <div class="container" style="margin-top: 1rem;">
      <div class="row border-bottom">
        <h1>课程名称</h1>
      </div>
      <div class="row" style="margin-top: 1rem;">
        <div class="col-3">
          <div class="border p-3 mb-2 rounded-lg">
            <h2>教师信息</h2>
            <sql:query dataSource="${snapshot}" var="result">
              SELECT * from teacher WHERE id = <%= session.getAttribute("userid")%>;
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
            <table class="table table-sm">
              <tbody>
                <tr>
                  <th scope="row">教师姓名</th>
                  <td><c:out value="${row.name}"/></td>
                </tr>
                <tr>
                  <th scope="row">所属学院</th>
                  <td><c:out value="${row.college}"/></td>
                </tr>
                <tr>
                  <th scope="row">职务</th>
                  <td><c:out value="${row.job}"/></td>
                </tr>
              </tbody>
            </table>
          </c:forEach>
          </div>
          <div class="border p-3 mb-5 rounded-lg">
            <h2>课程信息</h2>
            <sql:query dataSource="${snapshot}" var="classresult">
              SELECT * from class WHERE classid IN (SELECT classid FROM class WHERE teacherid = <%= session.getAttribute("userid")%>);
            </sql:query>
            <c:forEach var="row" items="${classresult.rows}">
            <table class="table table-sm">
              <tbody>
                <tr>
                  <th scope="row">开课学院</th>
                  <td><c:out value="${row.college}"/></td>
                </tr>
                <tr>
                  <th scope="row">课程编号</th>
                  <td><c:out value="${row.classid}"/></td>
                </tr>
                <tr>
                  <th scope="row">任课教师</th>
                  <td><c:out value="${row.teachername}"/></td>
                </tr>
                <tr>
                  <th scope="row">课程类型</th>
                  <td><c:out value="${row.type}"/></td>
                </tr>
                <tr>
                  <th scope="row">学分</th>
                  <td><c:out value="${row.credit}"/></td>
                </tr>
                <tr>
                  <th scope="row">考查方式</th>
                  <td><c:out value="${row.exam}"/></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!- 左侧边栏 ->
        <div class="col-6">
          <div class="border-bottom">
            <h2>课程介绍</h2>
          </div>
        </div>
        </c:forEach>
        <div class="col-3">
          <div class="border p-3 mb-2 rounded-lg">
            <h2>课程通知</h2>
            <table class="table table-sm">
              <tbody>
                <tr>
                  <th scope="row">教师姓名</th>
                  <td>ABC院</td>
                </tr>
                <tr>
                  <th scope="row">所属学院</th>
                  <td>ABC院</td>
                </tr>
                <tr>
                  <th scope="row">教师简介</th>
                  <td>A1234556</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!- 左侧边栏 ->
      </div>
    </div>

    <footer class="footer text-center" style="height: 74px;">
      <p class="copyright">Copyright © 2020 KoalaRong, All rights reserved</p>
    </footer>
    <!- 页脚 ->

    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
