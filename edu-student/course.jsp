<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1024kb" autoFlush="true"%>
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
    <title>在线教育平台-课程学习</title>
  </head>

  <body>

  <sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>
     <%
      String classid = request.getParameter("classid");
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
    <sql:query dataSource="${snapshot}" var="classresult">
      SELECT * from class WHERE classid = '<%=classid%>';
    </sql:query>
    <div class="container" style="margin-top: 1rem;">
    <c:forEach var="row" items="${classresult.rows}">
      <div class="row">
        <h1><c:out value="${row.classname}"/></h1>
      </div>
      </c:forEach>
      <ul class="nav nav-tabs justify-content-end" id="myTab" role="tablist" style="margin-top: -2rem;">
        <li class="nav-item">
          <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">主页</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">单元学习</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">提交作业</a>
        </li>
      </ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
    <div class="row" style="margin-top: 1rem;">
        <div class="col-3">
          <div class="border p-3 mb-2 rounded-lg">
            <h2>教师信息</h2>
            <sql:query dataSource="${snapshot}" var="result">
              SELECT * from teacher WHERE id = (SELECT teacherid from class WHERE classid = '<%=classid%>');
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
          <div>
            <p><c:out value="${row.introduction}"/></p>
          </div>
        </div>
        </c:forEach>
        <div class="col-3">
          <div class="border p-3 mb-2 rounded-lg">
            <h2>课程通知</h2>
            <sql:query dataSource="${snapshot}" var="noticeresult">
                  SELECT * from classnotice WHERE classid = '<%=classid%>' ORDER BY id DESC;
                </sql:query>
            <table class="table table-sm">
              <tbody>
              <c:forEach var="row" items="${noticeresult.rows}">
              <tr>
                <td>*</td>
                <td><a href="#"><c:out value="${row.tittle}"/></a></td>
              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <!- 左侧边栏 ->
      </div>
    </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  <div class="container" style="margin-top:1rem;">
    <div class="row">
    <div class="col-3">
      <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <sql:query dataSource="${snapshot}" var="result">
        SELECT * from unit WHERE classid = '<%= classid%>' ORDER BY id;
      </sql:query>
      <c:forEach var="row" items="${result.rows}">
        <a class="nav-link" id="v-unit-<c:out value="${row.id}"/>-tab" data-toggle="pill" href="#v-unit-<c:out value="${row.id}"/>" role="tab" aria-controls="v-unit-<c:out value="${row.id}"/>" aria-selected="true"><c:out value="${row.tittle}"/></a>
      </c:forEach>
      </div>
    </div>
    <div class="col-9">
    <div class="tab-content" id="v-unit-tabContent">
    <c:forEach var="row" items="${result.rows}">
    <c:set var="unitid" scope="session" value="${row.id}"/>
      <div class="tab-pane fade" id="v-unit-<c:out value="${row.id}"/>" role="tabpanel" aria-labelledby="v-unit-<c:out value="${row.id}"/>-tab">
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">单元内容</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">知识点</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">作业</a>
          </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
          <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
            <c:out value="${row.content}"/>
          </div>
          <sql:query dataSource="${snapshot}" var="knowledgeresult">
            SELECT * from knowledge WHERE unitid = <c:out value="${unitid}"/> AND masterid is null;
          </sql:query>
          
        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
            <div style="margin-top:1rem;margin-bottom:1rem;">
              <p>
              <c:forEach var="row" items="${knowledgeresult.rows}">
                <c:set var="masterid1" scope="session" value="${row.id}"/>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse<c:out value="${row.id}"/>" aria-expanded="false" aria-controls="collapseExample">
                  <c:out value="${row.tittle}"/>
                </button>
              </p>
              <div class="collapse" id="collapse<c:out value="${row.id}"/>">
                <div class="card card-body">
                  <c:out value="${row.content}"/>

                  <div style="margin-top:1rem;">
                    <p>
                      <sql:query dataSource="${snapshot}" var="knowledgeresult1">
                        SELECT * from knowledge WHERE masterid = <c:out value="${masterid1}"/>;
                      </sql:query>
                      <c:forEach var="row1" items="${knowledgeresult1.rows}">
                      <c:set var="masterid2" scope="session" value="${row1.id}"/>
                      <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse<c:out value="${row1.id}"/>" aria-expanded="false" aria-controls="collapseExample">
                        <c:out value="${row1.tittle}"/>
                      </button>
                    </p>
                    <div class="collapse" id="collapse<c:out value="${row1.id}"/>">
                      <div class="card card-body">
                        <c:out value="${row1.content}"/>

                        <div style="margin-top:1rem;">
                          <p>
                          <sql:query dataSource="${snapshot}" var="knowledgeresult2">
                          SELECT * from knowledge WHERE masterid = <c:out value="${masterid2}"/>;
                          </sql:query>
                          <c:forEach var="row2" items="${knowledgeresult2.rows}">
                          <c:set var="masterid1" scope="session" value="${row.id}"/>
                          <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse<c:out value="${row2.id}"/>" aria-expanded="false" aria-controls="collapseExample">
                            <c:out value="${row2.tittle}"/>
                          </button>
                          </p>
                          <div class="collapse" id="collapse<c:out value="${row2.id}"/>">
                            <div class="card card-body">
                              <c:out value="${row2.content}"/>
                            </div>
                          </div>
                        </div>
                          </c:forEach>
                      </div>


                      </div>
                    </div>
                    </c:forEach>
                  </div>

                </div>
              </div>
              </c:forEach>
            </div>
          </div>
          


          <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">...</div>
        </div>
      </div>

    </c:forEach>

    </div>
    </div>
  </div>
