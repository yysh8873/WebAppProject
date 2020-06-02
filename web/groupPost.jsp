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
<%@ page import="java.util.ArrayList" %>
<%@ page import="group.GroupDAO" %>
<%@ page import="group.Group" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Deeper - 그룹</title>
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
    System.out.println("userID error");
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

  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null){
    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }

  int gid = 0;

  if(request.getParameter("gid") != null){
    gid = Integer.parseInt(request.getParameter("gid"));
  }
  if(gid == 0) {
    System.out.println("update error 2");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('존재하지 않는 그룹입니다')");
    script.println("history.back()");
    script.println("</script>");
  }
  PostsDAO postsDAO = new PostsDAO();
  GroupDAO groupDAO = new GroupDAO();
%>
<div id="wrapper">
  <%@ include file="/headerGroup.jsp" %>

  <!-- /. NAV SIDE  -->

  <div id="page-wrapper">
    <div class="header">
      <h1 class="page-header">
        <%= groupDAO.getGroupName(gid) %>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">그룹</a></li>
        <li class="active"><%= groupDAO.getGroupName(gid) %></li>
      </ol>
    </div>
    <div id="page-inner">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-action">
              <b>포스트 목록</b>
            </div>
            <div class="card-image">
              <ul class="collection">
                <%
                  ArrayList<Posts> list = postsDAO.getGroupList(pageNumber, gid);
                  for(int i = 0; i < list.size(); i++){
                %>
                <a href="post.jsp?cid=<%= list.get(i).getCid() %>" type="inline" style="text-decoration:none">
                  <li class="collection-item avatar">
                    <i class="circle yellow white-text"><%= list.get(i).getCid() %></i>
                    <span class="title"><%= list.get(i).getTitle() %></span>
                    <p><%= list.get(i).getUid() %><br>
                      <%= list.get(i).getContents() %>
                    </p>
                    <a href="#!" class="secondary-content"><i class="material-icons">thumb_up</i></a>
                  </li></a>
                <%
                  }
                %>
              </ul>
              <%
                if(pageNumber != 1) {
              %>
              <a href="groupPost.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn btn-light btn pull-right">이전으로</a>
              <%
                } if (postsDAO.nextPage(pageNumber + 1)) {
              %>
              <a href="groupPost.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn btn-light btn pull-right">다음으로</a>
              <%
                }
              %>
            </div>
          </div>



        </div>
      </div>
      <div class="row">

        <div class="col-md-12">
          <div class="card">
            <div class="card-content">
              <div class="alert alert-success">
                <strong><%=groupDAO.getGroupMaster(gid)%></strong> 그룹장
              </div>
                <%
                    ArrayList<Group> guserlist = groupDAO.getGPeopleList(gid);
                    for(int i = 0; i < guserlist.size(); i++){
                %>
              <div class="alert alert-info">
                <strong><%= guserlist.get(i).getUid()%></strong> 그룹원
              </div>
                <%
                    }
                %>
            </div>
            <div class="card-action">
              <a href="groupGetout.jsp?gid=<%= gid%>&userID=<%=userID%>">탈퇴하기</a>
              <a href="groupDelete.jsp?gid=<%= gid%>&userID=<%=userID%>">그룹 삭제하기</a>
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
