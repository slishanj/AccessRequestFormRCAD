<%-- 
    Document   : allfiles
    Created on : Mar 24, 2015, 2:37:06 PM
    Author     : Administrator
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RC</title>
        <script type="text/javascript">
            function deletefile(filename){
//                //Set path to an absolute path; note that the parameter to getRealPath() here should be a context-relative path.
//String path = getServletContext().getRealPath("/images/test.gif"); 
//File deleteFile = new File(path);
            }
        </script>
    </head>
    <body>
        <h1>Request Applications</h1>
        <form action="readAllFilesServ.html">
            <input type="submit" value="Get All Applications List"/>

            <%
                if (request.getAttribute("filesList") != null) {
                    ArrayList<String> ar = (ArrayList) request.getAttribute("filesList");
                    for (String fileName : ar) {
                        out.write( fileName + " <input type=\"button\" onclick=\"deletefile("+fileName+")\">Delete Application</button><br>");
                    }
                }

            %>
        </form>
    </body>
</html>
