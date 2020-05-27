<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-22
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="me" class="user.User" scope="page"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Deeper - 내정보</title>
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
        내 정보
      </h3>
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">내 정보</a></li>
        <li class="active">회원정보 보기</li>
      </ol>
    </div>
    <div id="page-inner">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <%
              String userID=null;
              if(session.getAttribute("userID")!=null) {
                userID = (String) session.getAttribute("userID");
              }
              UserDAO user = new UserDAO();
            %>
            <div class="card-action">
              내 정보
            </div>
            <div class="card-content">

              <p><strong>ID :</strong><%=userID%> </p>
              <br>
              <p><strong>이름 :</strong> <%=user.myName(userID)%> </p>
              <br>
              <p><strong>이메일 :</strong> <%=user.myEmail(userID)%> </p>
              <br>
              <p><strong>게시글 수 :</strong> <%=user.myPostCnt(userID)%> </p>
              <br>
              <p><strong>그룹 수 :</strong><%=user.myGroupCnt(userID)%></p>
              <div class="input-field col s12 right-align bottom-right">
                <a class="waves-effect waves-light btn yellow" href="changeUserInfo.jsp"><i class="material-icons left">repeat</i>수정</a>
              </div>
              <div class="clearBoth"><br/></div>

            </div>
          </div>
        </div>
        <!-- /. PAGE INNER  -->
      </div>
      <!-- /. PAGE WRAPPER  -->
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