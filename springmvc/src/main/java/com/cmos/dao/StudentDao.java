package com.cmos.dao;

import com.cmos.domain.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {

    long countByExample(Student example);

    int deleteByExample(Student example);

    int deleteByPrimaryKey(Integer stuId);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectAll();

    Student selectByPrimaryKey(Integer stuId);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") Student example);

    int updateByExample(@Param("example") Student example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}