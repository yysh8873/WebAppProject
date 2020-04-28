<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-27
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 회원가입</title>
    <link rel="stylesheet" href="resources/assets/css/login.css">
</head>
<body>
<div class="login-page">
    <div class="form">
        <form class="login-form">
            <input type="text" placeholder="이름" />
            <input type="text" placeholder="ID" />
            <input type="password" placeholder="PW" />
            <input type="text" placeholder="email" />
            <button type="button" onClick="return btn_login();"> 회원가입</button>
            <p class="message">로그인하시겠습니까? <a href="login.jsp">로그인</a></p>
        </form>
    </div>
</div>
<script src="resources/assets/js/login.js"></script>
</body>
</html>