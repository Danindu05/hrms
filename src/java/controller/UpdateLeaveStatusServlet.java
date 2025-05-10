package controller;

import dao.LeaveRequestDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateLeaveStatusServlet")
public class UpdateLeaveStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int leaveId = Integer.parseInt(request.getParameter("leaveId"));
        String newStatus = request.getParameter("newStatus");

        LeaveRequestDAO dao = new LeaveRequestDAO();
        dao.updateLeaveStatus(leaveId, newStatus);

        response.sendRedirect("leaveRequest.jsp"); // Refresh the page
    }
}
