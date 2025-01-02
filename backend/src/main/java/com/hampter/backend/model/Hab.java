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

    @Column(name = "habTrinkets", columnDefinition = "string[]") // string represents the hab
    private List<String> habTrinkets;
}
