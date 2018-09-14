package com.cmos.service;
import com.cmos.domain.Unit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 8:59
 */
public interface UnitService {

    List<Unit> selectAll();

    int deleteByPrimaryKey(Integer unitId);

    int insert(Unit record);

    int updateByExample(@Param("example") Unit example);
}
