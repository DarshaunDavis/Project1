<%
	if (session.getAttribute("employeeID")!= null && session.getAttribute("manager").equals("No")){
		response.sendRedirect("edashboard.jsp");
	} 
	else if
		(session.getAttribute("employeeID")== null){
		response.sendRedirect("index.jsp");
	}
%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!doctype html>

<%
String id = request.getParameter("userID");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "reverse?useSSL=false";
String userID = "newuser";
String password = "password";

try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String sql = "select Employees.id, Employees.managerStatus, Employees.firstName, Employees.lastName, Employees.employeeID, Address.employeeAddress, Address.employeeApt, Address.employeeCity, Address.employeeState, Address.employeeZipCode, Email.personalEmail, Email.companyEmail from Employees, Address, Email where employeeID = employeeAddressID and employeeAddressID = employeeEmailID order by id;";
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employee Profiles | Revature: Expense Reimbursement System - Enterprise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="shortcut icon" href="assets/img/favicon.ico"/>
    <style>
        .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
            color: #fff;
            background-color: #03989E;
        }
    </style>
    </head>
  <body>

    
    <div class="container">
        
        <header class="py-3 mb-4 border-bottom">
            <div class="container d-flex flex-wrap justify-content-center">
              <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <img src="images/reverseicon.png" alt="" width="50" height="50"></svg>
                <span class=" fs-4">Revature: Expense Reimbursement System - Enterprise</span>
              </a>
              </div>
          </header>
            <header class="d-flex justify-content-center py-3">
              <ul class="nav nav-pills">
                <li class="nav-item"><a href="mdashboard.jsp" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="mpenreimbursement.jsp" class="nav-link">Review</a></li>
                <li class="nav-item"><a href="mresreimbursement.jsp" class="nav-link">Resolved</a></li>
                <li class="nav-item"><a href="mviewprofile.jsp" class="nav-link active" aria-current="page">Employees</a></li>
                <li class="nav-item"><a href="logout" class="nav-link" >Logout</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Welcome back <%=session.getAttribute("firstName") %> <%=session.getAttribute("lastName") %>!</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Employee ID #: <%=session.getAttribute("employeeID") %></a></li>
              </ul>
            </header>
      </div>      
      
	<section class="vh-100" style="background-color: #03989E">
	<div class="container h-100 shadow-2-strong" style="border-radius: 1rem;">
    	<div class="row d-flex justify-content-center mx-auto w-auto">
      		<div class="p-5 text-center table-responsive">
	          			<table class="align-top table table-light table-striped table-hover">
	          				<thead>
	          				<tr>
	          					<th colspan="13">
	          					<button class="btn btn-primary btn-lg btn-block" type="submit" name="addNewEmployee" id="addNewEmployee"
									class="form-submit" value="Add New Employee" onclick="window.location.href='http://localhost:8082/REVERSE/addnewemployee.jsp'" action="">Add New Employee</button>
	          					</th>
	          				</tr>
	          				<tr class="align-top">
	          						<th>Manager</th>
	          						<th>First Name</th>
	          						<th>Last Name</th>
	          						<th>Employee ID</th>
	          						<th>Address</th>
	          						<th>Apt</th>	
	          						<th>City</th>
	          						<th>State</th>
	          						<th>ZipCode</th>
	          						<th>Personal Email</th>
	          						<th>Company Email</th>
	          						<th colspan="2">
	          						<form method="post" action="searchEmployees" class="searchEmployees"
							id="searchEmployees">
	          						<input type="text" class="form-control form-control-sm mb-2" placeholder="Enter Employee ID">
	          						<button class="btn btn-success btn-sm" type="submit" name="submitSearch" id="submitSearch"
									class="form-submit" value="Submit Search">Search</button>
	          						<button class="btn btn-primary btn-sm ms-2" type="submit" name="resetSearch" id="resetSearch"
									class="form-submit" value="Reset Search">Reset</button>
	          						</form>	
	          						</th>				
	          					</tr>
	          				</thead>
	          				<tbody>
	          					<% 
	          				try{
	          					connection = DriverManager.getConnection(connectionUrl+dbName, userID, password);
	          					statement = connection.createStatement();
	          					sql = "select Employees.id, Employees.managerStatus, Employees.firstName, Employees.lastName, Employees.employeeID, Address.employeeAddress, Address.employeeApt, Address.employeeCity, Address.employeeState, Address.employeeZipCode, Email.personalEmail, Email.companyEmail from Employees, Address, Email where employeeID = employeeAddressID and employeeAddressID = employeeEmailID order by id;";
	          						resultSet = statement.executeQuery(sql);	          					
	          				while (resultSet.next()){
	          				%>
	          					
	          					<tr class="align-top">
	          						<td><%= resultSet.getString("managerStatus") %></td>
	          						<td><%= resultSet.getString("firstName")%></td>
	          						<td><%= resultSet.getString("lastName")%></td>
	          						<td><%= resultSet.getString("employeeID")%></td>
	          						<td><%= resultSet.getString("employeeAddress")%></td>
	          						<td><%= resultSet.getString("employeeApt")%></td>	
	          						<td><%= resultSet.getString("employeeCity")%></td>
	          						<td><%= resultSet.getString("employeeState")%></td>
	          						<td><%= resultSet.getString("employeeZipCode")%></td>
	          						<td><%= resultSet.getString("personalEmail")%></td>
	          						<td><%= resultSet.getString("companyEmail")%></td>
	          						<td><button class="btn btn-success">Update</button></td>
	          						<td><button class="btn btn-danger">Delete</button></td>          						
	          					</tr>
	          					<%
	          				}
	          					connection.close();
	          				} catch (Exception e){
	          					e.printStackTrace();
	          				}
	          					%>	
	          				</tbody>
	          			</table>
          			</div>
    	</div>
    </div>								
	</section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
      
</body>
</html>