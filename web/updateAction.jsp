<%@ page language="java" contentType="text/html; chrset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="posts.Posts" %>
<%@ page import="posts.PostsDAO" %>

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
    System.out.println("updateAction error 1");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 하세요')");
    script.println("location.href='login.jsp'");
    script.println("</script>");
  }


  int cid = 0;

  if(request.getParameter("cid") != null){
    cid = Integer.parseInt(request.getParameter("cid"));
  }
  if(cid == 0){
    System.out.println("updateAction error 2");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('유효하지 않은 글입니다.')");
    script.println("location.href='index.jsp'");
    script.println("</script>");
  }

  Posts posts = new PostsDAO().getPost(cid);

  if(!userID.equals(posts.getUid())){
    // 수정하는 사람과 로그인한 사람의 아이디 동일 하지 않는 경우
    System.out.println("updateAction error 6");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('권한이 없습니다.')");
    script.println("location.href='index.jsp'");
    script.println("</script>");
  } else { // 권한이 있는 경우
    if (request.getParameter("title") == null || request.getParameter("contents") == null || request.getParameter("tag") == null
            || request.getParameter("title").equals("") || request.getParameter("contents").equals("")) {
      System.out.println("updateAction error 4");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력되지 않은 사항이 있습니다')");
      script.println("history.back()");
      script.println("</script>");

    } else {
      PostsDAO postsDAO = new PostsDAO();
      // public int update(int cid, String title, String contents, String tag)
      int result = postsDAO.update(cid, request.getParameter("title"), request.getParameter("contents"), request.getParameter("tag"));

      if (result == -1) {
        System.out.println("updateAction error 5");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('글 수정 실패')");
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