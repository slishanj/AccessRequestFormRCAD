/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "MarkSignatures", urlPatterns = {"/MarkSignatures"})
public class MarkSignatures extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
        String UUID_registration = request.getParameter("redirid"); // this is coming from the email,
        String fromWho = request.getParameter("emailid"); // to check the user that's accepting the email
//        System.out.println("---------redirid = " + UUID_registration + "-----------------");

//        Registration_file regFile = readRegistration.Read(UUID_registration);
        Registration_file regFile = null;
        try {
            System.out.println("## MarkSignatures -" + UUID_registration + "- TRYING TO READ FILE #");
            FileInputStream fileIn = new FileInputStream(/*
                     getServletContext().getRealPath(File.separator) +*/UUID_registration+".efile");
            // read the file with this UUID
            ObjectInputStream in = new ObjectInputStream(fileIn);
            regFile = (Registration_file) in.readObject();
        } catch (IOException ex) {
            System.out.println(ex);
            System.out.println("--MarkSignatures-error reading file with: " + UUID_registration);
            System.out.println("--MarkSignatures-IO ERROR-------- ");
            System.out.println("--MarkSignatures-possibly, the file is not available-------- ");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        Date date = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
        SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy h:mm:ss a z");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
        String formattedDate = sdf.format(date);

        if (regFile != null) {
            System.out.println("--marking signatures--file not null--");
            if (fromWho.equals(regFile.getUser1Email())) {
                System.out.println("--marking user 1 OK--");
                regFile.setUser1OK(true);
                regFile.setUser1OKTimestamp(formattedDate);
            } else if (fromWho.equals(regFile.getUser2Email())) {
                System.out.println("--marking user 2 OK--");
                regFile.setUser2OK(true);
                regFile.setUser2OKTimestamp(formattedDate);
            } else if (fromWho.equals(regFile.getUser3Email())) {
                System.out.println("--marking user 3 OK--");
                regFile.setUser3OK(true);
                regFile.setUser3OKTimestamp(formattedDate);
            }

            //------------------------------- OLD SIGNATURE METHOD below------------------------------------

//        if (regFile != null) {
//            System.out.println("--marking signatures--file not null--");
//            if (regFile.isUser1OK()) {
//                if (regFile.isUser2OK()) {  // should check  && fromWho.equals(regFile.getUser3Email()) or refer above if block
//                    System.out.println("--marking user 3 OK--");
//                    regFile.setUser3OK(true);
//                    regFile.setUser3OKTimestamp(formattedDate);
//                }
//                System.out.println("--marking user 2 OK--");
//                regFile.setUser2OK(true);
//                regFile.setUser2OKTimestamp(formattedDate);
//            } else {
//                System.out.println("--marking user 1 OK--");
//                regFile.setUser1OK(true);
//                regFile.setUser1OKTimestamp(formattedDate);
//            }
            
            try {
//                FileWriter fw = new FileWriter("");
                System.out.println("--UPDATING THE REGISTRATION--");
                FileOutputStream fileOut
                        = new FileOutputStream(/*
                                 getServletContext().getRealPath(File.separator) +*/UUID_registration+".efile");
                // UUID is the name
                ObjectOutputStream out = new ObjectOutputStream(fileOut);
                out.writeObject(regFile);
                out.flush();
                out.close();

                System.out.println("UPDATED the  registration file: " + UUID_registration);
            } catch (IOException ex) {
                ex.printStackTrace();
                System.out.println("Error writing registration file: " + UUID_registration);
            }
        } else {
            System.out.println("------MarkSignatures servlet: regfile null------------");
        }

//        RequestDispatcher rd = request.getRequestDispatcher("MarkSignatures2");
        RequestDispatcher rd = request.getRequestDispatcher("Proceed2?ID=" + UUID_registration);
        rd.forward(request, response);
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
