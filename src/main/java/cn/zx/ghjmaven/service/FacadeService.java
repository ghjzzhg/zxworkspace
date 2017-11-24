package cn.zx.ghjmaven.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("facadeService")
public class FacadeService {
	//管理所有业务层获取对象实例
	//注入业务层实例
	@Autowired
	private UserService userService;
	public UserService getUserService(){
		return userService;
	}
	
	@Autowired
	private EmployeeService employeeService;
	public EmployeeService getEmployeeService(){
		return employeeService;
	}
	
	@Autowired
	private CustomerService customerService;
	public CustomerService getCustomerService(){
		return customerService;
	}
	
	@Autowired
	private ItemerService itemerService;
	public ItemerService getItemerService(){
		return itemerService;
	}
	
	@Autowired
	private AttenceService attenceService;
	public AttenceService getAttenceService(){
		return attenceService;
	}
}
