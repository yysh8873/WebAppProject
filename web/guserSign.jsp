<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="group.GroupDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="group" class="group.Group" scope="page"/>
<jsp:setProperty name="group" property="uid" />
<jsp:setProperty name="group" property="gid" />
<!DOCTYPE html><%--
  Created by IntelliJ IDEA.
  User: 우주영
  Date: 2020-06-13
  Time: 오후 6:54
  To change this template use File | Settings | File Templates.
--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
<%
    // 1. 로그인검사
    String userID = null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    if (userID == null) {
        System.out.println("No login error");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    else {
    }

    //그룹 존재 여부
    int gid = 0;

    if(request.getParameter("gid") != null){
        gid = Integer.parseInt(request.getParameter("gid"));
    }
    if(gid == 0) {
        System.out.println("update error 2");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 그룹입니다')");
        script.println("location.href='myGroup.jsp'");
        script.println("</script>");
    }

    String uid = "";
    if(request.getParameter("uid") != null) {
        uid = request.getParameter("uid");
    }

    GroupDAO groupDAO = new GroupDAO();
    // 2. 그룹장 확인
    if(userID.equals(groupDAO.getGroupMasterID(gid))) {
        // 3. 그룹멤버 승인
        int result = groupDAO.groupMemIn(uid, gid);
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('그룹원 승인에 실패했습니다.')");
            script.println("location.href='groupMember.jsp?gid="+gid+"'");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('가입 승인했습니다.')");
            script.println("location.href='groupMember.jsp?gid="+gid+"'");
            script.println("</script>");
        }
    }
    else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('그룹장이 아닙니다.')");
        script.println("location.href='myGroup.jsp'");
        script.println("</script>");
    }
%>
</body>
</html>
