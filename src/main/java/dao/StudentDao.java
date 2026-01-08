package dao;
import java.util.List;

import model.Student;

public interface StudentDao {
//	login
	public Student login(String email, String pass);
	
//	CREATE
	public boolean saveStudent(Student student);
	
//	Get students
	public Student getStudentByEmail(String email);
	public Student getStudentById(int id);
	public List<Student> getAllStudent();
	
//	UPDATE student
	public void updateStudent(Student student);
	public void updateStudentStatus(int stud_id, String status);
	
// 	DELETE student
	public void deleteStudent(int stud_id);
	
	//analytical
	public long getTotalStudentCount();
	public List<Student> getStudentsByClass(String course, int semester);
	public List<Student> getRecentStudents(int limit);
	
}
