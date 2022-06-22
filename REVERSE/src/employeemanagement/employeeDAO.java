package employeemanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.jni.User;

public class employeeDAO {
	
	
	//variable for connection
	private String jdbcURL = "jdbc:mysql://localhost:3306/reverse?useSSL=false";
	private String jdbcUsername = "newuser";
	private String jdbcPassword = "^!6NPTN%c*vO";
	Connection con = null;
	PreparedStatement pst = null;
	//Employee Queries
	//Allows employee to submit reimbursements		
	private static final String SUBMIT_REIMBURSEMENT = "INSERT INTO Expenses" + " (expenseID, employeeID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus) VALUES " + "(?,?,?,?,?,?,?,?);";
	
	//Allows employee to view pending reimbursements
	private static final String VIEW_PENDING_REIMBURSEMENT_EMPLOYEE = "SELECT expenseID, employeeID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus from Expenses where employeeID = ? AND expenseStatus = ?";
	
	//Allows employee to view resolved reimbursements
	private static final String VIEW_RESOLVED_REIMBURSEMENT_EMPLOYEE = "SELECT expenseID, employeeID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus from Expenses where employeeID = ? AND expenseStatus = ?";
	//Allows employee to view their profile
	private static final String SELECT_USER_BY_ID = "SELECT * from Profile where employeeID = ?";
	//Allows employee to update their profile
	private static final String UPDATE_EMPLOYEE_PROFILE = "UPDATE Profile where employeeID = ? SET employeeAddress = ?, employeeApt = ?, employeeCity = ?, employeeState = ?, employeeZipCode = ?, personalEmail = ?;";
	
	//Allows employee to reset their password
	private static final String UPDATE_EMPLOYEE_PASSWORD = "UPDATE Profile where employeeID = ? SET employeePassword;";
		
	//Manager queries
	//Allows manager view pending reimbursements
	private static final String VIEW_PENDING_REIMBURSEMENT_MANAGER = "SELECT expenseID, employeeID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus from Expenses where expenseStatus = ?";
	
	//Allows manager to approve reimbursements
	private static final String UPDATE_REIMBURSEMENT_STATUS_APPROVE = "UPDATE Expenses SET expenseStatus = ?;";
	
	//Allows manager to deny reimbursements
	private static final String UPDATE_REIMBURSEMENT_STATUS_DENY = "UPDATE Expenses SET expenseStatus = ?;";
	
	//Allows manager to view resolved reimbursements
	private static final String VIEW_RESOLVED_REIMBURSEMENT_MANAGER = "SELECT expenseID, employeeID, expenseDate, expenseAmount, expensePurpose, expenseCategory, expenseReceipt, expenseStatus from Expenses where expenseStatus = ?";
	
	//Allows manager to view all employees
	private static final String SELECT_ALL_USERS = "SELECT * FROM Profile";
	
	
	//Allows manager to add new employees
	private static final String INSERT_USERS_SQL = "INSERT INTO Profile" + " (managerStatus, firstName, lastName, employeeID, employeeAddress, employeeApt, employeeCity, employeeState, employeeZipCode, personalEmail, companyEmail, employeePassword) VALUES " + "(?,?,?,?,?,?,?,?,?,?,?,?);";
	
	//Allows manager to delete old employees
	private static final String DELETE_USERS_SQL = "DELETE from Profile where id = ?";
	
	protected Connection getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
		catch (SQLException e){
			
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	//Employee Queries
	//Allows employee to submit reimbursements

	
	//Allows employee to view pending reimbursements

	
	//Allows employee to view resolved reimbursements


	//Allows employee to view their profile

	
	//Allows employee to update their profile
	
	
	//Allows employee to reset their password
	
		
	//Manager queries
	//Allows manager view pending reimbursements
	
	
	//Allows manager to approve reimbursements
	
	
	//Allows manager to deny reimbursements
	
	
	//Allows manager to view resolved reimbursements
	
	
	//Allows manager to view all employees
	
	
	//Allows manager to add new employees
	public void addNewEmployee(User user) throws SQLException {
		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(INSERT_USERS_SQL)){
			//Pst.setString(1, user.)
					
				}
	}
	
	
	//Allows manager to delete old employees
	
}

	