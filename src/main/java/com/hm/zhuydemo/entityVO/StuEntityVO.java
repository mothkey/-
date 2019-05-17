package com.hm.zhuydemo.entityVO;

import com.hm.zhuydemo.entity.StuEntity;

/**
 * 学生VO
 */
public class StuEntityVO extends StuEntity {

    /**班级名称*/
    private String className;

    /**院系名称*/
    private String facultName;

    private String classId;

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getFacultName() {
        return facultName;
    }

    public void setFacultName(String facultName) {
        this.facultName = facultName;
    }
}
