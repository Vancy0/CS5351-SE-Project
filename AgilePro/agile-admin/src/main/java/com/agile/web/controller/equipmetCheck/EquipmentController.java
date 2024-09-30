package com.agile.web.controller.equipmetCheck;

import com.agile.equipmentCheck.domain.Equipment;
import com.agile.equipmentCheck.service.IEquipmentService;
import com.agile.common.annotation.Log;
import com.agile.common.core.controller.BaseController;
import com.agile.common.core.domain.AjaxResult;
import com.agile.common.core.page.TableDataInfo;
import com.agile.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/web/echeck/equipment")
public class EquipmentController extends BaseController {
    @Autowired
    private IEquipmentService equipmentService;

    /**
     * 获取设备列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Equipment equipment)
    {
        startPage(); // 分页
        List<Equipment> list = equipmentService.getEquipmentList(equipment);
        return getDataTable(list);
    }
    /**
     * 获取设备列表
     */
    @GetMapping("/listNotPage")
    public TableDataInfo listNotPage(Equipment equipment)
    {
        List<Equipment> list = equipmentService.getEquipmentList(equipment);
        return getDataTable(list);
    }

    /**
     * 根据设备id获取详细信息
     */
    @GetMapping("/{equipmentId}")
    public AjaxResult getInfo(@PathVariable(value = "equipmentId", required = true) Long equipmentId)
    {
        return AjaxResult.success(equipmentService.selectEquipmentDetailById(equipmentId));
    }

    /**
     * 新增设备
     */
    @Log(title = "设备管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Equipment equipment)
    {
        // 校验设备编号唯一
        // 校验设备名称及型号唯一
        if (equipmentService.checkEquipmentNoUnique(equipment) != null)
        {
            return AjaxResult.error("新增设备'" + equipment.getEquipmentName() + "'失败，设备编号已存在");
        }else if (equipmentService.checkNameTypeUnique(equipment) != null){
            return AjaxResult.error("新增设备'" + equipment.getEquipmentName() + "'失败，设备名称及型号已存在");
        }
        equipment.setCreateBy(getUsername());
        return toAjax(equipmentService.addEquipment(equipment));
    }

    /**
     * 修改设备
     */
    @Log(title = "设备管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Equipment equipment)
    {
        // 校验设备编号唯一
        // 校验设备名称及型号唯一
        Equipment checkNo = equipmentService.checkEquipmentNoUnique(equipment);
        if(checkNo != null && !Objects.equals(equipment.getEquipmentId(), checkNo.getEquipmentId())){
            return AjaxResult.error("修改设备'" + equipment.getEquipmentName() + "'失败，设备编号已存在");
        }
        Equipment checkName = equipmentService.checkNameTypeUnique(equipment);
        if (checkName != null && !Objects.equals(equipment.getEquipmentId(),checkName.getEquipmentId()))
        {
            return AjaxResult.error("修改设备'" + equipment.getEquipmentName() + "'失败，设备名称及型号已存在");
        }
        equipment.setUpdateBy(getUsername());
        return toAjax(equipmentService.updateEquipment(equipment));
    }

    /**
     * 删除设备
     * */
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{equipmentId}")
    public AjaxResult remove(@PathVariable Long equipmentId)
    {
        return toAjax(equipmentService.deleteEquipment(equipmentId));
    }
}
