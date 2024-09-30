package com.agile.equipmentCheck.service;

import java.util.List;
import com.agile.equipmentCheck.domain.EchackRecord;

/**
 * 点检记录Service接口
 * 
 * @author agile
 * @date 2023-08-22
 */
public interface IEchackRecordService 
{
    /**
     * 查询点检记录
     * 
     * @param recordId 点检记录主键
     * @return 点检记录
     */
    public EchackRecord selectEchackRecordByRecordId(Long recordId);


    public List<EchackRecord> selectEchackRecordByCheckId(Long checkId);

    /**
     * 查询点检记录列表
     * 
     * @param echackRecord 点检记录
     * @return 点检记录集合
     */
    public List<EchackRecord> selectEchackRecordList(EchackRecord echackRecord);

    /**
     * 新增点检记录
     * 
     * @param echackRecord 点检记录
     * @return 结果
     */
    public int insertEchackRecord(EchackRecord echackRecord);

    /**
     * 修改点检记录
     * 
     * @param echackRecord 点检记录
     * @return 结果
     */
    public int updateEchackRecord(EchackRecord echackRecord);

    /**
     * 批量删除点检记录
     * 
     * @param recordIds 需要删除的点检记录主键集合
     * @return 结果
     */
    public int deleteEchackRecordByRecordIds(Long[] recordIds);

    /**
     * 删除点检记录信息
     * 
     * @param recordId 点检记录主键
     * @return 结果
     */
    public int deleteEchackRecordByRecordId(Long recordId);
}
