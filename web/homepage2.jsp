<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="classes.Student,classes.Subject"%>



<html>

<head>

	<link rel="stylesheet" href="homepage2.css">
	<link rel="stylesheet" href="table.css">
	<link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="form.css">
	 
         
         

</head>
<%  
    
        Student student = new Student();
        Subject subject = student.view_attendance();
        
        
        String classname = "nine";
       Object uname=session.getAttribute("uname");
       student.setName(String.valueOf(uname));
       session.setAttribute("user_id",student.getName());
      Class.forName("com.mysql.cj.jdbc.Driver");  
       Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
        Statement s =con.createStatement();
                
        String sql="select *from student where username='"+student.getName()+"';";
        ResultSet r = s.executeQuery(sql);
        r.next();
        if(r.wasNull())
            response.sendRedirect("index.html");
       
       String rollno=r.getString("rollno");
       student.setEmail(r.getString("email"));
       student.setSection(r.getString("class"));
       if(rollno.charAt(1)=='0')
           classname = "ten";
       PreparedStatement toc =con.prepareStatement("select * from toc_"+classname+" where rollno=?;");
        PreparedStatement sepm =con.prepareStatement("select * from sepm_"+classname+" where rollno=?;");
         PreparedStatement hci =con.prepareStatement("select * from hci_"+classname+" where rollno=?;");
          PreparedStatement os =con.prepareStatement("select * from os_"+classname+" where rollno=?;");
           PreparedStatement dbms =con.prepareStatement("select * from dbms_"+classname+" where rollno=?;");
        toc.setString(1,rollno);
        sepm.setString(1,rollno);
        hci.setString(1,rollno);
        os.setString(1,rollno);
        dbms.setString(1,rollno);
       ResultSet toc_rs=toc.executeQuery();
        ResultSet sepm_rs=sepm.executeQuery();
         ResultSet hci_rs=hci.executeQuery();
          ResultSet os_rs=os.executeQuery();
           ResultSet dbms_rs=dbms.executeQuery();
     PreparedStatement cc = con.prepareStatement("select name from teacher where username = (select username from teacher_details where class =? and cc ='y');");
     cc.setString(1,student.getSection());
     ResultSet ccrs = cc.executeQuery();
     ccrs.next();
     toc_rs.next();sepm_rs.next();hci_rs.next();os_rs.next();dbms_rs.next();
       //double toc_att,sepm_att,hci_att,os_att,dbms_att;
     
       
       /*if(toc_rs.getString("cond").equals("0"))
           toc_att = 0;
       else
            toc_att = (Double.parseDouble(toc_rs.getString("att"))/Double.parseDouble(toc_rs.getString("cond"))*100.0);
       if(sepm_rs.getString("cond").equals("0"))
           sepm_att = 0;
       else
           sepm_att = (Double.parseDouble(sepm_rs.getString("att"))/Double.parseDouble(sepm_rs.getString("cond"))*100.0);
       if(hci_rs.getString("cond").equals("0"))
           hci_att = 0;
       else
            hci_att = (Double.parseDouble(hci_rs.getString("att"))/Double.parseDouble(hci_rs.getString("cond"))*100.0);
       if(os_rs.getString("cond").equals("0"))
           os_att = 0;
       else
            os_att = (Double.parseDouble(os_rs.getString("att"))/Double.parseDouble(os_rs.getString("cond"))*100.0);
       if(dbms_rs.getString("cond").equals("0"))
           dbms_att = 0;
       else
             dbms_att = (Double.parseDouble(dbms_rs.getString("att"))/Double.parseDouble(dbms_rs.getString("cond"))*100.0);*/

        
       
      subject.setDbms(dbms_rs.getString("cond"),dbms_rs.getString("att"));
      subject.setHci(hci_rs.getString("cond"),hci_rs.getString("att"));
      subject.setSepm(sepm_rs.getString("cond"),sepm_rs.getString("att"));
      subject.setOs(os_rs.getString("cond"),os_rs.getString("att"));
      subject.setToc(toc_rs.getString("cond"),toc_rs.getString("att"));
      
      double tot_avg = ((subject.getToc() + subject.getSepm() + subject.getHci() + subject.getOs() + subject.getDbms()));
      if(tot_avg!=0)
      tot_avg = tot_avg/5;
       
%>

<div class="ct" id="t1">
  <div class="ct" id="t2">
    <div class="ct" id="t3">
      <div class="ct" id="t4">
         <div class="ct" id="t5">
          <ul id="menu">
            <a href="#t1"><li class="icon fa fa-bolt" id="uno">HOME</li></a>
            <a href="#t2"><li class="icon fa fa-keyboard-o" id="dos">ATTENDANCE</li></a>
            <a href="giveattendance.jsp"><li class="icon fa fa-rocket" id="tres">GIVE ATTENDANCE</li></a>
            <a href="#t4"><li class="icon fa fa-rocket" id="tres">CHANGE PASSWORD</li></a>
            <a href="index.jsp"><li class="icon fa fa-dribbble" id="cuatro">LOGOUT</li></a>
          </ul>
          <div class="page" id="p1">
             <section class="icon fa fa-bolt"><span>
			 
			 
			 

