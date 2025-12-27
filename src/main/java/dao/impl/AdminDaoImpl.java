package dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.AdminDao;
import model.Admin;
import util.HibernateUtil;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Admin login(String email, String pass) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Admin admin;
		
		try {
			Query<Admin> query = session.createQuery("from Admin where email = :email",Admin.class);			
			query.setParameter("email", email);
			
			admin = query.uniqueResult();
			if (admin != null &&admin.getPass().equals(pass)) {
				return admin;
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

	@Override
	public boolean signup(Admin admin) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Admin getAdmin(int admin_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAdminProfile(Admin admin) {
		// TODO Auto-generated method stub

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
	public void save(Admin admin) {

	    Session session = HibernateUtil.getSessionFactory().openSession();
	    Transaction tx = null;

	    try {
	        tx = session.beginTransaction();
	        session.persist(admin);
	        tx.commit();
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        throw e;
	    } finally {
	        session.close();
	    }
	}


}
