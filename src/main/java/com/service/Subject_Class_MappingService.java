package com.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connections.DbConnection;
import com.entities.Class;
import com.entities.Student;
import com.entities.Subject_Class_Mapping;

import jakarta.persistence.TypedQuery;

public class Subject_Class_MappingService {

	SessionFactory sfact = null;
	
	public Subject_Class_MappingService()
	{
		sfact = DbConnection.getConnection();
	}
	
	public void AddSubj_Cls_Mapp(Subject_Class_Mapping cl)
	{
		Session session = sfact.openSession();
		Transaction trans = session.beginTransaction();
		session.persist(cl);
		trans.commit();
	}
	
	public List<Subject_Class_Mapping>  ShowAll()
	{
		Session session = sfact.openSession();
		TypedQuery qry = session.createQuery("from Subject_Class_Mapping");
		List<Subject_Class_Mapping> classlist = qry.getResultList();
		return classlist;
	}
	
	public Class SearchClass(int classID)
	{
		Session session = sfact.openSession();
		Class cl = session.get(Class.class, classID);
		return cl;
	}

	public Class UserCheck(String uname, String pwd)
	{
		Class std = null;
		Session session = sfact.openSession();
		TypedQuery  qry = session.createQuery("from Student where email=:uname and pswd=:pwd");
		qry.setParameter("uname", uname);
		qry.setParameter("pwd", pwd);
		List<Class>  stdlist = qry.getResultList();
		
		if(stdlist.isEmpty())
			std = null;
		else 
			std = stdlist.get(0);
		return std;
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
