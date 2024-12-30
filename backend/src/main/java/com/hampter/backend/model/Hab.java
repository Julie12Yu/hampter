package com.hampter.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Hab")
public class Hab {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "habID")
    private Integer habID;
}
