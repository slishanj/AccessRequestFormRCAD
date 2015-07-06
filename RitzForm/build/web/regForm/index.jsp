<!DOCTYPE html>

<%-- 
    Document   : index
    Created on : Nov 1, 2014, 12:28:31 PM
    Author     : Administrator
--%>

<%@page import="src.jdbc"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID"%>
<%--<%@page import="com.sun.security.auth.module.NTSystem"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //HTTP 1.1 
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server 
    %>

    <head>
        <meta charset="utf-8">
        <meta name="author" content="Occult Technologies,SriLanka">
        <meta name="description" content="Employee System Access Requests Management">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--[if lt IE 9]>
               <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
               <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <![endif]-->
        <!--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <!-- cdn for modernizr-->
        <script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
        <!-- polyfiller file to detect and load polyfills -->
        <script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
        <script>
            webshim.setOptions('waitReady', false);
            webshim.setOptions('forms-ext', {types: 'date'});
            webshim.polyfill('forms forms-ext');
        </script>

        <script type="text/javascript">
            var request;
            function sendInfo(ev) {
                var event = ev || window.event;
                if (event.preventDefault)
                {
                    event.preventDefault();
                }else {
                    event.returnValue = false;
                }
                var asscode = document.entrance.associatecode.value;
                var url = "../empinfo.asp?asscode=" + asscode;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = setInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server\nMessage: " + e);
                }
            }

            function setInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    var array = val.split(",");
                    document.entrance.firstname.value = array[0];
                    document.entrance.middlename.value = array[1];
                    document.entrance.lastname.value = array[2];
                    document.entrance.position.value = array[3];
                    document.entrance.department.value = array[4];
                    document.entrance.EID.value = array[5];
                    document.entrance.datejoined.value = array[6];
                }
            }
        </script>

        <link rel="shortcut icon" href="../welcome/images/property.logo.ico">
        <%--<!--<link rel="stylesheet" type="text/css" href="../regForm/bootstrap_3.3.2/css/bootstrap-theme.css"/>-->--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
        <%--<!--<link rel="stylesheet" type="text/css" href="../regForm/bootstrap_3.3.2/css/bootstrap.css"/>-->--%>
        <%--<!--<script type="text/css" src="../regForm/bootstrap_3.3.2/js/bootstrap.js"></script>-->--%>
        <%--<!--<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>-->--%>
        <%--<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->--%>

        <title>
            The Ritz-Carlton Hotel Abu Dhabi, Grand Canal
        </title>

        <style type="text/css">
            #sunset,#spaset,#oasysset,#OASYS_eHCMset,#vicasset,#operapmsset,#respakset,#fmcset,
            #folderset input[type='checkbox']{
                width: 15px;height:15px;
            }
            #gradientBack{
                background: rgb(160,216,239); /* Old browsers */
                background: -moz-linear-gradient(left, rgba(160,216,239,1) 0%, rgba(221,241,249,1) 65%, rgba(254,255,255,1) 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(160,216,239,1)), color-stop(65%,rgba(221,241,249,1)), color-stop(100%,rgba(254,255,255,1))); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(left, rgba(160,216,239,1) 0%,rgba(221,241,249,1) 65%,rgba(254,255,255,1) 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(left, rgba(160,216,239,1) 0%,rgba(221,241,249,1) 65%,rgba(254,255,255,1) 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(left, rgba(160,216,239,1) 0%,rgba(221,241,249,1) 65%,rgba(254,255,255,1) 100%); /* IE10+ */
                background: linear-gradient(to right, rgba(160,216,239,1) 0%,rgba(221,241,249,1) 65%,rgba(254,255,255,1) 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a0d8ef', endColorstr='#feffff',GradientType=1 ); /* IE6-9 */}

            #gradientWarningMgr{background: -moz-linear-gradient(top,  rgba(255,26,0,0.82) 0%, rgba(255,26,0,0.73) 12%, rgba(255,26,0,0.05) 100%); /* FF3.6+ */
                                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,26,0,0.82)), color-stop(12%,rgba(255,26,0,0.73)), color-stop(100%,rgba(255,26,0,0.05))); /* Chrome,Safari4+ */
                                background: -webkit-linear-gradient(top,  rgba(255,26,0,0.82) 0%,rgba(255,26,0,0.73) 12%,rgba(255,26,0,0.05) 100%); /* Chrome10+,Safari5.1+ */
                                background: -o-linear-gradient(top,  rgba(255,26,0,0.82) 0%,rgba(255,26,0,0.73) 12%,rgba(255,26,0,0.05) 100%); /* Opera 11.10+ */
                                background: -ms-linear-gradient(top,  rgba(255,26,0,0.82) 0%,rgba(255,26,0,0.73) 12%,rgba(255,26,0,0.05) 100%); /* IE10+ */
                                background: linear-gradient(to bottom,  rgba(255,26,0,0.82) 0%,rgba(255,26,0,0.73) 12%,rgba(255,26,0,0.05) 100%); /* W3C */
                                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d1ff1a00', endColorstr='#0dff1a00',GradientType=0 ); /* IE6-9 */
            }

            #sun,#spa,#oasys,#OASYS_eHCM,#vicas,#operapms,#operasnc,#respak,#fmc,#folder,#mymic{background-color: #000;opacity: .75}
            /*            #sun,#spa,#oasys,#OASYS_eHCM,#vicas,#operapms,#operasnc,#respak,#fmc,#folder{
                            background: -moz-linear-gradient(left,  rgba(0,0,0,0) 0%, rgba(0,0,0,0.7) 44%, rgba(0,0,0,0.8) 50%, rgba(0,0,0,0.72) 55%, rgba(0,0,0,0) 100%);  FF3.6+ 
                            background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(0,0,0,0)), color-stop(44%,rgba(0,0,0,0.7)), color-stop(50%,rgba(0,0,0,0.8)), color-stop(55%,rgba(0,0,0,0.72)), color-stop(100%,rgba(0,0,0,0)));  Chrome,Safari4+ 
                            background: -webkit-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(0,0,0,0.7) 44%,rgba(0,0,0,0.8) 50%,rgba(0,0,0,0.72) 55%,rgba(0,0,0,0) 100%);  Chrome10+,Safari5.1+ 
                            background: -o-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(0,0,0,0.7) 44%,rgba(0,0,0,0.8) 50%,rgba(0,0,0,0.72) 55%,rgba(0,0,0,0) 100%);  Opera 11.10+ 
                            background: -ms-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(0,0,0,0.7) 44%,rgba(0,0,0,0.8) 50%,rgba(0,0,0,0.72) 55%,rgba(0,0,0,0) 100%);  IE10+ 
                            background: linear-gradient(to right,  rgba(0,0,0,0) 0%,rgba(0,0,0,0.7) 44%,rgba(0,0,0,0.8) 50%,rgba(0,0,0,0.72) 55%,rgba(0,0,0,0) 100%);  W3C 
                            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#00000000',GradientType=1 );  IE6-9 
            
                        }*/
            #sun,#spa,#oasys,#OASYS_eHCM,#vicas,#operapms,#operasnc,#respak,#fmc,#folder,#mymic{color: whitesmoke}

            #emailaccessdata{background: -moz-linear-gradient(left,  rgba(255,127,4,0.97) 0%, rgba(255,124,0,0.49) 49%, rgba(255,167,61,0.42) 56%, rgba(255,183,107,0) 100%); /* FF3.6+ */
                             background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(255,127,4,0.97)), color-stop(49%,rgba(255,124,0,0.49)), color-stop(56%,rgba(255,167,61,0.42)), color-stop(100%,rgba(255,183,107,0))); /* Chrome,Safari4+ */
                             background: -webkit-linear-gradient(left,  rgba(255,127,4,0.97) 0%,rgba(255,124,0,0.49) 49%,rgba(255,167,61,0.42) 56%,rgba(255,183,107,0) 100%); /* Chrome10+,Safari5.1+ */
                             background: -o-linear-gradient(left,  rgba(255,127,4,0.97) 0%,rgba(255,124,0,0.49) 49%,rgba(255,167,61,0.42) 56%,rgba(255,183,107,0) 100%); /* Opera 11.10+ */
                             background: -ms-linear-gradient(left,  rgba(255,127,4,0.97) 0%,rgba(255,124,0,0.49) 49%,rgba(255,167,61,0.42) 56%,rgba(255,183,107,0) 100%); /* IE10+ */
                             background: linear-gradient(to right,  rgba(255,127,4,0.97) 0%,rgba(255,124,0,0.49) 49%,rgba(255,167,61,0.42) 56%,rgba(255,183,107,0) 100%); /* W3C */
                             filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7ff7f04', endColorstr='#00ffb76b',GradientType=1 ); /* IE6-9 */
            }

            #noticeIT{
                /*                background: rgba(255,255,255,1);
                                      background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%);
                                      background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(255,255,255,1)), color-stop(47%, rgba(246,246,246,1)), color-stop(100%, rgba(237,237,237,1)));
                                      background: -webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%);
                                      background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%);
                                      background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%);
                                      background: radial-gradient(ellipse at center, rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%);
                                      filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ededed', GradientType=1 );*/

                /*            #noticeIT {
                                background: #000;
                                color: #fff;
                                height: fit-content;
                                position: relative;
                                padding: 10px;
                
                                -moz-animation-name: dropHeader;
                                -moz-animation-iteration-count: 1;
                                -moz-animation-timing-function: ease-in;
                                -moz-animation-duration: 0.3s;
                
                                -webkit-animation-name: dropHeader;
                                -webkit-animation-iteration-count: 1;
                                -webkit-animation-timing-function: ease-in;
                                -webkit-animation-duration: 0.3s;
                
                                animation-name: dropHeader;
                                animation-iteration-count: 1;
                                animation-timing-function: ease-in;
                                animation-duration: 0.3s;
                            }
                            @-moz-keyframes dropHeader {
                                0% {
                                    -moz-transform: translateY(-40px);
                                }
                                100% {
                                    -moz-transform: translateY(0);
                                }
                            }
                            @-webkit-keyframes dropHeader {
                                0% {
                                    -webkit-transform: translateY(-40px);
                                }
                                100% {
                                    -webkit-transform: translateY(0);
                                }
                            }
                            @keyframes dropHeader {
                                0% {
                                    transform: translateY(-40px);
                                }
                                100% {
                                    transform: translateY(0);
                                }
                            }*/
            }

        </style>

    </head>
    <body>
        <%--Your Location: <% String ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("Proxy-Client-IP");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("HTTP_CLIENT_IP");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getRemoteAddr();
            }
            out.write(ipAddress);
