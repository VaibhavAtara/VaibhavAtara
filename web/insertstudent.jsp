<%-- 
    Document   : insertstudent.jsp
    Created on : 13 Sep, 2018, 7:29:05 PM
    Author     : HP
--%>
<%@page import="classes.Admin,classes.Student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
    Admin admin = Admin.get_instance();
    Student student = admin.add_student();
    
    student.setName(request.getParameter("name"));
    student.setSection(request.getParameter("section"));
    student.setEmail(request.getParameter("email"));
    
   /* String uname=request.getParameter("name");
    String section=request.getParameter("section");
    String email = request.getParameter("email");*/
    
    
  %>


<%
    int no_of_students=0;
    String pass="123456";
    int no_of_roll = 0;
    String roll="";
    String div="";
    String classname="";
    String class_name="nine";
    if(student.getSection().equals("10"))
        class_name="ten";
    //-----------------------------------------------------------------------------------------
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
    //------------------------------------------------------------------------------------------
      PreparedStatement ps0 =con.prepareStatement("select email from student;");
      ResultSet rs0 = ps0.executeQuery();
      
      while(rs0.next())
      {
          
          
          if(rs0.getString(1).equals(student.getEmail()))
          {
            
              session.setAttribute("already_added", "YES");
              response.sendRedirect("Admin.jsp");
              return;
          }
          
      }
          
     PreparedStatement ps =con.prepareStatement("insert into user(name,pass) values(?,?);");
     PreparedStatement ps1 =con.prepareStatement("select count(name)+1 from user where name like 'S%';");
     PreparedStatement ps2 =con.prepareStatement("select count(class)+1 from student where class like '___"+student.getSection()+"';");
     PreparedStatement ps3 =con.prepareStatement("insert into student values (?,?,?,?,?)");
     PreparedStatement ps4 =con.prepareStatement("insert into toc_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps5 =con.prepareStatement("insert into sepm_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps6 =con.prepareStatement("insert into hci_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps7 =con.prepareStatement("insert into os_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
     PreparedStatement ps8 =con.prepareStatement("insert into dbms_"+class_name+"(rollno,subjectname,att,cond) values (?,?,?,?);");
    //-----------------------------------------------------------------------------------------------
    ResultSet rs1 = ps1.executeQuery();  //for user_id
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
    
    /*String count=String.valueOf(no_of_students);
              StringBuilder sb = new StringBuilder();
             while(sb.length()+count.length()<6) {
             sb.append('0');
                 }
                 sb.append(no_of_students);
                 String finalid = sb.toString();
             
           String user_id ="S2K18" + finalid;*/
         admin.user_instance().setUser_id(no_of_students,"S");
         ps.setString(1,admin.user_instance().getUser_id());
         ps.setString(2,pass);
         ps.executeUpdate();
    //------------------------------------------------------------------------------------------------
     //for generating roll no
         /*roll=String.valueOf(no_of_roll);
           classname = "TE-"+student.getSection();
           if(student.getSection().equals("10"))
              div="30";
           else
               div="39";
           
           
           StringBuilder sb1 = new StringBuilder();
           while(sb1.length()+roll.length()<2) {
             sb1.append('0');
                 }
                 sb1.append(no_of_roll);
                String div_roll = sb1.toString();
              String roll_no = div+div_roll;*/
         
         admin.user_instance().setRoll_no(no_of_roll, student.getSection());
              
              
         //------------------------------------------------------------
         //inserting in student table
              ps3.setString(1,admin.user_instance().getUser_id());
              ps3.setString(2,admin.user_instance().getRoll_no());
              ps3.setString(3,student.getName());
              ps3.setString(4,"TE-"+student.getSection());
               ps3.setString(5,student.getEmail());
              ps3.executeUpdate();
        //---------------------------------------------------------------------------------
        //inserting into subjects table
      
        
     ps4.setString(1,admin.user_instance().getRoll_no());
     ps4.setString(2,"TOC");
     ps4.setInt(3,0);
     ps4.setInt(4,0);
     ps4.executeUpdate();
     
     
     ps5.setString(1,admin.user_instance().getRoll_no());
     ps5.setString(2,"SEPM");
     ps5.setInt(3,0);
     ps5.setInt(4,0);
     ps5.executeUpdate();
     
     
     ps6.setString(1,admin.user_instance().getRoll_no());
     ps6.setString(2,"HCI");
     ps6.setInt(3,0);
     ps6.setInt(4,0);
     ps6.executeUpdate();
     
     
     ps7.setString(1,admin.user_instance().getRoll_no());
     ps7.setString(2,"OS");
     ps7.setInt(3,0);
     ps7.setInt(4,0);
     ps7.executeUpdate();
     
     
     ps8.setString(1,admin.user_instance().getRoll_no());
     ps8.setString(2,"DBMS");
     ps8.setInt(3,0);
     ps8.setInt(4,0);
     ps8.executeUpdate();
        
        
        //-------------------------------------------------------------------------------
        session.setAttribute("email",student.getEmail());
        session.setAttribute("user_id",admin.user_instance().getUser_id());
       // response.sendRedirect("successfullyadded.jsp");
       session.setAttribute("stu_added","YES");
       response.sendRedirect("Admin.jsp");


%>