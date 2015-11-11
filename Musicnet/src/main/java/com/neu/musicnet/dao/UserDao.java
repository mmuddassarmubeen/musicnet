package com.neu.musicnet.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.musicnet.model.Person;
import com.neu.musicnet.model.UserAccount;


public class UserDao extends DAO {

	@SuppressWarnings("unchecked")
	public UserAccount findByUserName(String username) {

		List<UserAccount> users = new ArrayList<UserAccount>();

		users = getSession().createQuery("from UserAccount where username=?")
				.setParameter(0, username).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}
	
	public boolean saveImage(Person person)
	{
		Session sess = getSession();
		Transaction tr = sess.getTransaction();
		
		try{
			tr.begin();
			sess.update(person);
			tr.commit();
			return true;
		}
		catch(Exception ex)
		{
			tr.rollback();
			return false;
		}
		
	}
}
