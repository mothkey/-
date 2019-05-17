package com.hm.zhuydemo.entity;

/**\
 * 班级实体
 */
public class ClassEntity {
    private String id;

    /**姓名*/
    private String name;

    /**班级*/
    private String pid;

    /**编码*/
    private String code;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
