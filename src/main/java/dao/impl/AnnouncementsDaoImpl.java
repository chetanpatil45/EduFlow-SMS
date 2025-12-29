package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.AnnouncementsDao;
import model.Announcement;
import util.HibernateUtil;

public class AnnouncementsDaoImpl implements AnnouncementsDao{

	@Override
	public void save(Announcement announcement) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		session.persist(announcement);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Announcement> findActive() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcement> list = session.createQuery("from Announcement where status = true",Announcement.class).list();
		
		session.close();
		return list;
	}


	@Override
	public Announcement findById(Long id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Announcement announcement = session.find(Announcement.class, id);
		
		session.close();
		return announcement;
	}

	@Override
	public List<Announcement> findAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcement> list = session.createQuery("from Announcement",Announcement.class).list();
		
		session.close();
		return list;
	}

	@Override
	public void update(Announcement announcement) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.merge(announcement);
		trx.commit();
		session.close();
	}

	@Override
	public List<Announcement> findForAdmin() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcement> list = session.createQuery("from Announcement where targetRole = 'ADMIN'",Announcement.class).list();
		
		session.close();
		return list;
	}

	@Override
	public List<Announcement> findForTeacher() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcement> list = session.createQuery("from Announcement where targetRole = 'TEACHER'",Announcement.class).list();
		
		session.close();
		return list;
	}

	@Override
	public List<Announcement> findForStudent() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Announcement> list = session.createQuery("from Announcement where targetRole = 'STUDENT'",Announcement.class).list();
		
		session.close();  
		return list;
	}

	@Override
	public void deactivate(Long id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		Announcement announcement = session.find(Announcement.class, id);
		session.remove(announcement);
		
		trx.commit();
		session.close();
	}

}
