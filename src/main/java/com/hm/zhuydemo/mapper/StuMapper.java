package com.hm.zhuydemo.mapper;

import com.hm.zhuydemo.entity.ClassEntity;
import com.hm.zhuydemo.entity.FacultyEntity;
import com.hm.zhuydemo.entity.StuEntity;
import com.hm.zhuydemo.entityVO.StuEntityVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StuMapper {

    /**
     * 保存学生对象到数据库中并返回受SQL影响的纪录数目
     * @param stu 需要被保存的对象
     * @return
     */
    int save(StuEntity stu);

    int delStu(StuEntity stu);

    List<StuEntityVO> getStuList(StuEntityVO stu);

    List<ClassEntity> getClassList();

    List<FacultyEntity> getFacultyList();
}
