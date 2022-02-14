
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<html>
<head>
<script src="qrcode.js"></script>

</head>
<style>
    .elem{
        display:none;
    }
</style>
<body>
<%
    int j=0;
    String[] sub=new String[100];
    sub=(String[])session.getAttribute("SUBJECTS");
     
    Object o1=session.getAttribute("noofsubjects");
    int i=(Integer)o1;
    
%>
<div id="output" style="margin-top: 100px;"></div>


<form>
    <select name="los" id="los">    
    <%while(j<i){%>
    <option><%=sub[j++]%></option>
    <%}%>
    </select>
   <input type="button" value="Generate QR code" onclick="genqrcode()" style="margin-top:20px;">
   <input type="submit" id="elem" value="Back" style="display:none;">
</form>
    
    <script>
   
function genqrcode()
{
    var x=document.getElementById("los").value;
    var elem = document.getElementById("elem");
    elem.style.display = "block";
    let qrcode=new QRCode("output",{
    text:x,
    width:177,
    height:177,
    colorDark:"black",
    colorLight: "white",
    correctLevel : QRCode.CorrectLevel.M
    
});
}


</script>
<%
String b=request.getParameter("los");
String classname="nine";
 LocalDateTime ldt = LocalDateTime.now();
            String d= DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(ldt);
             d = d.replace("-","");
              d = 'd'+d;
if(b!=null)
{
    String send = "NO";
    Object ccstat = session.getAttribute("cc");
    String cc=String.valueOf(ccstat);
    Object o=session.getAttribute("uname");
    String uname=o.toString();
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
    PreparedStatement s1=con.prepareStatement("select class from teacher_details where username=? and subject=?;");
    s1.setString(1,uname );
    s1.setString(2,b);
    ResultSet r=s1.executeQuery();
    r.next();
    String class_name=r.getString("class");
    if(class_name.equals("TE-10"))
        classname="ten";
   
    PreparedStatement s4= con.prepareStatement("update "+b+"_"+classname+" set " +d+ "='a';");
     PreparedStatement s2=con.prepareStatement("update "+b+"_"+classname+" set cond=cond+1;");
   
    PreparedStatement s3 =con.prepareStatement("alter table "+b+"_"+classname+" add column " +d+ " char(1);");
    try
    {s3.executeUpdate();
    s2.executeUpdate();
    
    s4.executeUpdate();
    
    
    
    }
    catch(Exception e)
            {
                session.setAttribute("qrcode_error","YES");
                send = "YES";
            }
    
        if(cc.equals("YES"))
        {
         session.setAttribute("cc","NO");
         response.sendRedirect("cc.jsp");
         return;
        }
     response.sendRedirect("teacherpage.jsp");
     return;
    
}   






%>   
    

</body>
</html>
