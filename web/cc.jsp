
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>

<head>

	<link rel="stylesheet" href="homepage2.css">
	<link rel="stylesheet" href="table.css">
	<link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="form.css">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

	 <script>
             function selected_value()
             {
                 var x = document.getElementById("mySelect").value;
    //document.getElementById("mama").innerHTML = "You selected: " + x;
                 //window.location.replace("teacherpage.jsp?name="+x);
             }
             
             function att_details(x)
             {
               
        var ind=0,att=0,cond=0;
                var tbl = document.getElementById("table2"); 
                ind=x.parentNode.parentNode.rowIndex;
                att=parseInt(tbl.rows[ind].cells[2].innerHTML,10);
                cond=parseInt(tbl.rows[ind].cells[3].innerHTML,10);
               if(document.getElementById("r1").checked)
                {
                    tbl.rows[ind].cells[2].innerHTML=att+1;
                }   
                tbl.rows[ind].cells[3].innerHTML=cond+1;
                tbl.rows[ind].cells[4].innerHTML=((att+1)/(cond+1)*100).toFixed(2);
       
               
       }
             
             function att_details2(x)
             {
               
        var ind=0,att=0,cond=0;
                var tbl = document.getElementById("table2"); 
                ind=x.parentNode.parentNode.rowIndex;
               cond=parseInt(tbl.rows[ind].cells[3].innerHTML,10);
                tbl.rows[ind].cells[3].innerHTML=cond+1;
                tbl.rows[ind].cells[4].innerHTML=((att)/(cond+1)*100).toFixed(2);
       
               
             }
             
             
             
function myFunction() {
  $(document).ready(function(){
                swal('Success', 'Your data has been exported to pdf','success');
                 });
}

             
             
             </script>
</head>

<%  
    session.setAttribute("cc","YES");
    String[] arr=new String[100];
    String[] sub=new String[100];
    int i=0,j=0;
       Object uname=session.getAttribute("uname");
       String nname = uname.toString();
       session.setAttribute("user_id",uname);
       Class.forName("com.mysql.cj.jdbc.Driver");  
    Connection con = DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
           PreparedStatement ps =con.prepareStatement("select * from teacher where username=?;");
            ps.setString(1,nname);
           ResultSet rs=ps.executeQuery();   
           rs.next();
           
           PreparedStatement ps1 =con.prepareStatement("select * from teacher_details where username=?;");
            ps1.setString(1,nname);
           ResultSet rs1=ps1.executeQuery();   
         while( rs1.next())
         {
             arr[i]=rs1.getString("class");
             sub[i++]=rs1.getString("subject");
         }
         session.setAttribute("SUBJECTS",sub);
         session.setAttribute("noofsubjects",i);
           
%>
<div class="ct" id="t1">
  <div class="ct" id="t2">
    <div class="ct" id="t3">
      <div class="ct" id="t4">
         <div class="ct" id="t5">
          <ul id="menu">
            <a href="#t1"><li class="icon fa fa-bolt" id="uno">HOME</li></a>
            <a href="#t2"><li class="icon fa fa-keyboard-o" id="dos">MARK ATTENDANCE</li></a>
            <a href="qrgen.jsp"><li class="icon fa fa-rocket" id="tres">GENERATE QRCODE</li></a>
            <a href="#t3"><li class="icon fa fa-dribbble" id="cuatro">CHANGE PASSWORD</li></a>
            <a href="#t4"><li class="icon fa fa-rocket" id="tres">DATEWISE REPORT</li></a>
            <a href="#t5"><li class="icon fa fa-rocket" id="tres">DEFAULTER</li></a>
            <a href="index.jsp"><li class="icon fa fa-dribbble" id="cuatro">LOGOUT</li></a>
          </ul>
          <div class="page" id="p1">
             <section class="icon fa fa-bolt"><span>
                  
                         <p>
<section class="profile">
  <header class="header">
    <div class="details">
        <br><br>
      <img src="loginicon.png" alt="John Doe" class="profile-pic">
      <br><br><br><br><br><br><br>
      <h1 class="heading"><%out.println(rs.getString("name"));%></h1>
      <div class="location">
        <svg width="18" height="18" viewBox="0 0 30 24" fill="currentColor">
  
