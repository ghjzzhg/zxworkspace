package cn.zx.ghjmaven.domain;
// Generated 2017-9-5 17:20:58 by Hibernate Tools 3.2.2.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TUser generated by hbm2java
 */
@Entity
@Table(name="t_user"
    ,schema="zhongxi"
)
public class User1  implements java.io.Serializable {

     private String id;
     private String username;
     private String password;
     private Date birthday;
     private String gender;
     private String station;
     private String telephone;
     private String remark;
//     private Set<AuthRole> roles = new HashSet<AuthRole>();//get\set方法没有

    public User1() {
    }

	
    public User1(String id) {
        this.id = id;
    }
    public User1(String id, String username, String password, Date birthday, String gender, String station, String telephone, String remark) {
       this.id = id;
       this.username = username;
       this.password = password;
       this.birthday = birthday;
       this.gender = gender;
       this.station = station;
       this.telephone = telephone;
       this.remark = remark;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false, length=32)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    @Column(name="username", length=20)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column(name="password", length=32)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="birthday", length=10)
    public Date getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    
    @Column(name="gender", length=10)
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    @Column(name="station", length=40)
    public String getStation() {
        return this.station;
    }
    
    public void setStation(String station) {
        this.station = station;
    }
    
    @Column(name="telephone", length=11)
    public String getTelephone() {
        return this.telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    @Column(name="remark", length=32)
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }




}


