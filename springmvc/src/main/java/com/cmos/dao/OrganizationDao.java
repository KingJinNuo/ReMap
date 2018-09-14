package com.cmos.dao;

import java.util.List;

import com.cmos.domain.Organization;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationDao{

    long countByExample(Organization example);

    int deleteByExample(Organization example);

    int deleteByPrimaryKey(Integer orgId);

    int insert(Organization record);

    int insertSelective(Organization record);

    List<Organization> selectAll();

    Organization selectByPrimaryKey(Integer orgId);

    int updateByExampleSelective(@Param("record") Organization record, @Param("example") Organization example);

    int updateByExample(@Param("example") Organization example);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);
}