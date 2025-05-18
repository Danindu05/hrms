package controller;

import dao.tTrackerDAO;
import model.tTracker;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/tTrackerServlet")
public class tTrackerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        tTrackerDAO dao = new tTrackerDAO();
        List<tTracker> list = dao.getAllTrackers();
        request.setAttribute("trackerList", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tTracker.jsp");
        dispatcher.forward(request, response);
    }
}
