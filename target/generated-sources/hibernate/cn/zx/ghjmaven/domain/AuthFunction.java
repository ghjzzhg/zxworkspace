package cn.zx.ghjmaven.domain;
// Generated 2017-9-5 17:20:29 by Hibernate Tools 3.2.2.GA


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * AuthFunction generated by hbm2java
 */
@Entity
@Table(name="auth_function"
    ,catalog="zhongxi"
    , uniqueConstraints = @UniqueConstraint(columnNames="name") 
)
public class AuthFunction  implements java.io.Serializable {


     private String id;
     private AuthFunction authFunction;
     private String name;
     private String description;
     private String generatemenu;
     private Set<AuthFunction> authFunctions = new HashSet<AuthFunction>(0);

    public AuthFunction() {
    }

	
    public AuthFunction(String id) {
        this.id = id;
    }
    public AuthFunction(String id, AuthFunction authFunction, String name, String description, String generatemenu, Set<AuthFunction> authFunctions) {
       this.id = id;
       this.authFunction = authFunction;
       this.name = name;
       this.description = description;
       this.generatemenu = generatemenu;
       this.authFunctions = authFunctions;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false, length=32)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="pid")
    public AuthFunction getAuthFunction() {
        return this.authFunction;
    }
    
    public void setAuthFunction(AuthFunction authFunction) {
        this.authFunction = authFunction;
    }
    
    @Column(name="name", unique=true, length=32)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="description", length=32)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    @Column(name="generatemenu", length=32)
    public String getGeneratemenu() {
        return this.generatemenu;
    }
    
    public void setGeneratemenu(String generatemenu) {
        this.generatemenu = generatemenu;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="authFunction")
    public Set<AuthFunction> getAuthFunctions() {
        return this.authFunctions;
    }
    
    public void setAuthFunctions(Set<AuthFunction> authFunctions) {
        this.authFunctions = authFunctions;
    }




}


