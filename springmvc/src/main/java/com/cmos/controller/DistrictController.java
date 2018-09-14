package com.cmos.controller;
import com.cmos.domain.District;
import com.cmos.service.Impl.DistrictServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * Author ：wx
 * Date ：Created in  2018/9/10 16:20
 * @SessionAttributes(value={"district"} type={String.class})
 */
@SessionAttributes(value={"district"})
@Controller
public class DistrictController {
    @Autowired
    private DistrictServiceImpl districtServiceImpl;

    /**
     * 传参map modelMap model类型，返回String
     * springmvc会将模型信息放在request域
     * @param map
     * @return
     */
    @RequestMapping(value = "/district")
    public String  getDistrict(Map<String,Object> map){
        map.put("district",districtServiceImpl.selectAll());
        return "list";
    }

    @RequestMapping(value = "/district/{disId}",method = RequestMethod.DELETE)
    public String deleteDistrict(@PathVariable("disId") Integer disId){
        districtServiceImpl.deleteByPrimaryKey(disId);
        return "redirect:/district";
    }

    @RequestMapping(value="/districtInsert",method = RequestMethod.POST)
        public String insertDistrict(Integer disId,String disName){
        District example = new District();
        example.setDisId(disId);
        example.setDisName(disName);
        districtServiceImpl.insert(example);
        return "redirect:/district";
    }

    @RequestMapping(value = "/districtUpdate",method = RequestMethod.PUT)
    public String updateDistrict(Integer disId,String disName){
        districtServiceImpl.updateByExample(new District(disId,disName));
        return "redirect:/district";
    }

}
