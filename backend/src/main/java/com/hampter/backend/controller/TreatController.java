package com.hampter.backend.controller;

import com.hampter.backend.model.Treat;
import com.hampter.backend.repository.TreatRepository;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
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

    @MutationMapping
    public Treat addTreat(@Argument String treatDescription) {
        Treat treat = new Treat();
        treat.setTreatDescription(treatDescription); // Setter already defined by lombok <3
        return treatRepository.save(treat);
    }
}
