package com.agile.equipmentCheck.domain;

import com.agile.common.core.domain.BaseEntity;

public class Equipment extends BaseEntity {
    // id
    private Long equipmentId;
    // 设备编号
    private String equipmentNo;
    // 设备名称
    private String equipmentName;
    // 设备型号
    private String equipmentType;

    public String getEquipmentNo() {
        return equipmentNo;
    }

    public void setEquipmentNo(String equipmentNo) {
        this.equipmentNo = equipmentNo;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentType() {
        return equipmentType;
    }

    public void setEquipmentType(String equipmentType) {
        this.equipmentType = equipmentType;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }
}
