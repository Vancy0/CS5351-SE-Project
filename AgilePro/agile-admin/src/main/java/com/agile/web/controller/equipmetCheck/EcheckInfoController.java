package com.agile.web.controller.equipmetCheck;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.agile.common.annotation.Log;
import com.agile.common.core.controller.BaseController;
import com.agile.common.core.domain.AjaxResult;
import com.agile.common.enums.BusinessType;
import com.agile.equipmentCheck.domain.EcheckInfo;
import com.agile.equipmentCheck.service.IEcheckInfoService;
import com.agile.common.utils.poi.ExcelUtil;
import com.agile.common.core.page.TableDataInfo;

/**
 * 点检信息Controller
 * 
 * @author agile
 * @date 2023-08-04
 */
@RestController
@RequestMapping("/equipmentCheck/checkInfo")
public class EcheckInfoController extends BaseController
{
    @Autowired
    private IEcheckInfoService echeckInfoService;

    /**
     * 查询点检信息列表
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(EcheckInfo echeckInfo)
    {
        startPage();
        List<EcheckInfo> list = echeckInfoService.selectEcheckInfoList(echeckInfo);
        return getDataTable(list);
    }

    /**
     * 导出点检信息列表
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:export')")
    @Log(title = "点检信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EcheckInfo echeckInfo)
    {
        List<EcheckInfo> list = echeckInfoService.selectEcheckInfoList(echeckInfo);
        ExcelUtil<EcheckInfo> util = new ExcelUtil<EcheckInfo>(EcheckInfo.class);
        util.exportExcel(response, list, "点检信息数据");
    }

    /**
     * 获取点检信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:query')")
    @GetMapping(value = "/{checkId}")
    public AjaxResult getInfo(@PathVariable("checkId") Long checkId)
    {
        return AjaxResult.success(echeckInfoService.selectEcheckInfoByCheckId(checkId));
    }

    /**
     * 新增点检信息
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:add')")
    @Log(title = "点检信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EcheckInfo echeckInfo)
    {
        return toAjax(echeckInfoService.insertEcheckInfo(echeckInfo));
    }

    /**
     * 修改点检信息
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:edit')")
    @Log(title = "点检信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EcheckInfo echeckInfo)
    {
        return toAjax(echeckInfoService.updateEcheckInfo(echeckInfo));
    }

    /**
     * 删除点检信息
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:checkInfo:remove')")
    @Log(title = "点检信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{checkIds}")
    public AjaxResult remove(@PathVariable Long[] checkIds)
    {
        return toAjax(echeckInfoService.deleteEcheckInfoByCheckIds(checkIds));
    }
}
