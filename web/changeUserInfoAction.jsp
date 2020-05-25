<%--
  Created by IntelliJ IDEA.
  User: 권시연
  Date: 2020-05-23
  Time: 오후 7:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="name" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 유저정보수정</title>
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("userID")!=null) {
        userID = (String) session.getAttribute("userID");
    }
    if(userID==null) {
        System.out.println("changeUserAction login error");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    else {
        UserDAO userDAO = new UserDAO();
        // 입력 값을 받아와서 login 함수에 넣기
        int result = userDAO.updateUserInfo(userID, user.getPw(), user.getName(), user.getEmail());    // 결과값
        if(result == 1){ // 업데이트 성공
            System.out.println("회원정보 업데이트 성공");
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'myInfo.jsp'"); // 로그인 성공 시, 이동
            script.println("</script>");
        }

        else { // db 오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다')");
            script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
            script.println("</script>");
        }
    }
%>
</body>
</html>
