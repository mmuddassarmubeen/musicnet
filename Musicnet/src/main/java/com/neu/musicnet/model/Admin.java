package com.neu.musicnet.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="ADMIN",catalog="musicnet")
@PrimaryKeyJoinColumn(name="person_id")
public class Admin extends Person {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
