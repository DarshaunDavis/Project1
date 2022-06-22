<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Revature: Expense Reimbursement System - Enterprise</title>
  </head>
  <body>

    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
            <img src="images/reverseicon.png" alt="" width="50" height="50">
          </a>
          
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              
            </ul>
            <form method="post" class="d-flex" role="loginForm" action="loginForm" id="loginForm">
                <input type="email" name="companyEmail" id="companyEmail" class="form-control me-2" placeholder="Email" aria-label="email" required="required">
                <input type="password" name="employeePassword" id="employeePassword" class="form-control me-2" placeholder="Password" aria-label="password" required="required">
                <button type="submit" name="submitLogin" id="submitLogin" class="btn btn-outline-success me-2" value="submitLogin">Login</button>
            	
            </form>
            <button type="submit" name="forgotPasswordModalButton" id="forgotPasswordModalButton" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Forgot Password?</button>
            </div>
        </div>
      </nav>
      
      <!-- The Modal -->
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
          If you've lost or forgotten your password or wish to reset it,<br> enter your email below to get started.
          </div>
            <input type="email" class="form-control rounded-3" placeholder="Enter email address">
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Reset Password</button>
          <small class="text-muted">By clicking Reset Password, you acknowledge that your current password will become invalid.</small>
          
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
      
      <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">    

    <div class="p-5 mb-4 bg-light rounded-3"
      style="background-image: url('images/pexels-pixabay-53594b.jpg');">
        <div>
            <div class="container-f luid py-5">
            <h1 class="display-5 fw-bold">REVERSE</h1>
            <p class="col-md-8 fs-2">Revature: Expense Reimbursement System - Enterprise</p>
            <p class="col-md-8 fs-5">Focus on your business and let us handle your expense reimbursements!</p>
            </div>
        </div>
    </div>
    <div id="error"><?php echo $error; ?>
    <div class="container px-4 py-5" id="featured-3">
        <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
          <div class="feature col">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3">
              <svg class="bi" width="1em" height="1em"><use xlink:href="#collection"/></svg>
            </div>
            <h2>Easy to Use</h2>
            <p>Our REVERSE system makes it easy for your employees to submit their reimbursement requests through one easy to use form.</p>
          </div>
          <div class="feature col">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3">
              <svg class="bi" width="1em" height="1em"><use xlink:href="#people-circle"/></svg>
            </div>
            <h2>Centralized Records</h2>
            <p>Your reimbursement records are saved and stored in digital records to ensure you have access for tracking expenses and policy compliance</p>            
          </div>
          <div class="feature col">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3">
              <svg class="bi" width="1em" height="1em"><use xlink:href="#toggles2"/></svg>
            </div>
            <h2>Access Anywhere</h2>
            <p>Your employees won't to return to the office before submitting their expenses.  Our Android app allows the same simple submission as on the computer.</p>
          </div>
        </div>
      </div>
      
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">  
    
    <script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status == "error"){
    		swal("Please enter a valid email or password");
    	}
    	if(status == "invalidEmail"){
    		swal("Please enter a valid email");
    	}
    	if(status == "invalidPassword"){
    		swal("Please enter a valid password");
    	}
    </script>
  </body>
</html>