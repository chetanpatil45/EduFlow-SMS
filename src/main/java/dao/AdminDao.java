package dao;

import model.Admin;

public interface AdminDao {
	public Admin getAdminByEmail(String email);
	public Admin getAdminByUsername(String username);
	public boolean save(Admin admin);
	
	public boolean adminExists();
	
	public Admin getAdmin(int admin_id);
	public void updateAdminProfile(Admin admin);
	
}
