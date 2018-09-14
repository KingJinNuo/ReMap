package com.cmos.service.Impl;
import com.cmos.dao.OrganizationDao;
import com.cmos.domain.Organization;
import com.cmos.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 9:01
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public List<Organization> selectAll() {
        List<Organization> list = organizationDao.selectAll();
        return list;
    }

    @Override
    public int deleteByPrimaryKey(Integer orgId) {
        int result = organizationDao.deleteByPrimaryKey(orgId);
        return result;
    }

    @Override
    public int insert(Organization record) {
        int result = organizationDao.insert(record);
        return result;
    }

    @Override
    public int updateByExample(Organization example) {
        int result = organizationDao.updateByExample(example);
        return result;
    }
}
