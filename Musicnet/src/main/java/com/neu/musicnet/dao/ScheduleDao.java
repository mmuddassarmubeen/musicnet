package com.neu.musicnet.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.neu.musicnet.model.Event;
import com.neu.musicnet.model.EventManager;
import com.neu.musicnet.model.Musician;
import com.neu.musicnet.model.Person;
import com.neu.musicnet.model.Schedule;

public class ScheduleDao extends DAO {
	
	public List<Schedule> getSchedule(EventManager person)
	{
		List<Schedule> scheduleList = new ArrayList<Schedule>();
		
		Criteria criteria = getSession().createCriteria(EventManager.class).add(Restrictions.eq("id", person.getId()));
		EventManager per = (EventManager)criteria.uniqueResult();
		for(Event event : per.getEvents())
		{
			Schedule schedule = new Schedule();
			schedule.setTitle(event.getName());
			schedule.setStart(event.getStart());
			schedule.setEnd(event.getEnd());
			schedule.setEvent("ScheduledEvent");
			scheduleList.add(schedule);
		}
		
		return scheduleList;
	}
	
	public List<Schedule> getSchedule(Musician person)
	{
		List<Schedule> scheduleList = new ArrayList<Schedule>();
		
		Criteria criteria = getSession().createCriteria(Musician.class).add(Restrictions.eq("id", person.getId()));
		Musician per = (Musician)criteria.uniqueResult();
		for(Event event : per.getEvents())
		{
			Schedule schedule = new Schedule();
			schedule.setTitle(event.getName());
			schedule.setStart(event.getStart());
			schedule.setEnd(event.getEnd());
			schedule.setEvent("ScheduledEvent");
			scheduleList.add(schedule);
		}
		
		return scheduleList;
	}
}
