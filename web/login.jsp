<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-27
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 로그인</title>
    <link rel="stylesheet" href="resources/assets/css/login.css">
</head>
<body>
<%session.invalidate();%>
<div class="login-page">
    <div class="form">
        <form class="login-form" method="post" action="loginAction.jsp">
            <input type="text" placeholder="ID" name="uid" />
            <input type="password" placeholder="password" name="pw"/>
            <button type="submit"> 로그인 </button>
            <p class="message">계정이 없으신가요? <a href="register.jsp">회원가입</a></p>
            <p class="message">비밀번호를 까먹으셨나요? <a href="email.jsp">비밀번호 찾기</a></p>
        </form>
    </div>
</div>
<script src="resources/assets/js/login.js"></script>
</body>
</html>
