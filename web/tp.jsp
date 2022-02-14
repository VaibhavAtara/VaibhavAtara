<%-- 
    Document   : tp
    Created on : 5 Oct, 2018, 12:30:37 PM
    Author     : HP
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
    String result="";
    String pass="123456";
    int no_of_roll = 0;
    int cont =0;
    int no_of_students=0;
    String roll="";
    String div="";
    
    String class_name="nine";
    String firstname="",lastname="",email="",uname="",exists="NO";
    String section="";
    BufferedReader reader;
    try {
			reader = new BufferedReader(new FileReader(
					"F:/pdf/text.txt"));
			String line = reader.readLine();
			while (line != null) {
				System.out.println(line);
				//
                                
                                int s1 = line.indexOf(' ');
                               firstname = line.substring(0, s1);
                               System.out.println(firstname);
                               int s2 = line.indexOf(' ',s1 + 1);
                               lastname = line.substring(s1, s2);
                               System.out.println(lastname);
                               int s3 = line.indexOf(' ',s2 + 1);
                               email = line.substring(s2+1, s3);
                               System.out.println(email);
                               int s4 = line.indexOf(' ',s3+1);
                               section = line.substring(s3+1, s4);
                               //section = section.substring(0,3);
                               System.out.println(section);
                               uname = firstname + lastname;
                               int s5 = line.indexOf('0');
                                System.out.println(s5);
                                //
                                
                                
                             no_of_roll = 0;
     roll="";
     div="";
     
     class_name="nine";
    if(section.equals("TE-10"))
        class_name="ten";
    //-----------------------------------------------------------------------------------------
    PreparedStatement ps =con.prepareStatement("insert into user(name,pass) values(?,?);");
     PreparedStatement ps1 =con.prepareStatement("select count(name)+1 from user where name like 'S%';");
     PreparedStatement ps2 =con.prepareStatement("select count(class)+1 from student where class = ?;");
     PreparedStatement ps3 =con.prepareStatement("insert into student values (?,?,?,?,?)");
     PreparedStatement ps4 =con.prepareStatement("insert into toc_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps5 =con.prepareStatement("insert into sepm_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps6 =con.prepareStatement("insert into hci_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps7 =con.prepareStatement("insert into os_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps8 =con.prepareStatement("insert into dbms_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
    //------------------------------------------------------------------------------------------
      PreparedStatement ps0 =con.prepareStatement("select email from student;");
      ResultSet rs0 = ps0.executeQuery();
      
      while(rs0.next())
      {
          
          
          if(rs0.getString(1).equals(email))
          {
            
                exists = "YES";
                break;
              //session.setAttribute("already_added", "YES");
              //response.sendRedirect("Admin.jsp");
              
          }
          
      }
          if(exists.equals("YES"))
          {
              exists = "NO";
              line = reader.readLine();
              continue;
          }
     
    //-----------------------------------------------------------------------------------------------
    ResultSet rs1 = ps1.executeQuery();  //for user_id
    ps2.setString(1,section);
    ResultSet rs2 = ps2.executeQuery(); //for roll no
    //------------------------------------------------------------------------------------------------
    if(rs1.next())
           {
              no_of_students=rs1.getInt(1);
           }
    
    if(rs2.next())
    {
              no_of_roll=rs2.getInt(1);
    }
    //------------------------------------------------------------------------------------------------
    //for generating user_id
    
    String count=String.valueOf(no_of_students);
              StringBuilder sb = new StringBuilder();
             while(sb.length()+count.length()<6) {
             sb.append('0');
                 }
                 sb.append(no_of_students);
                 String finalid = sb.toString();
             
           String user_id ="S2K18" + finalid;
         ps.setString(1,user_id);
         ps.setString(2,pass);
         ps.executeUpdate();
    //------------------------------------------------------------------------------------------------
     //for generating roll no
         roll=String.valueOf(no_of_roll);
           
           if(section.equals("TE-10"))
              div="30";
           else
               div="39";
           
           
           StringBuilder sb1 = new StringBuilder();
           while(sb1.length()+roll.length()<2) {
             sb1.append('0');
                 }
                 sb1.append(no_of_roll);
                String div_roll = sb1.toString();
              String roll_no = div+div_roll;
              
              
         //------------------------------------------------------------
         //inserting in student table
              ps3.setString(1,user_id);
              ps3.setString(2,roll_no);
              ps3.setString(3,uname);
              ps3.setString(4,section);
               ps3.setString(5,email);
              ps3.executeUpdate();
        //---------------------------------------------------------------------------------
        //inserting into subjects table
      
        
     ps4.setString(1,roll_no);
     ps4.setString(2,"TOC");
     ps4.setInt(3,0);
     ps4.setInt(4,0);
     ps4.executeUpdate();
     
     
     ps5.setString(1,roll_no);
     ps5.setString(2,"SEPM");
     ps5.setInt(3,0);
     ps5.setInt(4,0);
     ps5.executeUpdate();
     
     
     ps6.setString(1,roll_no);
     ps6.setString(2,"HCI");
     ps6.setInt(3,0);
     ps6.setInt(4,0);
     ps6.executeUpdate();
     
     
     ps7.setString(1,roll_no);
     ps7.setString(2,"OS");
     ps7.setInt(3,0);
     ps7.setInt(4,0);
     ps7.executeUpdate();
     
     
     ps8.setString(1,roll_no);
     ps8.setString(2,"DBMS");
     ps8.setInt(3,0);
     ps8.setInt(4,0);
     ps8.executeUpdate();
        
        
        //-------------------------------------------------------------------------------
        //session.setAttribute("email",email);
       //session.setAttribute("user_id",user_id);
       //response.sendRedirect("successfullyadded.jsp");
       //response.sendRedirect("Admin.jsp");   
                                
          
    String to = email;
    
    String subject = "PICT MIS";
   // final String messg = request.getParameter("mess");
    String messg="YOUR USERNAME IS |" + user_id + "|  AND PASSWORD IS '123456'" ;

    final String from = "walkeryellow18@gmail.com";

    final String password = "vaibhavatara18";

 

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

    props.put("mail.password", password);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, password);

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
    //session.setAttribute("stu_added","YES");
    //response.se                     
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
				line = reader.readLine();
                                cont++;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    

      session.setAttribute("stu_added","YES");
      session.setAttribute("count",cont);
      response.sendRedirect("Admin.jsp");
                     
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <form> 
                <input type="file" name="file"> 
                <label for="fileupload"><%out.println(result);%></label> 
                <input type="submit" value="submit">
            </form>


        </h1>
    </body>
</html>
