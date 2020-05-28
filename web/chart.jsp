<%@ page import="posts.PostsDAO" %>
<%@ page import="posts.Posts" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 인기글</title>

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
<div id="wrapper">
    <%@ include file="/header.jsp" %>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                인기글
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">인기글</a></li>
                <li class="active">좋아요 순위</li>
            </ol>

        </div>
        <div id="page-inner">
            <%
                String userID = null;
                if(session.getAttribute("userID")!=null) {
                    userID = (String) session.getAttribute("userID");
                }

                int pageNumber = 1;
                if(request.getParameter("pageNumber") != null){
                    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                }

            %>
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        인기글
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover ">
                                <thead>
                                <tr>
                                    <th class="center">글번호</th>
                                    <th class="center">글 제목</th>
                                    <th class="center">작성자</th>
                                    <th class="center">작성일</th>
                                    <th class="center">좋아요</th>
                                </tr>
                                </thead>
                                <%
                                    PostsDAO postsDAO = new PostsDAO();
                                    ArrayList<Posts> list = postsDAO.getListLike(pageNumber);
                                    for(int i = 0; i < list.size(); i++){
                                        if(list.get(i).getGid() == 0) {
                                %>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td class="center"><a href="post.jsp?cid=<%=list.get(i).getCid()%>"> <%= list.get(i).getCid() %></a></td>
                                    <td class="center"><a href="post.jsp?cid=<%=list.get(i).getCid()%>"> <%= list.get(i).getTitle() %></a></td>
                                    <td class="center"><a href="post.jsp?cid=<%=list.get(i).getCid()%>"> <%= list.get(i).getUid() %></a></td>
                                    <td lass="center"><a href="post.jsp?cid=<%=list.get(i).getCid()%>"> <%= list.get(i).getTdate() %></a></td>
                                    <td class="center"><a href="post.jsp?cid=<%=list.get(i).getCid()%>"> <%= list.get(i).getLikes() %></a></td>
                                </tr>
                                </tbody>
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <%
                                if(pageNumber != 1) {
                            %>
                            <a href="chart.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-secondary pull-left">이전으로</a>
                            <%
                                } if (postsDAO.nextPage(pageNumber + 1)) {
                            %>
                            <a href="chart.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-secondary pull-right">다음으로</a>
                            <%
                                }
                            %>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
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
<!-- DATA TABLE SCRIPTS -->
<script src="resources/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="resources/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>$(document).ready(function () {$('#dataTables-example').dataTable();});</script>
<!-- Custom Js -->
<script src="resources/assets/js/custom-scripts.js"></script>


</body>

</html>
