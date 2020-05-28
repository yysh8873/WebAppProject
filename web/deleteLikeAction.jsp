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
  if(userID == null) {
    System.out.println("deleteLikeAction error 1");
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
    System.out.println("deleteLikeAction error 2");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('유효하지 않은 글입니다.')");
    script.println("location.href='index.jsp'");
    script.println("</script>");
  }

  Posts posts = new PostsDAO().getPost(cid);

  PostsDAO postsDAO = new PostsDAO();
      // public int deleteLike(int cid, String uid)
     //public int deleteLike2(int cid)
      int result = postsDAO.deleteLike(cid, userID);
      int result2 = postsDAO.deleteLike2(cid);

      if (result == -1 || result2 == -1) {
        System.out.println("deleteLikeAction error 4");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('좋아요 취소 실패')");
        script.println("history.back()");
        script.println("</script>");
      } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'myPost_likes.jsp'");
        script.println("</script>");
      }
%>
</body>
</html>