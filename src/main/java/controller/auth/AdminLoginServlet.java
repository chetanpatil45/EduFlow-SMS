package controller.auth;

import java.io.IOException;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import service.AdminService;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = req.getParameter("username");
		String passWord = req.getParameter("pass");
		
		System.out.println("Username :: "+userName + " Password :: "+passWord);
		
//		resp.getWriter().append("Welcome ").append("\nUsername ::"+userName).append("\nPassword :: "+passWord);		
		
		AdminService service = new AdminService();
		HttpSession session = req.getSession(true);
		Admin adminEmail = service.loginByEmail(userName, passWord);
		Admin adminUsername = service.loginByUsername(userName, passWord);
		
		if (adminEmail != null) {
			session.setAttribute("admin",adminEmail);
			resp.sendRedirect(req.getContextPath()+"/admin/dashboard.jsp");
		}
		else if (adminUsername != null) {
			session.setAttribute("admin",adminUsername);
			resp.sendRedirect(req.getContextPath()+"/admin/dashboard.jsp");
		}
		else {
			req.setAttribute("error", "Invalid Credentials");
		    req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
		}
		
	}
}
