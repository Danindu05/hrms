/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package controller;

import dao.tTrackerDAO;
import model.tTracker;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class tTrackerServlet extends HttpServlet {
    private tTrackerDAO dao;

    public void init() {
        dao = new tTrackerDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int empId = Integer.parseInt(req.getParameter("id"));
        tTracker data = dao.getEmployeeData(empId);

        req.setAttribute("tracker", data);
        RequestDispatcher dispatcher = req.getRequestDispatcher("tTracker.jsp");
        dispatcher.forward(req, resp);
    }
}
