package com.cmos.service;
import com.cmos.domain.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 8:59
 */
@Service
public interface StudentService {

    List<Student> selectAll();

    int deleteByPrimaryKey(Integer stuId);

    int insert(Student record);

    int updateByExample(@Param("example") Student example);
}
