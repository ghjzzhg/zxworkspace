package cn.zx.ghjmaven.action.bc;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Id;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.Employee;
import cn.zx.ghjmaven.domain.Itemer;
@Controller("itemerAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class ItemerAction extends BaseAction<Itemer>{
	
	private Itemer itemer;
	private Employee employee;
	@Action(value="itemerAction_pageQuery",results={@Result(name="pageQuery",type="json")})
	public String pageQuery(){
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			PageRequest pageRequest = new PageRequest(page-1, rows);
			Page<Itemer> pageData = facadeService.getItemerService().pageQuery(pageRequest);
			data.put("total", pageData.getTotalElements());
			data.put("rows", pageData.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		push(data);
		return "pageQuery";
	}
	
	@Action(value="itemerAction_save",results={@Result(name="save",location="/WEB-INF/pages/base/itemer.jsp")})
	public String save(){
		try {
//			List<Employee> employees = facadeService.getEmployeeService().findEmployeeInUse();
			facadeService.getItemerService().save(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "save";
	}
	
	//删除
	@Action(value="itemerAction_batchDelete",results={@Result(name="batchDelete",type="json")})
	public String batchDelete(){
		try {
			String ids = getParameter("ids");
			facadeService.getItemerService().batchDelete(ids);
			push(true);
		} catch (Exception e) {
			push(false);
		}
		return "batchDelete";
	}
	
	//查询所有项目
	@Action(value="itemerAction_ajaxList",results={@Result(name="ajaxList",type="json")})
	public String ajaxList(){
		try {
			List<Itemer> itemers = facadeService.getItemerService().findItemerInuse();
			push(itemers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ajaxList";
	}
	//不成文的约定，File的引用名称要和上传表单name的属性值相同
	private File upload;
	
	//当前action接口接受到上传的文件
	public void setUpload(File upload) {
		this.upload = upload;
	}
	//文件上传路径
	private final static String UPLOADDIR = "/file/upload";
	@Action(value="itemerAction_batchUpload",results={@Result(name="batchUpload",type="json")})
	public String batchUpload() throws IOException{
		try {
			// 1: 获取上传文件 excel struts2 如何接受上传文件 源码 拦截器
			// 源码文档 FileUploadInterceptor upload 真实文件
			// 2: apache poi 解析 excel ---->文档数据 转换 --->List<Region>
			// 创建对Excel工作簿文件的引用
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(upload));
			// 创建对工作表的引用。
			// 本例是按名引用（让我们假定那张表有着缺省名"Sheet1"）
			// HSSFSheet sheet = workbook.getSheet("Sheet1");
			HSSFSheet sheet = workbook.getSheetAt(0);
			// 也可用getSheetAt(int index)按索引引用，
			// 在Excel文档中，第一张工作表的缺省索引是0，
			// 其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
			List<Itemer> itemers = new ArrayList<Itemer>();// 为业务层准备数据
			for (Row row : sheet) {
				// 目的 row cell 数据 封装 region
				int rowNum = row.getRowNum();
				if (rowNum == 0) {
					continue;
				}
				Itemer r = new Itemer();
				r.setIid(row.getCell(0).getRowIndex());
//				r.setIid(row.getCell(0).getStringCellValue());
				r.setIname(row.getCell(1).getStringCellValue());
				r.setIstartdate(row.getCell(2).getDateCellValue());
				r.setIenddate(row.getCell(3).getDateCellValue());
				r.setImanager(row.getCell(4).getStringCellValue());
				r.setImember(row.getCell(5).getStringCellValue());
//				r.setCid(row.getCell(6).get);
				
//				r.setPostcode(row.getCell(4).getStringCellValue());
//				// 生成省市区 简码 以及 城市简码 代码生成 pinyin4j 汉字转拼音 以及拼音转汉字
//				r.setCitycode(PinYin4jUtils.hanziToPinyin(city.substring(0, city.length() - 1), ""));// 城市全拼
//				// 河北省石家庄市邯郸区
//				province = province.substring(0, province.length() - 1);
//				city = city.substring(0, city.length() - 1);
//				district = district.substring(0, district.length() - 1);
//				String[] jianmas = PinYin4jUtils.getHeadByString(province + city + district);
//				StringBuffer sb = new StringBuffer();
//				for (String s : jianmas) {
//					sb.append(s);
//				}
//				r.setShortcode(sb.toString());// 省市区首字母
//				regions.add(r);
			}
			// 3: 调用业务层 传递 List<Region>
			facadeService.getItemerService().batchImport(itemers);
//			facadeService.getRegionService().batchImport(regions);
			push(true);
		} catch (Exception e) {
			push(false);
			e.printStackTrace();
		}
		return "batchUpload";
	}
		
	
	 //上传文件存放路径   
//    private final static String UPLOADDIR = "/upload";   
    //上传文件集合   
    private List<File> file;   
    //上传文件名集合   
    private List<String> fileFileName;   
    //上传文件内容类型集合   
    private List<String> fileContentType;   
    public List<File> getFile() {   
        return file;   
    }   

    public void setFile(List<File> file) {   
        this.file = file;   
    }   

   public List<String> getFileFileName() {   
       return fileFileName;   
   }   

    public void setFileFileName(List<String> fileFileName) {   
        this.fileFileName = fileFileName;   
    }   

    public List<String> getFileContentType() {   
        return fileContentType;   
    }   

    public void setFileContentType(List<String> fileContentType) {   
        this.fileContentType = fileContentType;   
    }   
    @Action(value="itemerAction_upload",results={@Result(name="upload",type="json")})
    public String upload(){   
        System.out.println(this.getFileFileName());  
        for (int i = 0; i < file.size(); i++) {   
            //循环上传每个文件   
            uploadFile(i);   
        }   
        return "upload";   
    }   

    //执行上传功能   
    private void uploadFile(int i){   
        try {   
//        	FileSystemXmlApplicationContext.class.get
            InputStream in = new FileInputStream(file.get(i));   
            String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR);  
            File fileLocation = new File(dir);  
            //此处也可以在应用根目录手动建立目标上传目录  
            if(!fileLocation.exists()){  
                boolean isCreated  = fileLocation.mkdir();  
                if(!isCreated) {  
                    //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
                    return;  
                }  
            }  
            String fileName=this.getFileFileName().get(i);  
            File uploadFile = new File(dir, fileName);   
            OutputStream out = new FileOutputStream(uploadFile);   
            byte[] buffer = new byte[1024 * 1024];   
            int length;   
            while ((length = in.read(buffer)) > 0) {   
                out.write(buffer, 0, length);   
            }   
            in.close();   
            out.close();   
        } catch (FileNotFoundException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        } catch (IOException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        }   
    }   
}
