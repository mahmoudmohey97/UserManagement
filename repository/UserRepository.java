package com.jackrutorial.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//import com.jackrutorial.model.Skill;
import com.jackrutorial.model.User;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Long> {
 
 User findUserByEmail(String email);
 //List<Skill> findSkillsById(int id);
 
}