package com.hm.zhuydemo.service.impl;

import com.hm.zhuydemo.entity.ClassEntity;
import com.hm.zhuydemo.entity.FacultyEntity;
import com.hm.zhuydemo.entity.StuEntity;
import com.hm.zhuydemo.entityVO.StuEntityVO;
import com.hm.zhuydemo.mapper.StuMapper;
import com.hm.zhuydemo.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.List;

@Service
public class StuServiceImpl implements StuService {

    @Autowired
    private StuMapper stuMapper;

    /**
     * 保存学生
     * @param stu
     * @return
     */
    @Transactional
    @Override
    public int save(StuEntity stu) {
        return stuMapper.save(stu); //调用mapper 中的save
    }

    @Override
    public List<StuEntityVO> getStuList(StuEntityVO stu) {
        return stuMapper.getStuList(stu);
    }

    @Override
    public List<ClassEntity> getClassList() {
        return stuMapper.getClassList();
    }

    @Override
    public List<FacultyEntity> getFacultyList() {
        return stuMapper.getFacultyList();
    }

    @Override
    public int delStu(StuEntity stu) {
        return stuMapper.delStu(stu);
    }
}
