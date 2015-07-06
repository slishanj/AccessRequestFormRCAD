<%-- 
    Document   : login
    Created on : Sep 22, 2013, 7:40:15 PM
    Author     : Viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //HTTP 1.1 
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server 

        if (session.getAttribute("user") != null) {
            response.sendRedirect("index.jsp");
        } else {
    %>
    <head>
        <link rel="shortcut icon" href="img/favicon.png" type="image/png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="style.css" type="text/css"/>
        <style type="text/css">
            .titleTextCon{
                font-family: Trebuchet ms;
                background-image: url(img/bar_bg.gif);
                background-repeat: no-repeat;
                height: 33px;
                margin-left: 18px;
            }
            .titleText{
                margin-left: 50px;
                font-family: sans-serif;
                padding-top: 8px;
                color: #999999;
            }
            .login_top{
                background: url(img/login_top.png);
                background-repeat: no-repeat;
                width: 552px;
                height: 12px;
                margin-left: 20px;
                margin-top: 10px;
                float: left;
            }
            .login_center{
                margin-left: 20px;
                list-style-type:none; 
                background: url(img/login_center.png);
                background-repeat: repeat-y;
                width: 552px;
                float: left;
            }
            .login_bottom{
                background: url(img/login_bottom.png);
                background-repeat: no-repeat;
                width: 552px;
                height: 12px;
                margin-left: 20px;
                margin-bottom: 10px;
                float: left;
            }
            .ttt{
                width: fit-content; 
                height: auto;
                font-family: Trebuchet ms;
                float: left;
                margin-left:50px;
            }
            .ttt td{
                padding: 10px;
            }
            .loginButton{
                background-image: url(img/signup.png);
                width: 109px;
                height: 27px;
                border: none;
                margin-bottom: 10px;
                text-align: center;
                cursor: pointer;
                color: #4a4a4a;
                font-family: Trebuchet ms; 
                font-weight: bold;
                border-radius:10px;

            }
            .forgot_pass{
                font-family: Trebuchet ms;
                cursor: pointer;
                color: #676d77;
            }
            .forgot_pass:active{
                color : red;
            }
            .forgot_pass:hover{
                color: black;
            }
        </style>
        <title>GoCart.lk | Login</title>
    </head>
    <body class="bg">
        <%--<%@include file="Heading.jsp" %>--%>
        <%--<%@include file="menu_bar.jsp" %>--%>

        <div class="MainDiv">
            <div class="left">
                <%--<jsp:include page="left_pane.jsp"/>--%>
            </div>    
            <div class="center" id="centerDiv">
                <div class="titleTextCon">
                    <div class="titleText">Login</div>
                </div>
                <div class="login_top"></div>
                <div class="login_center">
                    <form action="logtest" method="post">
                        <table class="ttt">
                            <tbody>
                                <tr>
                                    <td style="width: fit-content;">Email</td>
                                    <td>:</td>
                                    <td><input type="text" name="uname" style="width: 300px; height: 20px; font-size: 16px;"></td>
                                </tr>
                                <tr>
                                    <td  style="width: fit-content;">Password</td>
                                    <td>:</td>
                                    <td><input type="password" name="pword" style="width: 300px; height: 20px; font-size: 16px;"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><input type="submit" value="Login"  class="loginButton"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td class="forgot_pass" style="padding: 0px;" onclick="location.href='send_security_code.jsp';">Forgot Password?</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <%if (request.getParameter("msg") != null) {%>
                                    <td style="color: red; width: 300px; height: auto;" ><%=request.getParameter("msg")%></td>
                                    <%}%>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="login_bottom"></div>
            </div>
        </div>
        <div class="right">
            <%--<jsp:include page="right_pane.jsp"/>--%>
        </div> 
    </div>

    <div class="footer">
        <%--<%@include file="footer.jsp" %>--%>
    </div>
</body>
<%}%>
</html>
