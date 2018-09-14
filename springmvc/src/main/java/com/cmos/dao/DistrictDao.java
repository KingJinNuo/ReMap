package com.cmos.dao;


import com.cmos.domain.District;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DistrictDao {


    int deleteByPrimaryKey(Integer disId);

    int insert(District record);

    int updateByExample(@Param("example") District example);

    List<District> selectAll();


}