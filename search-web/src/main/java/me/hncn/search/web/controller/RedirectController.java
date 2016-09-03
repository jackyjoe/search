package me.hncn.search.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



/**
 * Created by XMH on 2016/5/28.
 */
@Controller
@RequestMapping(value = "/redirect")
public class RedirectController {
    @RequestMapping(value = "/go")
    public String redirect(@RequestParam(required = true) String url){

        return "redirect:"+url;
    }
}
