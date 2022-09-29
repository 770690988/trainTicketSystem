package com.example.trainticketsystem.Entity.admin;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "adminInfo")
public class AdminInfo {
    //账户账号
    @Id
    @Column(name = "accountNum")
    private String accountNum;

    //账户密码
    @Column(name = "accountPassword")
    private String accountPassword;

    //账户是否注销
    @Column(name = "isCancelled")
    private Integer isCancelled;

}
