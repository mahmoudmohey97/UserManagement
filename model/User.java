package com.jackrutorial.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity(name="User")
@Table(name = "persons")
public class User  
{
 
 @Id
 @GeneratedValue(strategy = GenerationType.AUTO)
 private int id;
 
 @Column(name = "email")
 private String email;
 
 @Column(name = "phoneNumber")
 private String phoneNumber;
 
 @Column(name = "firstname")
 private String firstname; 
 
 @Column(name = "lastname")
 private String lastname;
 
 @Column(name = "password")
 private String password;
 
 @Column(name = "active")
 private int active;
 
 @Column(name = "age")
 private int age;
 
 @Column(name = "skill1")
 private String skill1;

 @Column(name = "skill2")
 private String skill2;

 @Column(name = "skill3")
 private String skill3;

 @Column(name = "skill4")
 private String skill4;

 @Column(name = "skill5")
 private String skill5;

 
 public String getSkill1() {
	return skill1;
}

public void setSkill1(String skill1) {
	this.skill1 = skill1;
}

public String getSkill2() {
	return skill2;
}

public void setSkill2(String skill2) {
	this.skill2 = skill2;
}

public String getSkill3() {
	return skill3;
}

public void setSkill3(String skill3) {
	this.skill3 = skill3;
}

public String getSkill4() {
	return skill4;
}

public void setSkill4(String skill4) {
	this.skill4 = skill4;
}

public String getSkill5() {
	return skill5;
}

public void setSkill5(String skill5) {
	this.skill5 = skill5;
}
 
 
// @ManyToMany(fetch = FetchType.LAZY ,
//		 cascade = {
//	        CascadeType.PERSIST,
//	        CascadeType.MERGE
//	    })
//	    @JoinTable(name = "user_skills",
//	        joinColumns = @JoinColumn(name = "id"),
//	        inverseJoinColumns = @JoinColumn(name = "ids")
//	    )
// private List<Skill> skills = new ArrayList<>();
// 
// 
// public List<Skill> getSkills() {
//	return skills;
//}
//
//public void setSkills(List<Skill> skills) {
//	this.skills = skills;
//}

public int getId() {
  return id;
 }
 
 public int getAge() {
	  return age;
	 }

 public void setId(int id) {
  this.id = id;
 }

 public void setAge(int age) {
	  this.age = age;
	 }

 
 public String getEmail() {
  return email;
 }

 public void setEmail(String email) {
  this.email = email;
 }

 public String getFirstname() {
  return firstname;
 }

 public void setFirstname(String firstname) {
  this.firstname = firstname;
 }

 public String getLastname() {
  return lastname;
 }

 public void setLastname(String lastname) {
  this.lastname = lastname;
 }

 public String getPassword() {
  return password;
 }

 public void setPassword(String password) {
  this.password = password;
 }

 public int getActive() {
  return active;
 }

 public void setActive(int active) {
  this.active = active;
 }


}