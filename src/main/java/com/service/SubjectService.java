package com.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connections.DbConnection;
import com.entities.Student;
import com.entities.Subject;

import jakarta.persistence.TypedQuery;

public class SubjectService {

	SessionFactory sfact = null;
	
	public SubjectService()
	{
		sfact = DbConnection.getConnection();
	}
	
	public void AddSubject(Subject sub)
	{
		Session session = sfact.openSession();
		Transaction trans = session.beginTransaction();
		session.persist(sub);
		trans.commit();
	}
	
	public List<Subject>  ShowAll()
	{
		Session session = sfact.openSession();
		TypedQuery qry = session.createQuery("from Subject");
		List<Subject> sublist = qry.getResultList();
		return sublist;
	}
	
	public Subject SearchSubject(int subjectID)
	{
		Session session = sfact.openSession();
		Subject sub = session.get(Subject.class, subjectID);
		return sub;
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
	
	public void DeleteSubject(int subjectID)
	{
		Session session = sfact.openSession();
		Transaction t = session.beginTransaction();
		Subject sub = this.SearchSubject(subjectID);
		session.delete(sub);
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
