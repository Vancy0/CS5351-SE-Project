package com.agile.equipmentCheck.controller;

import com.agile.equipmentCheck.domain.EcheckInfo;
import com.agile.equipmentCheck.service.IEcheckInfoService;
import com.agile.common.annotation.Log;
import com.agile.common.core.controller.BaseController;
import com.agile.common.core.domain.AjaxResult;
import com.agile.common.core.page.TableDataInfo;
import com.agile.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/app/checkInfo")
public class AppEcheckInfoController extends BaseController {
    @Autowired
    private IEcheckInfoService echeckInfoService;

    /**
     * 查询点检信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EcheckInfo echeckInfo)
    {
        startPage();
        List<EcheckInfo> list = echeckInfoService.selectEcheckInfoList(echeckInfo);
        return getDataTable(list);
    }


    /**
     * 获取点检信息详细信息
     */
    @GetMapping(value = "/{checkId}")
    public AjaxResult getInfo(@PathVariable("checkId") Long checkId)
    {
        return AjaxResult.success(echeckInfoService.selectEcheckInfoByCheckId(checkId));
    }

    /**
     * 修改点检信息
     */
    @Log(title = "点检信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EcheckInfo echeckInfo)
    {
        return toAjax(echeckInfoService.updateEcheckInfo(echeckInfo));
    }

}
