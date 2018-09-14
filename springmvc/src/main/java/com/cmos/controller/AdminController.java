package com.cmos.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Author ：wx
 * Date ：Created in  2018/9/13 15:47
 */
@SessionAttributes(value = {"ppp"},types = {String.class})
@Controller
public class AdminController {

    @RequestMapping("/userLogin")
    public String login(Map<String,Object> map, String username, String password){
        if(username.equals("admin")&&password.equals("123")){
            map.put("currentuser",username);
            map.put("currentpassword",password);
            return "list";
        }
        return "login";
    }
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session, SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "list";
    }

}
