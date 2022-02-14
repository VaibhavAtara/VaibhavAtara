<%-- 
    Document   : index
    Created on : 12 Oct, 2018, 12:25:28 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<html  >

<head>
  
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  

      <link rel="stylesheet" href="login.css">
      <script>
function mouseoverPass(obj) {
  var obj = document.getElementById('myPassword');
  obj.type = "text";
}
function mouseoutPass(obj) {
  var obj = document.getElementById('myPassword');
  obj.type = "password";
}
      </script>

  
</head>

<body>

  <div class="cont">
  <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <div class="login__form">
        <div class="login__row">
		<form  method="post" action="http://localhost:8080/dd/login.jsp">
          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
		  
          <input type="text" class="login__input name" name="uname" placeholder="Username"/>
        </div>
        <div class="login__row">
          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
          </svg>
          <input type="password" class="login__input pass" name="pass"  id="myPassword"  placeholder="Password" onmousedown="this.type='text'" onmouseup="this.type='password'" onmousemove="this.type='password'"/>
          <!--img src="theicon" onmouseover="mouseoverPass();" onmouseout="mouseoutPass();" /-->
        </div>
        <input type="submit" class="login__submit" value="Login">Login</input>
        <h1><a href="forgotpassword.html">forgot password?</a></h1>
      </div>
    </div>
      
    </form>
            
  <!script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'><!--script-->

  

    <script  src="login.js"></script>




</body>

</html>
<%
    session.setAttribute("cc", "NO");
    Object stat = session.getAttribute("status");
    String status = String.valueOf(stat);
    session.setAttribute("status",status);
            if(status.equals("failed")){
    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('oops', 'INVALID USERNAME OR PASSWORD','error')");
            out.println(" });");
            out.println("</script>");
            }
            



            Object change_pass = session.getAttribute("change_pass");
    String change_password = String.valueOf(change_pass);
    //session.setAttribute("status",status);
            if(change_password.equals("YES")){
    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'PASSWORD HAS BEEN CHANGED SUCCESSFULLY ,PLEASE LOGIN AGAIN','success')");
            out.println(" });");
            out.println("</script>");
            }
            change_password = "NO";
            session.setAttribute("change_pass", "NO");
            
String email="--";
Object emailsend = session.getAttribute("email_send");
    email = String.valueOf(emailsend);
    //session.setAttribute("status",status);
            if(email.equals("YES")){
    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'EMAIL HAS BEEN SENT','success')");
            out.println(" });");
            out.println("</script>");
            }
            

            if(email.equals("NO")){
    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('SUCCESS', 'UNABLE TO SENT EMAIL','error')");
            out.println(" });");
            out.println("</script>");
            }

            email = "--";
            session.setAttribute("email_send", "--");

            %>