//                out.write("<br>");
//                out.print(request.getRemoteAddr());
//                out.write("<br>");
//                out.print(request.getRemoteHost());
//                out.write("<br>");
//                out.print(request.getHeader("x-forwarded-for"));
//            --%>

        <%--<!--<br>Username:-->
            out.write(System.getProperty("user.name"));
            if (request.getRemoteUser() != null) {
                out.write("<br> remote User"+request.getRemoteUser());
            }
            if (request.getUserPrincipal() != null) {
                out.write("<br>UserPrincipal().getName() "+request.getUserPrincipal().getName());
            }
//                out.write("<br>"+new com.sun.security.auth.module.NTSystem().getName());
        --%>


        <% String uuid_Reg = UUID.randomUUID().toString();
             %>
        <% System.out.println(">>>>>>>>>>>>>>>>>>>>>>>REGISTRATION ID_ " + uuid_Reg + " <<<<<<<<<<<<<<<<<<<<<<<<<");%>

        <br/>
        <%--<!--<center>-->--%>
        <form name="entrance" id="mainForm" style="margin-top: 30px;border-radius: 15px;
              -webkit-box-shadow: -4px 3px 81px 23px rgba(0,0,0,0.53);
              -moz-box-shadow: -4px 3px 81px 23px rgba(0,0,0,0.53);
              box-shadow: -4px 3px 81px 23px rgba(0,0,0,0.53);padding: 5px" 
              method="POST" action="../Proceed2" onsubmit="">
            <br/>
            <%@include file="../logos.html" %>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <input type="hidden" value="<%=uuid_Reg%>" name="ID"/>
            <div style="width: auto">
                <%@include file="../title_msg.html" %>
                <center>
                    <div style="width: 90%;">
                        <table>
                            <tbody>
                                <tr>
                                    <td colspan="6" style="padding-bottom: 10px;">
                            <center>
                                <div class="" style="width: 50%;float: left;">
                                    <label for="ac-1">Associate Code</label>
                                    <div class=" input-group" style="width: 250px;">
                                        <input id="ac-1" class="form-control" required type="number" style="width: 197px" name="associatecode" 
                                               placeholder="this is your Employee No."/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" onclick="sendInfo(event);
                                                    return false;">Get Details</button>
                                        </span>
                                    </div>
                                </div>
                                <div class="" style="width: 50%;float: right"> 
                                    <label for="rd-1">Request Date</label>
                                    <input id="rd-1" class="form-control" required type="date" 
                                           id="datepicker" name="requestdate" value="" style="width: 200px"/>
                                </div>
                            </center>
                            </td>
                            </tr>
                            <tr>
                                <td id="gradientBack" colspan="6" style="padding-top: 5px;">
                                    <span class="" style="padding-left: 15px;font-size: large;font-weight: bold;text-transform: uppercase;">
                                        Associate Details
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px">First Name</td>
                                <td style="padding: 5px"><input class="form-control" type="text" required name="firstname" readonly/></td>
                                <td style="padding: 5px">Middle Name</td>
                                <td style="padding: 5px"><input class="form-control" type="text" name="middlename" readonly/></td>
                                <td style="padding: 5px">Last Name</td>
                                <td style="padding: 5px"><input class="form-control" type="text" required name="lastname" readonly/></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px">Designation</td>
                                <td style="padding: 5px">
                                    <!--<input class="form-control" type="text" required readonly name="position" placeholder="eg: technician"/></td>-->
                                    <input class="form-control" type="text" required readonly name="position" /></td>
                                <td style="padding: 5px">Department</td>
                                <td style="padding: 5px">

                                    <!--                                         "BANQUETS",
                                                                                    "CONFERENCE & CATERING",
                                                                                    "CORPORATE SALES",
                                                                                    "ENGINEERING",
                                                                                    "FINANCE & ACCOUNTING",
                                                                                    "FOOD & BEVERAGE",
                                                                                    "GOVERNMENT SALES",
                                                                                    "GROUP SALES",
                                                                                    "HOUSEKEEPING",
                                                                                    "HUMAN RESOURCES",
                                                                                    "LOSS PREVENTION",
                                                                                    "PURCHASING",
                                                                                    "QUALITY",
                                                                                    "REVENUE MANAGEMENT",
                                                                                    "ROOMS II",
                                                                                    "SALES & MARKETING",
                                                                                    "SALES",
                                                                                    "SPA",
                                                                                    "SYSTEMS",
                                                                                    "TRAVEL INDUSTRY SALES"-->

                                    <%--<!--<input type="text" required name="department"/>-->--%>
                                    <%--
                                        String[] DeptList = {
                                            "BANQUETS",
                                            "CONFERENCE & CATERING",
                                            "CORPORATE SALES",
                                            "ENGINEERING",
                                            "FINANCE & ACCOUNTING",
                                            "FOOD & BEVERAGE",
                                            "GOVERNMENT SALES",
                                            "GROUP SALES",
                                            "HOUSEKEEPING",
                                            "HUMAN RESOURCES",
                                            "LOSS PREVENTION",
                                            "PURCHASING",
                                            "QUALITY",
                                            "REVENUE MANAGEMENT",
                                            "ROOMS II",
                                            "SALES & MARKETING",
                                            "SALES",
                                            "SPA",
                                            "SYSTEMS",
                                            "TRAVEL INDUSTRY SALES"
};
                                    --%>
                                    <input class="form-control" type="text"  name="department" readonly/>
                                    <!--                                        <div class="dropdown">
                                                                                <select class="" name="department" placeholder="Select your Department">-->
                                    <%--<!--<option value="FnB">Food & Beverage</option>-->
                                        for (String name : DeptList) {
                                            out.write("<option value=\"" + name + "\">" + name + "</option>");
                                        }
                                    // this was the first method implemented 
                                   
                                    // this was implemented later, 
                                    // but there is no need to change the dept when 
                                    // it is auto-set using the associate code filled action above
                                        try {
                                            ResultSet s = jdbc.getConnection().createStatement()
                                                    .executeQuery("SELECT * FROM dept "
                                                            + " ORDER BY dept ASC");
                                            while (s.next()) {
                                                out.write("<option value=\"" + s.getString("dept") + "\">" + s.getString("dept") + "</option>");
                                            }
                                            s.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {

                                                    }
                                    --%>
                                    <!--</select>
                                    </div>-->
                                </td>
                                <td style="padding: 5px">Date Joined</td>
                                <td style="padding: 5px"><input class="form-control" type="text" required name="datejoined" readonly/></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr style="">
                                <td style="padding: 5px;padding-bottom: 15px;
                                    padding-top: 15px;" colspan="6">
                            <center>   
                                <%--
                                            <!-- <span style="border-top: 2px red groove;border-bottom: 5px red groove;
                                                                          border-left: 3px red groove;border-right: 3px red groove;
                                                                          border-radius: 5px;padding: 4px"> -->
                                --%>
                                <div class="form-group">
                                    <label class="control-label">Enterprise ID</label>
                                    <input class="form-control" type="text" required name="EID" 
                                           style="width: 300px;text-align: center;background-color: papayawhip;"/>
                                    <!--placeholder="your system login id, eg: iuthp352"/>-->
                                </div>
                            </center>
                            </td>
                            </tr>
                            <tr style="height: 20px"><td></td></tr>
                            <tr style="">
                                <td id="gradientBack" colspan="6" style="padding-top: 5px;">
                                    <span style="padding-left: 15px;font-size: large;font-weight: bold;text-transform: uppercase">
                                        Management Approval
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px">Manager Name</td>
                                <%--<!--<td></td>-->--%>
                                <td style="padding: 5px" colspan="2">
                                    <input class="form-control" style="width: 240px" type="text" required name="managername"/>
                                </td>
                                <td style="padding: 5px">&nbsp;Manager Title</td>
                                <%--<!--<td></td>-->--%>
                                <td style="padding: 5px" colspan="2">
                                    <input class="form-control" style="width: 240px" type="text" required name="managertitle"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <p id="gradientWarningMgr" style="border-radius: 5px;box-shadow: 10px 10px 5px #888888;
                                       text-align: center">By giving Management Approval, 
                                        I understand the critical access 
                                        which includes but not limited to <strong>Credit Card Information 
                                            View/Edit in Opera, PII & PCI Information 
                                            in all systems</strong>, and agree to give access to 
                                        my associate as mentioned in the 'associate details' section.
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6"  style="padding-top: 10px">
                            <center><strong>Manager Signature</strong>
                                <input class="form-control" type="text" required name="managersig" placeholder="Approving manager must initial here"
                                       style="width: 300px;text-align: center"/></center>
                            </td>
                            </tr>
                            <tr style="height: 30px">
                                <td colspan="6">
                                    <%--<!--<hr>-->--%>
                                </td>
                            </tr>
                            <tr style="">
                                <td id="gradientBack" colspan="6" style="padding-top: 5px;">
                                    <span style="padding-left: 15px;font-size: large;font-weight: bold;text-transform: uppercase">
                                        Access Required
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <%@include file="basicreq.html" %>
                                </td>
                            </tr>
                            <%@include file="sunreq.html"%>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="spareq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="oasysreq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="oasys2req.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="mymicrosreq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="vicasreq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="operareq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="opera2req.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="respakreq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="fmcreq.html" %>
                            <tr style=""><td><br></td></tr>
                                    <%@include file="folderreq.html" %>
                            <tr style="height: 20px"><td></td></tr>
                            <tr>
                                <td colspan="6">
                                    <p  id="gradientWarningMgr" style="border-radius: 5px;box-shadow: 10px 10px 5px #888888;
                                        text-align: center">By giving Management Approval, 
                                        I understand the critical access 
                                        which includes but not limited to <strong>Credit Card Information 
                                            View/Edit in Opera, PII & PCI Information 
                                            in all systems</strong>, and agree to give access to 
                                        my associate as mentioned in the 'associate details' section.
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6"  style="padding-top: 10px">
                            <center><strong>Manager Signature</strong>
                                <input class="form-control" type="text" required name="foldermanagersig" placeholder="Approving manager must initial here"
                                       style="width: 300px;text-align: center"/>
                            </center>
                            </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </center>
                <br/>
                <br/>
                <br/>
                <hr style="width: 80%">
                <br>
            </div>
            <br/>
            <div style="width: 100%;" class="text-center" >
                <style type="text/css">
                    // @font-face{
                    // font-family: Oswald;
                    //	src: url(http://fonts.googleapis.com/css?family=Oswald:400,700,300);
                    // }
                    @import url(http://fonts.googleapis.com/css?family=Patua+One);
                    input#bigsubmitbutton {
                        width:500px;
                        background: #3e9cbf; 
                        padding: 8px 14px 10px; 
                        border:1px solid #3e9cbf; 
                        cursor:pointer; 
                        font-size:1.5em;
                        //font-family:"Oswald", sans-serif; /*Oswald is from http://www.google.com/webfonts/specimen/Oswald*/
                        font-family: 'Patua One', cursive;
                        letter-spacing:.1em;
                        text-shadow: 0 -1px 0px rgba(0, 0, 0, 0.3); 
                        color: #fff;
                        -webkit-box-shadow: inset 0px 1px 0px #3e9cbf, 0px 5px 0px 0px #205c73, 0px 10px 5px #999;
                        -moz-box-shadow: inset 0px 1px 0px #3e9cbf, 0px 5px 0px 0px #205c73, 0px 10px 5px #999;
                        box-shadow: inset 0px 1px 0px #3e9cbf, 0px 5px 0px 0px #205c73, 0px 10px 5px #999;
                        -moz-border-radius: 10px;
                        -webkit-border-radius: 10px;
                        border-radius: 10px;
                    }

                    input#bigsubmitbutton:hover, input#bigsubmitbutton:focus {
                        /*color:#dfe7ea;*/
                        color:#c0c0c0;
                        -webkit-box-shadow: inset 0px 1px 0px #3e9cbf, 0px 2px 0px 0px #205c73, 0px 2px 5px #999;
                        -moz-box-shadow: inset 0px 1px 0px #3e9cbf, 0px 2px 0px 0px #205c73, 0px 2px 5px #999;
                        box-shadow: inset 0px 1px 0px #3e9cbf, 0px 2px 0px 0px #205c73, 0px 2px 5px #999;
                    }
                </style>

                <script type="text/javascript">
                    function validateEmailFields() {
                        if (document.getElementById("emaildisplayname").value === "") {
                            document.getElementById("emaildisplayname").focus();
                            document.getElementById("notifEmailName").style.visibility = "visible";
                            document.getElementById("notifEmailName").innerHTML = "Please Fill out this field to continue";
                        } else if (document.getElementById("emailaddress").value === "") {
                            document.getElementById("emailaddress").focus();
                            document.getElementById("notifEmailAddress").style.visibility = "visible";
                            document.getElementById("notifEmailAddress").innerHTML = "Please Fill out this field to continue";
                        } else {
                            document.getElementById("mainForm").submit();
                        }
                    }
                </script>
                <input style="" id="bigsubmitbutton" class="text-center" type="submit"
                       data-regular="" value="Proceed Request" onclick="validateEmailFields();" />
                <%--<!--<button class="btn btn-large btn-block btn-primary" type="button">Block level button</button>-->--%>

            </div>
            <br/>
        </form>
        <p id="resultBody" align="center">
            <%-- if (request.getParameter("msg") != null) {%>
            <%= request.getParameter("msg")%>
            <% }--%>
        </p>
        <%--<!--        <div style="margin-bottom: 10px;
                     font-size: 12px;
                     line-height: 15px;
                     color: #999;">
                    <center>
                        <form action="feedBform" method="POST" id="feedbackForm" name="feedbackForm">
                            <label>Your Feedback: </label><input required type="text" name="fb" id="fb" />
                            <label>Your Email: </label><input required type="email" name="emailfb" id="emailfb" />
                            <input type="submit" name="submit" id="submitfb" 
                                   value="Submit Feedback">
                        </form>
                    </center>
                </div>-->--%>
        <div style="margin-bottom: 0px;
             font-size: 10px;
             line-height: 15px;
             color: #999;">
            <center>  © 2014 Occult Technologies. All Rights Reserved.</center>
        </div>
        <br>
    </body>

</html>
