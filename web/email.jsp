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
    <title>Title</title>
</head>
<body>
<div>
    <form action="searchPw.jsp" method="get">
        <h2>비밀번호 찾기</h2>
        <p>
            아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 새암호를 보내드립니다<br>
            <br>
        <div>
            <input type="text" name="username" placeholder="이름">
        </div>
        <div>
            <input type="text" name="email" placeholder="이메일주소">
            <p>'@'포함한 이메일주소를 정확히 입력해주세요.</p>
        </div>

        <div>
            <button type="submit">비밀번호찾기</button>
        </div>
    </form>
</div>
</body>
</html>
