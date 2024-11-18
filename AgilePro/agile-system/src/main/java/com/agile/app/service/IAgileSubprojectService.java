package com.agile.app.service;

import java.util.List;
import com.agile.app.domain.AgileSubproject;

/**
 * 子系统Service接口
 * 
 * @author zicky
 * @date 2024-11-19
 */
public interface IAgileSubprojectService 
{
    /**
     * 查询子系统
     * 
     * @param id 子系统主键
     * @return 子系统
     */
    public AgileSubproject selectAgileSubprojectById(Long id);

    /**
     * 查询子系统列表
     * 
     * @param agileSubproject 子系统
     * @return 子系统集合
     */
    public List<AgileSubproject> selectAgileSubprojectList(AgileSubproject agileSubproject);

    /**
     * 新增子系统
     * 
     * @param agileSubproject 子系统
     * @return 结果
     */
    public int insertAgileSubproject(AgileSubproject agileSubproject);

    /**
     * 修改子系统
     * 
     * @param agileSubproject 子系统
     * @return 结果
     */
    public int updateAgileSubproject(AgileSubproject agileSubproject);

    /**
     * 批量删除子系统
     * 
     * @param ids 需要删除的子系统主键集合
     * @return 结果
     */
    public int deleteAgileSubprojectByIds(Long[] ids);

    /**
     * 删除子系统信息
     * 
     * @param id 子系统主键
     * @return 结果
     */
    public int deleteAgileSubprojectById(Long id);
}
