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
<%!
    public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
        PasswordAuthentication pa;
        public MyAuthentication(){
            pa=new PasswordAuthentication("yoso1516@gmail.com","yoso1516");
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
    String fromName = "통합구현 이메일 테스트";
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
        msg.setSubject(MimeUtility.encodeText("통합구현 이메일 테스트", "utf-8","B"));
        msg.setContent("통합구현 이메일 테스트입니다.", "text/html;charset=utf-8");
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


        Transport.send(msg);


    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
        return;
    }

    out.println("<script>alert('메일이 전송되었습니다.');<script>");

%>
