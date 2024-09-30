package com.agile.equipmentCheck.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

//import com.agile.common.service.IAppCommonService;
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
import com.agile.equipmentCheck.domain.EchackRecord;
import com.agile.equipmentCheck.service.IEchackRecordService;
import com.agile.common.utils.poi.ExcelUtil;
import com.agile.common.core.page.TableDataInfo;

/**
 * 点检记录Controller
 * 
 * @author agile
 * @date 2023-08-22
 */
@RestController
@RequestMapping("/app/equipmentCheck/record")
public class AppEchackRecordController extends BaseController
{
    @Autowired
    private IEchackRecordService echackRecordService;
//    @Autowired
//    private IAppCommonService appCommonService;

    /**
     * 查询点检记录列表
     */
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
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return AjaxResult.success(echackRecordService.selectEchackRecordByRecordId(recordId));
    }

    @GetMapping(value = "list/{checkId}")
    public AjaxResult listByCheckId(@PathVariable("checkId") Long checkId){
        return AjaxResult.success(echackRecordService.selectEchackRecordByCheckId(checkId));
    }

    /**
     * 新增点检记录
     */
    @Log(title = "点检记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EchackRecord echackRecord)
    {
        echackRecord.setCreateBy(getUsername());
        return toAjax(echackRecordService.insertEchackRecord(echackRecord));
    }

    /**
     * 修改点检记录
     */
//    @Log(title = "点检记录", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody EchackRecord echackRecord)
//    {
//        String token = getWXToken();
//        String userName = appCommonService.getWXUserName(token);
//        echackRecord.setUpdateBy(userName);
//        return toAjax(echackRecordService.updateEchackRecord(echackRecord));
//    }

    /**
     * 删除点检记录
     */
    @Log(title = "点检记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(echackRecordService.deleteEchackRecordByRecordIds(recordIds));
    }
}
