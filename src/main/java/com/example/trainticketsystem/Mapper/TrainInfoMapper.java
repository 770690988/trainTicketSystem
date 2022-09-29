package com.example.trainticketsystem.Mapper;

import com.example.trainticketsystem.Entity.train.TrainInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainInfoMapper extends JpaRepository<TrainInfo,String> {
}
