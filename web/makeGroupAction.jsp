<%@ page language="java" contentType="text/html; chrset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="group.GroupDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="group" class="group.Group" scope="page"/>
<jsp:setProperty name="group" property="gname"/>
<jsp:setProperty name="group" property="ginfo"/>
<jsp:setProperty name="group" property="tag"/>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
  String userID = null;
  if(session.getAttribute("userID")!=null) {
    userID = (String) session.getAttribute("userID");
  }
  if(userID==null) {
    System.out.println("makeGroupAction error 1");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 하세요')");
    script.println("location.href='login.jsp'");
    script.println("</script>");
  }
  else {
    if (group.getGinfo() == null || group.getGname()==null) {
      System.out.println("makeGroupAction error 2");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력되지 않은 사항이 있습니다')");
      script.println("history.back()");
      script.println("</script>");

    } else {
      GroupDAO groupDAO = new GroupDAO();
      //makeGroup(String gname, String ginfo, String tag, String uid)
      int result = groupDAO.makeGroup(group.getGname(), group.getGinfo(),group.getTag(), userID);

      if (result == -1) {
        System.out.println("makeGroupAction error 3");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('그룹 생성 실패')");
        script.println("history.back()");
        script.println("</script>");
      } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
      }
    }
  }
%>
</body>
</html>