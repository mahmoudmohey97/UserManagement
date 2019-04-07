package com.jackrutorial.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.jackrutorial.model.Role;
import com.jackrutorial.model.User;
import com.jackrutorial.repository.*;
import com.jackrutorial.repository.UserRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

@Service("userService")
public class UserServiceImpl implements UserService 
{
 
 @Autowired
 private UserRepository userRepository;
 
// @Autowired
// private SkillRepository skillRepository;
 
// @Autowired
// private RoleRepository roleRespository;
 
 @Autowired
 private BCryptPasswordEncoder bCryptPasswordEncoder;

 @Override
 public User findUserByEmail(String email) {
  return userRepository.findUserByEmail(email);
 }

 @Override
 public void saveUser(User user) {
  user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
  user.setActive(1);
 // Role userRole = roleRespository.findByRole("ADMIN");
 // user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
 // System.out.println(skillRepository.mySearch(user.getId()).toString());
  //user.setSkills(skillRepository.mySearch(Integer.toString(user.getId())));
  userRepository.save(user);
 }
}	