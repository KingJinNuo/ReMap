package com.cmos.service;
import com.cmos.domain.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 9:01
 */
public interface OrganizationService {

    List<Organization> selectAll();

    int deleteByPrimaryKey(Integer orgId);

    int insert(Organization record);

    int updateByExample(@Param("example") Organization example);

}
