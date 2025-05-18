package controller;

import dao.EmployeeDAO;
import model.Employee;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/insertEmployee", "/editEmployee", "/updateEmployee", "/deleteEmployee"})
public class EmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/insertEmployee":
                    insertEmployee(request, response);
                    break;
                case "/editEmployee":
                    showEditForm(request, response);
                    break;
                case "/updateEmployee":
                    updateEmployee(request, response);
                    break;
                case "/deleteEmployee":
                    deleteEmployee(request, response);
                    break;
                default:
                    response.sendRedirect("viewEmployees.jsp");
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String jobRole = request.getParameter("job_role");
        String department = request.getParameter("department");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contact_number");
        String nic = request.getParameter("nic");
        String homeContactNumber = request.getParameter("home_contact_number");
        String img = request.getParameter("img");

        Employee newEmployee = new Employee(0, name, jobRole, department, address, contactNumber, nic, homeContactNumber, img);
        employeeDAO.insertEmployee(newEmployee);
        response.sendRedirect("viewEmployees.jsp");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeDAO.selectEmployee(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editEmployee.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String jobRole = request.getParameter("job_role");
        String department = request.getParameter("department");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contact_number");
        String nic = request.getParameter("nic");
        String homeContactNumber = request.getParameter("home_contact_number");
        String img = request.getParameter("img");

        Employee employee = new Employee(id, name, jobRole, department, address, contactNumber, nic, homeContactNumber, img);
        employeeDAO.updateEmployee(employee);
        response.sendRedirect("viewEmployees.jsp");
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDAO.deleteEmployee(id);
        response.sendRedirect("viewEmployees.jsp");
    }
}
