package com.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connections.DbConnection;
import com.entities.Student;

import jakarta.persistence.TypedQuery;

public class StudentService {

	SessionFactory sfact = null;
	
	public StudentService()
	{
		sfact = DbConnection.getConnection();
	}
	
	public void AddStudent(Student std)
	{
		Session session = sfact.openSession();
		Transaction trans = session.beginTransaction();
		session.persist(std);
		trans.commit();
	}
	
	public List<Student>  ShowAll()
	{
		Session session = sfact.openSession();
		TypedQuery qry = session.createQuery("from Student");
		List<Student> stdlist = qry.getResultList();
		return stdlist;
	}
	
	public Student SearchStudent(int studentID)
	{
		Session session = sfact.openSession();
		Student std = session.get(Student.class, studentID);
		return std;
	}

	public Student UserCheck(String uname, String pwd)
	{
		Student std = null;
		Session session = sfact.openSession();
		TypedQuery  qry = session.createQuery("from Student where email=:uname and pswd=:pwd");
		qry.setParameter("uname", uname);
		qry.setParameter("pwd", pwd);
		List<Student>  stdlist = qry.getResultList();
		
		if(stdlist.isEmpty())
			std = null;
		else 
			std = stdlist.get(0);
		return std;
	}
	
	public void DeleteStudent(int studentID)
	{
		Session session = sfact.openSession();
		Transaction t = session.beginTransaction();
		Student std = this.SearchStudent(studentID);
		session.delete(std);
		t.commit();
	}
	
	public void ChangePassword(int rno, String pwd)
	{
		Session session = sfact.openSession();
		Transaction t = session.beginTransaction();
		TypedQuery  qry = session.createQuery("Update Student set pswd=:pwd where rollno=:rno");
		qry.setParameter("pwd", pwd);
		qry.setParameter("rno", rno);
		qry.executeUpdate();
		t.commit();
	}
}
