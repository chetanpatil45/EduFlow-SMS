package dao;

import model.Admin;

public interface AdminDao {
	public Admin login(String email, String pass);
	public boolean signup(Admin admin);
	public boolean adminExists();
	public void save(Admin admin);
	
	public Admin getAdmin(int admin_id);
	public void updateAdminProfile(Admin admin);
	
}
