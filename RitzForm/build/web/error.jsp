<%-- 
    Document   : error
    Created on : Nov 2, 2014, 11:52:11 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            window.onload = choosePic();

            function choosePic() {
                var myPix = new Array("http://www.beautifullife.info/wp-content/uploads/2013/04/19/Greatdirectories.jpg",
                "http://www.technologybell.com/wp-content/uploads/2013/10/The-Web-Motel-Error-Page.png",
                "http://www.404notfound.fr/assets/images/pages/img/taptapdesign.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/webstuffsharedotcom.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/tchikitodotcom.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/coolappse.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/androiddev101.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/klout.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/abduzeedo-v2dotcom.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/vasamuseetdotse.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/futureofwebdesigndotcom.jpg",
                "http://www.404notfound.fr/assets/images/pages/img/benlewdotcom.jpg",
                "http://www.flashuser.net/wp-content/uploads/2013/03/404-error-page-monsterslab.jpg",
                "http://www.flashuser.net/wp-content/uploads/2013/03/404-error-page-pulpfingers.jpg",
                "");
                var randomNum = Math.floor((Math.random() * myPix.length));
                document.getElementById("image").src = myPix[randomNum];
            }
        </script>
    </head>
    <body>
    <center>
        <img id="image" src="" />
    </center>
    </body>
</html>
