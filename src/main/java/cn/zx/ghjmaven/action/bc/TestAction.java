package cn.zx.ghjmaven.action.bc;

import cn.zx.ghjmaven.domain.LinkTypeData;
import cn.zx.ghjmaven.domain.Rule;
import cn.zx.ghjmaven.service.ExtractService;
import org.junit.Test;

import java.util.List;

public class TestAction {
   /* @Test
    public void getDatasByClass() {
        Rule rule = new Rule("https://www.autohome.com.cn/4252/#pvareaid=103177",
        new String[]{ "query.enterprisename","query.registationnumber" }, new String[]{ "兴网","" }, "cont_right", Rule.CLASS, Rule.POST);
        List<LinkTypeData> extracts = ExtractService.extract(rule);
        printf(extracts);  
    }*/
   /* @Test
    public void getDatasByCssQueryUserBaidu(){
        Rule rule = new Rule("http://news.baidu.com/ns", new String[]{ "word" }, new String[]{ "支付宝" }, null, -1, Rule.GET);
        List<LinkTypeData> extracts = ExtractService.extract(rule);
        printf(extracts);
    }*/

    @Test
    public void getDatasByCssQuery(){
        Rule rule = new Rule("http://www.11315.com/search", new String[] { "name" }, new String[] { "兴网" }, "div.g-mn div.con-model", Rule.SELECTION, Rule.GET);
        List<LinkTypeData> extracts = ExtractService.extract(rule);  
        printf(extracts);  
    }
    public void printf(List<LinkTypeData> datas){
        for (LinkTypeData data : datas) {
            System.out.println(data.getLinkText());  
            System.out.println(data.getLinkHref());  
            System.out.println("***********************************");  
        }  
  
    }  
}  