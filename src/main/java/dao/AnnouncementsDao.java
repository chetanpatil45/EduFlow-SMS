package dao;

import java.util.List;

import model.Announcements;

public interface AnnouncementsDao {
	public void save(Announcements announcement);
	public List<Announcements> findActive();
	
    public Announcements findById(Long id);
    public List<Announcements> findAll();
    public void update(Announcements announcement);

	
	public List<Announcements> findForAdmin();
	public List<Announcements> findForTeacher();
	public List<Announcements> findForStudent();

	public void deactivate(Long id);

}
