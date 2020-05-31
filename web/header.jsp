<%--
  Created by IntelliJ IDEA.
  User: rnjst
  Date: 2020-05-17
  Time: 오후 6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<html>
<head>
    <meta charset="utf-8" />
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons">trending_down</i> <strong>Deeper</strong></a>

        <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
    </div>
    <form method="post" action="search.jsp">
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <&nbsp>
            </li>
            <li>

                <a class="input-lg waves-effect no-padding ">
                    <input type="text" class="form-control no-padding" placeholder="Search by Title" aria-label="Search" name="title"></a>

            </li>
            <li><button type="submit" class="button waves-effect waves-dark btn-rounded btn-sm my-0 ml-sm-2">검색</button></li>
            <li><a href="write.jsp" class="button waves-effect waves-dark btn-rounded secondary-content"><i class="material-icons">mode_edit</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>로그인</b> <i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
    </form>
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
                <a href="group.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 그룹 </a>
            </li>
            <li>
                <a href="myGroup.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 내 그룹 </a>
            </li>
            <li>
                <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 인기글 </a>
            </li>
            <li>
                <a href="developmentTools.jsp" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>통합개발환경 추천</a>
            </li>
        </ul>
    </div>

</nav>
</body>
</html>