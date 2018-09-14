package com.cmos.service.Impl;
import com.cmos.dao.DistrictDao;
import com.cmos.domain.District;
import com.cmos.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 9:00
 */
@Service
public class DistrictServiceImpl implements DistrictService {
    @Autowired
    private DistrictDao districtDao;

    @Override
    public List<District> selectAll() {
        List<District> list = districtDao.selectAll();
        return list;
    }

    @Override
    public int deleteByPrimaryKey(Integer disId) {
        int result = districtDao.deleteByPrimaryKey(disId);
        return result;
    }

    @Override
    public int insert(District record) {
        int result = districtDao.insert(record);
        return result;
    }

    @Override
    public int updateByExample(District example) {
        int result = districtDao.updateByExample(example);
        return result;

    }


}
