package addnewemployee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class Login
 */
@WebServlet("/loginForm")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	
    	String strLoginCompanyEmail = request.getParameter("companyEmail");
    	String strLoginPassword = request.getParameter("employeePassword");
    	HttpSession session = request.getSession();
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	
    	if (strLoginCompanyEmail == null || strLoginCompanyEmail.equals("")) {
    		request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
    	}
    	if (strLoginPassword == null || strLoginPassword.equals("")) {
    		request.setAttribute("status", "invalidPassword");
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
    	}
    	try {
    		
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse?useSSL=false","newuser","password");
    		
    		PreparedStatement pst = con.prepareStatement("select * from Profile where companyEmail = ? and employeePassword = ?");
    		pst.setString(1, strLoginCompanyEmail);
    		pst.setString(2, strLoginPassword);
    		
    		ResultSet rs = pst.executeQuery();
    		if (rs.next()) {
    			session.setAttribute("manager", rs.getString("managerStatus"));
    			session.setAttribute("firstName", rs.getString("firstName"));
    			session.setAttribute("lastName", rs.getString("lastName"));
    			session.setAttribute("employeeID", rs.getString("employeeID"));
    			dispatcher = request.getRequestDispatcher("mdashboard.jsp");
    		} 
    		else {
    			request.setAttribute("status","error");
    			dispatcher = request.getRequestDispatcher("index.jsp");
    		}
    		dispatcher.forward(request, response);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}    	
	}

}
