package cn.zx.ghjmaven.domain;	

import static javax.persistence.GenerationType.IDENTITY;

import java.io.File;
import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/** 
 * @author 作者 : 年轻的谷弟
 * @createDate 创建时间：2017年10月18日 上午9:19:51 
 * 类说明--
 */
@Entity
@Table(name="myfile",schema="zhongxi")
public class UploadFile implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private File uploadFile;
    private String uploadFileName;
    private String uploadContentType;
    //文件路径  
    private String uploadPath; 
    @Id
    @GeneratedValue(strategy=IDENTITY)
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="uploadFile")
	public File getUploadFile() {  
        return uploadFile;  
    }  
      
    public void setUploadFile(File uploadFile) {  
        this.uploadFile = uploadFile;  
    }  
    @Column(name="uploadFileName")
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
    @Column(name="uploadContentType")
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
  
    public void setUploadContentType(
    		String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
    @Column(name="uploadPath")
    public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
}
