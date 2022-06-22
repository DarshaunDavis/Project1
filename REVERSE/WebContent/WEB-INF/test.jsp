package addnewemployee;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class addNewEmployeeServlet
 */
@WebServlet("/addNewEmployee")
public class AddNewEmployeeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	
    	String strManagerStatus = request.getParameter("managerStatus");
    	String strFirstName = request.getParameter("firstName");
    	String strLastName = request.getParameter("lastName");
    	String strEmployeeID = request.getParameter("employeeID");
    	String strEmployeeAddress = request.getParameter("employeeAddress");
    	String strEmployeeApt = request.getParameter("employeeApt");
    	String strEmployeeCity = request.getParameter("employeeCity");
    	String strEmployeeState = request.getParameter("employeeState");
    	String strEmployeeZipCode = request.getParameter("employeeZipCode");
    	String strPersonalEmail = request.getParameter("personalEmail");
    	String strNormalCompanyEmail = (strFirstName + strLastName +"@reverse.com");
    	String strCompanyEmail = strNormalCompanyEmail.toLowerCase(Locale.ENGLISH);
    	String strPassword = GeneratePassword(12);
    	
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse/","darshaun","upJgJDj7GR");
    		
    		
    		PreparedStatement pst = con.prepareStatement("insert into Profile(managerStatus, firstName, lastName, employeeID, employeeAddress, employeeApt, employeeCity, employeeState, employeeZipCode, personalEmail, companyEmail, employeePassword) values(?,?,?,?,?,?,?,?,?,?,?,?) ");
    		pst.setString(1, strManagerStatus);
    		pst.setString(2, strFirstName);
    		pst.setString(3, strLastName);
    		pst.setString(4, strEmployeeID);	
    		pst.setString(5, strEmployeeAddress);
    		pst.setString(6, strEmployeeApt);
    		pst.setString(7, strEmployeeCity);
    		pst.setString(8, strEmployeeState);
    		pst.setString(9, strPersonalEmail);
    		pst.setString(10, strEmployeeZipCode);
    		pst.setString(11, strCompanyEmail);
    		pst.setString(12, strPassword);
    		
    		int rowCount = pst.executeUpdate();
    		dispatcher = request.getRequestDispatcher("/WEB-INF/addnewemployee.jsp");
    				
    		if (rowCount > 0) {
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
