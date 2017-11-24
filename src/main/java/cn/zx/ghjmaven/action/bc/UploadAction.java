package cn.zx.ghjmaven.action.bc;	

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.UploadFile;

/** 
 * @author 作者 : 年轻的谷弟
 * @createDate 创建时间：2017年10月17日 下午2:10:41 
 * 类说明--
 */
@Controller("uploadAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class UploadAction extends BaseAction<UploadFile> {
	private UploadFile uploadFile;
	   
	@Action(value = "uploadAction_batchUpload", results = {@Result(name="batchUpload", type="json")})
    public String batchUpload() throws Exception {
		File file = uploadFile.getUploadFile();
		String uploadContentType = uploadFile.getUploadContentType();
		String uploadFileName = uploadFile.getUploadFileName();
		String uploadPath = uploadFile.getUploadPath();
        String s = null;
        File uploadFile1 = new File(ServletActionContext.getServletContext().getRealPath("uploadFile"));
        
        if(!file.exists()) {
        	file.mkdir();
        }
        boolean[] flags = null;
//        int size = file.size();
        //用于标识  
//        flags = new boolean[size];
          
        //规定的上传文件格式分解  
//        String[] fileType = allowedTypes.split(",");
        
//      判断文件大小是否符合条件  
//        for(int i = 0; i < size; i++) {  
//            flags[i] = false;
              
            //若是上传的文件大小大于规定的长度  
//            if(maximumSize < file.get(i).length()) {  
//                Map request = (Map)ServletActionContext.getContext().get("request");  
//                request.put("errorMessage", "文件太大，不能上传");  
//                return "input";  
//            }  
             
//            String fileType = uploadContentTypes.get(i);
            //判断上传的文件的类型 
//            for(int j = 0;j < uploadContentType.length;j++) {
//                if(uploadContentType.get(i).equals(fileType[j])) {
//                    flags[i]=true;
//                }
//            }
//        }
          
        //然后判断是否存在类型的不合格  
        for(int k = 0; k < flags.length; k++) {
            if(flags[k] == false) {  
                Map request = (Map)ServletActionContext.getContext().get("request");  
                request.put("errorMessage", "文件类型不符合");  
                return "input";
            }  
        }
              
        //把临时文件保存为本地文件  
//        for(int i = 0; i < uploadFiles.size(); i++){  
            FileReader fis = new FileReader(file);
            FileWriter fos = new FileWriter(uploadFile + "\\" + file);
            
            BufferedReader br = new BufferedReader(fis);
            BufferedWriter bw = new BufferedWriter(fos);
              
            while((s = br.readLine()) != null){  
                bw.write(s);  
            }  
//        }  
              
      return "success";  
    }  
}
