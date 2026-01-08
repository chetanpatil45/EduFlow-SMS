package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.StudentDao;

import model.Student;
import model.Teacher;
import util.HibernateUtil;

public class StudentDaoImpl implements StudentDao{

	@Override
	public boolean saveStudent(Student student) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx;
		
		student.setRoll(getTotalStudentCount()+1);
		
		try {
			trx = session.beginTransaction();
			session.persist(student);
			trx.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;		
		}finally {
			session.close();			
		}
		
	}

	@Override
	public Student getStudentByEmail(String email) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Student> query = session.createQuery("from student where email = :email",Student.class);
		query.setParameter("email", email);
		
		
		Student student = query.uniqueResult();
		session.close();
		return student;
	}

	@Override
	public Student getStudentById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Student student = session.find(Student.class, id);
		session.close();
		
		return student;
	}

	@Override
	public List<Student> getAllStudent() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Student> students = session.createQuery("from student order by createdAt desc",Student.class).list();
		
		session.close();
		return students;
	}

	@Override
	public void updateStudent(Student student) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		session.merge(student);
		trx.commit();
		session.close();
		
	}

	@Override
	public void updateStudentStatus(int stud_id, String status) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		Query<Student> query = session.createQuery("update student set status = :status where id = :id",Student.class);
		
		query.setParameter("status", status);
        query.setParameter("id", stud_id);
        query.executeUpdate();

        trx.commit();
        session.close();
				
	}

	@Override
	public void deleteStudent(int stud_id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		Student student = session.find(Student.class, stud_id);
		
		if (student != null) {
			session.remove(student);
		}else {
			
		}
		
		trx.commit();
		session.close();
	
	}

	@Override
	public long getTotalStudentCount() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Long count = session.createQuery("select count(s.stud_id) from student s",Long.class).uniqueResult();
		
		session.close();
		return count;
				
	}

	@Override
	public List<Student> getStudentsByClass(String course, int semester) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Student> query = session.createQuery("from student where course = :course and sem = :semester",Student.class);
		query.setParameter("course", course);
		query.setParameter("semester", semester);
		
		List<Student> students = query.list();
		session.close();
		return students;
	}

	@Override
	public List<Student> getRecentStudents(int limit) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Student> query = session.createQuery("from student order by createdAt desc",Student.class);
		
		query.setMaxResults(limit);
		
		List<Student> students = query.list();
		session.close();
		return students;
	}
	
	@Override
	public Student login(String email, String pass) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Student student;
		
		try {
			Query<Student> query = session.createQuery("from Student where email = :email",Student.class);
			query.setParameter("email", email);
			
			student = query.uniqueResult();
			if (student != null && student.getPass().equals(pass)) {
				return student;
			}
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			session.close();
		}
		
		return null;
	}
	
	public long getRoll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Long count = session.createQuery("SELECT COUNT(*) FROM student WHERE course_id = :course_id",Long.class).uniqueResult();
		
		session.close();
		return count;
	}

	
	
}

/*
 * SELECT 
    c.course_name,
    COUNT(s.stud_id) AS total_students
FROM course c
LEFT JOIN student s ON s.course_id = c.course_id
WHERE s.status = 'ACTIVE'
GROUP BY c.course_name;

 * */
