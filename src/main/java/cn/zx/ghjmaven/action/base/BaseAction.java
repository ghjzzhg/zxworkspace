package cn.zx.ghjmaven.action.base;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.PageData;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.zx.ghjmaven.service.FacadeService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

@SuppressWarnings("all")
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	protected T model;
	public T getModel() {
		return model;
	}
	protected int page;
	protected int rows = 20;

	public void setPage(int page) {
		this.page = page;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}
	//封装getPageRequest对象
	public PageRequest getPageRequest(){
		PageRequest pageRequest = new PageRequest(page, rows);
		
		return pageRequest;
	}
	
//	父类接受子类具体的类，响应分页
	protected Page<T> pageData;
	
	public Page<T> getPageData() {
		return pageData;
	}

	public void setPageData(Page<T> pageData) {
		this.pageData = pageData;
	}
	
	// 当前action 在值栈内部 getObj 方法 可以通过结果 key 搜索到
	public Object getObj() {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("total", pageData.getTotalElements());// 总记录数
		data.put("rows", pageData.getContent());// 每页数据
		return data;
	}
	
	//注入门面业务类
	@Autowired
	protected FacadeService facadeService;
	
	//获取参数化类型
	public BaseAction(){
		//获取model的实例对象
		Type superclass = this.getClass().getGenericSuperclass();
		//转为参数化类型
		ParameterizedType parameterizedType = (ParameterizedType)superclass;
		//获取一个泛型参数
		Class<T> modelClass = (Class<T>)parameterizedType.getActualTypeArguments()[0];
		
		try {
			model = modelClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	//父类肥壮通用方法 值栈--分页--session--request
	//获取值栈
	public ValueStack getValueStack(){
		return ActionContext.getContext().getValueStack();
	}
	//压入栈顶
	public void push(Object obj){
		getValueStack().push(obj);
	}
	//map结构压入栈顶
	public void push(String key,Object obj){
		getValueStack().set(key, obj);
	}
	
	//session操作
	public HttpSession getSession(){
		return ServletActionContext.getRequest().getSession();
	}
	public void setSessionAttribute(String key,Object obj){
		getSession().setAttribute(key,obj);
	}
	public void removeSessionAttribute(String key){
		getSession().removeAttribute(key);
	}
	public Object getSessionAttribute(String key){
		return getSession().getAttribute(key);
	}
	
	//获取请求和参数
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	public String getParameter(String key){
		return getRequest().getParameter(key);
	}
	
	//获取分页对象  接受页面的页码和每页显示记录
	protected int pageNum;//页码
	protected int pageSize = 20;//每页显示数量
	public void getPageNum(int pageNum){
		this.pageNum = pageNum;
	}
	public void getPageSize(int pageSize){
		this.pageSize = pageSize;
	}
	
	
}
