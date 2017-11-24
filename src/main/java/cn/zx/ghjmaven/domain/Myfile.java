package cn.zx.ghjmaven.domain;	

import static javax.persistence.GenerationType.IDENTITY;

import java.io.File;
import java.io.FileOutputStream;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/** 
 * @author 作者 : 年轻的谷弟
 * @createDate 创建时间：2017年9月14日 下午1:16:54 
 * 类说明--上传文件
 */
@Entity
@Table(name="myfile",schema="zhongxi")
public class Myfile {
	private Integer id;
	private File file;
	private String filename;
	private String filetype;
	
	public Myfile() {
		super();
	}
	public Myfile(Integer id,File file, String filename, String filetype) {
		super();
		this.id = id;
		this.file = file;
		this.filename = filename;
		this.filetype = filetype;
	}
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="id", unique=true, nullable=false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="file")
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	@Column(name="filename", length=32)
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Column(name="filetype", length=32)
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	@Override
	public String toString() {
		return "Myfile [id=" + id + ", file=" + file + ", filename=" + filename
				+ ", filetype=" + filetype + "]";
	}
	
	
}
