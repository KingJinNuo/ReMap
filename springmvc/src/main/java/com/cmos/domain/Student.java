package com.cmos.domain;

/**
 * 学生实体类
 */
public class Student {

    private Integer stuId;

    private String stuName;

    private String stuSex;

    private String stuAdd;

    private Integer unitId;

    public Student(Integer stuId, String stuName, String stuSex, String stuAdd, Integer unitId) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.stuSex = stuSex;
        this.stuAdd = stuAdd;
        this.unitId = unitId;
    }

    public Student() {
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public void setStuAdd(String stuAdd) {
        this.stuAdd = stuAdd;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public Integer getStuId() {
        return stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public String getStuSex() {
        return stuSex;
    }

    public String getStuAdd() {
        return stuAdd;
    }

    public Integer getUnitId() {
        return unitId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuId=" + stuId +
                ", stuName='" + stuName + '\'' +
                ", stuSex='" + stuSex + '\'' +
                ", stuAdd='" + stuAdd + '\'' +
                ", unitId=" + unitId +
                '}';
    }
}