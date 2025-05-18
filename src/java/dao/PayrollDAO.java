package dao;

import model.Payroll;
import java.sql.*;
import java.util.*;

public class PayrollDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/hrmsdb"; 
    private final String jdbcUsername = "root"; 
    private final String jdbcPassword = "";

    private static final String GET_ALL_QUERY = "SELECT * FROM payroll ORDER BY pay_date DESC";

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

    public List<Payroll> getAllPayrolls() {
        List<Payroll> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_QUERY);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Payroll p = new Payroll();
                p.setId(rs.getInt("id"));
                p.setEmployeeId(rs.getInt("employee_id"));
                p.setSalary(rs.getDouble("salary"));
                p.setBonuses(rs.getDouble("bonuses"));
                p.setDeductions(rs.getDouble("deductions"));
                p.setTotalPay(rs.getDouble("total_pay"));
                p.setPayDate(rs.getString("pay_date"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
