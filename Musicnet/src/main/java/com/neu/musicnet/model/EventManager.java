package com.neu.musicnet.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="EVENTMANAGER",catalog="musicnet")
@PrimaryKeyJoinColumn(name="person_id")
public class EventManager extends Person {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="EVENTMANAGERDETAILS", catalog="musicnet", joinColumns={
			@JoinColumn(name="person_id",nullable=false)},
			inverseJoinColumns={@JoinColumn(name="event_id", nullable=false)
			})
	private List<Event> events;
	
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	
	public EventManager()
	{}
	
	public EventManager(String fname,String lname,String emailValue, Date dob)
	{
		super(fname,lname,emailValue,dob);
	}

}
