<%@page import="java.util.List"%>
<%@page import="model.Payroll"%>
<%@page import="dao.PayrollDAO"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Payroll Management</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #e0eafc, #cfdef3);
}
.main-content {
    margin-left: 240px;
    padding: 30px;
}
.page-title {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 25px;
    color: #2c3e50;
}
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    margin-top: 10px;
}
th, td {
    padding: 14px 20px;
    text-align: left;
    font-size: 15px;
}
th {
    background-color: #3498db;
    color: white;
    font-size: 16px;
}
tr:nth-child(even) {
    background-color: #f4f6f8;
}
tr:hover {
    background-color: #ecf0f1;
}
    </style>
</head>
<body>

<%
    PayrollDAO payrollDAO = new PayrollDAO();
    List<Payroll> payrollList = payrollDAO.getAllPayrolls();
%>

<div class="main-content">
    <h1 class="page-title">Payroll Records</h1>

    <% if (payrollList != null && !payrollList.isEmpty()) { %>
    <table>
        <tr>
            
            <th>Employee ID</th>
            <th>Salary</th>
            <th>Bonuses</th>
            <th>Deductions</th>
            <th>Total Pay</th>
            <th>Pay Date</th>
        </tr>

        <% for (Payroll p : payrollList) { %>
            <tr>
                
                <td><%= p.getEmployeeId() %></td>
                <td>Rs. <%= String.format("%,.2f", p.getSalary()) %></td>
                <td>Rs. <%= String.format("%,.2f", p.getBonuses()) %></td>
                <td>Rs. <%= String.format("%,.2f", p.getDeductions()) %></td>
                <td><strong>Rs. <%= String.format("%,.2f", p.getTotalPay()) %></strong></td>
                <td><%= p.getPayDate() %></td>
            </tr>
        <% } %>
    </table>

    <% } else { %>
        <p>No payroll records found.</p>
    <% } %>

</div>

</body>
</html>
