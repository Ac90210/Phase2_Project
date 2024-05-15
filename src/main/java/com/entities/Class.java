package com.entities;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="Class")
public class Class {
	
	@Id
	@GeneratedValue
	private int classID;
	
    @ManyToMany(targetEntity=Subject.class, cascade=CascadeType.ALL)
	
	@JoinTable(name="Subject_Class_Mapping", 
	joinColumns= {@JoinColumn(name="classID")},
	inverseJoinColumns= {@JoinColumn(name="subjectID")})
    
	private List<Subject>  sub;
	
	
	public List<Subject> getSub() {
		return sub;
	}


	public void setSub(List<Subject> sub) {
		this.sub = sub;
	}

	@Column(name="className")
	private String className;
	
	
	public int getClassID() {
		return classID;
	}

	
	

	public void setClassID(int classID) {
		this.classID = classID;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	
}
