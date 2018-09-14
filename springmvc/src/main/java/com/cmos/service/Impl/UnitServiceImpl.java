package com.cmos.service.Impl;
import com.cmos.dao.UnitDao;
import com.cmos.domain.Unit;
import com.cmos.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 8:59
 */
@Service
public class UnitServiceImpl implements UnitService {

    @Autowired
    private UnitDao unitDao;
    @Override
    public List<Unit> selectAll() {
        List<Unit> list = unitDao.selectAll();
        return list;
    }

    @Override
    public int deleteByPrimaryKey(Integer unitId) {
        int result = unitDao.deleteByPrimaryKey(unitId);
        return result;
    }

    @Override
    public int insert(Unit record) {
        int result = unitDao.insert(record);
        return result;
    }

    @Override
    public int updateByExample(Unit example) {
        int reslut = unitDao.updateByExample(example);
        return reslut;
    }
}
