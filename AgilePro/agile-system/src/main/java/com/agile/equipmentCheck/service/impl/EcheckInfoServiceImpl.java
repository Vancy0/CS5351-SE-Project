package com.agile.equipmentCheck.service.impl;

import java.util.List;
import com.agile.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.agile.equipmentCheck.mapper.EcheckInfoMapper;
import com.agile.equipmentCheck.domain.EcheckInfo;
import com.agile.equipmentCheck.service.IEcheckInfoService;

/**
 * 点检信息Service业务层处理
 * 
 * @author agile
 * @date 2023-08-04
 */
@Service
public class EcheckInfoServiceImpl implements IEcheckInfoService 
{
    @Autowired
    private EcheckInfoMapper echeckInfoMapper;

    /**
     * 查询点检信息
     * 
     * @param checkId 点检信息主键
     * @return 点检信息
     */
    @Override
    public EcheckInfo selectEcheckInfoByCheckId(Long checkId)
    {
        return echeckInfoMapper.selectEcheckInfoByCheckId(checkId);
    }

    /**
     * 查询点检信息列表
     * 
     * @param echeckInfo 点检信息
     * @return 点检信息
     */
    @Override
    public List<EcheckInfo> selectEcheckInfoList(EcheckInfo echeckInfo)
    {
        return echeckInfoMapper.selectEcheckInfoList(echeckInfo);
    }

    /**
     * 新增点检信息
     * 
     * @param echeckInfo 点检信息
     * @return 结果
     */
    @Override
    public int insertEcheckInfo(EcheckInfo echeckInfo)
    {
        echeckInfo.setCreateTime(DateUtils.getNowDate());
        return echeckInfoMapper.insertEcheckInfo(echeckInfo);
    }

    /**
     * 修改点检信息
     * 
     * @param echeckInfo 点检信息
     * @return 结果
     */
    @Override
    public int updateEcheckInfo(EcheckInfo echeckInfo)
    {
        echeckInfo.setUpdateTime(DateUtils.getNowDate());
        return echeckInfoMapper.updateEcheckInfo(echeckInfo);
    }

    /**
     * 批量删除点检信息
     * 
     * @param checkIds 需要删除的点检信息主键
     * @return 结果
     */
    @Override
    public int deleteEcheckInfoByCheckIds(Long[] checkIds)
    {
        return echeckInfoMapper.deleteEcheckInfoByCheckIds(checkIds);
    }

    /**
     * 删除点检信息信息
     * 
     * @param checkId 点检信息主键
     * @return 结果
     */
    @Override
    public int deleteEcheckInfoByCheckId(Long checkId)
    {
        return echeckInfoMapper.deleteEcheckInfoByCheckId(checkId);
    }
}
