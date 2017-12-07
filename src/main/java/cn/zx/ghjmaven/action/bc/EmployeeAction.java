package cn.zx.ghjmaven.action.bc;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.EmailAuthenticator;
import cn.zx.ghjmaven.domain.Employee;
import cn.zx.ghjmaven.utils.BaiduMapUtils;
import cn.zx.ghjmaven.utils.MyFileUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Controller("employeeAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class EmployeeAction extends BaseAction<Employee>{

	/*private HtmlAction htmlAction;*/
	private Employee employee;
//	public Employee getEmployee(){
//		return employee;
//	}
	//添加员工
	@Action(value="employeeAction_save",results={@Result(name="save",location="/WEB-INF/pages/base/employee.jsp")})
	public String save(){
		try {
			facadeService.getEmployeeService().save(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "save";
	}
	
	@Action(value="employeeAction_pageQuery", results = { @Result(name = "pageQuery", type = "json") })
	public String pageQuery(){
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			String path = null;
			String name = null;
			/*send_email();*/
			/*htmlAction.getProvince("2015年统计用区划代码和城乡划分代码","http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/index.html","json");*/
			
			String lat = "28.694439";
			String lng = "115.939728";
			String city = BaiduMapUtils.getCity(lat, lng);
//			System.out.println(city);
			
			Map<String, Double> map = BaiduMapUtils.getLngAndLat("上海市新银大厦");
//			System.out.println(map.get("lng") + "--------" + map.get("lat"));
			
			PageRequest pageRequest = new PageRequest(page-1, rows);
			Page<Employee> pageData = facadeService.getEmployeeService().pageQuery(pageRequest);
			//将总记录数和页数放入值栈栈顶
			data.put("total", pageData.getTotalElements());
			data.put("rows", pageData.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		push(data);
		return "pageQuery";
	}
	
	//分页查询
//	@Action(value="employeeAction_pageQuery")
//	public String pageQuery(){
//		
//		try {
//			//封装查询条件，多表；连接
//			Specification<Employee> spec = new Specification<Employee>() {
//				//root实例模型。用来查询实例
//				//CriteriaQuery是AbsreactQuery子类，提供查询的方法
//				//CriteriaBuilder构建器对象
//				public Predicate toPredicate(Root<Employee> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
//					//首先判断有无输入姓名
//					//创建集合，存放所有满足条件的
//					List<Predicate> list = new ArrayList<Predicate>();
//					if (StringUtils.isNotBlank(model.getName())){
//						Predicate p1 = cb.like(root.get("name").as(String.class), "%" + model.getName() + "%");
//						list.add(p1);
//					}
//					if (StringUtils.isNotBlank(model.getRegister())) {
//						Predicate p2 = cb.like(root.get("register").as(String.class), "%" + model.getRegister() +"%");
//						list.add(p2);
//					}
//					if (StringUtils.isNotBlank(model.getPosition())) {
//						Predicate p3 = cb.like(root.get("position").as(String.class), "%" + model.getPosition() + "%");
//						list.add(p3);
//					}
//					//将所有的条件转换为泛型的数组
//					Predicate[] p = new Predicate[list.size()];
//					return cb.and(list.toArray(p));
//				}
//			};
////			PageRequest pageRequest = new PageRequest(page-1, rows);
//			Page<Employee> pageData = facadeService.getEmployeeService().pageQuery(spec, getPageRequest());
//			//将总记录数和页数放入值栈栈顶
//			setPageData(pageData);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "pageQuery";
//	}

	//删除数据
	@Action(value = "employeeAction_batchDelete", results={@Result(name="batchDelete", type = "json")})
	public String batchDelete(){
		try {
			String ids = getParameter("ids");
			facadeService.getEmployeeService().bacthDelete(ids);
			push(true);
		} catch (Exception e) {
			push(false);
		}
		return "batchDelete";
	}
	
	//查询所有员工
	@Action(value="employeeAction_ajaxList",results={@Result(name="ajaxList",type="json")})
	public String ajaxList(){
		//获取有效的员工，没有离职的
		try {
			List<Employee> emplyees = facadeService.getEmployeeService().findEmployeeInUse();
			push(emplyees);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ajaxList";
	}
	
	//查询项目专员
	@Action(value="employeeAction_findMember",results={@Result(name="findMember",type="json")})
	public String findMember(){
		//获取有效的员工，没有离职的
		try {
			List<Employee> members = facadeService.getEmployeeService().findEmployeeByMember();
			push(members);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "findMember";
	}
	
	//查询项目专员
	@Action(value="employeeAction_findManager",results={@Result(name="findManager",type="json")})
	public String findManager(){
		//获取有效的员工，没有离职的
		try {
			List<Employee> managers = facadeService.getEmployeeService().findEmployeeByManager();
			push(managers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "findManager";
	}
		
	@Action(value="employeeAction_download")
	public String download(){
		try {
			Page<Employee> list =  facadeService.getEmployeeService().pageQuery(getPageRequest());
			//使用poi下载文件
			HSSFWorkbook workbook = new HSSFWorkbook();
			//创建sheet
			HSSFSheet sheet1 = workbook.createSheet("分区信息一");
			//创建row信息
			HSSFRow row = sheet1.createRow(0);
			//创建单元格头标
			row.createCell(0).setCellValue("编号");
			row.createCell(1).setCellValue("姓名");
			row.createCell(2).setCellValue("性别");
			row.createCell(3).setCellValue("入职日期");
			row.createCell(4).setCellValue("出生年月");
			row.createCell(5).setCellValue("户籍所在地");
			row.createCell(6).setCellValue("毕业院校");
			row.createCell(7).setCellValue("职务");
			row.createCell(8).setCellValue("社保账号");
			row.createCell(9).setCellValue("公积金账号");
			row.createCell(10).setCellValue("电话号码");
			row.createCell(11).setCellValue("是否离职");
			//获取数据
			if (list != null && list.getSize() != 0) {
				for (Employee e : list) {
					int lastRowNum = sheet1.getLastRowNum();
					HSSFRow lastRow = sheet1.createRow(lastRowNum + 1);
					lastRow.createCell(0).setCellValue(e.getId());
					lastRow.createCell(1).setCellValue(e.getName());
					lastRow.createCell(2).setCellValue(e.getSex());
					lastRow.createCell(3).setCellValue(e.getEntryday());
					lastRow.createCell(4).setCellValue(e.getBirthday());
					lastRow.createCell(5).setCellValue(e.getRegister());
					lastRow.createCell(6).setCellValue(e.getPosition());
					lastRow.createCell(7).setCellValue(e.getSchool());
					lastRow.createCell(8).setCellValue(e.getSocialsecurity());
					lastRow.createCell(9).setCellValue(e.getPublicfund());
					lastRow.createCell(10).setCellValue(e.getTelephone());
					lastRow.createCell(11).setCellValue(e.getDeltag());
				}
			}
			//response文件流
			HttpServletResponse response = ServletActionContext.getResponse();
			//设置文件名
			String filename = "中喜员工信息.xls";
			//设置文件输出头
			response.setHeader("Content-Disposition", "attachment;filename="+MyFileUtils.encodeDownloadFilename(filename, getRequest().getHeader("user-agent")));
			//设置文件类型servletAction.getMine
			ServletContext servletContext = ServletActionContext.getServletContext();
			response.setContentType(servletContext.getMimeType(filename));
			//下载输出流
			workbook.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		//下载不需要页面跳转
		return NONE;
	}
		
	 public static void send_email() throws Exception{
	        String to = "ghjzzhg@163.com";
	        String subject = "java邮件";//邮件主题
	        String content = "这是你的java邮件";//邮件内容
	        Properties properties = new Properties();
	        InputStream resourceAsStream = null;
	        try {
	        	//此处EmployeeAction为你的当前类
	        	resourceAsStream = EmployeeAction.class.getClassLoader().getResourceAsStream("/mail.properties");
//	            resourceAsStream = Object.class.getResourceAsStream("/mail.properties");
	            properties.load(resourceAsStream);
	        } finally{
	            if (resourceAsStream!=null) {
	                resourceAsStream.close();
	            }
	        }
	        System.err.println("properties:"+properties);
	        properties.put("mail.smtp.host", properties.get("mail.smtp.host"));
	        properties.put("mail.smtp.port", properties.get("mail.smtp.port"));
	        properties.put("mail.smtp.auth", "true");
	        Authenticator authenticator = new EmailAuthenticator(properties.get("userName").toString(), properties.get("password").toString());
	        javax.mail.Session sendMailSession = javax.mail.Session.getDefaultInstance(properties, authenticator);
	        MimeMessage mailMessage = new MimeMessage(sendMailSession);
	        mailMessage.setFrom(new InternetAddress(properties.get("userName").toString()));
	        // Message.RecipientType.TO属性表示接收者的类型为TO
	        mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
	        mailMessage.setSubject(subject, "UTF-8");
	        mailMessage.setSentDate(new Date());
	        // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
	        Multipart mainPart = new MimeMultipart();
	        // 创建一个包含HTML内容的MimeBodyPart
	        BodyPart html = new MimeBodyPart();
	        html.setContent(content.trim(), "text/html; charset=utf-8");
	        mainPart.addBodyPart(html);
	        mailMessage.setContent(mainPart);
	        Transport.send(mailMessage);
	    }

}
