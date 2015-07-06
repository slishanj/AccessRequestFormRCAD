<%-- 
    Document   : index
    Created on : Nov 1, 2014, 7:04:57 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
    <%
        if (request.getParameter("redirid") == null) {
//            response.sendRedirect("welcome/index.html");
            response.sendRedirect("regForm/index.jsp");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("MarkSignatures");
            rd.forward(request, response);
            //response.sendRedirect("MarkSignatures");
        }

    %>
    </body>
</html>
