package cn.zx.ghjmaven.action.bc;	

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.Myfile;
import cn.zx.ghjmaven.domain.UploadState;
import cn.zx.ghjmaven.utils.UploadFileUtils;

/** 
 * @author 作者 : 年轻的谷弟
 * @version 创建时间：2017年9月13日 下午4:19:38 
 * 类说明 ---上传文件类
 */
@Controller("fileAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class FileAction extends BaseAction<Myfile>{
	private static final long serialVersionUID = 1L;
	private HttpServletResponse response;
	@Action(value="fileAction_batchUpload",results={@Result(name="bacthUpload",type="json")})
	public String bacthUpload(){
//		doFileUpload(getRequest(), response);
		doPost(getRequest(), response);
		return "bacthUpload";
	}
	
	public void doFileUpload(HttpServletRequest request,HttpServletResponse response){
		String path = UploadFileUtils.path;
		System.out.println(path);
		String doPath = UploadFileUtils.getDoPath(path);
		System.out.println(doPath);
	}
	
	private String uploadPath = "D:\\temp"; // 上传文件的目录  
	File tempPathFile;  
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		System.out.println("2222222222");
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(4096);
			factory.setRepository(tempPathFile);
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(4194304);
			List<FileItem> list = upload.parseRequest(request);
			Iterator<FileItem> iterator = list.iterator();
			while (iterator.hasNext()) {  
                FileItem fi = (FileItem) iterator.next();  
                String fileName = fi.getName();  
                if (fileName != null) {  
                    File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题  
                    File savedFile = new File(uploadPath, fullFile.getName());  
                    fi.write(savedFile);  
                }  
            }  
            System.out.print("upload succeed");  
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	      
}
