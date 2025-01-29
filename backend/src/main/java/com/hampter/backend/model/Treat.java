package com.hampter.backend.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Treat")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Treat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "treatID")
    private Integer Treat;

    @Column(name = "", columnDefinition = "string")
    private String treatDescription;
}
