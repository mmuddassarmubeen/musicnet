package com.neu.musicnet.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="ACCOUNTMANAGER",catalog="musicnet")
@PrimaryKeyJoinColumn(name="person_id")
public class AccountManager extends Person {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AccountManager()
	{}
	
	public AccountManager(String fname,String lname,String emailValue, Date dob)
	{
		super(fname,lname,emailValue,dob);
	}
}
