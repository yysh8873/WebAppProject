<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-05-03
  Time: 오후 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="deeper.DeeperDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="deeper" class="deeper.Deeper" scope="page"/>
<jsp:setProperty name="deeper" property="title" />
<jsp:setProperty name="deeper" property="contents" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deeper - 로그인</title>
</head>
<body>
    <%
        String uid = null;
        if(session.getAttribute("uid") != null){
            uid = (String) session.getAttribute("uid");
        }
        if(uid == null){ // 로그인이 되어있지 않을 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 후, 작성이 가능합니다')");
            script.println("location.href = 'login.jsp'"); // 로그인 페이지로
            script.println("</script>");
        } else{
            // 정보 미 입력 시
            if (deeper.getTitle() == null || deeper.getContents() == null){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력이 안 된 사항이 있습니다.')");
                script.println("history.back()"); // 이전페이지로 가기
                script.println("</script>");
            }
            else{ // 데이터 베이스에 등록하기
                DeeperDAO deeperDAO = new DeeperDAO();
                int result = deeperDAO.write(deeper.getTitle(), uid, deeper.getContents());
                if(result == -1){ // 데이터 베이스 오류
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다')");
                    script.println("history.back()"); // 이전페이지로 가기
                    script.println("</script>");
                }
                else { // 작성 성공 시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'index.jsp'"); // 성공 후, 메인 페이지
                    script.println("</script>");
                }
            }
        }

    %>
</body>
</html>
