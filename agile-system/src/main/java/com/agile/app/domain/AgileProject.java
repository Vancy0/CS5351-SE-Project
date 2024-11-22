package com.agile.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.agile.common.annotation.Excel;
import com.agile.common.core.domain.BaseEntity;

/**
 * 项目对象 agile_project
 * 
 * @author zicky
 * @date 2024-11-19
 */
public class AgileProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 项目id */
    @Excel(name = "项目id")
    private Long projectId;

    /** 项目名 */
    @Excel(name = "项目名")
    private String projectName;

    /** 项目状态(1进行中，2已完结) */
    @Excel(name = "项目状态(1进行中，2已完结)")
    private String status;

    /** 项目负责人id(user_name) */
    @Excel(name = "项目负责人id(user_name)")
    private String managerId;

    /** 负责人名字(nick_name) */
    @Excel(name = "负责人名字(nick_name)")
    private String managerName;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date verifyTime;

    /** 删除标记，0正常，1删除 */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setProjectId(Long projectId) 
    {
        this.projectId = projectId;
    }

    public Long getProjectId() 
    {
        return projectId;
    }
    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setManagerId(String managerId) 
    {
        this.managerId = managerId;
    }

    public String getManagerId() 
    {
        return managerId;
    }
    public void setManagerName(String managerName) 
    {
        this.managerName = managerName;
    }

    public String getManagerName() 
    {
        return managerName;
    }
    public void setVerifyTime(Date verifyTime) 
    {
        this.verifyTime = verifyTime;
    }

    public Date getVerifyTime() 
    {
        return verifyTime;
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
            .append("id", getId())
            .append("projectId", getProjectId())
            .append("projectName", getProjectName())
            .append("status", getStatus())
            .append("managerId", getManagerId())
            .append("managerName", getManagerName())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("verifyTime", getVerifyTime())
            .append("updateBy", getUpdateBy())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
