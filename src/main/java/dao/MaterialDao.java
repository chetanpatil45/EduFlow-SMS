package dao;

import java.util.List;

import model.Material;

public interface MaterialDao {
	public void save(Material material);

	public List<Material> findByTeacher(Long teacherId);

	public List<Material> findByCourse(Long courseId);

	public Material findById(Long materialId);

	void deactivate(Long materialId);
}
