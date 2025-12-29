package dao;

import java.util.List;

import model.Course;

public interface CourseDao {
	public void save(Course course);
	public void update (Course course);
	public void remove(long id);
	public Course getCourse(long id);
	
	public List<Course> getAllCourses();
	
	
}
