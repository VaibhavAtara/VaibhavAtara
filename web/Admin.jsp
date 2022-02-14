
<%@page import="java.sql.*"%>


 
<html>

<head>

	<link rel="stylesheet" href="admin.css">
	<!--link rel="stylesheet" href="admintable.css"-->
	<link rel="stylesheet" href="profile.css">
	<link rel="stylesheet" href="form.css">
        <link rel="stylesheet" href="add.css">
        <link rel="stylesheet" href="table.css">
	 <!--script  src="reset.js"--><!--script-->

</head>


<div class="ct" id="t1">
  <div class="ct" id="t2">
    <div class="ct" id="t3">
      <div class="ct" id="t4">
         <div class="ct" id="t5">
            <div class="ct" id="t6">
		<div class="ct" id="t7"> 
          <ul id="menu">
            <a href="#t1"><li class="icon fa fa-bolt" id="uno">HOME</li></a>
            <a href="#t2"><li class="icon fa fa-bolt" id="dos">Search Student</li></a>
            
            <a href="#t3"><li class="icon fa fa-rocket" id="tres">Add Student</li></a>
            <a href="#t4"><li class="icon fa fa-rocket" id="tres">Add Faculty</li></a>
            <a href="#t5"><li class="icon fa fa-bolt" id="dos">Remove Student</li></a>
            <!--a href="#t7"><li class="icon fa fa-rocket" id="tres">Modify Class Details</li></a-->
            <a href="index.jsp"><li class="icon fa fa-dribbble" id="cuatro">LOGOUT</li></a>
            
          </ul>
                    
<%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="t1">
             <section class="icon fa fa-bolt"><span>
			 
			 
			 


<section class="profile">
  <header class="header">
    <div class="details">
      <img src="loginicon.png" alt="John Doe" class="profile-pic">
      <h1 class="heading">ADMIN</h1>
      <div class="location">
        <svg width="18" height="18" viewBox="0 0 30 24" fill="currentColor">
  
</svg>
        <p>Pune, India</p>
      </div>
      <div class="stats">
        <div class="col-4">
          <h4>COLLEGE</h4>
          <p>PICT</p>
        </div>
        <div class="col-4">
          <h4>Year</h4>
          <p>TE</p>
        </div>
        
      </div>
    </div>
  </header>
