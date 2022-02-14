<%-- 
    Document   : attconfirmation
    Created on : 16 Sep, 2018, 10:55:33 PM
    Author     : RAMANI
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  <%  
      LocalDateTime ldt = LocalDateTime.now();
            String d= DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(ldt);
             d = d.replace("-","");
              d = 'd'+d;
      
             Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
      
      
              
    String class_name=(String)session.getAttribute("classname");
    
    String subject=(String)session.getAttribute("SUBJECT");
    out.println(class_name+"  "+subject);
    
    PreparedStatement ps3 =con.prepareStatement("select rollno,subjectname,att,cond from "+subject+"_"+class_name+";");        
  //ps3.setString(1,class_name);
  // ps3.setString(2,subject);
   //ResultSet rs=ps3.executeQuery();
   
   ResultSet rs3=ps3.executeQuery();
   
   PreparedStatement ps4=con.prepareStatement("update "+subject+"_"+class_name+" set att=att+1,cond=cond+1 where rollno=?");
   PreparedStatement ps5=con.prepareStatement("update "+subject+"_"+class_name+" set cond=cond+1 where rollno=?");
    PreparedStatement ps6 =con.prepareStatement("update "+subject+"_"+class_name+" set "+d+" ='p' where rollno=?;");
    PreparedStatement ps7 =con.prepareStatement("update "+subject+"_"+class_name+" set "+d+" ='a' where rollno=?;");
    PreparedStatement ps8 =con.prepareStatement("alter table "+subject+"_"+class_name+" add column " +d+ " char(1);");
    try{
   ps8.executeUpdate();
    
   while(rs3.next())
   {
       String rollno=rs3.getString("rollno");
       String status=request.getParameter(rs3.getString("rollno"));
        ps6.setString(1,rollno);
        ps7.setString(1,rollno);
        
       if(status.equals("present"))
       {
           ps4.setString(1,rollno);
          
           ps4.executeUpdate();
           
            ps6.executeUpdate();
       }
       else
       {
           ps5.setString(1,rollno);
          
           ps5.executeUpdate();
            ps7.executeUpdate();
       }
   }
   session.setAttribute("inserted","YES");
    }
    catch(Exception e)
            {
                session.setAttribute("marked","YES");
                
                
            }
   
   if(String.valueOf("cc_class").equals('n'))
   response.sendRedirect("teacherpage.jsp");
   else
    response.sendRedirect("cc.jsp");
    %>
    
    
</html>
