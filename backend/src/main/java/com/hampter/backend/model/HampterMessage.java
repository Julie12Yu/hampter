package com.hampter.backend.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "HampterMessage")
public class HampterMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hampterMessageID")
    private Integer hampterMessageID;

    @Column(name = "fromUserID")
    private Integer fromUserID;

    @Column(name = "toUserID")
    private Integer toUserID;

    @Column(name = "messageTitle")
    private String messageTitle;

    @Column(name = "messageText")
    private String messageText;

    @Column(name = "sentTime")
    private LocalDateTime sentDateTime;

    @Column(name = "readDateTime")
    private LocalDateTime readDateTime;

}
