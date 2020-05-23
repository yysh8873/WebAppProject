<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:31
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
    <title>Deeper - 내포스트</title>

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
    <style type="text/css">
        a, a:hover{
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    if (userID == null) {
        System.out.println("No login error");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    else {
    }
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
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="waves-effect waves-dark" href="index.jsp"><i class="fa fa-dashboard"></i> Home</a>
                </li>
                <li>
                    <a href="myPost.jsp" class="active-menu waves-effect waves-dark"><i class="fa fa-desktop"></i> 내 포스트</a>
                </li>
                <li>
                    <a href="group.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 그룹 </a>
                </li>
                <li>
                    <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 인기글 </a>
                </li>
                <li>
                    <a href="developmentTools.jsp" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>홈페이지 소개</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                내 포스트
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">내 포스트</a></li>
                <li class="active">내가 작성한 포스트 및 좋아요 포스트</li>
            </ol>
        </div>
        <div id="page-inner">
            <%
                    System.out.println("pageNumber ok");
                int pageNumber = 1;
                if(request.getParameter("pageNumber") != null){
                    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                }
            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-action">
                            <b>북마크 포스트</b>
                        </div>
                        <div class="card-image">
                            <ul class="collection">
                                <%
                                    PostsDAO postsDAO2 = new PostsDAO();
                                    ArrayList<Posts> list2 = postsDAO2.getMyLikeList(pageNumber, userID);
                                    System.out.println("list2.size() = "+ list2.size());
                                    for(int i = 0; i < list2.size(); i++){
                                %>
                                <a href="post.jsp?cid=<%= list2.get(i).getCid() %>" type="inline" style="text-decoration:none">
                                    <li class="collection-item avatar">
                                        <i class="circle light-blue white-text"><%= list2.get(i).getCid() %></i>
                                        <span class="title" style="text-size: 15px"><%= list2.get(i).getTitle() %></span>
                                        <p><%= list2.get(i).getUid() %></p>
                                        <p style="color: gray"><%= list2.get(i).getTdate() %></p>
                                        <br>
                                        <p aria-colspan="2", style="max-height: 11px; text-align: left"> <%= list2.get(i).getTag() %> </p>
                                        <a href="#!" class="secondary-content"><i class="material-icons">thumb_up</i></a>
                                    </li></a>
                                <%
                                    }
                                %>
                            </ul>
                            <%
                                if(pageNumber != 1) {
                            %>
                            <a href="myPost_likes.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn btn-light btn pull-left">이전으로</a>
                            <%
                                } if (postsDAO2.nextPage(pageNumber + 1)) {
                            %>
                            <a href="myPost_likes.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn btn-light btn pull-right">다음으로</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
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
    <!-- Morris Chart Js -->
    <script src="resources/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="resources/assets/js/morris/morris.js"></script>


    <script src="resources/assets/js/easypiechart.js"></script>
    <script src="resources/assets/js/easypiechart-data.js"></script>

    <script src="resources/assets/js/Lightweight-Chart/jquery.chart.js"></script>

    <!-- Custom Js -->
    <script src="resources/assets/js/custom-scripts.js"></script>


</body>

</html>
