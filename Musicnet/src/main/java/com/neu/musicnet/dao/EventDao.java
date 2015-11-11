package com.neu.musicnet.dao;



import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.neu.musicnet.model.Event;
import com.neu.musicnet.model.EventManager;
import com.neu.musicnet.model.Musician;
import com.neu.musicnet.model.Person;

public class EventDao extends DAO{

	
	public boolean createEvent(Event event) throws Exception
	{
		Transaction tr = null;
		try
		{
			Session session = getSession();
			 tr = session.getTransaction();
			
			tr.begin();
			Object msg = session.save(event);
			if(msg != null)
			{
				
				try
				{
					tr.commit();
				}
				catch(Exception ex)
				{
					String st = ex.getMessage();
					System.out.println("Transaction failed" + st);
				}
				System.out.println("Transaction complete");
				return true;
			}
		}
		catch(HibernateException e)
		{
			tr.rollback();
			throw new Exception("Could not save message" + e);
		}
		finally
		{
			close();
		}
		return false;
	}
	
	public List<Event> getCurrentEvents(Musician musician)
	{
		Criteria criteria = getSession().createCriteria(Event.class).createCriteria("musicians").add(Restrictions.eq("id",musician.getId()));
		return getEvents(criteria);
	}
	
	public List<Event> getCurrentEvents(EventManager eventManager)
	{
		Criteria criteria = getSession().createCriteria(Event.class).add(Restrictions.le("start", new Date())).add(Restrictions.ge("end", new Date())).createCriteria("eventManagers").add(Restrictions.eq("id",eventManager.getId()));
		return getEvents(criteria);
	}
	
	
	public List<Event> getFutureEvents(EventManager eventManager)
	{
		Criteria criteria = getSession().createCriteria(Event.class).add(Restrictions.gt("start", new Date())).createCriteria("eventManagers").add(Restrictions.eq("id",eventManager.getId()));
		return getEvents(criteria);
	}
	
	public List<Event> getPastEvents(EventManager eventManager)
	{
		Criteria criteria = getSession().createCriteria(Event.class).add(Restrictions.lt("end", new Date())).createCriteria("eventManagers").add(Restrictions.eq("id",eventManager.getId()));
		return getEvents(criteria);
	}
	
	private List<Event> getEvents(Criteria criteria)
	{
		try
		{
			List<Event> currentEvents  = criteria.list();
			return currentEvents;
		}
		catch(Exception ex)
		{
			System.out.println("Exception occured" + ex.getCause().getMessage());
		}
		return null;
	}
	
	
	public List<Event> getAllOpenEvents(Musician musician)
	{
		try
		{
			Object[] ids = new Object[]{musician.getId()};
			Query query = getSession().createQuery("select e from Event as e WHERE e.id not in (select ev.id from Musician m JOIN m.events as ev where m.id= :id)");
			query.setInteger("id", musician.getId());
			
			List<Event> currentEvents  = query.list();
			return currentEvents;
		}
		catch(Exception ex)
		{
			System.out.println("Exception occured" + ex.getCause().getMessage());
		}
		return null;
	}
	
	public List<Event> myEvents(Musician musician)
	{
		try
		{
			Criteria criteria = getSession().createCriteria(Event.class).createCriteria("musicians").add(Restrictions.eq("id",musician.getId()));
			List<Event> currentEvents  = criteria.list();
			return currentEvents;
		}
		catch(Exception ex)
		{
			System.out.println("Exception occured" + ex.getCause().getMessage());
		}
		return null;
	}
	
	public boolean subscribe(Event e, Person person)
	{
		
		Session session = getSession();
		Event event = (Event)session.get(Event.class, e.getId());
		if(event.getMusicians() == null)
		{
			event.setMusicians(new HashSet<Musician>());
		}
		event.getMusicians().add((Musician)person);
		Transaction tr = session.getTransaction();
		
		try{
			tr.begin();
			session.update(event);
			tr.commit();
			return true;
		}
		catch(Exception ex)
		{
			System.out.println("Exception thrown while saving event" + ex.getCause().getMessage());
			tr.rollback();
		}
		return false;
	}
	
	public List<Event> getAllEvents()
	{
		try
		{
			Criteria criteria = getSession().createCriteria(Event.class);
			List<Event> events  = criteria.list();
			return events;
		}
		catch(Exception ex)
		{
			System.out.println("Exception occured" + ex.getCause().getMessage());
		}
		return null;
	}
}
