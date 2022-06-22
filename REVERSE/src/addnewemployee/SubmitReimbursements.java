package addnewemployee;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddNewEmployeeServlet
 */
@WebServlet("/submitReimbursements")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class SubmitReimbursements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
    	Connection con = null;
    	InputStream inputStream = null;
    	
		String strExpenseID = (String)session.getAttribute("employeeID");
    	String strUnformattedDate = request.getParameter("expenseDate");
    	DateFormat formatter = new SimpleDateFormat("yyyy-MM-DD"); 
    	Date date1 = null;
		try {
			date1 = (Date)formatter.parse(strUnformattedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	SimpleDateFormat newFormat = new SimpleDateFormat("MM-dd-yyyy");
    	String strExpenseDate = newFormat.format(date1);
    	String strExpenseAmount = request.getParameter("expenseAmount").trim();
    	String strExpensePurpose = request.getParameter("expensePurpose").trim();
    	String strExpenseCategory = request.getParameter("expenseCategory").trim();
    	Part filePart = request.getPart("expenseReceipt");
    	if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
    	//String strExpenseReceipt = request.getParameter("expenseReceipt").trim();
    	String strExpenseStatus = ("Pending");
    	String strUnformattedSubmissionDate = GenerateSubmissionDate();
    	
    	DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-DD"); 
    	Date date2 = null;
		try {
			date2 = (Date)formatter2.parse(strUnformattedSubmissionDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	SimpleDateFormat newFormat2 = new SimpleDateFormat("MM-dd-yyyy");
    	String strSubmissionDate = newFormat2.format(date2);
    	
		try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse?useSSL=false","newuser","password");
    		

    		PreparedStatement pst1 = con.prepareStatement("insert into testExpenses (expenseID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus, submissionDate) values ( ?, ?, ?, ?, ?, ?, ?, ?)");
    		pst1.setString(1, strExpenseID);
    		pst1.setString(2, strExpenseDate);
    		pst1.setString(3, strExpenseAmount);
    		pst1.setString(4, strExpensePurpose);
    		pst1.setString(5, strExpenseCategory);
    		pst1.setBlob(6, inputStream);
    		pst1.setString(7, strExpenseStatus);
    		pst1.setString(8, strSubmissionDate);
    		
    		int rowCount1 = pst1.executeUpdate();
    		dispatcher = request.getRequestDispatcher("sreimbursement.jsp");
    				
    		if (rowCount1 > 0) {
    			request.setAttribute("status", "success");
    		} else {
    			request.setAttribute("status", "failed");
    		}
    		dispatcher.forward(request, response);
    	}catch (Exception e){
    		e.printStackTrace();
    	}finally {
    		try {
    			con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	}
    	
	}
	
	private String GenerateSubmissionDate() {
		LocalDate localDate = java.time.LocalDate.now();
		String currentDate = localDate.toString();
		return currentDate;
		
		
	}

}
