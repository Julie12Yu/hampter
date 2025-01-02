package com.hampter.backend.model;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "\"User\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userID")
    private Integer userID; // when graphql, need convert to string(??)

    @Column(name = "userEmail")
    private String userEmail;

    @Column(name = "userName")
    private String userName;

    @Column(name = "allHabs", columnDefinition = "integer[]") // hab IDs will be stored
    private List<Integer> habs;

    @Column(name = "pointCount")
    private Integer pointCount;

    @Column(name = "allHampters", columnDefinition = "integer[]") // hampter IDs will be stored
    private List<Integer> allHampters;

    @Column(name = "isOnline") // in GraphQL, it's non-nullable
    private Boolean isOnline;
}
