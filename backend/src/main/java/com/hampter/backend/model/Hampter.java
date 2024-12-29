package com.hampter.backend.model;

import jakarta.persistence.*;
import java.time.Duration;

@Entity
@Table(name = "hampter")
public class Hampter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hampterID")
    private Integer hampterID;

    @Column(name = "hampterName")
    private String hampterName;

    @Column(name = "hampterModel")
    private String hampterModel;

    @Column(name = "hampterTime")
    private Duration hampterTime;

    @Column(name = "hampterHab")
    private Integer hampterHab; // stores HAB ID

    @Column(name = "hampterHoldMessageID")
    private Integer hampterHoldMessageID;
}
