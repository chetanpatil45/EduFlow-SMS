package dao;

import java.util.List;
import model.Teacher;

public interface TeacherDao {
	
//	login
	public Teacher login(String email, String pass);
	
//	create
	public void saveTeacher(Teacher teacher);
	
//	get
	public Teacher getTeacherByEmail(String email);
	public Teacher getTeacherById(int teacher_id);
	public List<Teacher> getAllTeacher();
	
//	update
	public void updateTeacherStatus(int teacherId, String status);
	public void updateTeacher(Teacher teacher);
	
	
//	delete
	public void deleteTeacher(int teacher_id);
}
