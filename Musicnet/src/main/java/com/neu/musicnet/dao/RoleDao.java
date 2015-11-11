package com.neu.musicnet.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.musicnet.model.Role;

public class RoleDao extends DAO {

	public List<Role> getRoles()
	{
		List<Role> roles = null;
		Session session = getSession();
		Transaction tr = session.getTransaction();
		
		try
		{
			Criteria criteria = session.createCriteria(Role.class);
			roles = criteria.list();
		}
		catch(Exception ex)
		{
			System.out.println("Exception in retrieving roles:" + ex.getCause().getMessage());
		}
		return roles;
	}
}
