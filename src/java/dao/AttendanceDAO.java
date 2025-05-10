package dao;

import model.Attendance;
import java.sql.*;
import java.util.*;

public class AttendanceDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/hrmsdb"; 
    private final String jdbcUsername = "root"; 
    private final String jdbcPassword = "";

    private static final String BASE_QUERY = 
        "SELECT a.id, a.employee_id, e.name AS employee_name, a.date, a.status " +
        "FROM attendance a " +
        "JOIN employee e ON a.employee_id = e.id " +
        "WHERE 1=1";

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

    public List<Attendance> getAttendance(String selectedDate, String statusFilter) {
        List<Attendance> attendanceList = new ArrayList<>();
        StringBuilder sql = new StringBuilder(BASE_QUERY);

        if (selectedDate != null && !selectedDate.isEmpty()) {
            sql.append(" AND a.date = ?");
        }
        if (statusFilter != null && !statusFilter.isEmpty()) {
            sql.append(" AND a.status = ?");
        }

        sql.append(" ORDER BY a.date DESC, e.name ASC");

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (selectedDate != null && !selectedDate.isEmpty()) {
                ps.setString(paramIndex++, selectedDate);
            }
            if (statusFilter != null && !statusFilter.isEmpty()) {
                ps.setString(paramIndex++, statusFilter);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attendance attendance = new Attendance();
                attendance.setId(rs.getInt("id"));
                attendance.setEmployeeId(rs.getInt("employee_id"));
                attendance.setEmployeeName(rs.getString("employee_name"));
                attendance.setDate(rs.getString("date"));
                attendance.setStatus(rs.getString("status"));
                attendanceList.add(attendance);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return attendanceList;
    }
}
