<%
	if (session.getAttribute("employeeID")!= null && session.getAttribute("manager").equals("No")){
		response.sendRedirect("edashboard.jsp");
	} 
	else if
		(session.getAttribute("employeeID")== null){
		response.sendRedirect("index.jsp");
	}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard | Revature: Expense Reimbursement System - Enterprise</title>
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

    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    
    <div class="container">
        
        <header class="py-3 mb-4 border-bottom">
            <div class="container d-flex flex-wrap justify-content-center">
              <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <img src="images/reverseicon.png" alt="" width="50" height="50">
                </svg>
                <span class=" fs-4">Revature: Expense Reimbursement System - Enterprise</span>
              </a>
              </div>
          </header>
            <header class="d-flex justify-content-center py-3">
              <ul class="nav nav-pills">
                <li class="nav-item"><a href="mdashboard.jsp" class="nav-link active" aria-current="page">Dashboard</a></li>
                <li class="nav-item"><a href="mpenreimbursement.jsp" class="nav-link">Review</a></li>
                <li class="nav-item"><a href="mresreimbursement.jsp" class="nav-link">Resolved</a></li>
                <li class="nav-item"><a href="mviewprofile.jsp" class="nav-link">Employees</a></li>
                <li class="nav-item"><a href="logout" class="nav-link" >Logout</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Welcome back <%=session.getAttribute("firstName") %> <%=session.getAttribute("lastName") %>!</a></li>
                <li class="nav-item"><a class="nav-link link-dark">Employee ID #: <%=session.getAttribute("employeeID") %></a></li>
              </ul>
            </header>
      </div>
      
      <section class="vh-100" style="background-color: #03989E">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <form method="post" action="addnewemployee" class="addNewEmployee"
							id="addNewEmployee">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <h3 class="mb-5">Add New Employee</h3>

            <select id="managerStatus" name="managerStatus" class="form-control form-control-lg mb-4" placeholder="Is employee a manager?" required autofocus>
                 <option value="Select Expense Category" disabled selected="selected">Select Position</option>
                 <option value="No">Employee</option>
                 <option value="Yes">Manager</option>
                 </select>
            
            <div class="form-outline mb-4">
              <input type="text" id="firstName" name="firstName" class="form-control form-control-lg" placeholder="Employee First Name" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="lastName" name="lastName" class="form-control form-control-lg" placeholder="Employee Last Name" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeID" name="employeeID" class="form-control form-control-lg" placeholder="Employee ID Number" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeAdress" name="employeeAddress" class="form-control form-control-lg" placeholder="Employee Address" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeApt" name="employeeApt" class="form-control form-control-lg" placeholder="Employee Apartment *Optional*"/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeCity" name="employeeCity" class="form-control form-control-lg" placeholder="Employee City" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeState" name="employeeState" class="form-control form-control-lg" placeholder="Employee State" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="text" id="employeeZipCode" name="employeeZipCode" class="form-control form-control-lg" placeholder="Employee Zip Code" required autofocus/>
			</div>

            <div class="form-outline mb-4 mt-2">
              <input type="email" id="personalEmail" name="personalEmail" class="form-control form-control-lg" placeholder="Employee Personal Email" required autofocus/>
			</div>

            <button class="btn btn-primary btn-lg btn-block" type="submit" name="submitNewEmployee" id="submitNewEmployee"
									class="form-submit" value="Add New Employee">Add New Employee</button>
            
            </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">  
    
    <script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status == "success"){
    		swal("Employee has been successfully added!");
    	}
    </script>
</body>
</html>