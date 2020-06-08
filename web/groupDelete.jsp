<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="group.GroupDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="group" class="group.Group" scope="page"/>
<jsp:setProperty name="group" property="uid" />
<jsp:setProperty name="group" property="gid" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 로그인</title>
</head>
<body>
<%
    //그룹장 o-> 삭제 가능
    //그룹장 x-> 삭제 불가

    String userID = null;
    if(session.getAttribute("userID")!=null) {
        userID = (String) session.getAttribute("userID");
    }

    GroupDAO groupDAO = new GroupDAO();

    // 입력 값을 받아와서 login 함수에 넣기
    int result = groupDAO.deleteGroup(group.getGid(), userID);    // 결과값
    if(result == 1){ // 삭제 성공
        groupDAO.deleteGuser(group.getGid());   // 삭제 성공하면 그룹 유저 정보도 삭제
        System.out.println("그룹 삭제 성공");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('그룹 삭제 성공')");
        script.println("location.href = 'myGroup.jsp'");
        script.println("</script>");
    }
    else { // 비밀번호 불일치
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('그룹 삭제 실패')");
        script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
        script.println("</script>");
    }
%>
</body>
</html>