<p>
<section class="profile">
  <header class="header">
    <div class="details">
      <img src="loginicon.png" alt="<%out.println(r.getString("name"));%>" class="profile-pic">
      
      <h1 class="heading"><%out.println(r.getString("name"));%></h1>
      <div class="location">
        <svg width="18" height="18" viewBox="0 0 30 24" fill="currentColor">
  
</svg>
        <p>Pune, India</p>
      </div>
      <div class="stats">
        <div class="col-4">
          <h4>Roll No</h4>
          <p><% out.println(""+r.getInt("rollno"));%></p>
        </div>
        <div class="col-4">
          <h4>Class</h4>
          <p><%out.println(student.getSection());%></p>
        </div>
        
		<div class="col-4">
          <h4>CC</h4>
          <p><%out.println(ccrs.getString("name"));%></p>
        </div>
      </div>
    </div>
  </header>
</section>

			 
	<p>		 
			 
			 
			 
			 
			 
			 </span></section> 
          </div>
		  
		  
          <div class="page" id="p2">
            <section class="icon fa fa-keyboard-o"><span >
			
			
			
		





<section class="section1" >
  <!--for demo wrap-->
 
  <div class="tbl-header">
    <table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <h1 class="h1_table">Attendance Details</h1>
  <th style="width:300px">SUBJECT</th>
          <th style="width:100px">ATTENDED</th>
          <th style="width:100px">TOTAL</th>
          <th style="width:100px">PERCENTAGE</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content" style="overflow-y:scroll;height: 300px ">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
            
          <td style="width:300px;height:30px;"><% out.println(toc_rs.getString("subjectname"));%></td>
          
          <td><% out.println(toc_rs.getInt("att") );%></td>
          <td><% out.println(toc_rs.getString("cond") );%></td>
          <td><% out.println(String.format("%.2f",subject.getToc()));%></td>
        </tr>
        
        
        <tr>
            
          <td style="width:300px;height:30px;"><% out.println(sepm_rs.getString("subjectname"));%></td>
          
          <td><% out.println(sepm_rs.getInt("att") );%></td>
          <td><% out.println(sepm_rs.getString("cond") );%></td>
          <td><% out.println(String.format("%.2f",subject.getSepm()));%></td>
        </tr>
        
        
        <tr>
            
          <td style="width:300px;height:30px;"><% out.println(hci_rs.getString("subjectname"));%></td>
          
          <td><% out.println(hci_rs.getInt("att") );%></td>
          <td><% out.println(hci_rs.getString("cond") );%></td>
          <td><% out.println(String.format("%.2f",subject.getHci()));%></td>
        </tr>
        
        
        <tr>
            
          <td style="width:300px;height:30px;"><% out.println(os_rs.getString("subjectname"));%></td>
          
          <td><% out.println(os_rs.getInt("att") );%></td>
          <td><% out.println(os_rs.getString("cond") );%></td>
          <td><% out.println(String.format("%.2f",subject.getOs()));%></td>
        </tr>
        
        
        <tr>
            
          <td style="width:300px;height:30px;"><% out.println(dbms_rs.getString("subjectname"));%></td>
          
          <td><% out.println(dbms_rs.getInt("att") );%></td>
          <td><% out.println(dbms_rs.getString("cond") );%></td>
          <td><% out.println(String.format("%.2f",subject.getDbms()));%></td>
        </tr>
        
        
       
        
       
        <tr>
          <td style="width:300px">AVERAGE ATTENDANCE</td>
          <td></td>
          <td></td>
          <td><%out.println(String.format("%.2f",tot_avg));%></td>
        </tr>
        </tbody>
    </table>
        
   
  </div>
</section>
			</span></section>
          </div>  
          <div class="page" id="p3">
            <section class="icon fa fa-rocket"><span class="title"></span></section>
          </div>
          <div class="page" id="p4">
            <section class="icon fa fa-dribbble">
                <span>
              
		<section class="section1" >
			<br>
                        <br>
			<div class="login">
                            <div class="login-triangle"></div>
  
                                <h2 class="login-header">Change Password</h2>

                            <form class="login-container" action="changepassword.jsp" method="post">
          <input placeholder="Enter password" name="pass_word" type="text" tabindex="1" required>
                                 <p><input type="submit" value="Submit"></p>
                        </form>
</div>
				
			</section>
                    
                    
              </span>
                    
            </section>
          </div> 
          <div class="page" id="p5">
            <section class="icon fa fa-plus-circle">
              <span class="title">More</span>
              
            </section>
          </div> 
        </div>
      </div>
    </div>
  </div>
</div>

</html>

<%
        Object attchecked = session.getAttribute("att_checked");
        String att_checked = String.valueOf(attchecked);
            
            if(att_checked.equals("YES")){
    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('oops', 'WRONG QRCODE OR YOUR ATTENDANCE HAS BEEN MARKED ALREADY','error')");
            out.println(" });");
            out.println("</script>");
           session.setAttribute("att_checked", "NO");
          
                    }
%>