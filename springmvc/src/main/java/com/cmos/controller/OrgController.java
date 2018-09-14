package com.cmos.controller;
import com.cmos.domain.Organization;
import com.cmos.service.Impl.OrganizationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Author ：wx
 * Date ：Created in  2018/9/10 16:20
 */
@SessionAttributes( value = "organization")
@Controller
public class OrgController {
    @Autowired
    private OrganizationServiceImpl organizationService;

    /**
     * 将查询到的信息封装到ModelAndView中，在通过types存放在session中
     * @param modelAndView
     * @return
     */
    @RequestMapping(value = "/organization")
    public ModelAndView getOrganization(ModelAndView modelAndView){
        modelAndView.setViewName("list");
        modelAndView.addObject("organization",organizationService.selectAll());
        return modelAndView;
    }

    @RequestMapping(value = "/organization/{orgId}",method = RequestMethod.DELETE)
    public String deleteOrganization(@PathVariable("orgId") Integer orgId){
        organizationService.deleteByPrimaryKey(orgId);
        return "redirect:/organization";
    }

    @RequestMapping(value="/organizationInsert",method = RequestMethod.POST)
    public String insertOrganization(Integer orgId, String orgName,Integer disId){
        organizationService.insert(new Organization(orgId,orgName,disId));
        return "redirect:/organization";
    }

    @RequestMapping(value = "/organizationUpdate",method = RequestMethod.PUT)
    public String updateOrganization(Integer orgId, String orgName,Integer disId){
        organizationService.updateByExample(new Organization(orgId,orgName,disId));
        return "redirect:/organization";
    }

}
