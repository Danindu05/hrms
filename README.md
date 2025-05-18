
# Human Resource Management System (HRMS)

A  web-based **HR Management System** built using **Java EE technologies** including Servlets, JSP, and JDBC. The system allows HR departments to manage employee data, attendance, leave requests, payroll, and target tracking efficiently.

##  Key Features

-  **Employee Management** – Add, update, delete employee records  
-  **Attendance Tracking** – Record and monitor daily attendance  
-  **Leave Management** – View leave status, HR approval  
-  **Payroll Processing** – Calculate salaries, bonuses, deductions  
-  **Target Tracker** – Monitor productivity
-  **Dashboard Overview** – Weekly insights and system summaries  

## 🛠 Technologies Used

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Java Servlets, JSP, JDBC  
- **Database:** MySQL  
- **Server:** Apache Tomcat  
- **Architecture:** MVC


## Setup Instructions

1. Clone the repository  
   ```sh
   git clone https://github.com/yourusername/hrms.git

2. Import the project into Eclipse or NetBeans as a Java Web project

3. Set up your **MySQL database** using the provided `hrmsdb.sql` file

4. Deploy the project to your Apache Tomcat server

5. Start the Tomcat server and navigate to:  
   ```sh
   http://localhost:8080/HRMS/
6. Login using default credentials
   ```sh
   admin / 1234

## Database Schema

- `employee` – stores employee details  
- `attendance` – tracks daily attendance  
- `leave_request` – manages leave applications  
- `payroll` – handles salary info  
- `ttracker` – linked to the Target Tracker module


