package com.cmos.dao;

import com.cmos.domain.Unit;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UnitDao {

    long countByExample(Unit example);

    int deleteByExample(Unit example);

    int deleteByPrimaryKey(Integer unitId);

    int insert(Unit record);

    int insertSelective(Unit record);

    List<Unit> selectAll();

    Unit selectByPrimaryKey(Integer unitId);

    int updateByExampleSelective(@Param("record") Unit record, @Param("example") Unit example);

    int updateByExample(@Param("example") Unit example);

    int updateByPrimaryKeySelective(Unit record);

    int updateByPrimaryKey(Unit record);
}