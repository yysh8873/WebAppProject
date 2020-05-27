<%@ page import="group.GroupDAO" %>
<%@ page import="group.Group" %>
<%@ page import="java.util.ArrayList" %><%--
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

</head>
<body>
<div id="wrapper">
    <%@ include file="/headerGroup.jsp" %>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div class="header">
            <h1 class="page-header">
                그룹
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">그룹</a></li>
                <li class="active">전체 그룹</li>
            </ol>

        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="card purple darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">원하시는 그룹이 없으신가요?</span>
                            <p>나만의 그룹을 만들어보세요</p>
                        </div>
                        <div class="card-action">
                            <a href="makeGroup.jsp">그룹 만들기</a>
                        </div>
                    </div>
                </div>
                <%
                    GroupDAO groupDAO = new GroupDAO();
                    ArrayList<Group> list = groupDAO.getGroupList();
                    for(int i = 0; i < list.size(); i++){
                %>
                <div class="col-md-4 col-sm-4">
                    <div class="card teal">
                        <div class="card-content white-text">
                            <span class="card-title"><%= list.get(i).getGname() %></span>
                            <p><%= list.get(i).getTag() %></p>
                        </div>
                        <div class="card-action">
                            <a href="groupinfo.jsp?cid=<%= list.get(i).getGid() %>">정보 보기</a>
                            <a href="groupApply.jsp?cid=<%= list.get(i).getGid()%>">가입 신청</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

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
