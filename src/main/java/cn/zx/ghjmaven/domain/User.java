package cn.zx.ghjmaven.domain;

import java.net.Authenticator;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

// Generated 2017-8-24 9:43:09 by Hibernate Tools 3.2.2.GA

/**
 * Zxuser generated by hbm2java
 */
@Entity
@Table(name="zxuser",schema="zhongxi")
public class User extends Authenticator implements java.io.Serializable {

     private Integer id;
     private String username;
     private String password;
     private String sex;
     private Date birthday;
     private String phone;
     private String email;
     private String epassword;
     private Integer age;

    public User() {
    }
	
    public User(String username) {
        this.username = username;
    }
    public User(String username, String password, String sex, Date birthday, String phone, String email,String epassword, Integer age) {
       this.username = username;
       this.password = password;
       this.sex = sex;
       this.birthday = birthday;
       this.phone = phone;
       this.email = email;
       this.epassword = epassword;
       this.age = age;
    }
   
    @Id 
    @GenericGenerator(name="generator",strategy="uuid")
	@GeneratedValue(generator="generator")
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="username", nullable=false, length=20)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column(name="password", length=10)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="sex", length=2)
    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="birthday", length=19)
    public Date getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    
    @Column(name="phone", length=11)
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    @Column(name="email", length=20)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    @Column(name="epassword", length=20)
    public String getEpassword() {
        return this.epassword;
    }
    
    public void setEpassword(String epassword) {
        this.epassword = epassword;
    }
    
    @Column(name="age")
    public Integer getAge() {
        return this.age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }




}


