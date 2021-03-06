package cn.zx.ghjmaven.domain;
// Generated 2017-8-29 17:20:36 by Hibernate Tools 3.2.2.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Attence generated by hbm2java
 */
@Entity
@Table(name="attence",schema="zhongxi")
public class Attence  implements java.io.Serializable {

     private Integer aid;
     private String aname;
     private String atype;
     private String atime;
     private String atravel;
     private Integer id;
     private Integer iid;
     private Integer cid;
     private String iname;

    public Attence() {
    }

    public Attence(String atype,String aname, String atime, String atravel, Integer id, Integer iid, Integer cid, String iname) {
       this.atype = atype;
       this.aname = aname;
       this.atime = atime;
       this.atravel = atravel;
       this.id = id;
       this.iid = iid;
       this.cid = cid;
       this.iname = iname;
    }
   
    @Id
    @GeneratedValue(strategy=IDENTITY)
    @Column(name="aid", unique=true, nullable=false)
    public Integer getAid() {
        return this.aid;
    }
    
    public void setAid(Integer aid) {
        this.aid = aid;
    }
    @Column(name="aname", length=30)
    public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Column(name="atype", length=30)
    public String getAtype() {
        return this.atype;
    }
    
    public void setAtype(String atype) {
        this.atype = atype;
    }
    
    @Column(name="atime", length=10)
    public String getAtime() {
        return this.atime;
    }
    
    public void setAtime(String atime) {
        this.atime = atime;
    }
    
    @Column(name="atravel", length=2)
    public String getAtravel() {
        return this.atravel;
    }
    
    public void setAtravel(String atravel) {
        this.atravel = atravel;
    }
    
    @Column(name="id")
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="iid")
    public Integer getIid() {
        return this.iid;
    }
    
    public void setIid(Integer iid) {
        this.iid = iid;
    }
    @Column(name="cid")
    public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Column(name="iname", length=32)
	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	@Override
	public String toString() {
		return "Attence [aid=" + aid + ", aname=" + aname + ", atype=" + atype
				+ ", atime=" + atime + ", atravel=" + atravel + ", id=" + id
				+ ", iid=" + iid + ", cid=" + cid + ", iname=" + iname + "]";
	}




}


