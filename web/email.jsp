<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-06-09
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deeper - 비밀번호 찾기</title>
    <link rel="stylesheet" href="resources/assets/css/login.css">
</head>
<body>
<div class="login-page">
    <div class="form">
        <form class="login-form" action="searchPw.jsp" method="get">
            <p>
                아래 이메일주소를 입력하시면,<br>입력하신 이메일로<br>새암호를 보내드립니다<br>
                <br>
            <input type="text" name="username" placeholder="ID" />
            <input type="text" name="email" placeholder="email"/>
            <p>'@'포함한 이메일주소를<br>정확히 입력해주세요</p>
            <button type="submit"> 비밀번호 찾기 </button>
            <p class="message">로그인하시겠습니까? <a href="login.jsp">로그인</a></p>
        </form>
    </div>
</div>
</body>
</html>
