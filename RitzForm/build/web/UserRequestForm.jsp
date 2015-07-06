<%-- 
    Document   : UserRequestForm
    Created on : Feb 20, 2015, 9:00:11 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
        <title>Request Application: ${proceedID}</title>
        <style type="text/css">
            disableOnPage{visibility: hidden;}
        </style>
    </head>
    <body>
        <style type="text/css" scoped>
            input[type='checkbox']{
                width: 20px;height:20px;
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
                border-top-left-radius:0px;
            }.CSSTable table{
                border-collapse: collapse;
                border-spacing: 0;
                width:100%;
                height:100%;
                margin:0px;padding:0px;
            }.CSSTable tr:last-child td:last-child {
                -moz-border-radius-bottomright:0px;
                -webkit-border-bottom-right-radius:0px;
                border-bottom-right-radius:0px;
            }
            .CSSTable table tr:first-child td:first-child {
                -moz-border-radius-topleft:0px;
                -webkit-border-top-left-radius:0px;
                border-top-left-radius:0px;
            }
            .CSSTable table tr:first-child td:last-child {
                -moz-border-radius-topright:0px;
                -webkit-border-top-right-radius:0px;
                border-top-right-radius:0px;
            }.CSSTable tr:last-child td:first-child{
                -moz-border-radius-bottomleft:0px;
                -webkit-border-bottom-left-radius:0px;
                border-bottom-left-radius:0px;
            }.CSSTable tr:hover td{
                background-color:#ffffff;
            }
            .CSSTable td{
                vertical-align:middle;

                background-color:#e5e5e5;

                border:1px none #000000;
                border-width:0px 1px 1px 0px;
                text-align:center;
                padding:7px;
                font-size:14px;
                font-family:Courier;
                font-weight:bold;
                color:#000000;
            }.CSSTable tr:last-child td{
                border-width:0px 1px 0px 0px;
            }.CSSTable tr td:last-child{
                border-width:0px 0px 1px 0px;
            }.CSSTable tr:last-child td:last-child{
                border-width:0px 0px 0px 0px;
            }
        </style>

        ${message}
        <br>
        <br>
        <div class="CSSTable" >
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
    <center><button onclick="window.print();">Print Access Form</button></center>
    

    </body>
</html>
