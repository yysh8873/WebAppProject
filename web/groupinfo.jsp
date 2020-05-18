<%--
  Created by IntelliJ IDEA.
  User: 우주영
  Date: 2020-05-15
  Time: 오후 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="group.GroupDAO" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 그룹 상세 정보</title>

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
<div id="wrapper">
    <%@ include file="/header.jsp" %>
    <!-- /. NAV SIDE  -->

    <div id="page-wrapper">
        <div class="header">
            <h3 class="page-header">
                그룹 정보
            </h3>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">그룹</a></li>
                <li class="active">그룹 상세 정보</li>
            </ol>
        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <%
                            int gid = 0;

                            if(request.getParameter("gid") != null){
                                gid = Integer.parseInt(request.getParameter("gid"));
                            }
                            if(gid == 0){
                                System.out.println("update error 2");
                                PrintWriter script = response.getWriter();
                                script.println("<script>");
                                script.println("alert('존재하지 않는 그룹입니다')");
                                script.println("location.href='group.jsp'");
                                script.println("</script>");

                            GroupDAO group = new GroupDAO();
                        %>
                        <div class="card-action">
                            <%=group.getGroupName(gid)%>
                        </div>
                        <div class="card-content">

                            <p><strong>대표 태그 : </strong><%=group.getGroupTag(gid)%></p>
                            <br>
                            <p><strong>그룹장 : </strong><%=group.getGroupMaster(gid)%></p>
                            <br>
                            <p><strong>그룹원 수 : </strong> <%=group.getGroupCount(gid)%> </p>
                            <div class="input-field col s12 right-align bottom-right">
                                <a class="waves-effect waves-light btn yellow" href="groupJoin.jsp"><i class="material-icons left">repeat</i>가입하기</a>
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
