package dao;

import java.util.List;

import model.Announcement;

public interface AnnouncementsDao {
	public void save(Announcement announcement);
	public List<Announcement> findActive();
	
    public Announcement findById(Long id);
    public List<Announcement> findAll();
    public void update(Announcement announcement);

	
	public List<Announcement> findForAdmin();
	public List<Announcement> findForTeacher();
	public List<Announcement> findForStudent();

	public void deactivate(Long id);

}
