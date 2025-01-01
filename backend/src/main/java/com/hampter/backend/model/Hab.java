package com.hampter.backend.model;

import java.util.ArrayList;
import jakarta.persistence.*;

@Entity
@Table(name = "Hab")
public class Hab {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "habID")
    private Integer habID;

    @Column(name = "habHampters") // hampter IDs will be stored
    private ArrayList<Integer> habHampters;

    @Column(name = "habTrinkets") // string represents the hab
    private ArrayList<String> habTrinkets;
}
