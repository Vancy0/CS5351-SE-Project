package com.agile.app.service;

import java.util.List;
import com.agile.app.domain.AgileProject;

/**
 * 项目Service接口
 * 
 * @author zicky
 * @date 2024-11-19
 */
public interface IAgileProjectService 
{
    /**
     * 查询项目
     * 
     * @param id 项目主键
     * @return 项目
     */
    AgileProject selectAgileProjectById(Long id);

    /**
     * 查询项目列表
     * 
     * @param agileProject 项目
     * @return 项目集合
     */
    List<AgileProject> selectAgileProjectList(AgileProject agileProject);

    /**
     * 新增项目
     * 
     * @param agileProject 项目
     * @return 结果
     */
    int insertAgileProject(AgileProject agileProject);

    /**
     * 修改项目
     * 
     * @param agileProject 项目
     * @return 结果
     */
    int updateAgileProject(AgileProject agileProject);

    /**
     * 批量删除项目
     * 
     * @param ids 需要删除的项目主键集合
     * @return 结果
     */
    int deleteAgileProjectByIds(Long[] ids);

    /**
     * 删除项目信息
     * 
     * @param id 项目主键
     * @return 结果
     */
    int deleteAgileProjectById(Long id);
}
