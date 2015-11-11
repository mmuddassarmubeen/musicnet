package com.neu.musicnet.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.neu.musicnet.model.Musician;
import com.neu.musicnet.model.Skill;

public class SkillDao extends DAO {

	public List<Skill> getSkills(Musician musician)
	{
		try
		{
			List<Skill> skills = new ArrayList<Skill>();
			Musician m = (Musician)getSession().createCriteria(Musician.class).add(Restrictions.eq("id", musician.getId())).uniqueResult();
			for(Skill sk : m.getSkills())
			{
				skills.add(sk);
			}
			return skills;
		}
		catch(Exception ex)
		{
			System.out.println("Exception" + ex.getCause().getMessage());
			return null;
		}
	}
	
	public boolean addSkills(Musician musician)
	{
		Transaction tr = null;
		try
		{
			Session sess = getSession();
			tr = sess.getTransaction();
			tr.begin();
			sess.update(musician);
			tr.commit();
			return true;
		}
		catch(Exception ex)
		{
			tr.rollback();
			System.out.println("Exception" + ex.getCause().getMessage());
			return false;
		}
	}
	
}
