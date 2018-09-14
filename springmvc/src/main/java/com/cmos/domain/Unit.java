package com.cmos.domain;


/**
 * 班级实体类
 */
public class Unit {

    private Integer unitId;

    private String unitName;

    private Integer orgId;

    public Integer getUnitId() {
        return unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public Unit(Integer unitId, String unitName, Integer orgId) {
        this.unitId = unitId;
        this.unitName = unitName;
        this.orgId = orgId;
    }

    public Unit() {
    }

    @Override
    public String toString() {
        return "Unit{" +
                "unitId=" + unitId +
                ", unitName='" + unitName + '\'' +
                ", orgId=" + orgId +
                '}';
    }
}