package com.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connections.DbConnection;
import com.entities.Teacher;

import jakarta.persistence.TypedQuery;

public class TeacherService {

	SessionFactory sfact = null;
	
	public TeacherService()
	{
		sfact = DbConnection.getConnection();
	}
	
	public void AddTeacher(Teacher teacher)
	{
		Session session = sfact.openSession();
		Transaction trans = session.beginTransaction();
		session.persist(teacher);
		trans.commit();
	}
	
	public List<Teacher>  ShowAll()
	{
		Session session = sfact.openSession();
		TypedQuery qry = session.createQuery("from Teacher");
		List<Teacher> tlist = qry.getResultList();
		return tlist;
	}
	
	public Teacher SearchTeacher (int teacherID)
	{
		Session session = sfact.openSession();
		Teacher teacher = session.get(Teacher.class, teacherID);
		return teacher;
	}

	public Teacher UserCheck(String uname, String pwd)
	{
		Teacher std = null;
		Session session = sfact.openSession();
		TypedQuery  qry = session.createQuery("from Student where email=:uname and pswd=:pwd");
		qry.setParameter("uname", uname);
		qry.setParameter("pwd", pwd);
		List<Teacher>  stdlist = qry.getResultList();
		
		if(stdlist.isEmpty())
			std = null;
		else 
			std = stdlist.get(0);
		return std;
	}
	
	public void DeleteTeacher(int teacherID)
	{
		Session session = sfact.openSession();
		Transaction t = session.beginTransaction();
		Teacher teacher = this.SearchTeacher(teacherID);
		session.delete(teacher);
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