</svg>
        <p>Pune, India</p>
      </div>
      
      <div class="stats">
        <div class="col-4">
          <h4>User name</h4>
          <p><%out.println(nname);%></p>
        </div>
          <%rs1.first();
          do{%>
        <div class="col-4">
          <h4>Class&nbsp;:&nbsp; Subject</h4>
          <p><%out.println(rs1.getString("class") + "  :  " + rs1.getString("subject"));%></p>
        </div>
        <%}while(rs1.next());%>
        <div class="col-4">
            <h4>CC</h4>
            <p><%out.println(String.valueOf(session.getAttribute("cc_class")));%>
            
        </div>
      </div>
    </div>
  </header>
</section>
<p>	
   
</span></section>  
          </div>
          <div class="page" id="p2">
            <section class="icon fa fa-keyboard-o">
                <span>
                    <form>
                        <input type="hidden" name="abba" id="hidden" value="abc">
		<%  rs1.first(); %>
                        <select id="mySelect" value="<%=rs1.getString("class")%>" name="CLASS">
                    
                   <% do{ %>
                    
                    <option  value="<%=rs1.getString("class")%>"><%=(arr[j++])%></option>
                    
                    <%}while(rs1.next());%>
                    
                </select><br>
                <input type="submit" value="submit">
                    </form>
                	
  
  <%String class_name=request.getParameter("CLASS"); //done to assign selected value of list to jsp variable
  String classname = "nine";
    if(class_name!=null){
  
    if(class_name.equals("TE-10"))
        classname="ten";
    session.setAttribute("classname",classname);
        
        
        //out.println("you have selected "+class_name);
    PreparedStatement ps2 =con.prepareStatement("select subject from teacher_details where class=? and username=?;");
            ps2.setString(1,class_name);
            ps2.setString(2,nname);
           ResultSet rs2=ps2.executeQuery();
           rs2.next();
           String subject=rs2.getString("subject");
            session.setAttribute("SUBJECT",subject);
            session.setAttribute("CLASS_NAME",class_name);
   
   PreparedStatement ps3 =con.prepareStatement("select rollno,subjectname,att,cond from "+subject+"_"+classname+";");        
   ResultSet rs3=ps3.executeQuery();
           
  %>
 
<section class="section1" >
  <!--for demo wrap-->
  <h1 class="h1_table">Student Details</h1>
  <div class="tbl-header">
    <table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <th id="roll">ROLL NO</th>
          <th id="sub">SUBJECT</th>
          <th id="att">ATTENDED</th>
          <th id="cond">CONDUCTED</th>
          <th id="per">PERCENTAGE</th>
          <th>Mark Attendance</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tb1-content" style="overflow-y:scroll;height: 300px ">
      <form action="attconfirmation.jsp" method="post">
          
    <table cellpadding="0" cellspacing="0" border="1" id="table2">
      <tbody>
          <%while(rs3.next()){
          //rs3.next();
          %>
          <tr>
          
          <td><% out.println(""+rs3.getString("rollno"));%></td>
          <td><% out.println(rs3.getString("subjectname"));%></td>
          <td><% out.println(""+rs3.getInt("att"));%></td>
          <td><% out.println(""+rs3.getInt("cond"));%></td>
          <td><% 
          
          int att_check=rs3.getInt("cond");
                if(att_check==0)
                    out.println("0");
          else
          
          
          
          out.println(""+(Double.parseDouble(rs3.getString("att"))/Double.parseDouble(rs3.getString("cond"))*100.0));%></td>
          <td><!--input type="button" value="Mark Attendance" onclick="att_details(this)" /-->
               <input type="radio" id="r1" name="<%=rs3.getString("rollno")%>" value="present" onclick="att_details(this)"  > Present<br>
             <input type="radio"  id="r2"  name="<%=rs3.getString("rollno")%>" value="absent" onclick="att_details2(this)" > Absent<br>
        
          </td>
        
        </tr>
        <%}%>
        <tr>
            <td><input type="submit" name="abcd" value="Submit to database" id="enterdata"></td>
          </tr>
       </tbody>
    </table>
        
      </form> 
  </div>
        <%}
        %> 
         


		</span></section>
         
          </div>
        <div class="page" id="p3">
             <section class="icon fa fa-bolt"><span>
                     
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
 