</section>

			 
			 
			 
			 
			 
			 
			 
             </span></section>  
          </div>
     <%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="p2">
            <section class="icon fa fa-keyboard-o"><span >
			
                    <section class=""section1>
                        
                        <h1 class="h1_table">SEARCH STUDENT</h1>
                                <form>
                                <center>ENTER STUDENT ID &nbsp; &nbsp;:<input type="text" size=65  name="searchid"placeholder="student id...."> </center><br>
				<center><button type="submit">Submit</button></center>	
                                </form>
                        
                        <%
                            
                            String user_id = "";
                            user_id=request.getParameter("searchid");
                                    if(user_id!=null){
                                       String classname="nine";
                                       String rollno="";
                                             session.setAttribute("user_id",user_id);
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
                                   
                                    PreparedStatement ps =con.prepareStatement("select * from user where name=?;");
                                   PreparedStatement ps1 =con.prepareStatement("select * from student where username=?;");
                                     ps.setString(1,user_id);
                                    ps1.setString(1,user_id);
                                    System.out.println("HELLO WORLD1");
                                    try{
                                        ResultSet rs = ps.executeQuery();
                                        rs.next();
                                      
                                         String pass = rs.getString("pass");
                                        
                                    }
                                    catch(Exception e)
                                    {
                                        session.setAttribute("searched","failed");
                                        response.sendRedirect("Admin.jsp");
                                            return;
                                        
                                    }
                                   
                                    
                                    
                                         
                                         ResultSet rs1 = ps1.executeQuery();
                                    
                                    rs1.next();
                                   rollno=rs1.getString("rollno");
                                    if(rollno.charAt(1)=='0')
                                        classname="ten";
                                    
                                    

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
     
       double toc_att,sepm_att,hci_att,os_att,dbms_att;
     
       toc_rs.next();sepm_rs.next();hci_rs.next();os_rs.next();dbms_rs.next();
       if(Double.parseDouble(toc_rs.getString("cond"))==0.0)
           toc_att=0;
       else
       toc_att = (Double.parseDouble(toc_rs.getString("att"))/Double.parseDouble(toc_rs.getString("cond"))*100.0);
       if(Double.parseDouble(sepm_rs.getString("cond"))==0.0)
           sepm_att=0;
       else
       sepm_att = (Double.parseDouble(sepm_rs.getString("att"))/Double.parseDouble(sepm_rs.getString("cond"))*100.0);
       if(Double.parseDouble(hci_rs.getString("cond"))==0.0)
           hci_att=0;
       else
       hci_att = (Double.parseDouble(hci_rs.getString("att"))/Double.parseDouble(hci_rs.getString("cond"))*100.0);
       if(Double.parseDouble(os_rs.getString("cond"))==0.0)
           os_att=0;
       else
       os_att = (Double.parseDouble(os_rs.getString("att"))/Double.parseDouble(os_rs.getString("cond"))*100.0);
       if(Double.parseDouble(dbms_rs.getString("cond"))==0.0)
           dbms_att=0;
       else
       dbms_att = (Double.parseDouble(dbms_rs.getString("att"))/Double.parseDouble(dbms_rs.getString("cond"))*100.0);

        
       
      
      double tot_avg = ((toc_att + sepm_att + hci_att + os_att + dbms_att)/5.0);
                                
                                    
                                  
                                  %>
                                  
                                  
 <%//---------------------------------------------------------------------------------------%>
 
 <%!
    

 %>
 
 <div style="margin-left:100px;background-color:white;width:20%;border:5px solid red;border-radius: 20px; ">
     <div style="margin-left:50px;color:darkcyan;font-weight:bolder">
     <br><p>USER_ID  &nbsp;:&nbsp;<%out.println(rs1.getString("username"));%><p><br>
 <p>NAME &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%out.println(rs1.getString("name"));%><p><br>
 <p>ROLL N0 &nbsp;:&nbsp;<%out.println(rs1.getString("rollno"));%><p><br>
 <p>CLASS &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%out.println(rs1.getString("class"));%><p><br>
 </div>
  </div>
 
 <div style="margin-left:1000px;background-color:white;width:10%;border:2px solid red;border-radius: 20px">
     <form action="reset.jsp"  method="post">
     <button name="submit" type="submit" style="color:white;background-color:deepskyblue;width:100%;border-radius: 20px">RESET PASSWORD</button>
     </form>
     
 </div>
 <h1 class="h1_table">Attendance Details</h1>
  <div>
    <table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:150px";>SUBJECTS</th>
          <th style="width:150px";>ATTENDED</th>
          <th style="width:150px";>CONDUCTED</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tb1-content" style="overflow-y:scroll;height: 250px ">
    <table>
      <tbody>
	 
        <tr>
          <td style="width:150px";><%out.println(toc_rs.getString("subjectname"));%></td>
          <td style="width:150px";><%out.println(toc_rs.getInt("att"));%></td>
          <td style="width:150px";><%out.println(toc_rs.getInt("cond"));%></td>
        </tr>
        
        
        <tr>
          <td style="width:150px";><%out.println(sepm_rs.getString("subjectname"));%></td>
          <td style="width:150px";><%out.println(sepm_rs.getInt("att"));%></td>
          <td style="width:150px";><%out.println(sepm_rs.getInt("cond"));%></td>
        </tr>
        
        <tr>
          <td style="width:150px";><%out.println(hci_rs.getString("subjectname"));%></td>
          <td style="width:150px";><%out.println(hci_rs.getInt("att"));%></td>
          <td style="width:150px";><%out.println(hci_rs.getInt("cond"));%></td>
        </tr>
        
        <tr>
          <td style="width:150px";><%out.println(os_rs.getString("subjectname"));%></td>
          <td style="width:150px";><%out.println(os_rs.getInt("att"));%></td>
          <td style="width:150px";><%out.println(os_rs.getInt("cond"));%></td>
        </tr>
        
        <tr>
          <td style="width:150px";><%out.println(dbms_rs.getString("subjectname"));%></td>
          <td style="width:150px";><%out.println(dbms_rs.getInt("att"));%></td>
          <td style="width:150px";><%out.println(dbms_rs.getInt("cond"));%></td>
        </tr>

        <tr>
          <td>AVERAGE</td>
          <td><%out.println(tot_avg);%></td>
        </tr>
      </tbody>
    </table>
  </div>
 <%
    
 
 }%>
    <%//----------------------------------------%>                             
                            
                            
                    </section>
			

			</span></section>
          </div> 
     <%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="p7">
              <section class="icon fa fa-rocket"><span >
                  
                      <section class="section1" >
  
					<div>
					<table cellpadding="0px" cellspacing="0" border="0">
      
					<tr>
						<th >NAME</th>
						<th>SUBJECTS</th>
						<th>NUMBER OF CLASSES</th>          
					</tr>
      

      <tbody>
        <tr>
          <td>R.B.Murumkar</td>
          <td>DATABASE MANAGEMENT SYSTEMS</td>
          <td>2</td>
          
        </tr>
        <tr>
          <td>S.S.Pande</td>
          <td>HUMAN-COMPUTER INTERACTION</td>
          <td>3</td>
          
        </tr>
        <tr>
          <td>T.A.Rane</td>
          <td>OPERATING SYSTEM</td>
          <td>4</td>
          
        </tr>
        <tr>
          <td>K.A.Sultanpure</td>
          <td>THEORY OF COMPUTATION</td>
          <td>3</td>
          
        </tr>
        <tr>
          <td>S.C.Dharmadhikari</td>
          <td>SEPM</td>
          <td>2</td>
          
        </tr>

	<tr>
          <td>K.A.Sultanpure</td>
          <td>COMPUTER GRAPHICS</td>
          <td>3</td>
          
        </tr>
        <tr>
          <td>S.C.Dharmadhikari</td>
          <td>DSFL</td>
          <td>2</td>
          
        </tr>
       <tr>
	</tr>

	
        
			</tbody>
			</table>
			</div>
		</section>

                      
                      
                      

		 
                      
                  </span></section>
          </div>
      <%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="p4">
            <section class="icon fa fa-dribbble">
                <span >
                    <section class="section1" >
 
				<div class="tbl-header">
				<table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:100px">CLASS</th>
          <th style="width:200px">CLASS CORDINATOR</th>
          <th style="width:100px">NUMBER OF STUDENTS</th>
          <th style="width:100px">ROOM NO.</th>
        </tr>
      </thead>
  
      <tbody>
        <tr>
          <td >FE-1</td>
          <td>ABC</td>
          <td>80</td>
          <td>101</td>
        </tr>
        <tr>
          <td>SE-1</td>
          <td>DEF</td>
          <td>90</td>
          <td>201</td>
        </tr>
        <tr>
          <td>TE-1</td>
          <td>GHI</td>
          <td>60</td>
          <td>301</td>
        </tr>

	<td>BE-1</td>
          <td>JKL</td>
          <td>100</td>
          <td>401</td>
        </tr>

          <td>FE-2</td>
          <td>ABC</td>
          <td>80</td>
          <td>102</td>
        </tr>
        <tr>
          <td>SE-2</td>
          <td>DEF</td>
          <td>90</td>
          <td>202</td>
        </tr> 
        <tr>
          <td>TE-2</td>
          <td>GHI</td>
          <td>60</td>
          <td>302</td>
        </tr>

	<td>BE-2</td>
          <td>JKL</td>
          <td>100</td>
          <td>402</td>
        </tr>
        <tr>
		</tr>
        
      </tbody>
    </table>
  </div>
