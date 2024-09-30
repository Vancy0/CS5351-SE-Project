package com.agile.equipmentCheck.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.agile.common.annotation.Excel;
import com.agile.common.core.domain.BaseEntity;

/**
 * 点检记录对象 echack_record
 * 
 * @author agile
 * @date 2023-08-22
 */
public class EchackRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 点检记录id */
    private Long recordId;

    /** 点检内容 */
    @Excel(name = "点检内容")
    private String checkContent;

    /** 点检信息编号 */
    @Excel(name = "点检信息编号")
    private Long checkId;

    /** 检查状态 0正常 1异常 */
    @Excel(name = "检查状态 0正常 1异常")
    private String checkStatus;

    private EcheckInfo echeckInfo;

    public EcheckInfo getEcheckInfo() {
        return echeckInfo;
    }

    public void setEcheckInfo(EcheckInfo echeckInfo) {
        this.echeckInfo = echeckInfo;
    }

    public void setRecordId(Long recordId)
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
    }
    public void setCheckContent(String checkContent) 
    {
        this.checkContent = checkContent;
    }

    public String getCheckContent() 
    {
        return checkContent;
    }
    public void setCheckId(Long checkId) 
    {
        this.checkId = checkId;
    }

    public Long getCheckId() 
    {
        return checkId;
    }
    public void setCheckStatus(String checkStatus) 
    {
        this.checkStatus = checkStatus;
    }

    public String getCheckStatus() 
    {
        return checkStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("checkContent", getCheckContent())
            .append("checkId", getCheckId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("checkStatus", getCheckStatus())
            .toString();
    }
}
