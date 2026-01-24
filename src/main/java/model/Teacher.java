package model;

import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="teacher")
public class Teacher{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long teacher_id;

	private String name;
	private String email;
	private String pass;
	private String dept;
	private String address;
	private String phone;
	
	
	@ColumnDefault("'Active'") 
	private String status;
	
	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime created_at;

	public long getTeacher_id() {
		return teacher_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String isStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_at() {
		return created_at.toString();
	}

	public void setAddress(String address) {
		// TODO Auto-generated method stub
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}

	public void setPhone(String phone) {
		// TODO Auto-generated method stub
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
	

	
}