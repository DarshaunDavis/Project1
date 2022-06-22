<%
	if (session.getAttribute("employeeID")== null){
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
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile | Revature: Expense Reimbursement System - Enterprise</title>
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
                <li class="nav-item"><a href="edashboard.jsp" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="sreimbursement.jsp" class="nav-link">Submit</a></li>
                <li class="nav-item"><a href="epenreimbursement.jsp" class="nav-link">Review</a></li>
                <li class="nav-item"><a href="eresreimbursement.jsp" class="nav-link">Resolved</a></li>
                <li class="nav-item"><a href="eviewprofile.jsp" class="nav-link active" aria-current="page">Profile</a></li>
                <li class="nav-item"><a href="logout" class="nav-link" >Logout</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Welcome back <%=session.getAttribute("firstName") %> <%=session.getAttribute("lastName") %>!</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Employee ID #: <%=session.getAttribute("employeeID") %></a></li>
              </ul>
            </header>
      </div>
      
	      <!-- Forgot Password Modal -->
<div class="modal fade" id="forgotPasswordModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Reset your password</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form class="">
          <div class="form-floating mb-3">
          <div class="text-center mb-3">
          By clicking Reset Password, you acknowledge that your current password will be reset and become invalid.
          </div>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-danger" type="submit">Reset Password</button>
          </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	
	<section class="vh-100" style="background-color: #03989E">
	<div class="container h-100 shadow-2-strong" style="border-radius: 1rem;">
    	<div class="row d-flex justify-content-center mx-auto w-auto">
      		<div class="p-5 text-center table-responsive">
	          			<table class="align-top table table-light table-striped table-hover">
	          				<thead>
	          				<tr>
	          					<th colspan="13">
	          					<button class="btn btn-danger btn-lg btn-block" type="submit" name="addNewEmployee" id="addNewEmployee"
									class="form-submit" value="Add New Employee" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Reset Password</button>
	          					</th>
	          				</tr>
	          				<tr class="align-top">
	          						<th></th>
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
	          						<th></th>
	          						<th></th>          						
	          					</tr>
	          				</thead>
	          				<tbody>
	          					<% 
	          				try{
	          					connection = DriverManager.getConnection(connectionUrl+dbName, userID, password);
	          					statement = connection.createStatement();
	          					String employeeIDString = (String)session.getAttribute("employeeID");
	          					String sql = "select Employees.id, Employees.managerStatus, Employees.firstName, Employees.lastName, Employees.employeeID, Address.employeeAddress, Address.employeeApt, Address.employeeCity, Address.employeeState, Address.employeeZipCode, Email.personalEmail, Email.companyEmail from Employees, Address, Email where employeeID = employeeAddressID and employeeAddressID = employeeEmailID and employeeID =" + employeeIDString;
	          					resultSet = statement.executeQuery(sql);	          					
	          				while (resultSet.next()){
	          				%>
	          					
	          					<tr class="align-top">
	          						<td></td>
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
	          						<td><button class="btn btn-success" type="submit" name="updateProfile" id="updateProfile"
									class="form-submit" value="Update" >Update</button></td>
	          						<td></td>          						
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
          			
<section class="vh-100"	>
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <form method="post" action="updateEmployeeInformation" class="updateEmployeeInformation"
							id="updateEmployeeInformation" style="display: none">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <h3 class="mb-5">Update Personal Information</h3>

            <div class="form-outline mb-4">
              <input type="text" id="firstName" name="firstName" class="form-control form-control-lg" placeholder="Contact HR to update First Name" disabled/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="lastName" name="lastName" class="form-control form-control-lg" placeholder="Contact HR to update Last Name"  disabled/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeAdress" name="employeeAddress" class="form-control form-control-lg" placeholder="Enter New Address" autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeApt" name="employeeApt" class="form-control form-control-lg" placeholder="Enter New Apartment"/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeCity" name="employeeCity" class="form-control form-control-lg" placeholder="Enter New City" autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeState" name="employeeState" class="form-control form-control-lg" placeholder="Enter New State" autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeZipCode" name="employeeZipCode" class="form-control form-control-lg" placeholder="Enter New Zip Code" autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="email" id="personalEmail" name="personalEmail" class="form-control form-control-lg" placeholder="Enter New Personal Email" autofocus/>
			</div>
            <button class="btn btn-success btn-md btn-block float-left" type="submit" name="submitUpdate" id="submitUpdate"
									class="form-submit" value="Submit Update">Submit Update</button>            
            <button class="ms-5 btn btn-danger btn-md btn-block float-right" type="submit" name="cancelUpdate" id="cancelUpdate"
									class="form-submit" value="Cancel Update">Cancel Update</button>
            </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</section>
    	</div>
    </div>								
	</section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
      
</body>
</html>