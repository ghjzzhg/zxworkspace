package cn.zx.ghjmaven.action.bc;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.Customer;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;


@Controller("customerAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class CustomerAction extends BaseAction<Customer>{
	private Customer customer;
	//添加客户
	@Action(value="customerAction_save",results={@Result(name="save",location="/WEB-INF/pages/base/customer.jsp")})
	public String save(){
		try {
			facadeService.getCustomerService().save(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "save";
	}
	
	//查询客户
	@Action(value="customerAction_pageQuery",results={@Result(name="pageQuery",type="json")})
	public String pageQuery(){
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			PageRequest pageRequest = new PageRequest(page-1, rows);
			Page<Customer> pageData = facadeService.getCustomerService().pageQuery(pageRequest);
			data.put("total", pageData.getTotalElements());
			data.put("rows", pageData.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		push(data);
		return "pageQuery";
	}
}
