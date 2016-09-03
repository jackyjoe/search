package me.hncn.search.web.controller;

import me.hncn.search.handle.SearchHandle;
import me.hncn.search.handle.imp.GoogleSearchHandle;
import me.hncn.search.model.SearchResult;
import me.hncn.search.spring.SpringContextHolder;
import me.hncn.search.web.dto.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by XMH on 2016/5/21.
 */
@Controller
public class IndexController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String home(){
        return "index";
    }
    @RequestMapping(value = "/s",method = RequestMethod.GET)
    public String search(@RequestParam(required = false) String k,@RequestParam(required = false,defaultValue = "1")Integer p ,Model model){
        Map<String,Object> param = new HashMap<>();
        param.put("customSearchUrl","https://www.googleapis.com/customsearch/v1element");
        param.put("key","ss"); // from cse.google.com
        param.put("cx","ss");  // from cse.google.com
        param.put("rsz","filtered_cse");  // from cse.google.com
        param.put("hl","zh_CN");  // from cse.google.com
        param.put("GL","CN");  // from cse.google.com
        param.put("googlehost","www.google.com.hk"); // from cse.google.com
        SearchHandle searchHandle = SpringContextHolder.getBean(GoogleSearchHandle.class);
        Pagination<SearchResult> pagination = new Pagination<>(10,100,p);
        if(pagination.getTotalPage()>=p&&p>=1){
            List<SearchResult> resultList =searchHandle.doSearch(param,k,pagination.getBeginIndex(),10);
            pagination.setPageList(resultList);
        }
        model.addAttribute("pagination",pagination);
        model.addAttribute("k",k);
        return "search";
    }
}
