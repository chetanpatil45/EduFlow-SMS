package service;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import model.Admin;

public class AdminService {
	AdminDao admindao = new AdminDaoImpl();
	
	public Admin loginByEmail(String email, String pass) {
		Admin admin = admindao.getAdminByEmail(email);
		
		if (admin == null) return null;
		if (admin.getPass().equals(pass)) return admin;
		
		return null;
	}
	
	public Admin loginByUsername(String username, String pass) {
		Admin admin = admindao.getAdminByEmail(username);
		
		if (admin == null) return null;
		if (admin.getPass().equals(pass)) return admin;
		
		return null;
	}
	
	public boolean signup(Admin admin) {
		if (admin == null) {
			return false;
		}
		
		return admindao.save(admin);
	}
	
	public boolean isAdminExits() {
		return admindao.adminExists();
	}
}
