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
@Table(name="auth_function",schema="zhongxi", uniqueConstraints = @UniqueConstraint(columnNames="name"))
public class Function  implements java.io.Serializable {

     private String id;
     private String name;
     private String description;
     private String generatemenu;
     private Set<Function> functions = new HashSet<Function>(0);

    public Function() {
    }
	
    public Function(String id) {
        this.id = id;
    }
    public Function(String id, String name, String description, String generatemenu, Set<Function> functions) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.generatemenu = generatemenu;
       this.functions = functions;
    }
   
    @Id 
    @Column(name="id", unique=true, nullable=false, length=32)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
//@ManyToOne(fetch=FetchType.LAZY)
//    @JoinColumn(name="pid")
//    public Function getFunction() {
//        return this.function;
//    }
//    
//    public void setFunction(Function function) {
//        this.function = function;
//    }
    
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
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="functions")
    public Set<Function> getFunctions() {
        return this.functions;
    }
    
    public void setFunctions(Set<Function> functions) {
        this.functions = functions;
    }

	@Override
	public String toString() {
		return "Function [id=" + id + ", name="
				+ name + ", description=" + description + ", generatemenu="
				+ generatemenu + ", functions=" + functions + "]";
	}




}


