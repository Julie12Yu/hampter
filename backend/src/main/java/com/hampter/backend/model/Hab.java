package com.hampter.backend.model;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "Hab")
public class Hab {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "habID")
    private Integer habID;

    @Column(name = "habHampters", columnDefinition = "integer[]") // hampter IDs will be stored
    private List<Integer> habHampters;

    @Column(name = "habTrinkets", columnDefinition = "integer[]") // trinkets will be repped by id number
    private List<Integer> habTrinkets;
}
