package com.cmos.service.Impl;
import com.cmos.dao.StudentDao;
import com.cmos.domain.Student;
import com.cmos.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author ：wx
 * Date ：Created in  2018/9/5 8:59
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

    @Override
    public List<Student> selectAll() {
       List<Student> list = studentDao.selectAll();
        return list;
    }

    @Override
    public int deleteByPrimaryKey(Integer stuId) {
        int reault = studentDao.deleteByPrimaryKey(stuId);
        return reault;
    }

    @Override
    public int insert(Student record) {
        int result = studentDao.insert(record);
        return result;
    }

    @Override
    public int updateByExample(Student example) {
        int result = studentDao.updateByExample(example);
        return result;
    }
}
