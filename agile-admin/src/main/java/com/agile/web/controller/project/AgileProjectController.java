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
import com.agile.app.domain.AgileProject;
import com.agile.app.service.IAgileProjectService;
import com.agile.common.utils.poi.ExcelUtil;
import com.agile.common.core.page.TableDataInfo;

/**
 * 项目Controller
 * 
 * @author zicky
 * @date 2024-11-19
 */
@RestController
@RequestMapping("/system/project")
public class AgileProjectController extends BaseController
{
    @Autowired
    private IAgileProjectService agileProjectService;

    /**
     * 查询项目列表
     */
//    @PreAuthorize("@ss.hasPermi('system:project:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgileProject agileProject)
    {
        startPage();
        List<AgileProject> list = agileProjectService.selectAgileProjectList(agileProject);
        return getDataTable(list);
    }

    /**
     * 导出项目列表
     */

    @Log(title = "项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgileProject agileProject)
    {
        List<AgileProject> list = agileProjectService.selectAgileProjectList(agileProject);
        ExcelUtil<AgileProject> util = new ExcelUtil<AgileProject>(AgileProject.class);
        util.exportExcel(response, list, "项目数据");
    }

    /**
     * 获取项目详细信息
     */

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(agileProjectService.selectAgileProjectById(id));
    }

    /**
     * 新增项目
     */

    @Log(title = "项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgileProject agileProject)
    {
        return toAjax(agileProjectService.insertAgileProject(agileProject));
    }

    /**
     * 修改项目
     */

    @Log(title = "项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgileProject agileProject)
    {
        return toAjax(agileProjectService.updateAgileProject(agileProject));
    }

    /**
     * 删除项目
     */

    @Log(title = "项目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(agileProjectService.deleteAgileProjectByIds(ids));
    }
}
