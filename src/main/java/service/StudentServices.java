package service;

import dao.StudentDao;
import dao.impl.StudentDaoImpl;
import model.Student;

public class StudentServices {
	
	private StudentDao studentdao = new StudentDaoImpl();
	
	public boolean addStudent(Student student) {
		if(student == null) return false;
//		return studentdao.saveStudent(student);
		return true;
	}
}
