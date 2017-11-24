package cn.zx.ghjmaven.action.result;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import flexjson.JSONSerializer;

public class MyFlexJson implements Result{
	public void execute(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		HttpServletResponse response = (HttpServletResponse) actionContext.get(StrutsStatics.HTTP_RESPONSE);
		// flexjson 序列化对象
		JSONSerializer serializer = new JSONSerializer();
		String jsonString = serializer.serialize(findRootObject(invocation));
		response.setContentType("text/json;charset=utf-8");// 中文乱码问题
		response.getWriter().print(jsonString);
	}

	// 序列化对象获取 从 栈顶获取
	protected Object findRootObject(ActionInvocation invocation) {
		Object rootObject = invocation.getStack().peek(); // model overrides action
		return rootObject;
	}
}
