package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.AnnouncementsDao;
import model.Announcements;
import util.HibernateUtil;

public class AnnouncementsDaoImpl implements AnnouncementsDao{

	@Override
	public void save(Announcements announcement) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		session.persist(announcement);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Announcements> findActive() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcements> list = session.createQuery("from Announcement where status = true",Announcements.class).list();
		
		session.close();
		return list;
	}


	@Override
	public Announcements findById(Long id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Announcements announcement = session.find(Announcements.class, id);
		
		session.close();
		return announcement;
	}

	@Override
	public List<Announcements> findAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcements> list = session.createQuery("from Announcement",Announcements.class).list();
		
		session.close();
		return list;
	}

	@Override
	public void update(Announcements announcement) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.merge(announcement);
		trx.commit();
		session.close();
	}

	@Override
	public List<Announcements> findForAdmin() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcements> list = session.createQuery("from Announcement where targetRole = 'ADMIN'",Announcements.class).list();
		
		session.close();
		return list;
	}

	@Override
	public List<Announcements> findForTeacher() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcements> list = session.createQuery("from Announcement where targetRole = 'TEACHER'",Announcements.class).list();
		
		session.close();
		return list;
	}

	@Override
	public List<Announcements> findForStudent() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcements> list = session.createQuery("from Announcement where targetRole = 'STUDENT'",Announcements.class).list();
		
		session.close();  
		return list;
	}

	@Override
	public void deactivate(Long id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		Announcements announcement = session.find(Announcements.class, id);
		session.remove(announcement);
		
		trx.commit();
		session.close();
	}

}