</div>
  </div>
  </div>
  </div>

  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
  <div class="container" style="margin-top:1rem;">
  <div class="row">
    <div class="col-2">
      <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-homework-tab" data-toggle="pill" href="#v-pills-homework" role="tab" aria-controls="v-pills-homework" aria-selected="true">未完成作业</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">已完成作业</a>
      </div>
    </div>
  <div class="col-10">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-homework" role="tabpanel" aria-labelledby="v-pills-homework-tab">
        <sql:query dataSource="${snapshot}" var="result">
          SELECT * FROM homework WHERE classid = "<%=classid%>" AND NOT EXISTS (SELECT homeworkid FROM shomework WHERE studentid = <%= session.getAttribute("userid")%>);
        </sql:query>
        <h1>未完成作业</h1>
        <table border="1" width="100%">
        <tr>
          <th>标题</th>
          <th>发布者</th>
          <th>发布时间</th>
          <th>操作</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
        <tr>
          <td><c:out value="${row.tittle}"/></td>
          <td><c:out value="${row.author}"/></td>
          <td><c:out value="${row.time}"/></td>
          <td><a href="../ueditor/index.jsp?id=<c:out value="${row.id}"/>">提交</a></td>
        </tr>
        </c:forEach>
        </table>
      </div>


    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
    <sql:query dataSource="${snapshot}" var="result">
          SELECT * FROM homework WHERE classid = "<%=classid%>" AND  EXISTS (SELECT homeworkid FROM shomework WHERE studentid = <%= session.getAttribute("userid")%>);
        </sql:query>
    <h1>已完成作业</h1>
        <table border="1" width="100%">
        <tr>
          <th>标题</th>
          <th>发布者</th>
          <th>发布时间</th>
          <th>分数</th>
          <th>操作</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
        <tr>
          <td><c:out value="${row.tittle}"/></td>
          <td><c:out value="${row.author}"/></td>
          <td><c:out value="${row.time}"/></td>
          <td><c:out value="${row.grade}"/></td>
          <td><a href="homeview.jsp?id=<c:out value="${row.id}"/>">查看</a></td>
        </tr>
      </c:forEach>
      </table>
    </div>
    </div>
  </div>
</div>
</div>
  </div>
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
