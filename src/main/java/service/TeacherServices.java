package service;

import dao.StudentDao;
import dao.TeacherDao;
import dao.impl.StudentDaoImpl;
import dao.impl.TeacherDaoImpl;
import model.Student;
import model.Teacher;

public class TeacherServices {
	TeacherDao teacherDao = new TeacherDaoImpl();

	public boolean addTeacher(Teacher teacher) {
		if (teacher == null)
			return false;
//		teacherDao.saveTeacher(teacher);
		return true;
	}
}
