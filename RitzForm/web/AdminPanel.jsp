<%-- 
    Document   : AdminPanel
    Created on : Mar 7, 2015, 12:22:57 AM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="src.jdbc"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
        <script src="regForm/jquery-1.11.2.js"></script>
        <style type="text/css">
            #tabs {
                overflow: auto;
                width: 90%;
                list-style: none;
                margin: 0;
                padding: 0;
            }

            #tabs li {
                margin: 0;
                padding: 0;
                float: left;
            }

            #tabs a {
                box-shadow: -4px 0 0 rgba(0, 0, 0, .2);
                background: #ad1c1c;
                background: linear-gradient(220deg, transparent 10px, #ad1c1c 10px);
                text-shadow: 0 1px 0 rgba(0,0,0,.5);
                color: #fff;
                float: left;
                font: bold 12px/35px 'Lucida sans', Arial, Helvetica;
                height: 35px;
                padding: 0 30px;
                text-decoration: none;
            }

            #tabs a:hover {
                background: #c93434;
                background: linear-gradient(220deg, transparent 10px, #c93434 10px);     
            }

            #tabs a:focus {
                outline: 0;
            }

            #tabs #current a {
                background: #fff;
                background: linear-gradient(220deg, transparent 10px, #fff 10px);
                text-shadow: none;    
                color: #333;
            }

            #content {
                background-color: #fff;
                background-image:         linear-gradient(top, #fff, #ddd);
                border-radius: 0 2px 2px 2px;
                box-shadow: 0 2px 2px #000, 0 -1px 0 #fff inset;
                padding: 30px;
            }

            /* Remove the rule below if you want the content to be "organic" */
            #content div {
                height:auto;
                /*min-height:250px;*/
                height:auto !important;        /* for IE as it does not support min-height */
                /*height:250px;*/ 
            }
            .emTable {
                margin:0px;padding:0px;
                width:60%;
                box-shadow: 10px 10px 5px #888888;
                border:1px solid #000000;

                -moz-border-radius-bottomleft:0px;
                -webkit-border-bottom-left-radius:0px;
                border-bottom-left-radius:0px;

                -moz-border-radius-bottomright:0px;
                -webkit-border-bottom-right-radius:0px;
                border-bottom-right-radius:0px;

                -moz-border-radius-topright:0px;
                -webkit-border-top-right-radius:0px;
                border-top-right-radius:0px;

                -moz-border-radius-topleft:0px;
                -webkit-border-top-left-radius:0px;
                border-top-left-radius:0px;
            }.emTable table{
                border-collapse: collapse;
                border-spacing: 0;
                width:100%;
                height:100%;
                margin:0px;padding:0px;
            }.emTable tr:last-child td:last-child {
                -moz-border-radius-bottomright:0px;
                -webkit-border-bottom-right-radius:0px;
                border-bottom-right-radius:0px;
            }
            .emTable table tr:first-child td:first-child {
                -moz-border-radius-topleft:0px;
                -webkit-border-top-left-radius:0px;
                border-top-left-radius:0px;
            }
            .emTable table tr:first-child td:last-child {
                -moz-border-radius-topright:0px;
                -webkit-border-top-right-radius:0px;
                border-top-right-radius:0px;
            }.emTable tr:last-child td:first-child{
                -moz-border-radius-bottomleft:0px;
                -webkit-border-bottom-left-radius:0px;
                border-bottom-left-radius:0px;
            }.emTable tr:hover td{

            }
            .emTable tr:nth-child(odd){ background-color:#afaaaa; }
            .emTable tr:nth-child(even)    { background-color:#ffffff; }
            .emTable td{
                vertical-align:middle;
                border:1px solid #000000;
                border-width:0px 1px 1px 0px;
                text-align:left;
                padding:7px;
                font-size:13px;
                font-family:Arial;
                font-weight:normal;
                color:#000000;
            }.emTable tr:last-child td{
                border-width:0px 1px 0px 0px;
            }.emTable tr td:last-child{
                border-width:0px 0px 1px 0px;
            }.emTable tr:last-child td:last-child{
                border-width:0px 0px 0px 0px;
            }
            .emTable tr:first-child td{
                background:-o-linear-gradient(bottom, #000000 5%, #494747 100%);
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #494747) );
                background:-moz-linear-gradient( center top, #000000 5%, #494747 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#000000", endColorstr="#494747");	
                background: -o-linear-gradient(top,#000000,494747);

                background-color:#000000;
                border:0px solid #000000;
                text-align:center;
                border-width:0px 0px 1px 1px;
                font-size:14px;
                font-family:Arial;
                font-weight:bold;
                color:#ffffff;
            }
            .emTable tr:first-child:hover td{
                background:-o-linear-gradient(bottom, #000000 5%, #494747 100%);
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #494747) );
                background:-moz-linear-gradient( center top, #000000 5%, #494747 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#000000", endColorstr="#494747");
                background: -o-linear-gradient(top,#000000,494747);

                background-color:#000000;
            }
            .emTable tr:first-child td:first-child{
                border-width:0px 0px 1px 0px;
            }
            .emTable tr:first-child td:last-child{
                border-width:0px 0px 1px 1px;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#content div").hide(); // Initially hide all content
                $("#tabs li:first").attr("id", "current"); // Activate first tab
                $("#content div:first").fadeIn(); // Show first tab content

                $('#tabs a').click(function (e) {
                    e.preventDefault();
                    $("#content div").hide(); //Hide all content
                    $("#tabs li").attr("id", ""); //Reset id's
                    $(this).parent().attr("id", "current"); // Activate this
                    $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
                });

            })();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#finishb").click(function (ev) {
                    var event = ev || window.event;
                    event.preventDefault();
                    $("#previewb").prop('disabled', true);
                    $("#reeditb").prop('disabled', true);
                    $("#finishb").prop('disabled', true);
                    $("#submitb").prop('disabled', false);
                });
            })();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#reeditb").click(function (ev) {
                    var event = ev || window.event;
                    event.preventDefault();
                    $("#previewb").prop('disabled', false);
                    $("#finishb").prop('disabled', true);
                    $("#submitb").prop('disabled', true);
                    $("textarea#deptnames").prop('disabled', false);
                    $("textarea#deptemails").prop('disabled', false);
                    $(".tempr").parent().remove();
                });
            })();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#previewb").click(function (ev) {
                    var event = ev || window.event;
                    event.preventDefault();
                    var names = $("textarea#deptnames").val();
                    var emails = $("textarea#deptemails").val();

                    if (names === "" || emails === "") {
                        alert("Empty Lists, Cannot continue!");
                    } else {
                        var namearr = names.split(",");
                        var emailarr = emails.split(",");
                        var index;
//                    var index2;
                        var details;
                        details += "<tr><td class=\"tempr\" colspan=\"2\" style=\"background-color:red;color:white;font-weight:bold;\"><center>Note: There are<br/>";
                        details += namearr.length;
                        details += " Department Name(s) & ";
                        details += emailarr.length;
                        details += " Email Address(es)</center></td></tr>";

                        var row;
                        for (index = 0; index < namearr.length; index++) {
                            row += "<tr><td class=\"tempr\">";
                            if (namearr[index] === undefined) { //checking whether value for the given index is invalid
                                row += "<b style=\"color:red;\">";
                                row += namearr[index];
                                row += "</b>";
                            } else {
                                row += namearr[index];
                            }
                            row += "</td><td>";
                            if (emailarr[index] === undefined) { //checking whether value for the given index is invalid
                                row += "<b style=\"color:red\">";
                                row += emailarr[index];
                                row += "</b>";
                            } else {
                                row += emailarr[index];
                            }
                            row += "</td></tr>";
                        }
                        $("#inputtr").after(row);
                        $("#inputtr").after(details);
                        $("#previewb").prop('disabled', true);
                        $("#finishb").prop('disabled', false);
                        $("#reeditb").prop('disabled', false);
                        $("textarea#deptnames").prop('disabled', true);
                        $("textarea#deptemails").prop('disabled', true);
                    }
                });
            })();
        </script>
    </head>
    <body>
        <h1>Administrator Panel</h1>
        <hr/>
        <ul id="tabs">
            <li><a href="#" title="tab1">Access Requests</a></li>
            <li><a href="#" title="tab2">Under Construction</a></li>
            <li><a href="#" title="tab3">Under Construction</a></li>
            <li><a href="#" title="tab4">Directors' Emails</a></li>    
        </ul>

        <div id="content"> 
            <div id="tab1">
                <form action="readAllFilesServ.html">
                    <center><input type="submit" value="Get All Applications List"/></center>

                    <%
                        if (request.getAttribute("filesList") != null) {
                            ArrayList<String> ar = (ArrayList) request.getAttribute("filesList");
                            if (ar.isEmpty()) {
                                out.write("No Applications in Queue.");
                            } else {
                                for (String fileName : ar) {
                                    out.write("<a href=\"info.jsp?procID=" + fileName + "\" alt=\"Click to view Application\"/> " + fileName + "</a>&nbsp; <input type=\"button\" onclick=\"deletefile(" + fileName + ")\" value=\"Delete Application\"/><br>");
                                }
                            }
                        } else {
                            out.write("No Applications in Queue.");
                        }

                    %>
                </form>
            </div>
            <div id="tab2">Under Construction</div>
            <div id="tab3">Under Construction</div>
            <div id="tab4">
                <script type="text/javascript">
            var request;
            function deleteInfo(ev,dcode) {
                var event = ev || window.event;
                event.preventDefault();
                var url = "/deleteFromDb.asp?dcode=" + dcode;

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
                    alert(val); //alert that record has successfully been deleted
                }
            }
        </script>
                <style type="text/css">
                    .upform{margin-top: 100px}
                    .upformBtns{
                        float: right;
                        position: relative;
                        /*display: inline-block;*/
                        margin-top: -20px;
                        margin-right: 20px;
                        /*margin-bottom: 10px;*/
                    }
                    .reeditb,.previewb,.finishb,.submitb{width: 100px;padding: 6px}
                    input[type="text"],input[type="email"]{padding: 5px}
                    .emTable td{text-align: center}
                    .emTable{table-layout: fixed;margin-right: -30px}
                    #availinfo td{padding: 5px}
                </style>
                <center>
                    <h3>Currently Available Information</h3>
                <table id="availinfo"> 
                    <thead>
                    <th>Department</th>
                    <th>Name of Dir.</th>
                    <th>Email</th>
                    <th>Name of Div.Head</th>
                    <th>Email</th>
                    <th>Remove?</th>
                    </thead>
                    <tbody>

                        <%  
                        ResultSet rs=null;
                        try {
                                rs = jdbc.getConnection().createStatement().executeQuery("SELECT * FROM dept ORDER BY dept ASC");
                                while (rs.next()) {
                                    out.write("<tr>"
                                            + "<td>" + rs.getString("dept") + "</td>"
                                            + "<td>" + rs.getString("dirname") + "</td>"
                                            + "<td>" + rs.getString("diremail") + "</td>"
                                            + "<td>" + rs.getString("divname") + "</td>"
                                            + "<td>" + rs.getString("divemail") + "</td>"
                                            + "<td><input type=\"button\" value=\"Delete Row\" name=\"delrow\" onclick=\"deleteInfo(event,"+rs.getString("deptid")+")\" /></td>"
                                            + "</tr>");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.print(e);
                            }
                        %>

                    </tbody>
                </table>
                </center> 
                <form action="adminUpEmails.html" class="upform" name="upform">
                    <span class="upformBtns">
                        <input type="button" id="previewb" class="previewb" name="preview" value="Preview" />
                        <!--onclick="preview(event);"/>-->
                        <br/>
                        <br/>
                        <input type="button" id="reeditb" class="reeditb" name="reedit" value="Re-Edit" disabled />
                        <!--onclick="preview(event);"/>-->
                        <br/>
                        <br/>
                        <input type="button" id="finishb" class="finishb" name="finish" value="Finish Editing" disabled/>
                        <!--onclick="enableSubmit(event);"/>-->
                        <br/>
                        <br/>
                        <input type="submit" id="submitb" class="submitb" name="upload" value="Upload Data" disabled/>
                    </span>
                    <center>
                        <table class="emTable" >
                            <tr>
                                <td>
                                    Departments
                                </td>
                                <td >
                                    Director Email Addresses
                                </td>
                            </tr>
                            <tr id="inputtr">
                                <td >
                                    <label>List of Names separated by commas(,)</label><br/>
                                    <textarea rows="4" cols="40" id="deptnames" name="deptnames"></textarea>
                                </td>
                                <td>                                    
                                    <label>List of Emails separated by commas(,)</label><br/>
                                    <textarea rows="4" cols="40" id="deptemails" name="deptemails"></textarea>
                                </td>
                            </tr>

                        </table>
                    </center>

                    
                </form>
            </div>
        </div>
    </body>
</html>
