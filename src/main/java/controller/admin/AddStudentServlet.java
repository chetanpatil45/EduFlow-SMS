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
import service.StudentServices;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CourseDao coursedao = new CourseDaoImpl();
		StudentServices studentServices = new StudentServices();
		
		Student student = new Student();
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		int sem = Integer.parseInt(req.getParameter("sem"));
		
		Course course =  coursedao.getCourseByName(req.getParameter("course"));

		student.setName(name);
		student.setEmail(email);
		student.setCourse(course);
		student.setPass(email);
		student.setSem(sem);
		student.setAddress(address);
		
		if (studentServices.addStudent(student)) {
			req.setAttribute("sucess", "Student added ");
			req.getRequestDispatcher("/admin/students.jsp").forward(req,resp);
		}else {
			req.setAttribute("error", "Student added ");
			req.getRequestDispatcher("/admin/add-students.jsp").forward(req,resp);			
		}
		
	
	}
}
