<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <a class="nav-link" href="admin-manage/index.jsp">教师管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="student-manage/index.jsp">教师管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="teacher-manage/index.jsp">教师管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="registrar-manage/index.jsp"
              >教务人员管理</a
            >
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
        <a href="../../logout.jsp">
        <button
          type="button"
          class="btn btn-outline-info"
        >
          注销
        </button>
        </a>

          <div
            class="modal fade"
            id="exampleModalCenter"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <form action="login.jsp" method="post">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">
                      用户登录
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
                    <div class="form-group">
                      <label>账号</label>
                      <div class="input-group form-group mb-3">
                        <div class="input-group-append">
                          <button
                            class="btn btn-outline-secondary dropdown-toggle"
                            type="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
                            选择身份
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="login-student.html"
                              >教师</a
                            >
                            <a class="dropdown-item" href="login-teacher.html"
                              >教师</a
                            >
                            <a class="dropdown-item" href="login-admin.html"
                              >教师</a
                            >
                          </div>
                        </div>
                        <input
                          type="text"
                          class="form-control"
                          name="id"
                          aria-label="Text input with dropdown button"
                        />
                      </div>
                      <label>密码</label>
                      <div class="input-group mb-3">
                        <input
                          type="password"
                          class="form-control"
                          name="password"
                          aria-describedby="basic-addon1"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-secondary"
                      data-dismiss="modal"
                    >
                      关闭
                    </button>
                    <input
                      type="submit"
                      class="btn btn-primary"
                      value="登录"
                      name="login"
                    />
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
    <!- 导航栏 ->

    <form action="studentview.jsp" method="POST">
      输入要查询的教师ID:<input type="text" name="id" />
      <input type="submit" value="查询" />
    </form>

    <form action="studentmod.jsp" method="POST">
      输入要修改的教师ID:<input type="text" name="id" />
      <input type="submit" value="修改" />
    </form>

    <form action="studentdel.jsp" method="POST">
      输入要删除的教师ID:<input type="text" name="id" />
      <input type="submit" value="删除" />
    </form>

    <footer class="footer text-center" style="height: 74px;">
      <p class="copyright">Copyright © 2020 KoalaRong, All rights reserved</p>
    </footer>

    <form action="studentadd.jsp" method="POST">
      输入要增加的教师ID:<input type="text" name="id" />
      输入要增加的教师密码:<input type="password" name="password" />
      输入要增加的教师姓名:<input type="text" name="name" />
      输入要增加的教师性别:<input type="text" name="sex" />
      输入要增加的教师学院:<input type="text" name="college" />
      输入要增加的教师职务:<input type="text" name="class" />
      <input type="submit" value="增加" />
    </form>
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
