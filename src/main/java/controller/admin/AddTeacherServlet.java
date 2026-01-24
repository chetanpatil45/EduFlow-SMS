package controller.admin;

import java.io.IOException;

import dao.CourseDao;
import dao.impl.CourseDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Student;
import model.Teacher;
import service.StudentServices;
import service.TeacherServices;

@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		TeacherServices services = new TeacherServices();
		Teacher teacher = new Teacher();
		
		String name = req.getParameter("fullName");
		String email = req.getParameter("email");
		String dept = req.getParameter("department");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");

		teacher.setName(name);
		teacher.setEmail(email);
		teacher.setPass(email);
		teacher.setAddress(address);
		teacher.setDept(dept);
		teacher.setPhone(phone);
		
		if (services.addTeacher(teacher)) {
			req.setAttribute("sucess", "Teacher added ");
			req.getRequestDispatcher("/admin/teachers.jsp").forward(req,resp);
		}else {
			req.setAttribute("error", "Failed to add");
			req.getRequestDispatcher("/admin/add-teachers.jsp").forward(req,resp);			
		}
		
	
	}
}
