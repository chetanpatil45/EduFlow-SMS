package dao;
import com.sun.tools.classfile.StackMapTable_attribute.verification_type_info;

import model.Student;

public class StudentDao {
	public static void saveStudent(Student student) {}
	public static void getStudentByEmail(String email) {}
	public static void getStudentById(int id) {}
	public static void getAllStudent() {}
	public static void updateStudent(Student student) {}
	public static void updateStudentStatus(String status) {}
	public static void deleteStudent(String status) {}
	
	//analytical
	public static void getTotalStudentCount() {}
	public static void getStudentsByClass(String course, int semester) {}
	public static void getRecentStudents(int limit) {}
	
}
