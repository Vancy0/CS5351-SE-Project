package com.agile.app.service.impl;

import java.util.List;
import com.agile.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.agile.app.mapper.AgileProjectMapper;
import com.agile.app.domain.AgileProject;
import com.agile.app.service.IAgileProjectService;

/**
 * 项目Service业务层处理
 * 
 * @author zicky
 * @date 2024-11-19
 */
@Service
public class AgileProjectServiceImpl implements IAgileProjectService 
{
    @Autowired
    private AgileProjectMapper agileProjectMapper;

    /**
     * 查询项目
     * 
     * @param id 项目主键
     * @return 项目
     */
    @Override
    public AgileProject selectAgileProjectById(Long id)
    {
        return agileProjectMapper.selectAgileProjectById(id);
    }

    /**
     * 查询项目列表
     * 
     * @param agileProject 项目
     * @return 项目
     */
    @Override
    public List<AgileProject> selectAgileProjectList(AgileProject agileProject)
    {
        return agileProjectMapper.selectAgileProjectList(agileProject);
    }

    /**
     * 新增项目
     * 
     * @param agileProject 项目
     * @return 结果
     */
    @Override
    public int insertAgileProject(AgileProject agileProject)
    {
        agileProject.setCreateTime(DateUtils.getNowDate());
        return agileProjectMapper.insertAgileProject(agileProject);
    }

    /**
     * 修改项目
     * 
     * @param agileProject 项目
     * @return 结果
     */
    @Override
    public int updateAgileProject(AgileProject agileProject)
    {
        agileProject.setUpdateTime(DateUtils.getNowDate());
        return agileProjectMapper.updateAgileProject(agileProject);
    }

    /**
     * 批量删除项目
     * 
     * @param ids 需要删除的项目主键
     * @return 结果
     */
    @Override
    public int deleteAgileProjectByIds(Long[] ids)
    {
        return agileProjectMapper.deleteAgileProjectByIds(ids);
    }

    /**
     * 删除项目信息
     * 
     * @param id 项目主键
     * @return 结果
     */
    @Override
    public int deleteAgileProjectById(Long id)
    {
        return agileProjectMapper.deleteAgileProjectById(id);
    }
}
