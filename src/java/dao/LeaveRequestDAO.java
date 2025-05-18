package dao;

import model.LeaveRequest;
import java.sql.*;
import java.util.*;

public class LeaveRequestDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/hrmsdb";
    private final String jdbcUsername = "root"; 
    private final String jdbcPassword = "";

    private static final String GET_ALL_QUERY = "SELECT * FROM leave_request ORDER BY start_date DESC";
    private static final String UPDATE_STATUS_QUERY = "UPDATE leave_request SET status = ? WHERE id = ?";

   
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


    public List<LeaveRequest> getAllLeaveRequests() {
        List<LeaveRequest> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_QUERY);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                LeaveRequest leave = new LeaveRequest();
                leave.setId(rs.getInt("id"));
                leave.setEmployeeId(rs.getInt("employee_id"));
                leave.setStartDate(rs.getString("start_date"));
                leave.setEndDate(rs.getString("end_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                list.add(leave);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

 
    public void updateLeaveStatus(int leaveId, String newStatus) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_STATUS_QUERY)) {

            ps.setString(1, newStatus);
            ps.setInt(2, leaveId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
