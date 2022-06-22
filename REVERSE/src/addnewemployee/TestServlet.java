package addnewemployee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/connectionTest")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	
    	PrintWriter out = response.getWriter();
		out.print("Button click is working!");
    	
    	String strLoginCompanyEmail = request.getParameter("companyEmail");
    	String strLoginPassword = request.getParameter("employeePassword");
    	
    	
    	PrintWriter out1 = response.getWriter();
    	out1.print(strLoginCompanyEmail);
    	out1.print(strLoginPassword);
		out1.print("Data collection is working!");
    	HttpSession session = request.getSession();
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	PreparedStatement pst = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
    	
		
    	Statement statement = null;
        try {
           ArrayList<ArrayList<String>> outer = new ArrayList<ArrayList<String>>();
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reverse?useSSL=false","user","password");
           statement = (Statement) con.createStatement();
           String sql;
           sql = "select *from Employees";
           ResultSet resultSet = statement.executeQuery(sql);
           while (resultSet.next()) {
              ArrayList<String> inner = new ArrayList<String>();
              inner.add(resultSet.getString("id").toString());
              inner.add(resultSet.getString("managerStatus"));
              inner.add(resultSet.getString("firstName"));
              inner.add(resultSet.getString("lastName"));
              inner.add(resultSet.getString("employeeID"));
              outer.add(inner);
           }
           System.out.println("The name are as follows:");
           for (int i = 0; i < outer.size(); i++) {
        	   System.out.println(outer.get(i));
        	   out.println("<td>" + outer.get(i) + "</td>");
        	   if (i>0 && i%5==0) {
                   out.println("</tr><tr>");
        	   }
           }
        } catch (Exception e) {
           e.printStackTrace();
        }
     }
}
