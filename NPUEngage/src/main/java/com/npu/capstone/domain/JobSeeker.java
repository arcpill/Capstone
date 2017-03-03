package com.npu.capstone.domain;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "jobseeker")
public class JobSeeker {

	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private long id;


	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public JobSeeker(String firstName,String lastName,String email,String password)
	{
		this.firstName = firstName;
		this.lastName = lastName;
		this.email  = email;
		this.password = password;
	}
	public JobSeeker() {
		// TODO Auto-generated constructor stub
	}
	






	
}
