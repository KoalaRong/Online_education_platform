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
    <title>在线教育平台-教师</title>
  </head>

  <body>

  <sql:setDataSource var="snapshot" driver="org.mariadb.jdbc.Driver"
     url="jdbc:mariadb://localhost:3306/edu?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8"
     user="edu"  password="qwer1234!@#$"/>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="index.html">
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
            <a class="nav-link" href="#"
              >主页 <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">学习</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">活动</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">播客</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">精品课</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">专业</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">资源中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">学习社区</a>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              Dropdown
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
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
      <div class="row">
        <div class="col-3">
          <div class="row">
            <div class="col">
              <div class="card">
                <p class="card-header">个人信息</p>
                <img
                  class="card-img-top"
                  src="https://static.koalarong.com/img/logo.jpg"
                  alt=""
                />
                <div class="card-body">
                <sql:query dataSource="${snapshot}" var="result">
                  SELECT * from teacher WHERE id = <%= session.getAttribute("userid")%>;
                </sql:query>
                <c:forEach var="row" items="${result.rows}">
                  <h5 class="card-title"><c:out value="${row.name}"/></h5>
                  <p>所属学院：<c:out value="${row.college}"/></p>
                  <p>职务：<c:out value="${row.job}"/></p>
                  </c:forEach>
                  <a href="#" class="card-link">编辑信息</a>
                </div>
              </div>
            </div>
          </div>
          <div class="row" style="margin-top: 1rem;">
            <div class="col"></div>
          </div>
        </div>
        <!- 侧边栏 ->
        <div class="col-9">
          <div class="row">
            <div class="col-7">
              <div class="card" style="height: 250px;">
                <div class="card-header">通知</div>
                <div class="card-body">
                <sql:query dataSource="${snapshot}" var="result">
                  SELECT * from notice ORDER BY id DESC;
                </sql:query>
                <table>
                <c:forEach var="row" items="${result.rows}">
                <tr>
                   <td>*</td>
                   <td><a href="#"><c:out value="${row.tittle}"/></a></td>
                   <td>[<c:out value="${row.date}"/>]</td>
                </tr>
                </c:forEach>
                </table>
                </div>
              </div>
            </div>
            <!- 通知栏 ->
            <div class="col-5">
              <div class="card" style="height: 250px;">
                <div class="card-header">没想好放啥</div>
                <div class="card-body"></div>
              </div>
            </div>
            <!- 不知道是啥栏 ->
          </div>
          <div class="row">
            <div class="col" style="margin-top: 1rem;">
              <div class="card">
                <div class="card-header">
                  课程管理
                </div>
                <div class="card-body">
                  <div class="row">
                    <sql:query dataSource="${snapshot}" var="classresult">
                        SELECT * from class WHERE classid IN (SELECT classid FROM class WHERE teacherid = <%= session.getAttribute("userid")%>);
                      </sql:query>
                      <c:forEach var="row" items="${classresult.rows}">
                    <div class="col-4">
                      <div class="card">
                        <img
                          class="card-img-top rounded-0 border-left border-right"
                          src="https://static.koalarong.com/img/c1.jpg"
                          alt=""
                        />
                        <div class="card-body text-center">
                            <p class="text-left"><c:out value="${row.classname}"/></p>
                          <a href="./course.jsp?classid=<c:out value="${row.classid}"/>" class="btn btn-outline-primary btn-sm"
                            >课程建设</a
                          >
                          <button
                            type="button"
                            class="btn btn-outline-primary btn-sm"
                            data-toggle="modal"
                            data-target="#couseModalCenter<c:out value="${row.classid}"/>"
                          >
                            课程信息
                          </button>
                        </div>
                      </div>
                      <div
                        class="modal fade"
                        id="couseModalCenter<c:out value="${row.classid}"/>"
                        tabindex="-1"
                        role="dialog"
                        aria-labelledby="exampleModalCenterTitle"
                        aria-hidden="true"
                      >
                        <div
                          class="modal-dialog modal-dialog-centered"
                          role="document"
                        >
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5
                                class="modal-title"
                                id="exampleModalCenterTitle"
                              >
                                课程信息
                              </h5>
                              <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                              >
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                  <tbody>
                                    <tr>
                                      <th scope="row">课程名</th>
                                      <td><c:out value="${row.classname}"/></td>
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
                            <div class="modal-footer">
                              <p>*不知道注释啥</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </c:forEach>
                  </div>
                  <nav
                    aria-label="Page navigation example"
                    style="margin-top: 1rem;"
                  >
                    <ul class="pagination justify-content-end">
                      <li class="page-item">
                        <a class="page-link" href="#">Previous</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>
                </div>
              </div>
            </div>
          </div>
          <!- 课程栏 ->
        </div>
      </div>
    </div>

    <footer class="footer text-center" style="height: 74px;">
      <p class="copyright">Copyright © 2020 KoalaRong, All rights reserved</p>
    </footer>

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
