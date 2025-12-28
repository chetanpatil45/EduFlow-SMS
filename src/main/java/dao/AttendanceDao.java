package dao;

import java.util.List;

import model.Student;

public interface AttendanceDao {
	public long getTotalClasses(Long studentId, Long courseId);

	public long getPresentCount(Long studentId, Long courseId);

	public double getAttendancePercentage(Long studentId, Long courseId);

	public List<Student> getDefaulters(Long courseId, double minPercentage);

}
