package cn.zx.ghjmaven.action.intercepter;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import cn.zx.ghjmaven.domain.User;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

@Component("myintercepter")
public class MyLoginIntercepter extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//登录认证
		User existsUser = (User)ServletActionContext.getRequest().getSession().getAttribute("existsUser");
		if (existsUser == null) {
			return "no_login";
		}
		return invocation.invoke();
	}

}
