<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%

    
    
  String result;  
    
    
        
        //response.sendRedirect("index.html");
    
    //Creating a result for getting status that messsage is delivered or not!

   

    // Get recipient's email-ID, message & subject-line from index.html page

    Object id = session.getAttribute("user_id");
    Object email = session.getAttribute("email");
    String user_id = String.valueOf(id);
    String to = String.valueOf(email);
    
    String subject = "PICT MIS";
   // final String messg = request.getParameter("mess");
    String messg="YOUR USERNAME IS |" + user_id + "|  AND PASSWORD IS '123456'" ;

    final String from = "vaibhavatara@gmail.com";

    final String pass = "ccgpvrpa2020";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }
    session.setAttribute("stu_added","YES");
    response.sendRedirect("Admin.jsp");
    
%>

<title>Sending Mail in JSP</title>

<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

