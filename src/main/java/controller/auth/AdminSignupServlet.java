package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import service.AdminService;

import java.io.IOException;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;

/**
 * Servlet implementation class AdminSignupServlet
 */
@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminService service = new AdminService();

		if (service.isAdminExits()) {
			// Admin already created → block signup
			request.getRequestDispatcher("admin/admin-exists.jsp").forward(request, response);

		} else {

			// First-time setup → allow signup page
			request.getRequestDispatcher("/WEB-INF/admin/signup.jsp").forward(request, response);
		}
		
//		request.getRequestDispatcher("/WEB-INF/admin/signup.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String address = request.getParameter("address");
		
		
		AdminService service = new AdminService();
		HttpSession session = request.getSession(true);
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setEmail(email);
		admin.setName(name);
		admin.setPass(pass);
		admin.setAddress(address);
		
		if (service.signup(admin)) {
			request.setAttribute("sucess", "Account created");
			request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
		}
		else {
			request.setAttribute("error", "Failed to create an Account !");
			request.getRequestDispatcher("/WEB-INF/admin/signup.jsp").forward(request, response);
//			request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
		}
	}

}
