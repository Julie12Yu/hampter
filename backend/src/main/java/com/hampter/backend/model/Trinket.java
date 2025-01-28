package com.hampter.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Trinket")
public class Trinket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trinketID")
    private Integer Trinket;

    @Column(name = "", columnDefinition = "string")
    private String trinketDescription;
}
