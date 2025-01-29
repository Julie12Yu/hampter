package com.hampter.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Treat")
public class Treat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trinketID")
    private Integer Treat;

    @Column(name = "", columnDefinition = "string")
    private String treatDescription;
}
