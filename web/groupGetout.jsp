<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
</head>
<body><%--
  Created by IntelliJ IDEA.
  User: 우주영
  Date: 2020-06-08
  Time: 오후 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
</head>
<body>
<%
    // 로그인 검사
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

    GroupDAO groupDAO = new GroupDAO();
    //그룹장 검사: 그룹장은 탈퇴할 수 없습니다.
    if(userID == groupDAO.getGroupMasterID(gid)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('그룹장은 탈퇴할 수 없습니다.')");
        script.println("location.href='myGroup.jsp'");
        script.println("</script>");
    }
     //그 외: 탈퇴되었습니다
    else {
        int result = groupDAO.groupOut(userID, gid);
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('탈퇴에 실패했습니다.')");
            script.println("location.href='myGroup.jsp'");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('탈퇴되었습니다.')");
            script.println("location.href='myGroup.jsp'");
            script.println("</script>");
        }
    }

%>

</body>

</html>
