package cn.zx.ghjmaven.domain;	
/** 
 * @author 作者 : 年轻的谷弟
 * @version 创建时间：2017年9月13日 下午8:19:14 
 * 类说明   文件上传状态
 */
public enum UploadState {
	UPLOAD_SUCCSSS(0, "上传文件成功！"),
    UPLOAD_FAILURE(1, "上传文件失败！"),
    UPLOAD_TYPE_ERROR(2, "上传文件类型错误！"),
    UPLOAD_OVERSIZE(3, "上传文件过大！"),
    UPLOAD_ZEROSIZE(4, "上传文件为空！"),
    UPLOAD_NOTFOUND(5, "上传文件路径错误！");
      
    private String state;  
    private int flag;  
    public String getState() {  
        return this.state;  
    }  
      
    public int getFlag() {  
        return this.flag;  
    }  
    UploadState(int flag, String state) {  
        this.state = state;  
        this.flag = flag;  
    }  
}
