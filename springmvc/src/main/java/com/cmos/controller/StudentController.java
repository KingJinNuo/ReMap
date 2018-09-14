package com.cmos.controller;
import com.cmos.domain.Student;
import com.cmos.service.Impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Author ：wx
 * Date ：Created in  2018/9/10 16:20
 */
@SessionAttributes(value = {"student"})
@Controller
public class StudentController {
    @Autowired
    private StudentServiceImpl studentService;

    @RequestMapping(value = "/student")
    public String getStudent(ModelMap modelMap){
        modelMap.put("student",studentService.selectAll());
        return "list";
    }

    @RequestMapping(value = "/student/{stuId}",method = RequestMethod.DELETE)
    public String deleteStudent(@PathVariable("stuId") Integer stuId){
        studentService.deleteByPrimaryKey(stuId);
        return "redirect:/student";
    }

    @RequestMapping(value="/studentInsert",method = RequestMethod.POST)
    public String insertStudent(Integer stuId,String stuName,String stuSex,String stuAdd,Integer unitId){
        studentService.insert(new Student(stuId,stuName,stuSex,stuAdd,unitId));
        return "redirect:/student";
    }

    @RequestMapping(value = "/studentUpdate",method = RequestMethod.PUT)
    public String updateStudent(Integer stuId,String stuName,String stuSex,String stuAdd,Integer unitId){
        studentService.updateByExample(new Student(stuId,stuName,stuSex,stuAdd,unitId));
        return "redirect:/student";
    }

}
