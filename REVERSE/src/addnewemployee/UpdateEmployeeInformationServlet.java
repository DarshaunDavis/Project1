package addnewemployee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Locale;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddNewEmployeeServlet
 */
@WebServlet("/updateEmployeeInformation")
public class UpdateEmployeeInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	
    	String strManagerStatus = request.getParameter("managerStatus").trim();
    	String strFirstName = request.getParameter("firstName").trim();
    	String strLastName = request.getParameter("lastName").trim();
    	String strEmployeeID = request.getParameter("employeeID").trim();
    	String strEmployeeAddress = request.getParameter("employeeAddress").trim();
    	String strEmployeeApt = request.getParameter("employeeApt").trim();
    	String strEmployeeCity = request.getParameter("employeeCity").trim();
    	String strEmployeeState = request.getParameter("employeeState").trim();
    	String strEmployeeZipCode = request.getParameter("employeeZipCode").trim();
    	String strPersonalEmail = request.getParameter("personalEmail").trim();
    	String strNormalCompanyEmail = (strFirstName + strLastName +"@reverse.com").trim();
    	String strCompanyEmail = strNormalCompanyEmail.toLowerCase(Locale.ENGLISH).trim();
    	String strPassword = GeneratePassword(12);
    	
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse?useSSL=false","newuser","password");
    		HttpSession session = request.getSession();

    		PreparedStatement pst1 = con.prepareStatement("update Employees set (managerStatus, firstName, lastName, employeeID, employeePassword) values (?, ?, ?, ?, ?) where employeeID=" + session.getAttribute("employeeID"));
    		pst1.setString(1, strManagerStatus);
    		pst1.setString(2, strFirstName);
    		pst1.setString(3, strLastName);
    		pst1.setString(4, strEmployeeID);
    		pst1.setString(5, strPassword);

    		PreparedStatement pst2 = con.prepareStatement("insert into Address (employeeAddressID, employeeAddress, employeeApt, employeeCity, employeeState, employeeZipCode) values (?, ?, ?, ?, ?, ?)");
    		pst2.setString(1, strEmployeeID);	
    		pst2.setString(2, strEmployeeAddress);
    		pst2.setString(3, strEmployeeApt);
    		pst2.setString(4, strEmployeeCity);
    		pst2.setString(5, strEmployeeState);
    		pst2.setString(6, strEmployeeZipCode);

    		PreparedStatement pst3 = con.prepareStatement("insert into Email (employeeEmailID, personalEmail, companyEmail) values(?,?,?)");
    		pst3.setString(1, strEmployeeID);
    		pst3.setString(2, strPersonalEmail);
    		pst3.setString(3, strCompanyEmail);
    		
    		int rowCount1 = pst1.executeUpdate();
    		int rowCount2 = pst2.executeUpdate();
    		int rowCount3 = pst3.executeUpdate();
    		dispatcher = request.getRequestDispatcher("addnewemployee.jsp");
    				
    		if (rowCount1 > 0) {
    			if (rowCount2 > 0) 
        			if (rowCount3 > 0) 
            			request.setAttribute("status", "success");
    					request.setAttribute("sql", "'select Employees.id, Employees.managerStatus, Employees.firstName, Employees.lastName, Employees.employeeID, Address.employeeAddress, Address.employeeApt, Address.employeeCity, Address.employeeState, Address.employeeZipCode, Email.personalEmail, Email.companyEmail from Employees, Address, Email where employeeID = employeeAddressID and employeeAddressID = employeeEmailID order by id;'"
);
    		} else {
    			request.setAttribute("status", "failed");
    		}
    		dispatcher.forward(request, response);
    	/*} catch (ClassNotFoundException e) {
    		e.printStackTrace();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}*/
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

	private String GeneratePassword(int length) {
		char[] chars = "[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()<>?]".toCharArray();
        Random r = new Random();
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < length; i++)
        {
            char c = chars[r.nextInt(chars.length)];
            sb.append(c);
        }
		return sb.toString();
	}

}
