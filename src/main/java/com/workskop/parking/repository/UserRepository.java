package com.workskop.parking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.workskop.parking.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
