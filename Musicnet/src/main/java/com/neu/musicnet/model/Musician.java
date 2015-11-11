package com.neu.musicnet.model;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="MUSICIAN",catalog="musicnet")
@PrimaryKeyJoinColumn(name="person_id")
public class Musician extends Person {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@OneToMany(cascade=CascadeType.ALL)
	private Set<Skill> skills;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="EVENTUSERDETAILS", catalog="musicnet", joinColumns={
			@JoinColumn(name="person_id",nullable=false)},
			inverseJoinColumns={@JoinColumn(name="event_id", nullable=false)
			})
	private List<Event> events;
	

	public Set<Skill> getSkills() {
		return skills;
	}

	public void setSkills(Set<Skill> skills) {
		this.skills = skills;
	}
	
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}


	public Musician()
	{}
	
	public Musician(String fname,String lname,String emailValue, Date dob)
	{
		super(fname,lname,emailValue,dob);
		skills = new HashSet<Skill>();
	}
	
}
