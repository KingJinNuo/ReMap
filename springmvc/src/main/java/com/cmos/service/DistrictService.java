package com.cmos.service;
import com.cmos.domain.District;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 9:00
 */
public interface DistrictService {

    List<District> selectAll();

    int deleteByPrimaryKey(Integer disId);

    int insert(District record);

    int updateByExample(@Param("example") District example);


}
