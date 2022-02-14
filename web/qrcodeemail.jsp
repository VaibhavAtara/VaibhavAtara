
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.DataSource"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*,javax.mail.*"%>



<%

    
    
    
    
    Class.forName("com.mysql.cj.jdbc.Driver");  
       Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
       PreparedStatement ps =con.prepareStatement("select * from student where username=?;" );
       PreparedStatement ps1 =con.prepareStatement("select * from user where name=?;" );
        PreparedStatement ps2 =con.prepareStatement("select * from teacher where username=?;" );
        //response.sendRedirect("index.html");
    
    //Creating a result for getting status that messsage is delivered or not!

    String result;
    ResultSet rs;
    // Get recipient's email-ID, message & subject-line from index.html page

    final String id = request.getParameter("id");
    ps1.setString(1,id);
    ps.setString(1,id);
     ps2.setString(1,id);
    ResultSet rs1 = ps1.executeQuery();
    if(id.charAt(0)=='T')
    {
       
        rs = ps2.executeQuery();
    }
    else{
    
    
     rs = ps.executeQuery();
    }
    
    if(rs.next())
    {}
    else
    {
        response.sendRedirect("index.html");
    }
    if(rs1.next())
    {
    }
    else
    {
        response.sendRedirect("forgotpassword.html");
    }
    String subject = "REGARDING RESETING PASSWORD";
   // final String messg = request.getParameter("mess");
    String messg="YOUR PASSWORD  FOR OUR ATTENDANCE MANAGEMENT WEBSITE IS " + rs1.getString("pass");
    
    String to=rs.getString("email");
 

    // Sender's email ID and password needs to be mentioned

    final String from = "walkeryellow18@gmail.com";

    final String pass = "vaibhavatara18";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol","smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "25");

 

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

        // correct
        
             
    //4) create new MimeBodyPart object and set DataHandler object to this object      
    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
  
    String filename = "C:/Users/HP/Documents/NetBeansProjects/dd/web/loginicon.png";//change accordingly  
    DataSource source = new FileDataSource(filename);  
    messageBodyPart2.setDataHandler(new DataHandler(source));  
    messageBodyPart2.setFileName(filename);  
     
     
    //5) create Multipart object and add MimeBodyPart objects to this object      
    Multipart multipart = new MimeMultipart();  
     
    multipart.addBodyPart(messageBodyPart2);  
  
    //6) set the multiplart object to the message object  
    message.setContent(multipart );  
     
        
        
        //correct

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();
        out.println(mex);
        result = "Error: unable to send mail....";

    }

%>

<title>Sending Mail in JSP</title>

<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

<b><center><font color="red"><% out.println(result);%></b><%-- 
    Document   : qrcodeemail
    Created on : 13 Oct, 2018, 9:57:04 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
