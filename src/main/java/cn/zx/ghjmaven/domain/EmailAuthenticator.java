package cn.zx.ghjmaven.domain;	



import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/** 
 * @author 作者 : 年轻的谷弟
 * @version 创建时间：2017年9月2日 下午7:05:56 
 * 类说明 
 */
public class EmailAuthenticator extends Authenticator{
	String userName = null;
    String password = null;
    
    public EmailAuthenticator() {
    }
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public EmailAuthenticator(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
    
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }
}
