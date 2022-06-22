package addnewemployee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewEmployeeEmail
 */
@WebServlet("/NewEmployeeEmail")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int optvalue = 0;
		HttpSession mySession = request.getSession();
		
		/*if(email = null || !email.equals("")) {
			//Send OTP
			Random rand = new Random
			optvalue = randnextInt(1255650);
			
			String to = email;
			
			Properties props = new Properties
		}*/
		doGet(request, response);
	}

}
