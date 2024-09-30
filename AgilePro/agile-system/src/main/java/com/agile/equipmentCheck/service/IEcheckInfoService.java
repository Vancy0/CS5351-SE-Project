package com.agile.equipmentCheck.service;

import java.util.List;
import com.agile.equipmentCheck.domain.EcheckInfo;

/**
 * 点检信息Service接口
 * 
 * @author agile
 * @date 2023-08-04
 */
public interface IEcheckInfoService 
{
    /**
     * 查询点检信息
     * 
     * @param checkId 点检信息主键
     * @return 点检信息
     */
    public EcheckInfo selectEcheckInfoByCheckId(Long checkId);

    /**
     * 查询点检信息列表
     * 
     * @param echeckInfo 点检信息
     * @return 点检信息集合
     */
    public List<EcheckInfo> selectEcheckInfoList(EcheckInfo echeckInfo);

    /**
     * 新增点检信息
     * 
     * @param echeckInfo 点检信息
     * @return 结果
     */
    public int insertEcheckInfo(EcheckInfo echeckInfo);

    /**
     * 修改点检信息
     * 
     * @param echeckInfo 点检信息
     * @return 结果
     */
    public int updateEcheckInfo(EcheckInfo echeckInfo);

    /**
     * 批量删除点检信息
     * 
     * @param checkIds 需要删除的点检信息主键集合
     * @return 结果
     */
    public int deleteEcheckInfoByCheckIds(Long[] checkIds);

    /**
     * 删除点检信息信息
     * 
     * @param checkId 点检信息主键
     * @return 结果
     */
    public int deleteEcheckInfoByCheckId(Long checkId);
}
