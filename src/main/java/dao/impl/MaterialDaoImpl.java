package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.MaterialDao;
import model.Material;
import util.HibernateUtil;

public class MaterialDaoImpl implements MaterialDao {

	@Override
	public void save(Material material) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		
		session.persist(material);
		trx.commit();
		session.close();
	}

	@Override
	public List<Material> findByTeacher(Long teacherId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Material> query = session.createQuery("from Material where teacherId = :id",Material.class);
		
		query.setParameter("id", teacherId);
		List<Material> list = query.list();
		
		session.close();
		return list;		
	}

	@Override
	public List<Material> findByCourse(Long courseId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query<Material> query = session.createQuery("from Material where courseId = :id",Material.class);
		
		query.setParameter("id", courseId);
		List<Material> list = query.list();
		
		session.close();
		return list;
	}

	@Override
	public Material findById(Long materialId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Material material = session.find(Material.class, materialId);
		
		session.close();
		return material;
	}

	@Override
	public void deactivate(Long materialId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = session.beginTransaction();
		Material material = session.find(Material.class, materialId);
		
		session.remove(material);
		trx.commit();
		
		session.close();
	}

}
