package com.agile.equipmentCheck.service.impl;

import com.agile.equipmentCheck.domain.Equipment;
import com.agile.equipmentCheck.mapper.EquipmentMapper;
import com.agile.equipmentCheck.service.IEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EquipmentServiceImpl implements IEquipmentService {
    @Autowired
    EquipmentMapper equipmentMapper;
    // 查询设备列表
    @Override
    public List<Equipment> getEquipmentList(Equipment equipment) {

        return equipmentMapper.selectEquipmentList(equipment);
    }

    @Override
    public Equipment selectEquipmentDetailById(Long id) {
        return equipmentMapper.selectEquipmentDetailById(id);
    }

    @Override
    public int addEquipment(Equipment equipment) {
        return equipmentMapper.insertEquipment(equipment);
    }

    @Override
    public int updateEquipment(Equipment equipment) {
        return equipmentMapper.updateEquipment(equipment);
    }

    @Override
    public Equipment checkEquipmentNoUnique(Equipment equipment) {
        return equipmentMapper.checkEquipmentNoUnique(equipment);
    }

    @Override
    public Equipment checkNameTypeUnique(Equipment equipment) {
        return equipmentMapper.checkNameTypeUnique(equipment);
    }

    @Override
    public int deleteEquipment(Long equipmentId) {
        return equipmentMapper.deleteEquipment(equipmentId);
    }
}
