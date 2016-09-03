package me.hncn.search.handle.imp;

import com.fasterxml.jackson.core.type.TypeReference;
import me.hncn.search.handle.SearchHandle;
import me.hncn.search.model.SearchResult;
import me.hncn.util.http.HttpClient;
import me.hncn.util.json.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**GoogleSearchHandle
 * Created by XMH on 2016/5/21.
 */
@Component
public class GoogleSearchHandle implements SearchHandle {
    private static Logger logger = LoggerFactory.getLogger(GoogleSearchHandle.class);
    @Override
    public List<SearchResult> doSearch(Map<String,Object> param,String keyWord, int start, int pageSize) {
        param.put("q",keyWord);
        param.put("start",start);
        param.put("num",pageSize);
        try {
            String customSearchUrl = "https://www.googleapis.com/customsearch/v1element";
            String result = HttpClient.sendGet(customSearchUrl,param);
            Map<String,Object> re = JsonUtil.getMap(result);
            if(re!=null){
                String resultsStr = JsonUtil.getJsonStr(re.get("results"));
                return JsonUtil.getObj(resultsStr, new TypeReference<List<SearchResult>>() {});
            }
        } catch (IOException e) {
            logger.error("search error",e);
        }

        return null;
    }
}
