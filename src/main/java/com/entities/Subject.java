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
@Table(name="Subject_Class_Mapping")
public class Subject {
	
	@Id
	@GeneratedValue
	private int subjectID;
	
	 @ManyToMany(targetEntity=Class.class, cascade=CascadeType.ALL)
		
		@JoinTable(name="Subject_Class_Mapping", 
		joinColumns= {@JoinColumn(name="subjectID")},
		inverseJoinColumns= {@JoinColumn(name="classID")})
	    
		private List<Class>  cls;
	
	public List<Class> getCls() {
		return cls;
	}


	public void setCls(List<Class> cls) {
		this.cls = cls;
	}

	@Column(name="subjectName")
	private String subjectName;
	
	
	public int getSubjectID() {
		return subjectID;
	}


	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	
	

	

}
