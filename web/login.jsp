<%-- 
    Document   : login
    Created on : 9 Sep, 2018, 9:53:04 AM
    Author     : RAMANI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%-- 
    Document   : login
    Created on : 6 Sep, 2018, 8:45:46 PM
    Author     : HP
--%>


  
<%
    
    String uname=request.getParameter("uname");
    String upass=request.getParameter("pass");
    
    
    
  %>


<%
    
    Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
           PreparedStatement ps =con.prepareStatement("select * from user where name=? and pass=?;");
             ps.setString(1,uname);
             ps.setString(2,upass);
             
              ResultSet rs = ps.executeQuery();
             
              
        
           
        if(rs.next())
        {
            session.setAttribute("status", "success");
            session.setAttribute("change_pass", "NO");
            session.setAttribute("uname",uname);
            if(uname.charAt(0)=='T'){
                 PreparedStatement ps1 =con.prepareStatement("select class,cc from teacher_details where username=?;");
                ps1.setString(1, uname);
                ResultSet rs1=ps1.executeQuery();
                while(rs1.next())
                {
                    String cc=rs1.getString(2);
                    if(cc.equals("y"))
                    {
                        String ccofclass=rs1.getString(1);
                        session.setAttribute("cc_class",ccofclass );
                        response.sendRedirect("cc.jsp");
                        return;
                    }
                }
                session.setAttribute("cc_class","n");
                response.sendRedirect("teacherpage.jsp");}
            else if(uname.charAt(0)=='A')
            response.sendRedirect("http://localhost:8080/dd/Admin.jsp");
            else
                response.sendRedirect("homepage2.jsp");
        }
        else
        {
            
            
            
            session.setAttribute("status", "failed");
            session.setAttribute("change_pass", "NO");
            
            response.sendRedirect("index.jsp");
            
             
                   
                        
        
        
               
                    
                    
            
        }
        
 
  



%>
