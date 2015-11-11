package com.neu.musicnet.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.neu.musicnet.model.AccountManager;
import com.neu.musicnet.model.AccountRequest;
import com.neu.musicnet.model.EventManager;
import com.neu.musicnet.model.Musician;
import com.neu.musicnet.model.Person;
import com.neu.musicnet.model.Role;
import com.neu.musicnet.model.UserAccount;

public class AccountDao extends DAO{

	public boolean saveAccountRequest(AccountRequest request)
	{
		boolean result = false;
		Session session = getSession();
		Transaction tr = session.getTransaction();
		
		try
		{
			tr.begin();
			session.save(request);
			tr.commit();
			result = true;
		}
		catch(Exception ex)
		{
			tr.rollback();
			System.out.println("Error thrown:" + ex.getCause().getMessage());
		}
		
		return result;
	}
	
	public List<AccountRequest> getPendingRequests()
	{
		List<AccountRequest> requests = null;
		Session session = getSession();
		Transaction tr = session.getTransaction();
		
		try
		{
			
			Criteria criteria = session.createCriteria(AccountRequest.class).add(Restrictions.eq("processed",false));
			requests = criteria.list();
		}
		catch(Exception ex)
		{
			tr.rollback();
			System.out.println("Error thrown:" + ex.getCause().getMessage());
		}
		
		return requests;
		
	}
	
	public boolean approveRequest(AccountRequest accRequest)
	{
		List<AccountRequest> requests = null;
		Session session = getSession();
		Transaction tr = session.getTransaction();
		Person p = null;
		
		if(accRequest.getRole().equals("ROLE_EVENTMANAGER"))
		{
			p = new EventManager(accRequest.getFirstname(),accRequest.getLastname(),accRequest.getEmail(), accRequest.getDateOfBirth());
		}
		else if(accRequest.getRole().equals("ROLE_ACCOUNTMANAGER"))
		{
			p = new AccountManager(accRequest.getFirstname(),accRequest.getLastname(),accRequest.getEmail(), accRequest.getDateOfBirth());
		}
		else 
		{
			p = new Musician(accRequest.getFirstname(),accRequest.getLastname(),accRequest.getEmail(), accRequest.getDateOfBirth());
		}
		
		UserAccount useraccount = new UserAccount(accRequest.getUsername(),accRequest.getPassword(), true);
		Role role = null; 
		Query q = session.createQuery("from Role where name=:rolename");
		q.setString("rolename", accRequest.getRole());
		role = (Role)q.uniqueResult();
		useraccount.getRoles().add(role);
		useraccount.setPerson(p);
		p.setUserAccount(useraccount);
		
		//Account request processed
		accRequest.setProcessed(true);
		
		try
		{
			tr.begin();
			session.save(p);
			session.update(accRequest);
			tr.commit();
			return true;
		}
		catch(Exception ex)
		{
			tr.rollback();
			System.out.println("Error thrown:" + ex.getCause().getMessage());
		}
		
		return false;
		
	}
	
	
	
}
