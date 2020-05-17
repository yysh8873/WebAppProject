<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 소개</title>

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
            <h1 class="page-header">
                Deeper <small>개발자들을 위한 SNS</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">소개</a></li>
                <li class="active">사이트 소개</li>
            </ol>

        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-action">
                            소개
                        </div>
                        <div class="card-content">
                            <p>홈페이지에 대한 소개 및 사용법 안내</p>
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
