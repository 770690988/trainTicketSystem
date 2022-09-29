package com.example.trainticketsystem.Service;

import com.example.trainticketsystem.Mapper.TrainInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Transactional
@Service
public class DriverService {
    @Autowired
    private TrainInfoMapper trainInfoMapper;

//    @Autowired

}
