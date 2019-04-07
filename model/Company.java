package com.jackrutorial.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company 
{
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	 private int id;
	 
	 @Column(name = "email")
	 private String email;
	 
	 @Column(name = "phoneNumber")
	 private String phoneNumber;
	 
	 @Column(name="name")
	 private String name;
	 

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "employeesNum")
	 private String employeesNum;
	 
	 @Column(name = "password")
	 private String password;
	 
	 @Column(name = "address")
	 private String address;
	 
	 public int getId() {
		 return id;
	 }
	 
	 public String getName() {
		 return name;
	 }
	 
	 public void setName(String name) {
		 this.name = name;
	 }
	 
	 public void setId(int id) {
		 this.id = id;
	 }
	 
	 public String getEmail() {
		 return email;
	 }
	 
	 public void setEmail(String email) {
		 this.email = email;
	 }
	 
	 public String getPhoneNumber() {
		 return phoneNumber;
	 }
	 
	 public void setPhoneNumber(String phoneNumber) {
		 this.phoneNumber = phoneNumber;
	 }
	 
	 public String getEmployeesNum() {
		 return employeesNum;
	 }
	 
	 public void setEmployeesNum(String employeesNum) {
		 this.employeesNum = employeesNum;
	 }
	 
	 public String getPassword() {
		 return password;
	 }
	 
	 public void setPassword(String password) {
		 this.password = password;
	 }
	 
//	 @Override
//	 public String toString() {
//		 return "Company [id=" + id + ", email=" + email + ", phoneNumber=" + phoneNumber + ", employeesNum="
//				 + employeesNum + ", password=" + password + "]";
//	 }
}
