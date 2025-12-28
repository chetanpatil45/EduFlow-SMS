package dao;

import java.util.List;

import model.Announcement;

public interface AnnouncementsDao {
	public void save(Announcement announcement);
	public List<Announcement> findActive();
	public List<Announcement> findByCourse(Long courseId);
	
    public Announcement findById(Long id);
    public List<Announcement> findAll();
    public void update(Announcement announcement);

	
	public List<Announcement> findForAdmin();
	public List<Announcement> findForTeacher(Long teacherId);
	public List<Announcement> findForStudent(Long studentId);

	public void deactivate(Long id);

}