</section>

                    
                </span>
                         </section>
          </div> 
     <%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="p3">
            <section class="icon fa fa-plus-circle">
                <span>
                    
                    <section class="section1" >
			<br>
                         <button><a href="tp.jsp">IMPORT FROM FILE</a></button>
                        <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">ADD STUDENT<h2>

  <form class="login-container" action="insertstudent.jsp" method="post">
      
                        
			   <input placeholder="Enter name" name="name" type="text" tabindex="1" required>
                        
                           <br>
                        
			   <input placeholder="Enter email" name="email" type="email" tabindex="2" required>
                        
                           <br>
                                Section &nbsp;:&nbsp;
                                <select name="section">
                                <option value="9">9</option>
                                <option value="10">10</option>
                                 </select>
                                <br><br>
    <p><input type="submit" value="Submit"></p>
  </form>
</div>
			
			</section>
                    
                </span>
              
            </section>
          </div> 
      <%//---------------------------------------------------------------------------------------------------------------------------%>
       <%//---------------------------------------------------------------------------------------------------------------------------%>
          <div class="page" id="p4">
            <section class="icon fa fa-plus-circle">
                <span >
                    
                    
                    
                        <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">ADD FACULTY</h2>

  <form class="login-container" action="insertfaculty.jsp" method="post">
     
			   <input placeholder="Enter name" name="name" type="text" tabindex="1" required>
                           <br>
				<input placeholder="Enter Email" name="email" type="email" tabindex="2" required>
                                <br>
				
                                Section &nbsp;:&nbsp;<select name="section">
                                <option value="9">9</option>
                                <option value="10">10</option>
                                 </select>
                                <br>
                                <br>
                                Subject &nbsp;:&nbsp;<select name="subject">
                                <option value="DBMS">DBMS</option>
                                <option value="TOC">TOC</option>
                                <option value="SEPM">SEPM</option>
                                <option value="HCI">HCI</option>
                                <option value="OS">OS</option>
                                <br>
                                 </select>
                                <br><br>
                                </select>
                                <br><br>
                                Class Coordinator &nbsp;:&nbsp;<select name="cc">
                                <option value="y">Yes</option>
                                <option value="n">No</option>
                                 </select>
				
    <p><input type="submit" value="Submit"></p>
  </form>
