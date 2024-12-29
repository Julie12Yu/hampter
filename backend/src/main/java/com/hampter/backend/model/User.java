package com.hampter.backend.model;

import java.util.ArrayList;
import jakarta.persistence.*;

@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userID")
    private Integer userID;

    @Column(name = "allHabs") // hab IDs will be stored
    private ArrayList<Integer> habs;

    @Column(name = "pointCount")
    private Integer pointCount;

    @Column(name = "hampterCount") // hampter IDs will be stored
    private ArrayList<Integer> hampterCount;

    @Column(name = "isOnline")
    private boolean isOnline;

    @Column(name = "userEmail")
    private boolean userEmail;
}
