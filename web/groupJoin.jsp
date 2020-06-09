<%@ page import="java.io.PrintWriter" %>
<%@ page import="group.GroupDAO" %><%--
  Created by IntelliJ IDEA.
  User: 우주영
  Date: 2020-06-08
  Time: 오후 10:43
  To change this template use File | Settings | File Templates.
--%>

<%
    // 1. 로그인 검사
    String userID = null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
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

    GroupDAO groupDAO = new GroupDAO();
    // 2. 이미 가입: 이미 가입한 그룹입니다
    int ismem = groupDAO.isGroupMember(userID, gid);
    if(ismem == 1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 가입한 그룹입니다.')");
        script.println("location.href='myGroup.jsp'");
        script.println("</script>");
    }

    //그 외: 신청되었습니다
    else {
        int result = groupDAO.groupJoin(userID, gid);
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당 그룹에 가입 신청을 실패했습니다.')");
            script.println("location.href='myGroup.jsp'");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('그룹에 가입 신청했습니다.')");
            script.println("location.href='myGroup.jsp'");
            script.println("</script>");
        }
    }
%>