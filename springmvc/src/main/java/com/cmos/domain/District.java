package com.cmos.domain;


/**
 * Author:wx
 * 地区实体类
 */
public class District {
    private Integer disId;

    private String disName;

    public District() {
    }

    public District(Integer disId, String disName) {
        this.disId = disId;
        this.disName = disName;
    }

    public void setDisId(Integer disId) {
        this.disId = disId;
    }

    public void setDisName(String disName) {
        this.disName = disName;
    }

    public Integer getDisId() {
        return disId;
    }

    public String getDisName() {
        return disName;
    }

    @Override
    public String toString() {
        return "District{" +
                "disId=" + disId +
                ", disName='" + disName + '\'' +
                '}';
    }
}
