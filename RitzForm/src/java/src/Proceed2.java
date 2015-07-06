package src;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Properties;
import java.util.TimeZone;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Proceed2", urlPatterns = {"/Proceed2"})
public class Proceed2 extends HttpServlet {

    String UUID_fromRegistration = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();

        String result;
        // Recipient's email ID needs to be mentioned.
        String addressTo = null;

        String toUser1 = null;
//        String toUser2 = "kalpaw@gmail.com";
//        String toUser2 = "slishanadata@gmail.com";
        String toUser2 = null;
        String toUser3 = "kalpaw@outlook.com";
//        String toUser3 = "lakmalsamarasinghe9@gmail.com";
        String toUser4 = "kalpa.w@ritzcarlton.com";
//        String toUser4 = "sfthelp@gmail.com";

        UUID_fromRegistration = request.getParameter("ID");
//        System.out.println("----PROCEED2-request received with ID=" + UUID_fromRegistration + "----");
        // we have to read the REGISTRATION file first, if data is inside, 
        // we have to proceed from them,
        // if not , we have to proceed with the data from the registration jsp page
//        Registration_file RegFile = readRegistration.Read(UUID_fromRegistration);
        Registration_file RegFile = null;
        try {
//            System.out.println("---trying to read file from Proceed2 servlet--");
            FileInputStream fileIn = new FileInputStream(/*
                     getServletContext().getRealPath(File.separator) +*/UUID_fromRegistration + ".efile");
            // read the file with this UUID
            ObjectInputStream in = new ObjectInputStream(fileIn);
            RegFile = (Registration_file) in.readObject();
        } catch (IOException ex) {
            ex.printStackTrace();
//            System.out.println(ex);
//            System.out.println("-Proceed2-error reading file with: " + UUID_fromRegistration);
//            System.out.println("-Proceed2-IO ERROR-");
//            System.out.println("-Proceed2-possibly, the file is unavailable-");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        //---------EMAIL data variables declaration---------------------
        String dept;
        String desig;
        String employeeid;
        String enterpriseid;
        String fname;
        String lname;
        String emailDisplay = "";
        String emailAddress = "";
        String RequestDate;
        String DateJoined;
        String ManagerName;
        String ManagerTitle;
        String ManagerSig;
        String ManagerSigTimestamp;
        String[] split = null;
        DeptEmailList DEList = new DeptEmailList();

        //---------end of EMAIL data variables declaration--------------
        if (RegFile != null) {
//            System.out.println("---Proceed2: regfile is not null---");
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

            if (RegFile.isUser1OK()) { // if first user accepts, change email to user2
//                System.out.println("-USER 1 ACCEPTED-set email to user2");
                addressTo = toUser2;
            }
            if (RegFile.isUser2OK()) { // if second user accepts, change email to user3
//                System.out.println("--USER 2 ACCEPTED-set email to user3");
                addressTo = toUser3;
            }
            if (RegFile.isUser3OK()) { // if 3rd user accepts, change email to user4 (ADMINISTRATOR)
//                System.out.println("---USER 3 ACCEPTED-set email to user4");
                addressTo = toUser4;
            }
            if (!RegFile.isUser1OK() & !RegFile.isUser2OK() & !RegFile.isUser3OK()) { // if no one has accepted change the email to user 1 again or by default
//                System.out.println("-NO USERS HAVE ACCEPTED THE EMAIL YET-");
                addressTo = toUser1;
            }
        } else {
            // setting timestamp for manager
            Date date = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
            SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy h:mm:ss a z");
            sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
            String formattedTimestamp = sdf.format(date);

            // if no one has accepted change the email to user 1 again or by default
//            System.out.println("--FRESH REGISTRATION---");
            dept = request.getParameter("department");
            desig = request.getParameter("position");
            employeeid = request.getParameter("associatecode");
            enterpriseid = request.getParameter("EID");
            fname = request.getParameter("firstname");
            lname = request.getParameter("lastname");
            RequestDate = request.getParameter("requestdate");
            DateJoined = request.getParameter("datejoined");
            ManagerName = request.getParameter("managername");
            ManagerTitle = request.getParameter("managertitle");
            ManagerSig = request.getParameter("managersig");
            ManagerSigTimestamp = formattedTimestamp;
            if (request.getParameter("emaildisplayname") != null) {
                emailDisplay = request.getParameter("emaildisplayname");
            }
            if (request.getParameter("emailaddress") != null) {
                emailAddress = request.getParameter("emailaddress");
            }

            //---------------------------------------------------------------------------
            // selecting department emails
            if (dept.equals("BANQUETS")) {
//                toUser1 = DeptEmailList.getBanquetEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("CONFERENCE & CATERING")) {
//                toUser1 = DeptEmailList.getCCSEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("CORPORATE SALES")) {
//                toUser1 = DeptEmailList.getCoopSalesEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("ENGINEERING")) {
//                toUser1 = DeptEmailList.getEngineeringEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("FINANCE & ACCOUNTING")) {
//                toUser1 = DeptEmailList.getFinanceEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("FOOD & BEVERAGE")) {
//                toUser1 = DeptEmailList.getFnBEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("GOVERNMENT SALES")) {
//                toUser1 = DeptEmailList.getGovtSalesEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("GROUP SALES")) {
//                toUser1 = DeptEmailList.getGrpSalesEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("HOUSEKEEPING")) {
//                toUser1 = DeptEmailList.getHouseKeepingEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("HUMAN RESOURCES")) {
//                toUser1 = DeptEmailList.getHREmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("LOSS PREVENTION")) {
//                toUser1 = DeptEmailList.getLPEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("PURCHASING")) {
//                toUser1 = DeptEmailList.getPurchasingEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("QUALITY")) {
//                toUser1 = DeptEmailList.getQualityEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("REVENUE MANAGEMENT")) {
//                toUser1 = DeptEmailList.getRevenueMgmtEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("ROOMS II")) {
//                toUser1 = DeptEmailList.getRoomsEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("SALES & MARKETING")) {
//                toUser1 = DeptEmailList.getSalesMarketingEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("SALES")) {
//                toUser1 = DeptEmailList.getSalesEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("SPA")) {
//                toUser1 = DeptEmailList.getSpaEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("SYSTEMS")) {
//                toUser1 = DeptEmailList.getSystemsEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            } else if (dept.equals("TRAVEL INDUSTRY SALES")) {
//                toUser1 = DeptEmailList.getTravelIndustrySalesEmail();
                toUser1 = DEList.getDB_dir_Email(dept);
                toUser2 = DEList.getDB_Div_Email(dept);
            }
            addressTo = toUser1;

            //---------------------------------------------------------------------------
//        ArrayList accessRights = new ArrayList<String>();
            String[] values = null;
            if (request.getParameterValues("accessList[]") == null) {
                split = new String[]{"Invalid Request Form"};
            } else {
                values = request.getParameterValues("accessList[]");
            }
            if (values.length == 0) {
                split = new String[]{"Invalid Request Form"};
            } else {
                String ArrayString = Arrays.toString(values);
                int lastIndexOf = ArrayString.lastIndexOf("]");
                int firstIndexOf = ArrayString.indexOf("[");
                ArrayString = ArrayString.substring(firstIndexOf + 1, lastIndexOf);
                split = ArrayString.split(",");
            }
            Registration_file regfile = new Registration_file();
            regfile.setUUID_registration(UUID_fromRegistration);
            regfile.setRequestDate(RequestDate);
            regfile.setDateJoined(DateJoined);
            regfile.setDepartment(dept);
            regfile.setDesignation(desig);
            regfile.setEmployeeID(employeeid);
            regfile.setEnterpriseID(enterpriseid);
            regfile.setFirstName(fname);
            regfile.setLastName(lname);
            regfile.setManagerName(ManagerName);
            regfile.setManagerTitle(ManagerTitle);
            regfile.setManagerSignature(ManagerSig);
            regfile.setManagerTimestamp(ManagerSigTimestamp);
            regfile.setEmailDisplayName(emailDisplay);
            regfile.setEmailAddress(emailAddress);
            regfile.setUser1Email(toUser1); // user 1 is declared from an if- block using department.
            regfile.setUser2Email(toUser2);
            regfile.setUser3Email(toUser3); // user 3 can be set as a static constant
            regfile.setUser4Email(toUser4); // user 4 can be set as a static constant too
            regfile.setRequestedAccessArray(split); // we send the array splitted using the commas

//            boolean success = new writeRegistration().Write(UUID_fromRegistration, regfile);
            // ---------- write to the file  (SERIALIZATION) ----------------------
            try {
//                FileWriter fw = new FileWriter("");
                FileOutputStream fileOut
                        = new FileOutputStream(/*
                                 getServletContext().getRealPath(File.separator) +*/UUID_fromRegistration + ".efile");
                // UUID is the name
                ObjectOutputStream out = new ObjectOutputStream(fileOut);
                out.writeObject(regfile);
                out.flush();
                out.close();

//                System.out.println("written the  registration file: " + UUID_fromRegistration);
            } catch (IOException ex) {
                ex.printStackTrace();
//                System.out.println("Error writing registration file: " + UUID_fromRegistration);
            }

//            System.out.println("-----data serialization success? : " + success + "-----------");
            values = null;
            regfile = null;
        }

// <editor-fold defaultstate="collapsed" desc=" EMAIL CONFIG SECTION">
//        System.out.println("------------------incoming-------------------------");
        // Sender's email ID needs to be mentioned
        String from = "sudu_ishan@yahoo.com";
//        String from = "sfthelp@gmail.com";

        /**
         * *********************** FROM TB PROJECT
         * ***********************************
         *
         */
//        final String username = "sfthelp", //-----GMAIL
//                password = "SLISHAN290";
        final String username = "sudu_ishan",
                password = "SLISHAN290";

        // Assuming you are sending email from localhost (GMAIL)
//        String host = "smtp.gmail.com";
        String host = "smtp.mail.yahoo.com";

//<editor-fold defaultstate="collapsed" desc="Old Configs">
//----------------------------------------------------------------------------------------
//        //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
//        //   final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
//        // Get a Properties object
//        Properties props = System.getProperties();
//        //props.put("mail.transport.protocol", "smtps");
////        props.put("mail.smtp.starttls.required", "true");
//        props.put("mail.smtp.user", username);
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.password", password);
//        props.put("mail.smtp.starttls.enable", "true");
////props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
//        //props.put("mail.smtp.socketFactory.fallback", "false");
//        props.put("mail.smtp.port", "587"); //------- last worked on DECEMBER 2014......
//        //props.put("mail.smtp.socketFactory.port", "465");
//        props.put("mail.smtp.auth", "true");
//</editor-fold>
//----------------------------------------------------------------------------------------
//---------------------------YAHOO MAIL---------------------------------
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "false");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//        props.put("mail.smtp.socketFactory.port", port);
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.socketFactory.fallback", "false");
//---------------------------YAHOO MAIL---------------------------------
        /**
         * **********************************************************************************
         */
        // Get the default Session object.
        //Session mailSession = Session.getDefaultInstance(properties);
//        Session mailSession = Session.getDefaultInstance(props);
        Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
//        mailSession.setDebug(true); //----------------SHOWS all output in processing and sending the email
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
//            message.addRecipient(Message.RecipientType.TO,
//                    new InternetAddress(to));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(addressTo));
            // Set Subject: header field
            message.setSubject("System access for Employee: " + employeeid);
            // Now set the actual message
            //</editor-fold>

//            StringBuffer content = new StringBuffer(); //http://stackoverflow.com/questions/355089/stringbuilder-and-stringbuffer
            StringBuilder content = new StringBuilder(); //StringBuilder is faster than StringBuffer because it's not synchronized
            content.append("<!DOCTYPE html>\n"
            //            String content = "<!DOCTYPE html>\n"
            ).append(//<editor-fold defaultstate="collapsed" desc="FORM CONTENT">
                    "<html>\n").append("    <head>\n"
                    ).append("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                    ).append("         <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <!--bootstrap-->\n"
                    ).append("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                    ).append("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css\">"
                    ).append("    </head>\n"
                    ).append("    <body>\n"
                    ).append("        <div style=\"height: 116px\"> \n"
                    ).append("            <img src=\"http://ritzform-occulttech.rhcloud.com/regForm/IT_dept.jpg\" style=\"float: right;margin-top: 25px;margin-right: 5px;\" />\n"
                    ).append("            <img src=\"http://www.ritzcarlton.com/images2011/logo-ritz_carlton.png\"\n"
                    ).append("                 style=\"margin-left: 5px;float: left;\"/>\n"
                    ).append("        </div>\n"
                    ).append("        <br>\n"
                    ).append("    <center> \n"
                    ).append("        <div style=\"margin-top: -100px\" id=\"\" class=\"\">\n"
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
                    ).append("    <div style=\"background-color: #9acfea;color: #444;\">\n"
                    ).append("        <center style=\"font-size:18px;font-weight: bolder\"> GENERAL INFORMATION </center>\n"
                    ).append("    </div>\n"
                    ).append("    <div style=\"\" >\n"
                    ).append("        <table style=\"width:100%;table-layout: fixed;\" cellspacing=\"0\">\n"
                    ).append("            <tr>\n"
                    ).append("                <td><b>Request Date : </b>").append(RequestDate).append("\n"
                    ).append("                    <br> <b>Associate Code : </b>").append(employeeid).append("\n"
                    ).append("                    <br> <b style=\"color:red;\">EID : </b>").append(enterpriseid).append("\n"
                    ).append("                </td>\n"
                    ).append("            </tr>\n"
                    ).append("            <tr  style=\"vertical-align:middle;background-color: #9acfea;\n"
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
                    ).append("            <tr  style=\"vertical-align:middle;background-color: #9acfea;\n"
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
                    ).append("            <tr  style=\"vertical-align:middle;background-color: #9acfea;\n"
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
                    ).append("                <td colspan=\"2\" style=\"font-weight: bold;font-size: large\">\n"
                    ).append("                    <ol>\n");
//</editor-fold>
            for (String req : split) {
                content.append("<li>").append(req).append("</li>\n");
            }

//<editor-fold defaultstate="collapsed" desc="TRIED TO COLOR THE LIST according to category, doesn't execute completely">
//                if (req.equals("LoginAccess")) {
//                    content = content.concat("<li style=\"background-color:#FF6666;color:#B8B8B8\" >" + req + "</li>\n");
//
//                } else if (req.equals("MSOfficeAccess")) {
//                    content = content.concat("<li style=\"background-color:#FF6666;color:#B8B8B8\" >" + req + "</li>\n");
//
//                } else if (req.equals("HDriveAccess")) {
//                    content = content.concat("<li style=\"background-color:#FF6666;color:#B8B8B8\" >" + req + "</li>\n");
//
//                } else if (req.equals("EmailAccess")) {
//                    content = content.concat("<li style=\"background-color:#FF6666;color:#B8B8B8\" >" + req + "</li>\n");
//                    content = content.concat("<ul type=\"disc\">\n");
//                    content = content.concat("<li>Email Dispay Name: " + emailDisplay + "</li>");
//                    content = content.concat("<li>Email Address: " + emailAddress + "@ritzcarlton.com</li>");
//                    content = content.concat("<ul type=\"disc\">\n");
//
//                } else if (req.startsWith("SUN")) {
//                    content = content.concat("<li style=\"background-color:#CCE6FF\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("Spa")) {
//                    content = content.concat("<li style=\"background-color:#E2FFE0\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("OASYS_eHCM")) {
//                    content = content.concat("<li style=\"background-color:#CCE6FF\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("OASYS")) {
//                    content = content.concat("<li style=\"background-color:#E2FFE0\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("VICAS")) {
//                    content = content.concat("<li style=\"background-color:#CCE6FF\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("OperaPMS")) {
//                    content = content.concat("<li style=\"background-color:#E2FFE0\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("OPERA_SnC")) {
//                    content = content.concat("<li style=\"background-color:#CCE6FF\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("RESPAK")) {
//                    content = content.concat("<li style=\"background-color:#E2FFE0\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("FMC")) {
//                    content = content.concat("<li style=\"background-color:#CCE6FF\" >" + req + "</li>\n");
//
//                } else if (req.startsWith("folder")) {
//                    content = content.concat("<li style=\"background-color:#E2FFE0\" >" + req + "</li>\n");
//
//                }
//</editor-fold>
            if (!emailDisplay.isEmpty() && !emailAddress.isEmpty()) {
                content.append("<ul type=\"disc\" style=\"background-color:black;color:white;width: -moz-fit-content;width: -webkit-fit-content;width: fit-content;padding:10px 10px 10px 25px;\">\n");
                content.append("<li>Email Dispay Name: ").append(emailDisplay).append("</li>");
                content.append("<li>Email Address: ").append(emailAddress).append("@ritzcarlton.com</li>");
                content.append("<ul type=\"disc\">\n");
            }
            content.append("                    </ol>\n"
            ).append("                </td>\n"
            ).append("            </tr>\n"
            ).append("            <tr  style=\"vertical-align:middle;background-color: #9acfea;\n"
            ).append("                 text-align:center;\n"
            ).append("                 padding:10px;\n"
            ).append("                 font-size:18px;\n"
            ).append("                 font-weight:bolder;\n"
            ).append("                 color:#337ab7;\">\n"
            ).append("                <td colspan=\"3\">\n"
            ).append("                    Management Approval\n"
            ).append("                </td>\n"
            ).append("            </tr>\n"
            ).append("            <tr>\n"
            ).append("                <td>Manager Name: ").append(ManagerName).append("</td>\n"
            ).append("                <td>Title: ").append(ManagerTitle).append("</td>\n"
            ).append("                <td>Initials: ").append(ManagerSig).append("</td>\n"
            ).append("            </tr>\n"
            ).append("            <tr>\n"
            ).append("                <td colspan\"3\">Signed Timestamp: ").append(ManagerSigTimestamp).append("</td>\n"
            ).append("            </tr>\n"
            ).append("        </table>\n"
            ).append("    </div>\n"
            ).append("    <br>\n"
            ).append("\n"
            ).append("    <span style=\"font-size: small;color: #9d9d9d\">").append(UUID_fromRegistration).append("</span>\n"
            ).append("");

