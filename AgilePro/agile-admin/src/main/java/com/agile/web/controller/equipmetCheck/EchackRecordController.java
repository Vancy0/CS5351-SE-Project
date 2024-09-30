package com.agile.web.controller.equipmetCheck;

import com.agile.equipmentCheck.domain.EchackRecord;
import com.agile.equipmentCheck.service.IEchackRecordService;
import com.agile.common.annotation.Log;
import com.agile.common.core.controller.BaseController;
import com.agile.common.core.domain.AjaxResult;
import com.agile.common.core.page.TableDataInfo;
import com.agile.common.enums.BusinessType;
import com.agile.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 点检记录Controller
 * 
 * @author agile
 * @date 2023-08-22
 */
@RestController
@RequestMapping("/equipmentCheck/record")
public class EchackRecordController extends BaseController
{
    @Autowired
    private IEchackRecordService echackRecordService;

    /**
     * 查询点检记录列表
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(EchackRecord echackRecord)
    {
        startPage();
        List<EchackRecord> list = echackRecordService.selectEchackRecordList(echackRecord);
        return getDataTable(list);
    }

    /**
     * 导出点检记录列表
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:export')")
    @Log(title = "点检记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EchackRecord echackRecord)
    {
        List<EchackRecord> list = echackRecordService.selectEchackRecordList(echackRecord);
        ExcelUtil<EchackRecord> util = new ExcelUtil<EchackRecord>(EchackRecord.class);
        util.exportExcel(response, list, "点检记录数据");
    }

    /**
     * 获取点检记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return AjaxResult.success(echackRecordService.selectEchackRecordByRecordId(recordId));
    }

    /**
     * 新增点检记录
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:add')")
    @Log(title = "点检记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EchackRecord echackRecord)
    {
        return toAjax(echackRecordService.insertEchackRecord(echackRecord));
    }

    /**
     * 修改点检记录
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:edit')")
    @Log(title = "点检记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EchackRecord echackRecord)
    {
        return toAjax(echackRecordService.updateEchackRecord(echackRecord));
    }

    /**
     * 删除点检记录
     */
    @PreAuthorize("@ss.hasPermi('equipmentCheck:record:remove')")
    @Log(title = "点检记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(echackRecordService.deleteEchackRecordByRecordIds(recordIds));
    }
}
