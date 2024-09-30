package com.agile.equipmentCheck.domain;

import com.agile.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.agile.common.annotation.Excel;
import com.agile.common.core.domain.BaseEntity;

/**
 * 点检信息对象 echeck_info
 * 
 * @author agile
 * @date 2023-08-04
 */
public class EcheckInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 点检设备id */
    private Long checkId;

    /** 点检编号 */
    @Excel(name = "点检编号")
    private String checkNo;

    /** 使用人 */
    @Excel(name = "使用人")
    private String userName;

    /** 设备位置 */
    @Excel(name = "设备位置")
    private String checkPosition;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 设备id */
    @Excel(name = "设备id")
    private Long equipmentId;

    /** 点检状态 */
    @Excel(name = "点检状态")
    private String status;

    /** 删除标志 */
    private String delFlag;

    private SysDept dept;

    private Equipment equipment;

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public void setCheckId(Long checkId)
    {
        this.checkId = checkId;
    }

    public Long getCheckId()
    {
        return checkId;
    }
    public void setCheckNo(String checkNo)
    {
        this.checkNo = checkNo;
    }

    public String getCheckNo()
    {
        return checkNo;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setCheckPosition(String checkPosition) 
    {
        this.checkPosition = checkPosition;
    }

    public String getCheckPosition() 
    {
        return checkPosition;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("checkId", getCheckId())
            .append("checkNo", getCheckNo())
            .append("userName", getUserName())
            .append("checkPosition", getCheckPosition())
            .append("deptId", getDeptId())
            .append("equipmentId", getEquipmentId())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
