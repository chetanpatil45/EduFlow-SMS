package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.CourseDao;
import model.Course;
import util.HibernateUtil;

public class CourseDaoImpl implements CourseDao{

	@Override
	public void save(Course course) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.persist(course);
		trx.commit();
		
		session.close();
	}

	@Override
	public void update(Course course) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.merge(course);
		trx.commit();
		
		session.close();
	}

	@Override
	public void remove(long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		Course course = session.find(Course.class, id);
		
		session.remove(course);
		trx.commit();
			
		session.close();
	}

	@Override
	public Course getCourse(long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Course course = session.find(Course.class, id);
		
		session.close();
		return course;
	}

	@Override
	public List<Course> getAllCourses() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Course> list = session.createQuery("from Course",Course.class).list();
		
		session.close();
		return list;
	}
	
	@Override
	public Course getCourseByName(String course_name){
		Session session = HibernateUtil.getSessionFactory().openSession();
	    Course course = null;

	    try {
	        Query<Course> query = session.createQuery(
	            "FROM Course c WHERE c.name = :name", Course.class
	        );
	        query.setParameter("name", course_name);

	        course = query.uniqueResult(); // returns null if not found
	    } finally {
	        session.close();
	    }

	    return course;
	}

}
