package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.TeacherDao;
import model.Teacher;
import util.HibernateUtil;

public class TeacherDaoImpl implements TeacherDao{

	@Override
	public void saveTeacher(Teacher teacher) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.persist(teacher);
		trx.commit();
		session.close();
	}

	@Override
	public Teacher getTeacherByEmail(String email) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Teacher> query = session.createQuery("from teacher where email = :email", Teacher.class);
		query.setParameter("email", email);
		
		Teacher teacher = query.uniqueResult();
		return teacher;
	}

	@Override
	public Teacher getTeacherById(int teacher_id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Teacher teacher = session.find(Teacher.class, teacher_id);
		session.close();
		
		return teacher;
	}

	@Override
	public List<Teacher> getAllTeacher() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Teacher> teachers = session.createQuery("from teachers",Teacher.class).list();
		
		session.close();
		return teachers;
	}

	@Override
	public void updateTeacherStatus(int teacherId, String status) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		Query<Teacher> query = session.createQuery("update teacher set status = :status where teacher_id = :teacher_id",Teacher.class);
		query.setParameter("status", status);
		query.setParameter("teacher_id", teacherId);
		query.executeUpdate();
		
		transaction.commit();
		session.close();
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.merge(teacher);
		trx.commit();
		
		session.close();
		
	}

	@Override
	public void deleteTeacher(int teacher_id) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		Teacher teacher = session.find(Teacher.class, teacher_id);
		
		if (teacher != null) {
			session.remove(teacher);			
		}
		
		trx.commit();
		session.close();
	}

}
