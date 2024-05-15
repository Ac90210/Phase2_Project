package com.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Subject_Class_Teacher_Mapping")
public class Subject_Class_Teacher_Mapping {

	    @Id
	    @GeneratedValue
	    private int id;

	    @ManyToOne
	    @JoinColumn(name = "subjectID")
	    private Subject Subject;

	    @ManyToOne
	    @JoinColumn(name = "classID")
	    private int classID;

	    @ManyToOne
	    @JoinColumn(name = "teacherID")
	    private Teacher teacher;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public Subject getSubject() {
			return Subject;
		}

		public void setSubject(Subject subject) {
			Subject = subject;
		}

	
		public int getClassID() {
			return classID;
		}

		public void setClassID(int classID) {
			this.classID = classID;
		}

		public Teacher getTeacher() {
			return teacher;
		}

		public void setTeacher(Teacher teacher) {
			this.teacher = teacher;
		}
}
