package cn.zx.ghjmaven.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="EMPLOYEE",schema="ZHONGXI")
//@NamedQuery(name="Employee.pageQuery",query="from Employee where id != null")
public class Employee implements Serializable{
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Character sex;
	private Date entryday;
	private Date birthday;
	private String register;
	private String school;
	private String position;
	private String socialsecurity;
	private String publicfund;
	private String telephone;
	private Character deltag;
	
	public Employee(){
		
	}
	
	public Employee(Integer id, String name, Character sex, Date entryday,
			Date birthday, String register, String school, String position,
			String socialsecurity, String publicfund,
			String identitycard, String schoolcard, String telephone, Character deltag) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.entryday = entryday;
		this.birthday = birthday;
		this.register = register;
		this.school = school;
		this.school = position;
		this.socialsecurity = socialsecurity;
		this.publicfund = publicfund;
		this.telephone = telephone;
		this.deltag = deltag;
	}


	@Id
//	@GenericGenerator(name="generator",strategy="uuid")
//	@GeneratedValue(generator="generator")
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID",unique=true,nullable=false,length=10)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "NAME", length = 20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "SEX", length = 2)
	public Character getSex() {
		return sex;
	}
	public void setSex(Character sex) {
		this.sex = sex;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "ENTRYDAY",length=3)
	public Date getEntryday() {
		return entryday;
	}
	public void setEntryday(Date entryday) {
		this.entryday = entryday;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "BIRTHDAY",length=3)
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Column(name = "REGISTER", length = 30)
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	@Column(name = "SCHOOL", length = 30)
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	@Column(name = "POSITION", length = 20)
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Column(name = "SOCIALSECURITY", length = 20)
	public String getSocialsecurity() {
		return socialsecurity;
	}
	public void setSocialsecurity(String socialsecurity) {
		this.socialsecurity = socialsecurity;
	}
	@Column(name = "PUBLICFUND", length = 20)
	public String getPublicfund() {
		return publicfund;
	}
	public void setPublicfund(String publicfund) {
		this.publicfund = publicfund;
	}
	@Column(name = "telephone", length = 20)
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Column(name = "deltag", length = 2)
	public Character getDeltag() {
		return deltag;
	}

	public void setDeltag(Character deltag) {
		this.deltag = deltag;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", entryday=" + entryday + ", birthday=" + birthday
				+ ", register=" + register + ", school=" + school+ ", position=" + position
				+ ", socialsecurity=" + socialsecurity + ", publicfund="
				+ publicfund + ", telephone=" + telephone + ", deltag="
				+ deltag + "]";
	}
	
	
	
}