            Registration_file regFiletime = null;
            try {
                FileInputStream fileIn = new FileInputStream(/*
                         getServletContext().getRealPath(File.separator) +*/UUID_fromRegistration + ".efile");
                // read the file with this UUID
                ObjectInputStream in = new ObjectInputStream(fileIn);
                regFiletime = (Registration_file) in.readObject();
            } catch (IOException ex) {
                ex.printStackTrace();
//                System.out.println("--error reading timestamps : " + UUID_fromRegistration);
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            }

//--------------Suffixes for each user----------------------------
            StringBuilder deptAccepted = new StringBuilder("<center><b style=\"color:red;font-size:14px;\">");
            deptAccepted.append(" * Department Head Accepted -")
                    .append(DEList.getDB_DeptHeadName(dept))
                    .append(" on ")
                    .append(regFiletime.getUser1OKTimestamp())
                    .append("</b></center><br/>");

            StringBuilder financeAccepted = new StringBuilder("<center><b style=\"color:red;font-size:14px;\"> ** Division Head Accepted -")
                    .append(DEList.getDB_DivHeadName(dept))
                    .append(" on ")
                    .append(regFiletime.getUser2OKTimestamp())
                    .append("</b></center><br/>\n");

            StringBuilder FOAccepted = new StringBuilder("<center><b style=\"color:red;font-size:14px;\"> *** Finance Director Accepted on ")
                    .append(regFiletime.getUser3OKTimestamp())
                    .append("</b></center><br/>\n");
//-----------------------------------------------------------------------------------------

// --------------DIRECTORS MARKING THE APPLICATION AS ACCEPTED---------------------------------
            if (addressTo.equals(toUser1)) {
//                System.out.println("-----------sending to the first user---------");
            } else if (addressTo.equals(toUser2)) {
                content.append("<hr>\n").append(deptAccepted);
            } else if (addressTo.equals(toUser3)) {
                content.append("<hr>\n"
                ).append(deptAccepted).append(financeAccepted);
            } else if (addressTo.equals(toUser4)) {// if the user is ADMINISTRATOR, display a button to redirect to finalizing page
                content.append("<hr>\n").append(deptAccepted).append(financeAccepted).append(FOAccepted)
                        .append("<hr><br>"
                        ).append("<center>\n"
                        ).append("        <form action=\"http://ritzform-occulttech.rhcloud.com/info.jsp?procID="
                        ).append(UUID_fromRegistration).append("\" method=\"post\"> \n"
                        ).append("            <input id=\"disableOnPage\" style=\"\n"
                        ).append("                   font-size: 20px;\n"
                        ).append("                   font-weight: bold;\n"
                        ).append("                   font-family: 'Oswald';\n"
                        ).append("                   padding: 4px;\n"
                        ).append("                   cursor: pointer;\n"
                        ).append("                   color: whitesmoke;\n"
                        ).append("                   background-color: #444;\n"
                        ).append("                   border: 1px solid rgb(50,50,50);\n"
                        ).append("                   border-radius: 3px\"\n"
                        ).append("                   type=\"submit\" \n"
                        ).append("                   value=\"Finalize Employee Request Form\"/> \n"
                        ).append("        </form>\n"
                        ).append("    </center>\n"
                        ).append("</body>\n"
                        ).append("</html>");
            }
//---------------------------------------------------------------------------------------------

