<%
	if (session.getAttribute("employeeID")== null){
		response.sendRedirect("index.jsp");
	}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Submit Reimbursements | Revature: Expense Reimbursement System - Enterprise</title>
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
                    <img src="images/reverseicon.png" alt="" width="50" height="50"></svg>
                <span class=" fs-4">Revature: Expense Reimbursement System - Enterprise</span>
              </a>
              </div>
          </header>
            <header class="d-flex justify-content-center py-3">
              <ul class="nav nav-pills">
                <li class="nav-item"><a href="edashboard.jsp" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="sreimbursement.jsp" class="nav-link active" aria-current="page">Submit</a></li>
                <li class="nav-item"><a href="epenreimbursement.jsp" class="nav-link">Review</a></li>
                <li class="nav-item"><a href="eresreimbursement.jsp" class="nav-link">Resolved</a></li>
                <li class="nav-item"><a href="eviewprofile.jsp" class="nav-link">Profile</a></li>
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
      <form method="post" action="submitReimbursements" class="submitReimbursements"
							id="submitReimbursements" enctype="multipart/form-data">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <h3 class="mb-3">Submit Reimbursement</h3>

            <div class="form-outline mb-4">	            
            <p>Submit your REVERSE reimbursements for approval</p>
             <div class="form-outline mb-4 mt-2">
             <label id="expenseDate"><b>Date of expense</b></label>
             <input type="date" class="form-control form-control-lg" placeholder="Please enter expense date" name="expenseDate" required autofocus>
             </div>
             <div class="form-outline mb-4 mt-2">
             <label id="expenseAmount"><b>Amount of expense</b></label>
             <input type="text" class="form-control form-control-lg" placeholder="Please enter expense amount" name="expenseAmount" required autofocus>
             </div>
             <div class="form-outline mb-4 mt-2">
             <label id="expensePurpose"><b>Purpose of expense</b></label>
             <textarea class="form-control form-control-lg" placeholder="Please enter expense purpose" name="expensePurpose" required autofocus></textarea>
             </div>    
             <div class="form-outline mb-4 mt-2">
             <label for="expenseCategory"><b>Select expense category</b></label>
             <select id="expenseCategory" name="expenseCategory" class="form-control form-control-lg">
                 <option value="Select Expense Category" disabled selected="selected">Select Expense Category</option>
                 <option value="Business Travel">Business Travel</option>
                 <option value="Business use of Personal Vehicle">Business use of Personal Vehicle</option>
                 <option value="Education Expenses">Education Expenses</option>
                 <option value="Entertainment">Entertainment</option>
                 <option value="Meals">Meals</option>
                 <option value="Professional Dues">Professional Dues</option>
                 <option value="Tools and Supplies">Tools and Supplies</option>
                 <option value="Other">Other</option>
             </select>
             </div>
             <div class="form-outline mb-4 mt-2">
             <label for="expenseReceipt">Please attach your receipt (Optional)</label>
             <input type="file" id="9expenseReceipt" name="expenseReceipt" class="form-control form-control-lg">
             </div>

            <button class="btn btn-primary btn-lg btn-block" type="submit" name="submitExpense" id="submitExpense"
									class="form-submit" value="Submit Expense">Submit Expense</button>
            
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
    		swal("Your reimbursement request has been successfully submitted!");
    	}
    </script>    
</body>
</html>