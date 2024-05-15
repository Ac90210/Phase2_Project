package com.entities;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="Student")
public class Student {

	@Id
	@GeneratedValue
	private int studentID;
	
	@ManyToOne(targetEntity = Class.class, cascade = CascadeType.ALL)
	@JoinColumn(name="classID")
	private Class classtbl;
	

	public Class getClasstbl() {
		return classtbl;
	}

	public void setClasstbl(Class classtbl) {
		this.classtbl = classtbl;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name="studentName")
	private String studentName;
	
    private String gender;
	
	private String email;
	
	private String address;
	
	private String location;
	
	
	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

}

