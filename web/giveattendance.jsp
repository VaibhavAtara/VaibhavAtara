<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<html>
  <head>
      <style>
          babu{
              visibility:hidden
          }
      </style>
    <title>Instascan &ndash; Demo</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
    <script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
  </head>
  <body>
    <div id="app">
      <div class="sidebar">
        <section class="cameras">
          <h2>Cameras</h2>
          <ul>
            <li v-if="cameras.length === 0" class="empty">No cameras found</li>
            <li v-for="camera in cameras">
              <span v-if="camera.id == activeCameraId" :title="formatName(camera.name)" class="active">{{ formatName(camera.name) }}</span>
              <span v-if="camera.id != activeCameraId" :title="formatName(camera.name)">
                <a @click.stop="selectCamera(camera)">{{ formatName(camera.name) }}</a>
              </span>
            </li>
          </ul>
        </section>
        <section class="scans">
          
            <h2>Scans</h2>
          <ul v-if="scans.length === 0">
            <li class="empty">No scans yet</li>
          </ul>
         <form>
          <form>
            <li v-for="scan in scans" :key="scan.date" :title="scan.content" title="">SCANNED SUCCESSFULLY</li>
            <select hidden  name="baba">
                <option v-for="scan in scans" :key="scan.date" :title="scan.content" > {{ scan.content }} </option>
                
            </select>
            
            <input v-for="scan in scans" :key="scan.date" :title="scan.content" title="" type="submit" value="submit">
          </form>
           
           
             
            <% String a = request.getParameter("baba");     //qr code data
                
            LocalDateTime ldt = LocalDateTime.now();
            String d= DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(ldt);
             d = d.replace("-","");
              d = 'd'+d;
            if(a!=null)
            {
                a=a.toLowerCase();
                String classname="nine";
                Object uname=session.getAttribute("uname");
                String nname=String.valueOf(uname);
               Class.forName("com.mysql.cj.jdbc.Driver");
               Connection con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
              
               Statement s =con.createStatement();
               String sql="select * from student where username='"+nname+"';";
               ResultSet r = s.executeQuery(sql);
            r.next();
            String rollno=r.getString("rollno");
            if(rollno.charAt(1)=='0')
                classname="ten";
            
            
           
           try
           {
               PreparedStatement s3 =con.prepareStatement("select  "+d+" from  "+a+"_"+classname+" where rollno=?;");
           s3.setString(1,rollno);
           ResultSet rs3 = s3.executeQuery();
          rs3.next();
          
          if(rs3.getString(1).equals("p") )
          {
              
              session.setAttribute("att_checked", "YES");
              response.sendRedirect("homepage2.jsp");
              return;
          }
               PreparedStatement s2 =con.prepareStatement("update "+a+"_"+classname+" set "+ d +"='p' where rollno=?;");
           s2.setString(1,rollno); 
            
            s2.executeUpdate();
           PreparedStatement s1 =con.prepareStatement("update "+a+"_"+classname+" set att=att+1 where rollno=?");
           s1.setString(1,rollno);
           
            s1.executeUpdate();
           
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('succsss', 'YOUR ATTENDANCE HAS BEEN MARKED SUCCESSFULLY','success')");
            out.println(" });");
            out.println("</script>");
          
            }
           catch(Exception e)
           {
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('oops', 'WRONG QRCODE OR YOUR ATTENDANCE HAS BEEN MARKED ALREADY','error')");
            out.println(" });");
            out.println("</script>");
           }
        
         
            
               
            
            
            
            }
      %>
      <a href="homepage2.jsp">Back</a>
        </section>
          
      </div>
      <div class="preview-container">
        <video id="preview"></video>
      </div>
    </div>
    <script type="text/javascript" src="app.js"></script>
  </body>
</html>
