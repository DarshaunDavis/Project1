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
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resolved Reimbursements | Revature: Expense Reimbursement System - Enterprise</title>
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
                <li class="nav-item"><a href="mresreimbursement.jsp" class="nav-link active" aria-current="page">Resolved</a></li>
                <li class="nav-item"><a href="mviewprofile.jsp" class="nav-link">Employees</a></li>
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
	          					<h1>Resolved Reimbursement Requests</h1>
	          					</th>
	          				</tr>
	          				<tr class="align-top">
	          						<th></th>
	          						<th>ID</th>
	          						<th>Expense ID</th>
	          						<th>Expense Date</th>
	          						<th>Expense Amount</th>
	          						<th>Expense Purpose</th>	
	          						<th>Expense Category</th>
	          						<th>Expense Receipt</th>
	          						<th>Expense Status</th>
	          						<th>Submission Date</th>
	          						<th>Approval ID</th>
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
	          					String sql = "select * from testExpenses where not expenseStatus = 'Pending'";
	          					resultSet = statement.executeQuery(sql);	          					
	          				while (resultSet.next()){
	          				%>
	          					
	          					<tr class="align-top">
	          						<td></td>
	          						<td><%= resultSet.getString("id")%></td>
	          						<td><%= resultSet.getString("expenseID")%></td>
	          						<td><%= resultSet.getString("expenseDate")%></td>
	          						<td><%= resultSet.getString("expenseAmount")%></td>
	          						<td><%= resultSet.getString("expensePurpose")%></td>	
	          						<td><%= resultSet.getString("expenseCategory")%></td>
	          						<td></td>
	          						<td><%= resultSet.getString("expenseStatus")%></td>
	          						<td><%= resultSet.getString("submissionDate")%></td>
	          						<td><%= resultSet.getString("reviewerID")%></td>
	          						<td><button class="btn btn-success" type="submit" name="updateProfile" id="updateProfile"
									class="form-submit" value="Approve" >Approve</button></td>
	          						<td><button class="btn btn-danger" type="submit" name="updateProfile" id="updateProfile"
									class="form-submit" value="Deny" >Deny</button></td>          						
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