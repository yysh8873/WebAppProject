<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="posts.Posts" %>
<%@ page import="posts.PostsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 포스트</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="resources/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="resources/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="resources/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="resources/assets/css/custom-styles.css" rel="stylesheet" />
    <link href="resources/assets/css/custom-styles2.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="resources/assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("userID") != null) {
        System.out.println("userID error");
        userID = (String) session.getAttribute("userID");
    }

    int cid = 0;
    if(request.getParameter("cid") != null){
        System.out.println("cid != null ");
        cid = Integer.parseInt(request.getParameter("cid"));
    }
    if(cid == 0){
        System.out.println("No post error");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
    }

    Posts posts = new PostsDAO().getPost(cid);
%>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons">trending_down</i> <strong>Deeper</strong></a>

            <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li>
                <&nbsp>
            </li>
            <li>
                <a class="input-lg waves-effect no-padding ">
                    <input type="search" class="form-control no-padding" placeholder="Search" aria-label="Search"></a>
            </li>
            <li><a class="button waves-effect waves-dark btn-rounded btn-sm my-0 ml-sm-2" href="search.jsp">검색</a></li>
            <li><a href="write.jsp" class="button waves-effect waves-dark btn-rounded secondary-content"><i class="material-icons">mode_edit</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>로그인</b> <i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
    </nav>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="myInfo.jsp"><i class="fa fa-user fa-fw"></i> 회원정보 보기</a>
        </li>
        <li><a href="changeUserInfo.jsp"><i class="fa fa-gear fa-fw"></i> 회원정보 수정</a>
        </li>
        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
        </li>
    </ul>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu waves-effect waves-dark" href="index.jsp"><i class="fa fa-dashboard"></i> Home</a>
                </li>
                <li>
                    <a href="myPost.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 내 포스트</a>
                </li>
                <li>
                    <a href="myGroup.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 그룹 </a>
                </li>
                <li>
                    <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 인기글 </a>
                </li>
                <li>
                    <a href="introduction.jsp" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>홈페이지 소개</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                <%= posts.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> <small><%= posts.getUid() %></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#"><%= posts.getUid() %></a></li>
                <li class="active"><%= posts.getTdate() %></li>
            </ol>

        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-action card-title">
                            <%= posts.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
                        </div>
                        <div class="card-content" >
                            <p>작성자: <%= posts.getUid() %></p>
                            <p>작성일: <%= posts.getTdate() %></p>
                            <hr>
                            <p aria-colspan="2", style="min-height: 200px; text-align: left">
                                <%= posts.getContents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
                            <br>
                            <hr>
                            <p><strong>등록된 해시태그 [ <%= posts.getTag() %> ] </strong> </p>
                            <br>
                            <div class="input-field col s12 right-align bottom-right">
                                <%
                                    if(userID != null && userID.equals(posts.getUid())){

                                %>
                                    <a href="update.jsp?cid=<%= cid %>" class="waves-effect waves-light btn blue white-text" href="index.jsp"><i class="material-icons left">visibility_off</i>삭제</a>
                                    <a href="deleteAction.jsp?cid=<%= cid %>" class="waves-effect waves-light btn yellow text-darken-1" href="write.jsp"><i class="material-icons left">repeat</i>수정</a>
                                <%
                                    }
                                %>
                                <a class="waves-effect waves-light btn"><i class="material-icons left">thumb_up</i>좋아요</a>
                                <a href="index.jsp" class="waves-effect waves-light btn pink" href="write.jsp"><i class="material-icons left">done</i>확인</a>
                            </div>
                            <div class="clearBoth"><br/></div>
                        </div>
                    </div>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
    </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="resources/assets/js/jquery-1.10.2.js"></script>

        <!-- Bootstrap Js -->
        <script src="resources/assets/js/bootstrap.min.js"></script>

        <script src="resources/assets/materialize/js/materialize.min.js"></script>

        <!-- Metis Menu Js -->
        <script src="resources/assets/js/jquery.metisMenu.js"></script>
        <!-- Custom Js -->
        <script src="resources/assets/js/custom-scripts.js"></script>



</body>

</html>