</div>
  
  
  
  


                    
                </span>
             
            </section>
          </div> 
      <%//---------------------------------------------------------------------------------------------------------------------------%>
       <%//---------------------------------------------------------------------------------------------------------------------------%>
            <div class="page" id="p5">
            <section class="icon fa fa-keyboard-o"><span >
			
                    <section class="section1">
                        
                        <h1 class="h1_table">REMOVE STUDENT</h1>
                                <form>
                                <center>ENTER STUDENT ID &nbsp; &nbsp;:<input type="text" size=65  name="removeid"placeholder="student id...."> </center><br>
				<center><button type="submit">Submit</button></center>	
                                </form>
                        
                        <%
                            
                            String remove_id = "";
                            remove_id=request.getParameter("removeid");
                                    if(remove_id!=null){
                                       String remove_classname="nine";
                                       String remove_rollno="";
                                            
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
                                   
                                    PreparedStatement rps =con.prepareStatement("select * from user where name=?;");
                                   
                                    PreparedStatement rps2 = con.prepareStatement("delete from user where name=?; ");
                                
                                     rps.setString(1,remove_id);
                                     rps2.setString(1,remove_id);
                                   
                                    try{
                                        ResultSet rs = rps.executeQuery();
                                        rs.next();
                                                                          
                                        
                                         String pass = rs.getString("pass");
                                        
                                    }
                                    catch(Exception e)
                                    {
                                        session.setAttribute("searched","failed");
                                        response.sendRedirect("Admin.jsp");
                                                                          

                                            return;
                                        
                                    }
                                   
                                    
                                    
                                                                           
                                    rps2.executeUpdate();
                                    
                                    
                                    session.setAttribute("deleted","YES");
                                        response.sendRedirect("Admin.jsp");
                                                                           

                                            return;
        
                                  
                     
 

    

 
 }%>
                              
                            
                            
                    </section>
			

			</span></section>
          </div> 
          <%---delete%>
      <%//---------------------------------------------------------------------------------------------------------------------------%>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>

</html>

<%
        
                Object search = session.getAttribute("searched");
                String searched = String.valueOf(search);
            if(searched.equals("failed")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('NO SUCH RECORD FOUND', '','error')");
            out.println(" });");
            out.println("</script>");
            session.setAttribute("searched","successed");
            }
            
            Object del = session.getAttribute("deleted");
                String deleted = String.valueOf(del);
            if(deleted.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'DELETED SUCCESSFULLY','success')");
            out.println(" });");
            out.println("</script>");
            session.setAttribute("deleted","NO");
            }
            

            Object stuadded = session.getAttribute("stu_added"); 
                String stu_added= String.valueOf(stuadded);
            if(stu_added.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'ADDED SUCCESSFULLY ','success')");
            out.println(" });");
            out.println("</script>");
            session.setAttribute("stu_added","NO");
            }
            

            Object alreadyadded = session.getAttribute("already_added");
                String already_added= String.valueOf(alreadyadded);
            if(already_added.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('OOPS', ' ALREADY ADDED','error')");
            out.println(" });");
            out.println("</script>");
            session.setAttribute("already_added","NO");
            }

%>