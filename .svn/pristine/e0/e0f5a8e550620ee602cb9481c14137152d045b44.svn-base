package cn.zx.ghjmaven.action.intercepter;	

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import cn.zx.ghjmaven.domain.User;
import cn.zx.ghjmaven.service.FacadeService;

/** 
 * @author 作者 : 年轻的谷弟
 * @version 创建时间：2017年9月6日 下午4:17:21 
 * 类说明 :用作shiro权限管理的类，完成认证授权
 */
public class Realm extends AuthorizingRealm{
	@Autowired
	private FacadeService facadeService;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		System.out.println("这里是要干嘛的~~~~");
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获取令牌
		UsernamePasswordToken userToken = (UsernamePasswordToken) token;
		//获取真实用户
		String username = userToken.getUsername();
		//通过用户名获取用户信息
		User existUser = facadeService.getUserService().findUserByUsername(username);
		if (existUser != null) {
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(existUser,existUser.getEpassword(),super.getName());
			return info;
		}else {
			return null;
		}
	}
	
}
