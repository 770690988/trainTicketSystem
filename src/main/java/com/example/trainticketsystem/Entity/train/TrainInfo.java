package com.example.trainticketsystem.Entity.train;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "trainInfo")
public class TrainInfo {
    @Id
    @Column(name = "trainId")
    private String trainId;

    @Column(name = "firstSeatNum")
    private Integer firstSeatNum;

    @Column(name = "secondSeatNum")
    private Integer secondSeatNum;

    @Column(name = "thirdSeatNum")
    private Integer thirdSeatNum;
}
