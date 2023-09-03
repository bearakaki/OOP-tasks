/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author beaar
 */
@WebServlet(name = "LoteriaServlet", urlPatterns = {"/loteria.html"})
public class LoteriaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String errorMessage = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RandomServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h4> <a href = 'index.html'>Voltar</a></h4>");
            out.println("<form>");
            out.println("<input type='submit' name='random' value='Generate'/>");
            out.println("</form>");
            
            if(errorMessage != null){
                out.println("<h4 style='color:red'>"+ errorMessage+ "</h4>");            
            }else{
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>Index</th><th>Number</th>");
                out.println("</tr>");
            int[] num = new int[6];
            int c = 0;
            while(c< 6){
                int r = ((int)(60*Math.random())+1);
                boolean equals = false;
                for(int z = 0; z < c; z++){ 
                    if(num[z] == r){ 
                        equals = true;
                        break;
                    }
                }   
               
                if(equals == false){ 
                    num[c] = r;
                    c++;
                out.println("<tr>");
                out.println("<th>"+c+"</th>");
                out.println("<th>" + r + "</th>");
                out.println("</tr>");
                }
            if(c>=6){
                break;
            }
            }
            
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
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
    
