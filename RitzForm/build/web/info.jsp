<!DOCTYPE html>
<%-- 
    Document   : info
    Created on : Nov 3, 2014, 9:00:44 AM
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.EOFException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="src.Registration_file"%>
<%@page import="java.util.UUID"%>

<html>
    <%
        String UUID_fromRegistration = request.getParameter("procID");
        Registration_file RegFile = null;
        boolean proceed = false;
        try {
            FileInputStream fileIn = new FileInputStream(UUID_fromRegistration + ".efile");
            // read the file with this UUID
            ObjectInputStream in = new ObjectInputStream(fileIn);
            RegFile = (Registration_file) in.readObject();
            proceed = true;
        } catch (EOFException ex) {
            System.out.println("invalid file_" + UUID_fromRegistration);
            ex.printStackTrace();
            out.write("<br><center><b>Invalid Registration file....redirecting</b></center>");
            response.setHeader("Refresh", "2;url=regForm/index.jsp");
//            response.sendRedirect("regForm/index.jsp");
        } catch (IOException ex) {
            System.out.println("invalid file_" + UUID_fromRegistration);
            ex.printStackTrace();
            out.write("<br><center><b>Invalid Registration file....redirecting</b></center>");
            response.setHeader("Refresh", "2;url=regForm/index.jsp");
//            response.sendRedirect("regForm/index.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println("invalid file_" + UUID_fromRegistration);
            ex.printStackTrace();
            out.write("<br><center><b>Invalid Registration file....redirecting</b></center>");
            response.setHeader("Refresh", "2;url=regForm/index.jsp");
//            response.sendRedirect("regForm/index.jsp");
        }
        String dept = "";
        String desig = "";
        String employeeid = "";
        String enterpriseid = "";
        String fname = "";
        String lname = "";
        String emailDisplay = "";
        String emailAddress = "";
        String RequestDate = "";
        String DateJoined = "";
        String ManagerName = "";
        String ManagerTitle = "";
        String ManagerSig = "";
        String ManagerSigTimestamp = "";
        String[] split = null;
        if (proceed) {
            if (RegFile != null) {
                System.out.println("-------------info.jsp: regfile is not null------------");
                dept = RegFile.getDepartment();
                desig = RegFile.getDesignation();
                employeeid = RegFile.getEmployeeID();
                enterpriseid = RegFile.getEnterpriseID();
                fname = RegFile.getFirstName();
                lname = RegFile.getLastName();
                RequestDate = RegFile.getRequestDate();
                DateJoined = RegFile.getDateJoined();
                ManagerName = RegFile.getManagerName();
                ManagerTitle = RegFile.getManagerTitle();
                ManagerSig = RegFile.getManagerSignature();
                ManagerSigTimestamp = RegFile.getManagerTimestamp();
                split = RegFile.getRequestedAccessArray();

                emailDisplay = RegFile.getEmailDisplayName();
                emailAddress = RegFile.getEmailAddress();
            }
        }
    %>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--bootstrap-->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
