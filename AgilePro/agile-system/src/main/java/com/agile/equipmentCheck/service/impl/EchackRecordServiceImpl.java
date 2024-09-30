package com.agile.equipmentCheck.service.impl;

import java.util.List;
import java.util.Objects;

import com.agile.equipmentCheck.domain.EcheckInfo;
import com.agile.equipmentCheck.mapper.EcheckInfoMapper;
import com.agile.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.agile.equipmentCheck.mapper.EchackRecordMapper;
import com.agile.equipmentCheck.domain.EchackRecord;
import com.agile.equipmentCheck.service.IEchackRecordService;

/**
 * 点检记录Service业务层处理
 * 
 * @author agile
 * @date 2023-08-22
 */
@Service
public class EchackRecordServiceImpl implements IEchackRecordService 
{
    @Autowired
    private EchackRecordMapper echackRecordMapper;
    @Autowired
    private EcheckInfoMapper echeckInfoMapper;

    /**
     * 查询点检记录
     * 
     * @param recordId 点检记录主键
     * @return 点检记录
     */
    @Override
    public EchackRecord selectEchackRecordByRecordId(Long recordId)
    {
        return echackRecordMapper.selectEchackRecordByRecordId(recordId);
    }

    @Override
    public List<EchackRecord> selectEchackRecordByCheckId(Long checkId){
        return echackRecordMapper.selectEchackRecordByCheckId(checkId);
    };

    /**
     * 查询点检记录列表
     * 
     * @param echackRecord 点检记录
     * @return 点检记录
     */
    @Override
    public List<EchackRecord> selectEchackRecordList(EchackRecord echackRecord)
    {
        return echackRecordMapper.selectEchackRecordList(echackRecord);
    }

    /**
     * 新增点检记录
     * 
     * @param echackRecord 点检记录
     * @return 结果
     */
    @Override
    public int insertEchackRecord(EchackRecord echackRecord)
    {
        EcheckInfo echeckInfo = echeckInfoMapper.selectEcheckInfoByCheckId(echackRecord.getCheckId());
        if(!Objects.equals(echeckInfo.getStatus(), echackRecord.getCheckStatus())){
            // 状态不同 更新点检设备状态
            echeckInfo.setStatus(echackRecord.getCheckStatus());
            echeckInfo.setUpdateTime(DateUtils.getNowDate());
            echeckInfoMapper.updateEcheckInfo(echeckInfo);
        }
        echackRecord.setCreateTime(DateUtils.getNowDate());
        return echackRecordMapper.insertEchackRecord(echackRecord);
    }

    /**
     * 修改点检记录
     * 
     * @param echackRecord 点检记录
     * @return 结果
     */
    @Override
    public int updateEchackRecord(EchackRecord echackRecord)
    {
        echackRecord.setUpdateTime(DateUtils.getNowDate());
        return echackRecordMapper.updateEchackRecord(echackRecord);
    }

    /**
     * 批量删除点检记录
     * 
     * @param recordIds 需要删除的点检记录主键
     * @return 结果
     */
    @Override
    public int deleteEchackRecordByRecordIds(Long[] recordIds)
    {
        return echackRecordMapper.deleteEchackRecordByRecordIds(recordIds);
    }

    /**
     * 删除点检记录信息
     * 
     * @param recordId 点检记录主键
     * @return 结果
     */
    @Override
    public int deleteEchackRecordByRecordId(Long recordId)
    {
        return echackRecordMapper.deleteEchackRecordByRecordId(recordId);
    }
}
