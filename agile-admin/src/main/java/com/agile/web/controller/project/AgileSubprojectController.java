package com.agile.web.controller.project;

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
import com.agile.app.domain.AgileSubproject;
import com.agile.app.service.IAgileSubprojectService;
import com.agile.common.utils.poi.ExcelUtil;
import com.agile.common.core.page.TableDataInfo;

/**
 * 子系统Controller
 * 
 * @author zicky
 * @date 2024-11-19
 */
@RestController
@RequestMapping("/project/subproject")
public class AgileSubprojectController extends BaseController
{
    @Autowired
    private IAgileSubprojectService agileSubprojectService;

    /**
     * 查询子系统列表
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgileSubproject agileSubproject)
    {
        startPage();
        List<AgileSubproject> list = agileSubprojectService.selectAgileSubprojectList(agileSubproject);
        return getDataTable(list);
    }

    /**
     * 导出子系统列表
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:export')")
    @Log(title = "子系统", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgileSubproject agileSubproject)
    {
        List<AgileSubproject> list = agileSubprojectService.selectAgileSubprojectList(agileSubproject);
        ExcelUtil<AgileSubproject> util = new ExcelUtil<AgileSubproject>(AgileSubproject.class);
        util.exportExcel(response, list, "子系统数据");
    }

    /**
     * 获取子系统详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(agileSubprojectService.selectAgileSubprojectById(id));
    }

    /**
     * 新增子系统
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:add')")
    @Log(title = "子系统", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgileSubproject agileSubproject)
    {
        return toAjax(agileSubprojectService.insertAgileSubproject(agileSubproject));
    }

    /**
     * 修改子系统
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:edit')")
    @Log(title = "子系统", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgileSubproject agileSubproject)
    {
        return toAjax(agileSubprojectService.updateAgileSubproject(agileSubproject));
    }

    /**
     * 删除子系统
     */
    @PreAuthorize("@ss.hasPermi('project:subproject:remove')")
    @Log(title = "子系统", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(agileSubprojectService.deleteAgileSubprojectByIds(ids));
    }

    //查询cycle
    @GetMapping("/getExpectedCycle/{projectId}")
    public AjaxResult getExpectedCycle(@PathVariable("projectId") Long projectId){
//        return success(agileSubprojectService.selectAgileSubprojectById(projectId));
        List<Integer> list = agileSubprojectService.selectExpectedCycleById(projectId);
//        return getDataTable(list);
        return success(list);
    }

    @GetMapping("/getFinishedCycle/{projectId}")
    public AjaxResult getFinishedCycle(@PathVariable("projectId") Long projectId){
//        return success(agileSubprojectService.selectAgileSubprojectById(projectId));
        List<Integer> list = agileSubprojectService.selectFinishedCycleById(projectId);
        return success(list);
    }


}
