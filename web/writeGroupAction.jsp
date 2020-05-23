<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="posts.PostsDAO"%>
<%@ page import="group.GroupDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="write" class="posts.Posts" scope="page"/>
<jsp:setProperty name="write" property="title"/>
<jsp:setProperty name="write" property="contents"/>
<jsp:setProperty name="write" property="tag"/>
<jsp:useBean id="group" class="group.Group" scope="page"/>
<jsp:setProperty name="group" property="gname"/>

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
    System.out.println("writeAction error 1");
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 하세요')");
    script.println("location.href='login.jsp'");
    script.println("</script>");
  }
  else {
    if (write.getContents() == null || write.getTitle()==null) {
      System.out.println("writeAction error 2");
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력되지 않은 사항이 있습니다')");
      script.println("history.back()");
      script.println("</script>");

    } else {
      PostsDAO postsDAO = new PostsDAO();
      GroupDAO groupDAO = new GroupDAO();
      int gid=groupDAO.getGid(group.getGname());  //gname통해서 gid를 알아내고
      System.out.println("writeAction- gname: "+group.getGname());
      System.out.println("wrtieAction- gid: "+gid);
      int result = postsDAO.write(write.getTitle(), userID, write.getContents(),gid,write.getTag()); //포스트할 때는 gid로 등록

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
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
      }
    }
  }
%>
</body>
</html>