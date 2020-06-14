<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-22
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="posts.Posts" %>
<%@ page import="posts.PostsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Deeper - 포스트 수정</title>
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
  <%
    String userID = null;
    if(session.getAttribute("userID")!=null) {
      userID = (String) session.getAttribute("userID");
    }
    if (userID == null) {
      System.out.println("update error 1");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
    }

    int cid = 0;

    if(request.getParameter("cid") != null){
      cid = Integer.parseInt(request.getParameter("cid"));
    }
    if(cid == 0){
      System.out.println("update error 2");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('유효하지 않은 글입니다.')");
      script.println("location.href='index.jsp'");
      script.println("</script>");
    }

    Posts posts = new PostsDAO().getPost(cid);

    if(!userID.equals(posts.getUid())){
      // 수정하는 사람과 로그인한 사람의 아이디 동일 하지 않는 경우
      System.out.println("update error 3");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('권한이 없습니다.')");
      script.println("location.href='index.jsp'");
      script.println("</script>");
    }

  %>

  <!-- /. NAV SIDE  -->

  <div id="page-wrapper">
    <div class="header">
      <h1 class="page-header">
        포스트 수정
      </h1>
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">전체 포스트</a></li>
        <li class="active">포스트 수정</li>
      </ol>
    </div>
    <div id="page-inner">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-content">
              <form class="col s12" method="post" action="updateAction.jsp?cid=<%= cid%>">
                <div class="row">
                  <div class="input-field col s12">
                    <textarea id="textarea1" class="materialize-textarea" name="title"><%= posts.getTitle()%></textarea>
                    <label for="textarea1">글 제목</label>
                  </div>

                  <div class="input-field col s12">
                    <label for="textarea2">내용</label>
                    <textarea class="form-control materialize-textarea" id="textarea2" rows="10" name="contents"><%= posts.getContents()%></textarea>
                  </div>

                  <div class="input-field col s12">
                    <label for="textarea3">해시태그 등록</label>
                    <textarea class="form-control materialize-textarea" id="textarea3" name="tag" ><%= posts.getTag()%></textarea>
                  </div>
                  <div class="input-field col s12 right-align bottom-right">
                    <button type="submit" class="waves-effect waves-light btn yellow black-text"><i class="material-icons left">done</i>Re-Upload</button>
                  </div>
                </div>
              </form>
              <div class="clearBoth"></div>
            </div>
          </div>
        </div>
        <!-- /.row (nested) -->
      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /. PAGE WRAPPER  -->
  </div>
  <!-- /. ROW  -->
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
