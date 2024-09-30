package com.agile.equipmentCheck.service;

import com.agile.equipmentCheck.domain.Equipment;

import java.util.List;

public interface IEquipmentService {
    // 查询设备列表
    public List<Equipment> getEquipmentList(Equipment equipment);
    // 查询设备详情
    public Equipment selectEquipmentDetailById(Long id);
    // 新增设备信息
    public int addEquipment(Equipment equipment);
    // 修改设备信息
    public int updateEquipment(Equipment equipment);

    // 检查编号是否唯一
    public Equipment checkEquipmentNoUnique(Equipment equipment);

    // 检查名称及型号是否唯一
    public Equipment checkNameTypeUnique(Equipment equipment);
    // 删除设备
    public int deleteEquipment(Long equipmentId);
}
