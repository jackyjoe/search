package me.hncn.search;

import me.hncn.search.handle.SearchHandle;
import me.hncn.search.handle.imp.GoogleSearchHandle;
import me.hncn.search.model.SearchResult;
import me.hncn.search.spring.SpringContextHolder;
import me.hncn.util.json.JsonUtil;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by XMH on 2016/5/21.
 */

public class GoogleSearchTest extends SpringTest{
    @Test
    public void GoogleSearchDemo(){
        Map<String,Object> param = new HashMap<>();
        param.put("customSearchUrl","https://www.googleapis.com/customsearch/v1element");
        param.put("key","AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY"); //医疗 key
        param.put("cx","011171077869724059247:fmmsum16kl8");
        param.put("rsz","filtered_cse");

        SearchHandle searchHandle = SpringContextHolder.getBean(GoogleSearchHandle.class);
        List<SearchResult> resultList =searchHandle.doSearch(param,"复旦大学",10,20);
        System.out.println(JsonUtil.getJsonStr(resultList));
    }

}
