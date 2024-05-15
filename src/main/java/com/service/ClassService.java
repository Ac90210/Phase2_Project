package com.service;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connections.DbConnection;
import com.entities.Class;

import jakarta.persistence.TypedQuery;

public class ClassService {

	SessionFactory sfact = null;
	
	public ClassService()
	{
		sfact = DbConnection.getConnection();
	}
	
	public void AddClass(Class cl)
	{
		Session session = sfact.openSession();
		Transaction trans = session.beginTransaction();
		session.persist(cl);
		trans.commit();
	}
	
	public List<Class> ShowAll()
	{
		Session session = sfact.openSession();
		TypedQuery qry = session.createQuery("from Class");
		List<Class> classlist = qry.getResultList();
		return classlist;
	}
	public Class SearchClass(int classID)
	{
		Session session = sfact.openSession();
		Class cl = session.get(Class.class, classID);
		return cl;
	}
	
	public void DeleteClass(int classID)
	{
		Session session = sfact.openSession();
		Transaction t = session.beginTransaction();
		Class cl = this.SearchClass(classID);
		session.delete(cl);
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
