<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-05-03
  Time: 오후 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="uid" />
<jsp:setProperty name="user" property="pw" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 로그인</title>
</head>
<body>
<%
    UserDAO userDAO = new UserDAO();
    // 입력 값을 받아와서 login 함수에 넣기
    int result = userDAO.login(user.getUid(), user.getPw());    // 결과값
    if(result == 1){ // 로그인 성공
        session.setAttribute("userID",user.getUid());
        System.out.println("로그인 성공");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp'"); // 로그인 성공 시, 이동
        script.println("</script>");
    }
    else if(result == 0){ // 비밀번호 불일치
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다')");
        script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
        script.println("</script>");
    }
    else if(result == -1){ // 아이디 존재X
        System.out.println("로그인 id 없음");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다')");
        script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
        script.println("</script>");
    }
    else if(result == -1){ // db 오류
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다')");
        script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
        script.println("</script>");
    }
%>
</body>
</html>