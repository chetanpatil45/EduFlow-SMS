package dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.AdminDao;
import model.Admin;
import util.HibernateUtil;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Admin getAdminByEmail(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Admin admin;
		
		try {
			Query<Admin> query = session.createQuery("from Admin where email = :email",Admin.class);			
			query.setParameter("email", email);
			
			admin = query.uniqueResult();
			return admin;	
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		finally {
			session.close();
		}
	}
	
	@Override
	public Admin getAdmin(int admin_id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Admin admin = session.find(Admin.class, admin_id);
		
		session.close();
		return admin;
	}

	@Override
	public void updateAdminProfile(Admin admin) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		session.merge(admin);
		transaction.commit();
		
		session.close();
	}

	@Override
	public boolean adminExists() {

	    Session session = HibernateUtil.getSessionFactory().openSession();
	    try {
	        Long count = session.createQuery(
	                "select count(a.id) from Admin a", Long.class)
	                .uniqueResult();

	        return count != null && count > 0;
	    } finally {
	        session.close();
	    }
	}


	@Override
	public boolean save(Admin admin) {
	    Session session = HibernateUtil.getSessionFactory().openSession();
	    Transaction tx = null;

	    try {
	        tx = session.beginTransaction();
	        session.persist(admin);
	        tx.commit();
	        return true;
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        return false;	        
	    } finally {
	        session.close();
	    }
	}
	
	@Override
	public Admin getAdminByUsername(String username) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Admin admin;
		
		try {
			Query<Admin> query = session.createQuery("from Admin where username = :username",Admin.class);			
			query.setParameter("email", username);
			
			admin = query.uniqueResult();
			return admin;	
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		finally {
			session.close();
		}
	}


}
