package dao;

import model.tTracker;
import java.sql.*;
import java.util.*;

public class tTrackerDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/hrmsdb";
    private final String dbUser = "root";
    private final String dbPassword = "";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }

    public List<tTracker> getAllTrackers() {
        List<tTracker> list = new ArrayList<>();
        String sql = "SELECT t.*, e.name, e.department, e.img FROM ttracker t JOIN employee e ON t.employee_id = e.id";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                tTracker t = new tTracker();
                t.setId(rs.getInt("id"));
                t.setEmployeeId(rs.getInt("employee_id"));
                t.setEmployeeName(rs.getString("name"));
                t.setDepartment(rs.getString("department"));
                t.setImagePath(rs.getString("img"));
                t.setAttendanceDays(rs.getInt("attendance_days"));
                t.setLeaveDays(rs.getInt("leave_days"));
                t.setLateDays(rs.getInt("late_days"));
                t.setTasksAssigned(rs.getInt("tasks_assigned"));
                t.setTasksCompleted(rs.getInt("tasks_completed"));
                list.add(t);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return list;
    }
}