</span></section>  
          </div>
        
            <div class="page" id="p4">
            <section class="icon fa fa-keyboard-o">
                <span>
                    <form>
                        <input type="hidden" name="abba" id="hidden" value="abc">
		<%  rs1.first(); %>
                        <select id="mySelect" value="<%=rs1.getString("class")%>" name="report">
                    
                   <% do{ %>
                    
                    <option  value="<%=rs1.getString("class")%>"><%=rs1.getString("class")%></option>
                    
                    <%}while(rs1.next());%>
                    
                </select><br><br>
                
                <!---->
                <select name="cc_subjects">
                    <option value="toc">TOC</option>
                    <option value="hci">HCI</option>
                    <option value="dbms">DBMS</option>
                    <option value="os">OS</option>
                    <option value="sepm">SEPM</option>
                </select>
                <br><br>
                
                
                
                <!---->
                    
                    DATE FROM:<input type="date" name="date_from">
                    
                    <br>
                    DATE TO:<input type="date" name="date_to">
                    <br><br><br>
                <input type="submit" value="submit">
                    </form>
                <br>	
  
  <%String class_report=request.getParameter("report"); //done to assign selected value of list to jsp variable
  String classreport = "nine";
  String date_from=request.getParameter("date_from");
   String date_to=request.getParameter("date_to");
   String cc_subjects=request.getParameter("cc_subjects");
   Object ccwhichclass=session.getAttribute("cc_class");
   String cc_which_class=String.valueOf(ccwhichclass);
   
   int flag=0;
   System.out.println(cc_subjects);
   
    if(class_report!=null){
  
  date_from = date_from.replace("-","");
  date_from = 'd'+date_from;
              
   date_to = date_to.replace("-","");
   date_to = 'd'+date_to;
              System.out.println("date_from:" + date_from +" date_to:"+date_to);
    String from = date_from;
    String to = date_to;
    if(class_report.equals("TE-10"))
        classreport="ten";
    
    
    
        
        
        //out.println("you have selected "+class_name);
    /*PreparedStatement ps4 =con.prepareStatement("select subject from teacher_details where class=? and username=?;");
    ps4.setString(1,class_report);
    ps4.setString(2,nname);
    ResultSet rs4 = ps4.executeQuery();
     rs4.next();
     
     String sub_report = rs4.getString("subject");
     */String send = "NO";
     
    
    
    
     try{
         System.out.println("1");
         PreparedStatement ps5 =con.prepareStatement("select "+date_from+","+date_to+" from "+cc_subjects+"_"+classreport+";");
         ps5.executeQuery();
     }
     catch(Exception e)
     {
       
         session.setAttribute("invalid_date","YES");
         send = "YES";
         System.out.println("2");
        // response.sendRedirect("cc.jsp");
         //return;
     }
    // out.println(send);
     if(send.equals("YES")){
         response.sendRedirect("cc.jsp");
     return;}
     

     if(class_report.equals(cc_which_class)){flag=1;}
          else
     {      PreparedStatement ps4 =con.prepareStatement("select subject from teacher_details where class=? and username=?;");
        ps4.setString(1,class_report);
             ps4.setString(2,nname);
            ResultSet rs4 = ps4.executeQuery();
             rs4.next();
     
             String sub_report = rs4.getString("subject");
             if(sub_report.equals(cc_subjects))
             {flag=1;}
            
     }
     if(flag==1){
     PreparedStatement ps7 =con.prepareStatement("select rollno from "+cc_subjects+"_"+classreport+";");
     ResultSet rs7=ps7.executeQuery();  
     PreparedStatement ps6 =con.prepareStatement("select column_name from information_schema.columns where table_name='"+cc_subjects+"_"+classreport+"' order by ordinal_position;");
       
      ResultSet rs6=ps6.executeQuery();
         String columns="";
         ResultSet rs8[]=new ResultSet[100];
    String match="NO";
     int k=0;
     j=0;i=0;
         while(rs6.next())
         {
              
             
            columns =rs6.getString(1);
            if(match.equals("NO")){
            if(columns.equals(date_from)){
                match = "YES"; j=i; }}
            if(match.equals("YES"))
            {
            PreparedStatement ps8 =con.prepareStatement("select "+columns+" from "+cc_subjects+"_"+classreport+";");
            rs8[k++]=ps8.executeQuery(); 
             if(columns.equals(date_to))
                 break;
           //out.println(columns);
             }
             
             
             i++;
            
         
         }
         
        //pdf
        String file_name ="F:\\pdf\\test.pdf";
        Document document = new Document();
        
        PdfWriter.getInstance(document, new FileOutputStream(file_name));
        document.open();
                String pdf_header = "                                                                             "  + class_report +"       "+ cc_subjects.toUpperCase() +"          " +"ATTENDANCE";
        Paragraph para = new Paragraph(pdf_header);
        document.add(para);
        Paragraph para1 = new Paragraph("                 ");
        document.add(para1);
        
        PdfPTable table = new PdfPTable(k+1);
        PdfPCell c1 = new PdfPCell(new Phrase("ROLL NO"));
        table.addCell(c1);
        
        
        
       
        
       // table.setHeaderRows(1);
        
       // table.addCell("1");
        //table.addCell("2");
        //table.addCell("3");
        //table.addCell("4");
        //table.addCell("5");
        //table.addCell("6");
       // document.add(table);
        //document.close();
        
        String date = "";
     
     
         
     
           
           
  %>
 
<section class="section1" >
  <!--for demo wrap-->
  <h1 class="h1_table">Student Details</h1>
  <div class="tbl-header">
    <table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <th id="roll">ROLL NO</th>
          <%rs6.first();
          i=1;
          do
          {
          if(i>j){
              date = rs6.getString(1);
              date=date.replace("d", "");
             date = new StringBuffer(date).insert(4, '-').toString();
             date = new StringBuffer(date).insert(7, '-').toString();
             
          %>
          
          <th id="date"><%out.println(date);
              c1 = new PdfPCell(new Phrase(date));
        table.addCell(c1);%></th>
          
            <%}i++;}while(rs6.next());
            table.setHeaderRows(1);%>
        </tr>
      </thead>
    </table>
  </div>
        
        <div class="tb1-content" style="overflow-y:scroll;height: 250px ">
      
          
    <table cellpadding="0" cellspacing="0" border="1" id="table2">
      <tbody>
          <%while(rs7.next()){
              i=0;
              while(i<k)
              {
                  rs8[i].next();
                  i++;
              }
              


          %>
          <tr>
          
          <td><% out.println(""+rs7.getString("rollno"));
                table.addCell(rs7.getString("rollno"));%></td>
          
          <% i=0;
              while( i< k){%>
          <td><% out.println(rs8[i].getString(1));
                table.addCell(rs8[i].getString(1)); %></td>
          <%i++;}%>
        
          
        
        </tr>
        <%}%>
        
       </tbody>
    </table>
        
  </div>
        <button onclick="myFunction()">Export to PDF</button>




        <%document.add(table);
            document.close();
            
            
            
            
            
     }

            
        
        
            }
        %> 
         


		</span></section>
         
          </div>
        
        <div class="page" id="p5">
            <section class="icon fa fa-keyboard-o">
                <span>
                    <form>
                        <input type="hidden" name="abba" id="hidden" value="abc">
		<%  rs1.first(); %>
                        <select id="mySelect" value="<%=rs1.getString("class")%>" name="defaulter">
                    
                   <% do{ %>
                    
                    <option  value="<%=rs1.getString("class")%>"><%=rs1.getString("class")%></option>
                    
                    <%}while(rs1.next());%>
                        </select>
                    <br><br>
                    
                    
                    <select name="defaulter_subjects">
                    <option value="toc">TOC</option>
                    <option value="hci">HCI</option>
                    <option value="dbms">DBMS</option>
                    <option value="os">OS</option>
                    <option value="sepm">SEPM</option>
                </select>
                    
                    
                   
                    
                </select><br><br>
                Defaulter Cut_Off &nbsp; :&nbsp; <input type="number" name="cut_off">
                    
                 
                <input type="submit" value="submit">
                    </form>
                <br>	
  
  <%String defaulter_report=request.getParameter("defaulter"); //done to assign selected value of list to jsp variable
  String defaulterreport = "nine";
  String cutoff = request.getParameter("cut_off");
  String defaulter_subjects=request.getParameter("defaulter_subjects");
    if(defaulter_report!=null){
  
        int cut_off = Integer.parseInt(cutoff);
    if(defaulter_report.equals("TE-10"))
        defaulterreport="ten";
    
    
    
        
        
        //out.println("you have selected "+class_name);
    /*PreparedStatement ps9 =con.prepareStatement("select subject from teacher_details where class=? and username=?;");
    ps9.setString(1,defaulter_report);
    ps9.setString(2,nname);
    ResultSet rs9 = ps9.executeQuery();
     rs9.next();
     
     String sub_defaulter = rs9.getString("subject");
     */
     
         
         PreparedStatement ps10 =con.prepareStatement("select * from "+defaulter_subjects+"_"+defaulterreport+";");
         ResultSet rs10 = ps10.executeQuery();
    
      
         
        //pdf
        
        String file_name ="F:\\pdf\\defaulter.pdf";
        Document document = new Document();
        
        PdfWriter.getInstance(document, new FileOutputStream(file_name));
        document.open();
                String pdf_header1 = "                                                            "  + defaulter_report + "      DEFAULTER LIST";
        Paragraph para = new Paragraph(pdf_header1);
        document.add(para);
        Paragraph para1 = new Paragraph("                 ");
        document.add(para1);
        
        PdfPTable table = new PdfPTable(4);
        PdfPCell c1 = new PdfPCell(new Phrase("ROLL NO"));
        table.addCell(c1);
         c1 = new PdfPCell(new Phrase("ATTEDDED"));
        table.addCell(c1);
          c1 = new PdfPCell(new Phrase("CONDUCTED"));
        table.addCell(c1);
         c1 = new PdfPCell(new Phrase("ATTENDANCE"));
        table.addCell(c1);
        
        
        
       
        
        table.setHeaderRows(1);
        
       // table.addCell("1");
        //table.addCell("2");
        //table.addCell("3");
        //table.addCell("4");
        //table.addCell("5");
        //table.addCell("6");
       // document.add(table);
        //document.close();*/
        



         
     
           
           
  %>
 
<section class="section1" >
  <!--for demo wrap-->
  <h1 class="h1_table">Student Details</h1>
  <div class="tbl-header">
    <table cellpadding="0px" cellspacing="0" border="0">
      <thead>
        <tr>
          <th id="roll">ROLL NO</th>
          <th id="date">ATTENDED</th>
          <th id="date">CONDUCTED</th>
          <th id="date">ATTENDANCE</th>
        </tr>
      </thead>
    </table>
  </div>
        
        <div class="tb1-content" style="overflow-y:scroll;height: 300px ">
      
          
    <table cellpadding="0" cellspacing="0" border="1" id="table2">
      <tbody>
          <%while(rs10.next()){
          %>
          <tr>
          <%
                   Double att = (Double.parseDouble(rs10.getString("att"))/Double.parseDouble(rs10.getString("cond"))*100.0);
           if(att < cut_off){
          %>
          <td><% out.println(""+rs10.getString("rollno"));
              table.addCell(rs10.getString("rollno"));%></td>
          <td><% out.println(""+rs10.getInt("att"));
              table.addCell(rs10.getString("att"));%></td>
          <td><% out.println(""+rs10.getInt("cond"));
                table.addCell(rs10.getString("cond"));%></td>
          <td><% out.println(""+String.format("%.2f",att));
              table.addCell(String.format("%.2f",att));%></td>
        </tr>
        <%}}
        document.add(table);
        document.close();%>
        
       </tbody>
    </table>
        
  </div>
        

		




<button onclick="myFunction()">Export to PDF</button>






        
         <%}%>


		</span></section>
         
          </div>
        
        
         
        </div>
      </div>
    </div>
  </div>
</div>

</html>
<%
            Object insert = session.getAttribute("inserted");
            String inserted = String.valueOf(insert);
            if(inserted.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'DATA INSERTED SUCCESSFULLY','success')");
            out.println(" });");
            out.println("</script>");
            }
            session.setAttribute("inserted", "NO");
            


            Object mark = session.getAttribute("marked");
            String marked = String.valueOf(mark);
            if(marked.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SORRY', 'ATTENDANCE HAS  BEEN ALREADY MARKED','error')");
            out.println(" });");
            out.println("</script>");
            }
            session.setAttribute("marked", "NO");
            


            Object qrcode = session.getAttribute("qrcode_error");
            String qrcode_error = String.valueOf(qrcode);
            if(qrcode_error.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SORRY', 'QRCODE HAS BEEN ALREADY GENERATED','error')");
            out.println(" });");
            out.println("</script>");
            }
            session.setAttribute("qrcode_error", "NO");
            



             Object invaliddate = session.getAttribute("invalid_date");
            String invalid_date = String.valueOf(invaliddate);
            if(invalid_date.equals("YES")){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SORRY', 'INVALID DATE','error')");
            out.println(" });");
            out.println("</script>");
            session.setAttribute("invalid_date", "NO");
            //
            }
           
            %>