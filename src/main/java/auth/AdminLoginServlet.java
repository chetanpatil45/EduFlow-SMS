package auth;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = req.getParameter("username");
		String passWord = req.getParameter("pass");
		
		System.out.println("Username :: "+userName + " Password :: "+passWord);
		
		resp.getWriter().append("Welcome ").append("\nUsername ::"+userName).append("\nPassword :: "+passWord);		
		
	}
}
