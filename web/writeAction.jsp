<%@ page language="java" contentType="text/html; chrset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="post.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="write" class="post.Post" scope="page"/>
<jsp:setProperty name="write" property="title"/>
<jsp:setProperty name="write" property="contents"/>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <%
      String userID=null;;
      if(session.getAttribute("userID")!=null) {
        userID = (String) session.getAttribute("userID");
      }
      if(userID==null) {
        System.out.println("writeAction error 1");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')>");
        script.println("location.href='login.jsp'");
        script.println("</script>");
      }
      else {
        if (write.getContents() == null || write.getTitle()==null) {
          System.out.println("writeAction error 2");
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('입력되지 않은 사항이 있습니다')>");
          script.println("history.back()");
          script.println("</script>");

        } else {
          PostDAO postDAO = new PostDAO();
          //write(String title, String uid, String contents, int gid,String tag)
          int result = postDAO.write(write.getTitle(), userID, write.getContents(),0,write.getTag());

          if (result == -1) {
            System.out.println("writeAction error 3");
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글쓰기 실패')");
            script.println("history.back()");
            script.println("</script>");
          } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'post.jsp'");
            script.println("</script>");
          }
        }
      }
    %>
  </body>
</html>