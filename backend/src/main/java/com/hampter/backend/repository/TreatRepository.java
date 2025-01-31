package com.hampter.backend.repository;

import com.hampter.backend.model.Treat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TreatRepository extends JpaRepository<Treat, Integer> {

    public Treat save(String treatDescription);

}