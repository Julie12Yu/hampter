package com.hampter.backend.controller;

import com.hampter.backend.model.Treat;
import com.hampter.backend.repository.TreatRepository;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class TreatController {

    private final TreatRepository treatRepository;

    public TreatController(TreatRepository treatRepository) {
        this.treatRepository = treatRepository;
    }

    @QueryMapping
    public List<Treat> treats() {
        return treatRepository.findAll();
    }
}
