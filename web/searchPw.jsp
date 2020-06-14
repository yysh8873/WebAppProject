<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-06-09
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="uid" />
<%!
    public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
        PasswordAuthentication pa;
        public MyAuthentication(){
            pa = new PasswordAuthentication("yoso1516@gmail.com", "yoso1516");
        }
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return pa;
        }
    }
%>


<%
    // SMTP 서버 주소
    String smtpHost = "smtp.gmail.com";


    //받는 사람의 정보
    String toName = request.getParameter("username");
    String toEmail = request.getParameter("email");


    //보내는 사람의 정보
    String fromName = "Deeper";
    String fromEmail = "yoso1516@gmail.com";

    try {
        Properties props = new Properties();
        props.put("mail.smtp.user", fromEmail);
        props.put("mail.smtp.host", "smtp.googlemail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        // 메일 인증
        Authenticator myauth=new MyAuthentication();
        Session sess=Session.getInstance(props, myauth);


        InternetAddress addr = new InternetAddress();
        addr.setPersonal(fromName,"UTF-8");
        addr.setAddress(fromEmail);


        Message msg = new MimeMessage(sess);
        msg.setFrom(addr);
        msg.setSubject(MimeUtility.encodeText("Deeper 새 비밀번호", "utf-8","B"));

        Random rand = new Random();
        String ran = Integer.toString(rand.nextInt(1000)) + "deeper"; //0~999 까지 난수 생성
        String content = "새로 설정된 비밀번호는 " + ran + "입니다.";

        System.out.println("설정된 비밀번호 = " +  ran);
        UserDAO userDAO = new UserDAO();
        // 입력 값을 받아와서 login 함수에 넣기
        int result = userDAO.updateUserPW(toName, ran, toEmail);    // 결과값
        if(result == 1){ // 업데이트 성공
            System.out.println("비밀번호 변경 성공");
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호 변경 성공')"); // 로그인 성공 시, 이동
            script.println("</script>");
        }

        else { // db 오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력하신 정보가 올바르지 않습니다')");
            script.println("history.back()"); // 이전페이지로 가기(다시 로그인 페이지로 가기)
            script.println("</script>");
            return;
        }


        msg.setContent(content, "text/html;charset=utf-8");
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


        Transport.send(msg);


    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
        return;
    }
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('메일이 전송되었습니다.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
%>
