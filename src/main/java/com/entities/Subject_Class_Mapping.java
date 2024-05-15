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
	    private int subjectID;

	    @ManyToOne
	    @JoinColumn(name = "classID")
	    private int classID;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getSubjectID() {
			return subjectID;
		}

		public void setSubjectID(int subjectID) {
			this.subjectID = subjectID;
		}

		public int getClassID() {
			return classID;
		}

		public void setClassID(int classID) {
			this.classID = classID;
		}

		
}
