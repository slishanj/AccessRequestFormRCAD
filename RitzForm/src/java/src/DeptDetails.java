/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
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
@WebServlet(name = "DeptDetails", urlPatterns = {"/DeptDetails.html"})
public class DeptDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        DeptEmailList delist = new DeptEmailList();

        String dname = request.getParameter("dname");
        String UUID = request.getParameter("appid");
        System.out.println("--received request for DeptHead Name and timestamp -" + dname + "--" + UUID);
        String dbDeptHeadName = delist.getDB_DeptHeadName(dname);

        Registration_file regFiletime = null;
        try {
            FileInputStream fileIn = new FileInputStream(UUID + ".efile");
            // read the file with this UUID
            ObjectInputStream in = new ObjectInputStream(fileIn);
            regFiletime = (Registration_file) in.readObject();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        String user1OKTimestamp = regFiletime.getUser1OKTimestamp();
        String user2OKTimestamp = regFiletime.getUser2OKTimestamp();
        String user3OKTimestamp = regFiletime.getUser3OKTimestamp();

        out.write(dbDeptHeadName + " on " + user1OKTimestamp + ", on " + user2OKTimestamp + ", on " + user3OKTimestamp);

        delist = null;
        dbDeptHeadName = null;
        dname = null;
        UUID = null;
        regFiletime = null;
        user1OKTimestamp = null;
        user2OKTimestamp = null;
        user3OKTimestamp = null;
        out=null;
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
