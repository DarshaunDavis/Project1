package addnewemployee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchReimbursementsServlet
 */
@WebServlet("/searchEmployees")
public class SearchReimbursementsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    	String strEmployeeSearch = request.getParameter("submitSearch").trim();
    	
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse?useSSL=false","newuser","password");
    		HttpSession session = request.getSession();
    		
    		if (strEmployeeSearch.equalsIgnoreCase("") || strEmployeeSearch == null) {
	    		dispatcher = request.getRequestDispatcher("mviewprofile.jsp");
	    		request.setAttribute("searchID", null);
    		}
    		else {
        		dispatcher = request.getRequestDispatcher("mviewprofile.jsp");
        		request.setAttribute("sql", "search");
        		request.setAttribute("searchID", "search");
    			
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

}
