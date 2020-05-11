<%--
  Created by IntelliJ IDEA.
  User: 우주영
  Date: 2020-05-04
  Time: 오후 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="uid" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="email" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>

<%
    if (user.getUid() == null || user.getName() == null || user.getEmail() == null || user.getPw() == null) {
        System.out.println("빈칸 존재");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('빈칸을 전부 입력해 주세요')>");
        script.println("history.back()");
        script.println("</script>");
    } //빈칸 검사
    else {
        UserDAO userDAO = new UserDAO();
        int dup = userDAO.idDuplication(user.getUid());
        if(dup == 1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('중복된 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } // 아이디 중복 검사
        else {
            int result = userDAO.register(user.getUid(), user.getName(), user.getEmail(), user.getPw());

            if (result == -1 || dup == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('회원가입에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
            } //DB 실패
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('회원가입이 완료되었습니다')");
                script.println("location.href = 'login.jsp'");
                script.println("</script>");
            } //삽입 완료
        }
    }
%>
</body>
</html>
