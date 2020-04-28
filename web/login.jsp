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
<div class="login-page">
    <div class="form">
        <form class="login-form">
            <input type="text" placeholder="ID" />
            <input type="password" placeholder="password" />
            <button type="button" onClick="return btn_login();"> 로그인 </button>
            <p class="message">계정이 없으신가요? <a href="register.jsp">회원가입</a></p>
        </form>
    </div>
</div>
<script src="resources/assets/js/login.js"></script>
<script type="text/javascript">
    function btn_login(){
        document.location.href="index.jsp";
    }
</script>
</body>
</html>
