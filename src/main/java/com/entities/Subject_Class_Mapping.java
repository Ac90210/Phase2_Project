package com.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Subject_Class_Mapping")
public class Subject_Class_Mapping {

	    @Id
	    @GeneratedValue
	    private int id;

	    @ManyToOne
	    @JoinColumn(name = "subjectID")
	    private Subject subject;

	    @ManyToOne
	    @JoinColumn(name = "classID")
	    private Class class1;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public Subject getSubject() {
			return subject;
		}

		public void setSubject(Subject subject) {
			this.subject = subject;
		}

		public Class getClass1() {
			return class1;
		}

		public void setClass1(Class class1) {
			this.class1 = class1;
		}

		

		
}
