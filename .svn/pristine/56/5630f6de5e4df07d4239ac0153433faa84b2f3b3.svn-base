package cn.zx.ghjmaven.action.user;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.User;
import cn.zx.ghjmaven.service.UserService;


//注解开发-action由spring创建
@Controller("userAction")
//值栈多例
@Scope("prototype")
//定义struts.xml中的包名
@ParentPackage("ghjmaven")
//定义浏览器访问的名称空间
@Namespace("/user")
public class UserAction extends BaseAction<User>{
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;

	//判断验证码是否存在且正确
	@Action(value="userAction_validCheckCode",results={@Result(name="validCheckCode",type="json")})
	public String validCheckCode(){
		//获取用户输入验证码
		String input_code = getParameter("checkcode");
		//判断验证码不可为空
		if (StringUtils.isNotBlank(input_code)) {
			//获取页面的验证码
			String session_code = (String)getSessionAttribute("key");
			if (session_code.equalsIgnoreCase(input_code)) {
				push(true);
			}else {
				push(false);
			}
		}else {
			this.addActionError(this.getText("checkcode.isnotnull.error"));
			push(false);
		}
		return "validCheckCode";
	}
	@Action(value="userAction_login",
		results={@Result(name="login_error",location="/login.jsp"),
				@Result(name="login_param_error",location="/login.jsp"),
				@Result(name="checkcode_error",location="/login.jsp"),
				@Result(name="login_ok",location="/index.jsp",type="redirect")
		})
	@InputConfig(resultName="login_param_error")
	public String login(){
		//获取页面验证码和用户输入验证码,且是一次性的
		String input_code = getParameter("checkcode");
		String session_code = (String)getSessionAttribute("key");
		//一次性验证码使用完立刻移出
		removeSessionAttribute("key");
		if (StringUtils.isNotBlank(input_code)) {
			if (input_code.equals(session_code)) {
				//验证码相同
				UserService userService = facadeService.getUserService();
				User existsUser = userService.findUserByUsernameAndPassword(model.getUsername(),model.getPassword());
				if (existsUser == null) {
					//用户名或密码错误
					this.addActionError(this.getText("usernameorpassword.param.error"));
					return "login_error";
				}else {
					//用户存在，登录成功
					setSessionAttribute("existsUser", existsUser);
					return "login_ok";
				}
			} else {
				//验证码不正确
				this.addActionError(this.getText("checkcode.param.error"));
				return "checkcode_error";
			}
		}else {
			//验证码为空，请重新输入
			this.addActionError(this.getText("checkcode.isnotnull.error"));
			return "checkcode_error";
		}
	}
	
	
	//修改密码
	@Action(value="userAction_editPassword",results={@Result(name="editPassword",type="json")})
	public String editPassword(){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			User existsUser = (User)getSessionAttribute("existsUser");
			facadeService.getUserService().editPassword(model.getPassword(), existsUser.getId());
			map.put("flag", true);
		} catch (Exception e) {
			map.put("flag", false);
			e.printStackTrace();
		}
		push(map);
		return "editPassword";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
