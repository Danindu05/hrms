package dao;

import model.Employee;
import java.sql.*;
import java.util.*;

public class EmployeeDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/hrmsdb"; // Your DB
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employee";
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee (name, job_role, department, address, contact_number, nic, home_contact_number, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employee WHERE id=?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employee SET name=?, job_role=?, department=?, address=?, contact_number=?, nic=?, home_contact_number=?, img=? WHERE id=?";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employee WHERE id=?";
    
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 1. Get All Employees
    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_EMPLOYEES)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String jobRole = rs.getString("job_role");
                String department = rs.getString("department");
                String address = rs.getString("address");
                String contactNumber = rs.getString("contact_number");
                String nic = rs.getString("nic");
                String homeContactNumber = rs.getString("home_contact_number");
                String img = rs.getString("img");

                employees.add(new Employee(id, name, jobRole, department, address, contactNumber, nic, homeContactNumber, img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employees;
    }

    // 2. Insert New Employee
    public void insertEmployee(Employee employee) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getJobRole());
            ps.setString(3, employee.getDepartment());
            ps.setString(4, employee.getAddress());
            ps.setString(5, employee.getContactNumber());
            ps.setString(6, employee.getNic());
            ps.setString(7, employee.getHomeContactNumber());
            ps.setString(8, employee.getImg()); // NEW img
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 3. Select Employee by ID
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String jobRole = rs.getString("job_role");
                String department = rs.getString("department");
                String address = rs.getString("address");
                String contactNumber = rs.getString("contact_number");
                String nic = rs.getString("nic");
                String homeContactNumber = rs.getString("home_contact_number");
                String img = rs.getString("img");

                employee = new Employee(id, name, jobRole, department, address, contactNumber, nic, homeContactNumber, img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }

    // 4. Update Employee
    public void updateEmployee(Employee employee) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getJobRole());
            ps.setString(3, employee.getDepartment());
            ps.setString(4, employee.getAddress());
            ps.setString(5, employee.getContactNumber());
            ps.setString(6, employee.getNic());
            ps.setString(7, employee.getHomeContactNumber());
            ps.setString(8, employee.getImg()); // NEW img
            ps.setInt(9, employee.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 5. Delete Employee
    public void deleteEmployee(int id) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
