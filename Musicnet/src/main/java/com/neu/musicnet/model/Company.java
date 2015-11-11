package com.neu.musicnet.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="COMPANY",catalog="musicnet")
public class Company implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="company_id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	
	private Set<EventManager> eventManagers;
	private Set<AccountManager> accountManagers;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public Set<EventManager> getEventManagers() {
		return eventManagers;
	}
	public void setEventManagers(Set<EventManager> eventManagers) {
		this.eventManagers = eventManagers;
	}
	public Set<AccountManager> getAccountManagers() {
		return accountManagers;
	}
	public void setAccountManagers(Set<AccountManager> accountManagers) {
		this.accountManagers = accountManagers;
	}
	
	

}