//              <%--  var dept = <%=dept %>;
//                var appid = <%=UUID_fromRegistration %>; --%>
                $.ajax({
                    url: "/DeptDetails.html",
                    type: "POST",
                    data: {dname: "<%=dept%>", appid: "<%=UUID_fromRegistration%>"},
                    dataType: "html",
                    beforeSend: function () {
                        $('#deptAccepted').append("loading..");
                        $('#financeAccepted').append("loading..");
                        $('#FOAccepted').append("loading..");
                    },
                    success: function (fdata) {
                        var vals = fdata;
                        var array = vals.split(",");
                        $("#deptAccepted").html(array[0]);
                        $("#financeAccepted").html(array[1]);
                        $("#FOAccepted").html(array[2]);
                    }
                });
            });

        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css" />
    </head>
    <body>
        <style type="text/css" scoped >
            @media print{
                @page {
                    size: A4;
                }
                .dirs{color:red;font-size:12px;}
                #deptAccepted,#financeAccepted,#FOAccepted{color:red;font-size:10px;}
                .printbutton{visibility: hidden}
                .reqacc{font-size: 11px}
                .finalauth{font-size: 10px}
                .im{height: 55px}
                .im1{margin-top: 0px;margin-right: 0px;}
                .im2{margin-left: 0px;}
                .title{margin-top: -80px}
                .geninfo{padding:5px}

                .geninfotable td{font-size: 11px;}
                .tablehead{font-size: 12px;}
                h2{font-size: 14px;}
            }
            @media screen{
                input[type='checkbox']{
                    width: 20px;height:20px;-webkit-print-color-adjust: exact;
                }
                .CSSTable {
                    margin:0px auto;
                    padding:0px;
                    width:95%;
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
                    border-top-left-radius:0px;-webkit-print-color-adjust: exact;
                }.CSSTable table{
                    border-collapse: collapse;
                    border-spacing: 0;
                    width:100%;
                    height:100%;
                    margin:0px;padding:0px;-webkit-print-color-adjust: exact;
                }.CSSTable tr:last-child td:last-child {
                    -moz-border-radius-bottomright:0px;
                    -webkit-border-bottom-right-radius:0px;
                    border-bottom-right-radius:0px;-webkit-print-color-adjust: exact;
                }
                .CSSTable table tr:first-child td:first-child {
                    -moz-border-radius-topleft:0px;
                    -webkit-border-top-left-radius:0px;
                    border-top-left-radius:0px;-webkit-print-color-adjust: exact;
                }
                .CSSTable table tr:first-child td:last-child {
                    -moz-border-radius-topright:0px;
                    -webkit-border-top-right-radius:0px;
                    border-top-right-radius:0px;-webkit-print-color-adjust: exact;
                }.CSSTable tr:last-child td:first-child{
                    -moz-border-radius-bottomleft:0px;
                    -webkit-border-bottom-left-radius:0px;
                    border-bottom-left-radius:0px;-webkit-print-color-adjust: exact;
                }.CSSTable tr:hover td{
                    background-color:#ffffff;
                }
                .CSSTable td{
                    vertical-align:middle;

                    background-color:#e5e5e5;

                    border:1px none #000000;
                    border-width:0px 1px 1px 0px;
                    text-align:left;
                    padding:7px;
                    font-size:14px;
                    font-family:Courier;
                    font-weight:bold;
                    color:#000000;-webkit-print-color-adjust: exact;
                }.CSSTable tr:last-child td{
                    border-width:0px 1px 0px 0px;-webkit-print-color-adjust: exact;
                }.CSSTable tr td:last-child{
                    border-width:0px 0px 1px 0px;-webkit-print-color-adjust: exact;
                }.CSSTable tr:last-child td:last-child{
                    border-width:0px 0px 0px 0px;-webkit-print-color-adjust: exact;
                }
            }

        </style>
        <div style="width: 97%;margin:0 auto;">
            <% if (proceed) { %>
            <%

                StringBuilder content = new StringBuilder();
                content.append("<div class\"im\" style=\"height: 116px\"> \n"
                ).append("            <img class\"im1\" src=\"http://ritzform-occulttech.rhcloud.com/regForm/IT_dept.jpg\" style=\"float: right;margin-top: 25px;margin-right: 5px;\" />\n"
                ).append("            <img class\"im2\" src=\"http://www.ritzcarlton.com/images2011/logo-ritz_carlton.png\"\n"
                ).append("                 style=\"margin-left: 5px;float: left;\"/>\n"
                ).append("        </div>\n"
                ).append("        <br>\n"
                ).append("    <center> \n"
                ).append("        <div style=\"margin-top: -50px\" id=\"\" class=\"title\">\n"
                ).append("            <h2 style=\"display:block;font-family: Georgia, 'Times New Roman', Times, serif;\n"
                ).append("                text-transform:uppercase;text-shadow: 2px 1px #aaaaaa;\">\n"
                ).append("                The Ritz-Carlton Hotel Abu Dhabi,Grand Canal\n"
                ).append("            </h2>\n"
                ).append("            <h2 style=\"display:block;font-family: Georgia, 'Times New Roman', Times, serif;\n"
                ).append("                text-transform:capitalize;\">\n"
                ).append("                Systems and Applications Access Request Form\n"
                ).append("            </h2>\n"
                ).append("        </div>\n"
                ).append("    </center>\n"
                ).append("<br>"
                ).append("    <div  class=\"tablehead\" style=\"background-color: #9acfea;color: #444;\">\n"
                ).append("        <center style=\"font-size:18px;font-weight: bolder\"> GENERAL INFORMATION </center>\n"
                ).append("    </div>\n"
                ).append("    <div style=\"\" >\n"
                ).append("        <table class=\"geninfotable\" style=\"width:100%;table-layout: fixed;\" cellspacing=\"0\">\n"
                ).append("            <tr>\n"
                ).append("                <td colspan=\"3\">"
                ).append("                    <center> <table class=\"geninfo\" style=\"padding:5px\">"
                ).append("                         <tr><td style=\"padding-left:10px;padding-right:10px;\" ><b>Request Date : </b></td><td>").append(RequestDate).append("</td></tr>\n"
                ).append("                         <tr><td style=\"padding-left:10px;padding-right:10px;\"><b>Associate Code : </b></td><td>").append(employeeid).append("</td></tr>\n"
                ).append("                         <tr><td style=\"padding-left:10px;padding-right:10px;\"><b style=\"color:red;\">EID : </b></td><td>").append(enterpriseid).append("</td></tr>"
                ).append("                     </table></center>\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr class=\"tablehead\"  style=\"vertical-align:middle;background-color: #9acfea;\n"
                ).append("                 text-align:center;\n"
                ).append("                 padding:10px;\n"
                ).append("                 font-size:18px;\n"
                ).append("                 font-weight:bolder;\n"
                ).append("                 color:#337ab7;\">\n"
                ).append("                <td>\n"
                ).append("                    First Name\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                    Last Name\n"
                ).append("                </td>\n"
                ).append("                <td>                    \n"
                ).append("                    Department\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr style=\"text-align: center\">\n"
                ).append("                <td >\n"
                ).append("                    ").append(fname).append("\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                    ").append(lname).append("\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                    ").append(dept).append("\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr  class=\"tablehead\" style=\"vertical-align:middle;background-color: #9acfea;\n"
                ).append("                 text-align:center;\n"
                ).append("                 padding:10px;\n"
                ).append("                 font-size:18px;\n"
                ).append("                 font-weight:bolder;\n"
                ).append("                 color:#337ab7;\">\n"
                ).append("                <td>\n"
                ).append("                    Designation\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                    Date Joined\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr style=\"text-align: center\">\n"
                ).append("                <td >\n"
                ).append("                    ").append(desig).append("\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                    ").append(DateJoined).append("\n"
                ).append("                </td>\n"
                ).append("                <td>\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr  class=\"tablehead\" style=\"vertical-align:middle;background-color: #9acfea;\n"
                ).append("                 text-align:center;\n"
                ).append("                 padding:10px;\n"
                ).append("                 font-size:18px;\n"
                ).append("                 font-weight:bolder;\n"
                ).append("                 color:#337ab7;\">\n"
                ).append("                <td colspan=\"3\">\n"
                ).append("                    Required Access\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr>\n"
                ).append("            <td></td>\n"
                ).append("                <td class=\"reqacc\" colspan=\"2\" style=\"font-weight: bold;font-size: large\">\n"
                ).append("                    <ol>\n");

                for (String req : split) {
                    content.append("<li>").append(req).append("</li>\n");
                }

                if (!emailDisplay.isEmpty() && !emailAddress.isEmpty()) {
                    content.append("<ul type=\"disc\" style=\"background-color:black;color:white;width: -moz-fit-content;width: -webkit-fit-content;width: fit-content;padding:10px 10px 10px 25px;\">\n");
                    content.append("<li>Email Dispay Name: ").append(emailDisplay).append("</li>");
                    content.append("<li>Email Address: ").append(emailAddress).append("@ritzcarlton.com</li>");
                    content.append("<ul type=\"disc\">\n");
                }

                content.append(
                        "                    </ol>\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr  class=\"tablehead\" style=\"vertical-align:middle;background-color: #9acfea;\n"
                ).append("                 padding:10px;\n"
                ).append("                 font-size:18px;\n"
                ).append("                 font-weight:bolder;\n"
                ).append("                 color:#337ab7;\">\n"
                ).append("                <td style=\"text-align:center;\" colspan=\"3\">\n"
                ).append("                    Management Approval\n"
                ).append("                </td>\n"
                ).append("            </tr>\n"
                ).append("            <tr>\n"
                ).append("                <td style=\"text-align:center;\"><b>Manager Name:</b> ").append(ManagerName).append("</td>\n"
                ).append("                <td style=\"text-align:center;\"><b>Title:</b> ").append(ManagerTitle).append("</td>\n"
                ).append("                <td style=\"text-align:center;\"><b>Initials:</b> ").append(ManagerSig).append("</td>\n"
                ).append("            </tr>\n"
                ).append("            <tr>\n"
                ).append("                <td colspan\"3\">Signed Timestamp: ").append(ManagerSigTimestamp).append("</td>\n"
                ).append("            </tr>\n"
                ).append("        </table>\n"
                ).append("    </div>\n"
                ).append("    <br>\n"
                ).append("\n"
                ).append("");
            %>

            <%=content.toString()%>
            <hr>
            <center>
                <div class="dirs">
                    <% if (RegFile.isUser1OK()) { %>
                    <b style="color:red;font-size:18px;"> * Department Head Accepted *</b><br>
                    <span id="deptAccepted"></span><br>
                    <% } else { %>
                    <span style="color: #888888;font-weight: bold">## Department Approval Pending ##</span>
                    <% }
                        if (RegFile.isUser2OK()) {
                    %>
                    <b style="color:red;font-size:18px;"> ** Division Head Accepted **</b><br>
                    <span id="financeAccepted"></span><br>
                    <% } else { %>
                    <br/><span style="color: #888888;font-weight: bold">## Division Head Approval Pending ##</span>
                    <% }
                        if (RegFile.isUser3OK()) {
                    %>
                    <b style="color:red;font-size:18px;"> *** Finance Director Accepted ***</b><br>
                    <span id="FOAccepted"></span>
                    <% } else {%>
                    <br/><span style="color: #888888;font-weight: bold">## Finance Director Approval Pending ##</span>
                    <% }%>
                </div>
            </center>
            <hr><br>
            <span style="font-size: small;color: #9d9d9d"><%=UUID_fromRegistration%> </span>
        </div>
        <br>
        <br>

        <div class="CSSTable finalauth" >
            <table style="">
                <tr>
                    <td >
                        <input type="checkbox" > GPO-AUHRZ-FolderRedirection-H
                    </td>
                    <td>
                        <input type="checkbox"> GPO-AUHRZ-RestrictedLocalDrives
                    </td>
                    <td>
                        <input type="checkbox" > GPO-AUHRZ-RestrictedInternetAccess
                    </td>
                </tr>
                <tr>
                    <td >
                        <input type="checkbox" > GPO-AUHRZ-RestrictedStartMenu
                    </td>
                    <td>
                        <input type="checkbox" > GPO-AUHRZ-RestrictedUserComputer
                    </td>
                    <td>
                        <input type="checkbox" > GPO-AUHRZ-RestrictedUserComputerAddOn
                    </td>
                </tr>
                <tr>
                    <td >
                        <input type="checkbox" > GRP-Websense-Subscribers-Exceptions-INT
                    </td>
                    <td>
                        <input type="checkbox" > GRP-Websense-Subscribers-INT
                    </td>
                    <td>
                        <input type="checkbox" > GRP-Websense-Subscribers-Noemail-INT
                    </td>
                </tr>
                <tr>
                    <td colspan="3">    
                        <input type="checkbox" > GRPAUHRZ-USERS
                    </td>
                </tr>
            </table>
        </div>
        <br><br>
    <center><button class="printbutton" onclick="window.print();">Print Access Form</button></center>
        <% }// allllll the above shit will only happen only if this boolean is true %>
</body>
</html>

