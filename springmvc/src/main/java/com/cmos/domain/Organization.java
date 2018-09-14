package com.cmos.domain;

/**
 * 学校实体类
 */
public class Organization {

    private Integer orgId;

    private String orgName;

    private Integer disId;

    public Organization(Integer orgId, String orgName, Integer disId) {
        this.orgId = orgId;
        this.orgName = orgName;
        this.disId = disId;
    }

    public Organization() {
    }

    public Integer getOrgId() {
        return orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public Integer getDisId() {
        return disId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public void setDisId(Integer disId) {
        this.disId = disId;
    }

    @Override
    public String toString() {
        return "Organization{" +
                "orgId=" + orgId +
                ", orgName='" + orgName + '\'' +
                ", disId=" + disId +
                '}';
    }
}