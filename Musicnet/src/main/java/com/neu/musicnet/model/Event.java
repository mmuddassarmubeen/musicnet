package com.neu.musicnet.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.MetaValue;

@Entity
@Table(name="EVENT",catalog="musicnet")
public class Event implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="event_id")
	private long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="start")
	private Date start;
	
	@Column(name="end")
	private Date end;
	
	@JsonIgnore
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.PERSIST)
	@JoinTable(name="EVENTUSERDETAILS", catalog="musicnet", joinColumns={
			@JoinColumn(name="event_id",nullable=false)},
			inverseJoinColumns={@JoinColumn(name="person_id", nullable=false)
			})
	@MetaValue(targetEntity = Musician.class, value="musician")
	private Set<Musician> musicians;
	
	@JsonIgnore
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.PERSIST)
	@JoinTable(name="EVENTMANAGERDETAILS", catalog="musicnet", joinColumns={
			@JoinColumn(name="event_id",nullable=false)},
			inverseJoinColumns={@JoinColumn(name="person_id", nullable=false)
			})
	
	private Set<EventManager> eventManagers;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Musician> getMusicians() {
		return musicians;
	}
	public void setMusicians(Set<Musician> musicians) {
		this.musicians = musicians;
	}
	public Set<EventManager> getEventManagers() {
		return eventManagers;
	}
	public void setEventManagers(Set<EventManager> eventManagers) {
		this.eventManagers = eventManagers;
	}
}
