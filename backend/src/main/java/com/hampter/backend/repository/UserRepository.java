package com.hampter.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.hampter.backend.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