            if (!addressTo.equals(toUser4)) { // if the user is not ADMINISTRATOR, display "accept" button
                content.append(
                        "<hr>\n"
                ).append("    <center>\n");
                if (addressTo.equals(toUser1)) {         //if it is first user, bind the email address to URL, so server knows from who, the accept order is now coming from        
                    content.append("        <form action=\"http://ritzform-occulttech.rhcloud.com/index.jsp?redirid=").append(UUID_fromRegistration).append("&emailid=").append(toUser1).append("\" method=\"post\"> \n");
                } else if (addressTo.equals(toUser2)) {
                    content.append("        <form action=\"http://ritzform-occulttech.rhcloud.com/index.jsp?redirid=").append(UUID_fromRegistration).append("&emailid=").append(toUser2).append("\" method=\"post\"> \n");
                } else if (addressTo.equals(toUser3)) {
                    content.append("        <form action=\"http://ritzform-occulttech.rhcloud.com/index.jsp?redirid=").append(UUID_fromRegistration).append("&emailid=").append(toUser3).append("\" method=\"post\"> \n");
                }
                content.append("            <input style=\"\n"
                ).append("                   font-size: 20px;\n"
                ).append("                   font-weight: bold;\n"
                ).append("                   font-family: 'Oswald';\n"
                ).append("                   padding: 4px;\n"
                ).append("                   cursor: pointer;\n"
                ).append("                   color: whitesmoke;\n"
                ).append("                   background-color: #444;\n"
                ).append("                   border: 1px solid rgb(50,50,50);\n"
                ).append("                   border-radius: 3px\"\n"
                ).append("                   type=\"submit\" \n"
                ).append("                   value=\"Accept Employee Request\"/> \n"
                ).append("        </form>\n"
                ).append("    </center>\n"
                ).append("</body>\n"
                ).append("</html>");
            }
            message.setContent(content.toString(), "text/html; charset=utf-8");

            /**
             * *******************************************************************
             */
            /**
             * *******************************************************************
             */
            /**
             * *******************************************************************
             */
            //http://stackoverflow.com/questions/16441005/java-send-mail-failure-gmail-with-smtp
//            message.setContent("CONTENT", "text/html; charset=utf-8");
            // Send message
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, from, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            /**
             * *******************************************************************
             */

            // Send message
//            result = "Message Sent successfully....";
//            response.sendRedirect("/regForm/index.jsp?msg=" + result);
            response.sendRedirect("success.jsp");
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = "Error: unable to send message....";
//            response.sendRedirect("/regForm/index.jsp?msg=" + result);
            response.sendRedirect("error.jsp" + result);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
