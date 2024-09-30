package com.agile.equipmentCheck.mapper;

import com.agile.equipmentCheck.domain.Equipment;

import java.util.List;

public interface EquipmentMapper {
    // 查询设备列表
    public List<Equipment> selectEquipmentList(Equipment equipment);

    // 查询设备详情
    public Equipment selectEquipmentDetailById(Long id);

    // 新增设备信息
    public int insertEquipment(Equipment equipment);

    // 更新设备信息
    public int updateEquipment(Equipment equipment);

    // 检查编号是否唯一
    public Equipment checkEquipmentNoUnique(Equipment equipment);

    // 检查名称及型号是否唯一
    public Equipment checkNameTypeUnique(Equipment equipment);

    // 删除设备
    public int deleteEquipment(Long equipmentId);
}
