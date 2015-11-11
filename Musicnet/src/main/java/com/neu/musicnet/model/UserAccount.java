package com.neu.musicnet.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="USERACCOUNT",catalog="musicnet")
public class UserAccount implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="account_id")
	private long userid;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="isenabled")
	private boolean enabled;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="ROLEDETAILS", catalog="musicnet", joinColumns={
			@JoinColumn(name="account_id",nullable=false)},
			inverseJoinColumns={@JoinColumn(name="role_id", nullable=false)
			})
	private Set<Role> roles;
	
	
	@OneToOne
	@JoinColumn(name="person_id")
	private Person person;
	
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	
	
	public UserAccount()
	{}
	
	public UserAccount(String uname, String pass, boolean isenabled )
	{
		username = uname;
		password = pass;
		enabled = isenabled;
		roles = new HashSet<Role>();
	}
}
