package cn.zx.ghjmaven.action.bc;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;

import cn.zx.ghjmaven.action.base.BaseAction;
import cn.zx.ghjmaven.domain.Attence;

@Controller("attenceAction")
@Scope("prototype")
@ParentPackage("ghjmaven")
@Namespace("/bc")
public class AttenceAction extends BaseAction<Attence>{
	
	@Action(value="attenceAction_pageQuery",results={@Result(name="pageQuery",type="json")})
	public String pageQuery(){
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			PageRequest pageRequest = new PageRequest(page-1, rows);
			Page<Attence> pageData = facadeService.getAttenceService().pageQuery(pageRequest);
			data.put("total", pageData.getTotalElements());
			data.put("rows", pageData.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		push(data);
		return "pageQuery";
	}
	
	@Action(value="attenceAction_save",results={@Result(name="save",location="/WEB-INF/pages/performance/attence.jsp")})
	public String save(){
		try {
			facadeService.getAttenceService().save(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "save";
	}
	
}
