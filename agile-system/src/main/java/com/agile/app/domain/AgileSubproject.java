package com.agile.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.agile.common.annotation.Excel;
import com.agile.common.core.domain.BaseEntity;

/**
 * 子系统对象 agile_subproject
 * 
 * @author zicky
 * @date 2024-11-19
 */
public class AgileSubproject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 项目id */
    @Excel(name = "项目id")
    private Long projectId;

    /** 子项目id */
    @Excel(name = "子项目id")
    private String subprojectId;

    /** 子项目名字 */
    @Excel(name = "子项目名字")
    private String subprojectName;

    /** 子项目状态 */
    @Excel(name = "子项目状态")
    private String subStatus;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date verifyTime;

    /** 删除标记，0正常，1删除 */
    private String delFlag;

    private String memberId;

    private Integer storyPoint;

    private String finishedCycle;

    private String expctedCycle;

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
    public void setSubprojectId(String subprojectId) 
    {
        this.subprojectId = subprojectId;
    }

    public String getSubprojectId() 
    {
        return subprojectId;
    }
    public void setSubprojectName(String subprojectName) 
    {
        this.subprojectName = subprojectName;
    }

    public String getSubprojectName() 
    {
        return subprojectName;
    }
    public void setSubStatus(String subStatus) 
    {
        this.subStatus = subStatus;
    }

    public String getSubStatus() 
    {
        return subStatus;
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

    public void setMemberId(String memberId)
    {
        this.memberId = memberId;
    }

    public String getMemberId()
    {
        return memberId;
    }

    public void setStoryPoint(Integer storyPoint)
    {
        this.storyPoint = storyPoint;
    }

    public Integer getStoryPoint()
    {
        return storyPoint;
    }

    public void setFinishedCycle(String finishedCycle)
    {
        this.finishedCycle = finishedCycle;
    }

    public String getFinishedCycle()
    {
        return finishedCycle;
    }

    public void setExpctedCycle(String expctedCycle)
    {
        this.expctedCycle = expctedCycle;
    }

    public String getExpctedCycle()
    {
        return expctedCycle;
    }




    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("projectId", getProjectId())
            .append("subprojectId", getSubprojectId())
            .append("subprojectName", getSubprojectName())
            .append("subStatus", getSubStatus())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("verifyTime", getVerifyTime())
            .append("updateBy", getUpdateBy())
            .append("delFlag", getDelFlag())
            .append("memberId", getMemberId())
            .append("storyPoint", getStoryPoint())
            .append("finishedCycle", getFinishedCycle())
            .append("expctedCycle", getExpctedCycle())
            .toString();
    }
}
