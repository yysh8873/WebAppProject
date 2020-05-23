<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="posts.Posts" %>
<%@ page import="posts.PostsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="search" class="posts.Posts" scope="page"/>
<jsp:setProperty name="search" property="tag"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Deeper - 검색결과</title>
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
<div id="wrapper">
  <%@ include file="/header.jsp" %>
  <!-- /. NAV SIDE  -->

  <div id="page-wrapper">
    <div class="header">
      <h3 class="page-header">
        검색어
      </h3>
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">전체 포스트</a></li>
        <li class="active">검색 결과</li>
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
              <b>포스트 목록</b>
            </div>
            <div class="card-image">
              <ul class="collection">
                <a href="posts.jsp" type="inline" style="text-decoration:none">
                  <li class="collection-item avatar">
                    <i class="material-icons circle yellow">track_changes</i>
                    <!--<span class="title">글 제목</span>
                    <p>글쓴이<br>
                      게시글 미리보기
                    </p>
                    <a href="#!" class="secondary-content"><i class="material-icons">thumb_up</i></a>
                    -->
                      <%
                           PostsDAO postsDAO = new PostsDAO();
                           ArrayList<Posts> list = postsDAO.getPostByTag(pageNumber, search.getTag());
                           System.out.println("search.jsp -pageNumber = "+ pageNumber);
                           System.out.println("search.jsp -tag = "+ search.getTag());
                           for(int i = 0; i < list.size(); i++){

                      %>
                    <a href="post.jsp?cid=<%= list.get(i).getCid() %>" type="inline" style="text-decoration:none">
                  <li class="collection-item avatar">
                    <i class="circle light-blue white-text"><%= list.get(i).getCid() %></i>
                    <span class="title" style="text-size: 15px"><%= list.get(i).getTitle() %></span>
                    <p><%= list.get(i).getUid() %></p>
                    <p style="color: gray"><%= list.get(i).getTdate() %></p>
                    <br>
                    <p aria-colspan="2", style="max-height: 11px; text-align: left"> <%= list.get(i).getTag() %> </p>
                    <a href="#!" class="secondary-content"><i class="material-icons">thumb_up</i></a>
                  </li></a>
                <%
                  }
                %>
              </ul>
              <%
                if(pageNumber != 1) {
              %>
              <a href="myPost.jsp?" class="btn btn btn-light btn pull-left">이전으로</a>
              <%
                } if (postsDAO.nextPage(pageNumber + 1)) {
                System.out.println("pageNumber = "+ pageNumber);
              %>
              <a href="myPost_my.jsp?" class="btn btn btn-light btn pull-right">더보기</a>
              <%
                }

              %>
                  </li></a>

              </ul>
            </div>
          </div>



        </div>
      </div>
      <!-- /. ROW  -->
      <div class="fixed-action-btn horizontal click-to-toggle">
        <a class="btn-floating btn-large red">
          <i class="material-icons">menu</i>
        </a>
        <ul>
          <li><a class="btn-floating red"><i class="material-icons">track_changes</i></a></li>
          <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
          <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
          <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
        </ul>
      </div>
    </div>
    <!-- /. PAGE INNER  -->
  </div>
  <!-- /. PAGE WRAPPER  -->
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
