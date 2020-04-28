<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 내그룹</title>

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
                    <a href="myPost.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 내 포스트</a>
                </li>
                <li>
                    <a href="myGroup.jsp" class="active-menu waves-effect waves-dark"><i class="fa fa-qrcode"></i> 그룹 </a>
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
    <div id="page-wrapper" >
        <div class="header">
            <h1 class="page-header">
                그룹
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">그룹</a></li>
                <li class="active">내가 가입한 그룹(그룹 목록)</li>
            </ol>

        </div>

        <div id="page-inner">

            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="card teal">
                        <div class="card-content white-text">
                            <span class="card-title">그룹 이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">그룹 이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">그룹이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card light-green darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">그룹이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card red darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">그룹이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card yellow darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">그룹이름</span>
                            <p>그룹 소개, 해시태그, 그 외</p>
                        </div>
                        <div class="card-action">
                            <a href="group.jsp">입장하기</a>
                            <a href="#">탈퇴하기</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="card purple darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">원하시는 그룹이 없으신가요?</span>
                            <p>나만의 그룹을 만들어보세요</p>
                        </div>
                        <div class="card-action">
                            <a href="makrGroup.jsp">그룹 만들기</a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /. ROW  -->
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
<script>
    $(document).ready(function(){
        $('ul.tabs').tabs();
        $('.collapsible').collapsible({
                accordion: false, // A setting that changes the collapsible behavior to expandable instead of the default accordion style
                onOpen: function(el) { alert('Open'); }, // Callback for Collapsible open
                onClose: function(el) { alert('Closed'); } // Callback for Collapsible close
            }
        );
    });
</script>


</body>

</html>
