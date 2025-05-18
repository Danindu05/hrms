<%@page import="java.util.List"%>
<%@page import="model.Payroll"%>
<%@page import="dao.PayrollDAO"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Payroll Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/payroll.css">
</head>
<body>

<%
    PayrollDAO payrollDAO = new PayrollDAO();
    List<Payroll> payrollList = payrollDAO.getAllPayrolls();
%>

<div class="main-content">
    <h1 class="page-title"><i class="fas fa-file-invoice-dollar"></i> Payroll Records</h1>

    <% if (payrollList != null && !payrollList.isEmpty()) { %>
        <table class="payroll-table">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Salary</th>
                    <th>Bonuses</th>
                    <th>Deductions</th>
                    <th>Total Pay</th>
                    <th>Pay Date</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
    <% } else { %>
        <div class="no-data">
            <i class="fas fa-info-circle"></i> No payroll records found.
        </div>
    <% } %>
</div>

</body>
</html>

</div>

</body>
</html>
