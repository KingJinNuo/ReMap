package com.cmos.controller;
import com.cmos.domain.Unit;
import com.cmos.service.Impl.UnitServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Author ：wx
 * Date ：Created in  2018/9/10 16:20
 */
@SessionAttributes(value = {"unit"})
@Controller
public class UnitController {
    @Autowired
    private UnitServiceImpl unitService;

    @RequestMapping(value = "/unit")
    public String getUnit(Model model){
        model.addAttribute("unit",unitService.selectAll());
        return "list";
    }

    @RequestMapping(value = "/unit/{unitId}",method = RequestMethod.DELETE)
    public String deleteUnit(@PathVariable("unitId") Integer unitId){
        unitService.deleteByPrimaryKey(unitId);
        return "redirect:/unit";
    }

    @RequestMapping(value="/unitInsert",method = RequestMethod.POST)
    public String insertUnit(Integer unitId,String unitName,Integer orgId){
        unitService.insert(new Unit(unitId,unitName,orgId));
        return "redirect:/unit";
    }

    @RequestMapping(value = "/unitUpdate",method = RequestMethod.PUT)
    public String updateUnit(Integer unitId,String unitName,Integer orgId){
        unitService.updateByExample(new Unit(unitId,unitName,orgId));
        return "redirect:/unit";
    }

}
