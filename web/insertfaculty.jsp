<%-- 
    Document   : insertstudent.jsp
    Created on : 13 Sep, 2018, 7:29:05 PM
    Author     : HP
--%>
<%@page import="classes.Admin,classes.Faculty"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Admin admin = Admin.get_instance();
    Faculty faculty = admin.add_faculty();
    faculty.setName(request.getParameter("name"));
    faculty.setSection(request.getParameter("section"));
    faculty.setSubject(request.getParameter("subject"));
    faculty.setEmail(request.getParameter("email"));
    faculty.setCc(request.getParameter("cc"));

    
  %>


<%
    int no_of_teachers = 0;
    String pass="123456";
    String classname="";
    
    //-------------------------------------------------------------------------------------------
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
    //----------------------------------------------------------------------------------------------
            PreparedStatement ps0 =con.prepareStatement("select email from teacher;");
      ResultSet rs0 = ps0.executeQuery();
      
      while(rs0.next())
      {
          
          
          if(rs0.getString(1).equals(faculty.getEmail()))
          {
            
              session.setAttribute("already_added", "YES");
              response.sendRedirect("Admin.jsp");
              return;
          }
          
      }
           PreparedStatement ps =con.prepareStatement("insert into user(name,pass) values(?,?);");
           PreparedStatement ps1 =con.prepareStatement("select count(name)+1 from user where name like 'T%';");
           PreparedStatement ps2 =con.prepareStatement("insert into teacher values (?,?,?);");
           PreparedStatement ps4 =con.prepareStatement("select cc from teacher_details where class=?;");
           
           PreparedStatement ps3 =con.prepareStatement("insert into teacher_details values (?,?,?,?);");
           
           
           
           
     //------------------------------------------------------------------------------------------------------   
            
           ResultSet rs1 = ps1.executeQuery();
           if(rs1.next())
           {
              no_of_teachers=rs1.getInt(1);
           }
      //------------------------------------------------------------------------------------------------------
              /*String count=String.valueOf(no_of_teachers);
              StringBuilder sb = new StringBuilder();
             while(sb.length()+count.length()<6) {
             sb.append('0');
                 }
                 sb.append(no_of_teachers);
                 String finalid = sb.toString();
             
           String user_id ="T2K18" + finalid;*/
              
              admin.user_instance().setUser_id(no_of_teachers,"T");
        //------------------------------------------------------------------------------------------------------
         ps.setString(1,admin.user_instance().getUser_id());
         ps.setString(2,pass);
          ps.executeUpdate();
         //----------------------------------------------------------------------------------------------
         ps2.setString(1,admin.user_instance().getUser_id());
         ps2.setString(2,faculty.getName());
          ps2.setString(3,faculty.getEmail());
         ps2.executeUpdate();
         //--------------------------------------------------------------------------------------------------
       classname="TE-"+faculty.getSection();
         
         ps4.setString(1,classname);
       ResultSet rs4= ps4.executeQuery();
       
         
         ps3.setString(1,admin.user_instance().getUser_id());
         ps3.setString(2,classname);
         ps3.setString(3,faculty.getSubject());
        
        
         
         //-----------------------------------------------------------------------------------------------
        ps3.setString(4,faculty.getCc());
     
        session.setAttribute("cc_added","YES");
       
        while(rs4.next())
       {
           String cc_check=rs4.getString(1);
           if(cc_check.equals("y") && faculty.getCc().equals("y"))
           {    
        session.setAttribute("user_id",admin.user_instance().getUser_id());
        session.setAttribute("email", faculty.getEmail());
                ps3.setString(4,"n");
                 ps3.executeUpdate();
                 session.setAttribute("cc_added","NO");
                 
            response.sendRedirect("successfullyadded.jsp");
            return;
            
           }
       }
       
       
       
         
          
            
        ps3.executeUpdate();
         session.setAttribute("cc_added","YES");
                          System.out.println("hello1");

 
  
        session.setAttribute("user_id",admin.user_instance().getUser_id());
        session.setAttribute("email", faculty.getEmail());
         
       
        
        //response.sendRedirect("successfullyadded.jsp");
        session.setAttribute("stu_added","YES");
        response.sendRedirect("Admin.jsp");
        return;

%>