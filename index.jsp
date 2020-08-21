<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>在线教育平台</title>
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
            <a class="nav-link" href="ad">管理员管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">学生管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">教师管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">教务人员管理</a>
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
          <button
            type="button"
            class="btn btn-outline-info"
            data-toggle="modal"
            data-target="#exampleModalCenter"
          >
            登录
          </button>

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
                      <label>账号<small class="form-text text-muted">请选择身份</small></label>
                      <div class="input-group form-group mb-3">
                        <div class="input-group-append">
                          <select class="custom-select" name="identity">
                            <option selected value="admin">管理员</option>
                            <option value="registrar">教务人员</option>
                            <option value="teacher">教师</option>
                            <option value="student">学生</option>
                          </select>
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

    <div id="homecarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#homecarousel" data-slide-to="0" class="active"></li>
        <li data-target="#homecarousel" data-slide-to="1"></li>
        <li data-target="#homecarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" style="height: 450px;">
        <div class="carousel-item active">
          <img
            src="https://static.koalarong.com/img/70110257_p0.jpg"
            class="d-block img-fluid"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="https://static.koalarong.com/img/74724305_p0.jpg"
            class="d-block img-fluid"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="https://static.koalarong.com/img/78830672_p0.jpg"
            class="d-block img-fluid"
            alt="..."
          />
        </div>
      </div>
      <a
        class="carousel-control-prev"
        href="#homecarousel"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a
        class="carousel-control-next"
        href="#homecarousel"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
      <h1>欢迎,管理员<%=session.getAttribute("adminname") %></h1>

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
