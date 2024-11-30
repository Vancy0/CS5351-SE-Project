package com.agile.app.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.agile.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.agile.app.mapper.AgileSubprojectMapper;
import com.agile.app.domain.AgileSubproject;
import com.agile.app.service.IAgileSubprojectService;

/**
 * 子系统Service业务层处理
 * 
 * @author zicky
 * @date 2024-11-19
 */
@Service
public class AgileSubprojectServiceImpl implements IAgileSubprojectService 
{
    @Autowired
    private AgileSubprojectMapper agileSubprojectMapper;

    /**
     * 查询子系统
     * 
     * @param id 子系统主键
     * @return 子系统
     */
    @Override
    public AgileSubproject selectAgileSubprojectById(Long id)
    {
        return agileSubprojectMapper.selectAgileSubprojectById(id);
    }

    /**
     * 查询子系统列表
     * 
     * @param agileSubproject 子系统
     * @return 子系统
     */
    @Override
    public List<AgileSubproject> selectAgileSubprojectList(AgileSubproject agileSubproject)
    {
        return agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);
    }

    /**
     * 新增子系统
     * 
     * @param agileSubproject 子系统
     * @return 结果
     */
    @Override
    public int insertAgileSubproject(AgileSubproject agileSubproject)
    {
        agileSubproject.setCreateTime(DateUtils.getNowDate());
        return agileSubprojectMapper.insertAgileSubproject(agileSubproject);
    }

    /**
     * 修改子系统
     * 
     * @param agileSubproject 子系统
     * @return 结果
     */
    @Override
    public int updateAgileSubproject(AgileSubproject agileSubproject)
    {
        agileSubproject.setUpdateTime(DateUtils.getNowDate());
        return agileSubprojectMapper.updateAgileSubproject(agileSubproject);
    }

    /**
     * 批量删除子系统
     * 
     * @param ids 需要删除的子系统主键
     * @return 结果
     */
    @Override
    public int deleteAgileSubprojectByIds(Long[] ids)
    {
        return agileSubprojectMapper.deleteAgileSubprojectByIds(ids);
    }

    /**
     * 删除子系统信息
     * 
     * @param id 子系统主键
     * @return 结果
     */
    @Override
    public int deleteAgileSubprojectById(Long id)
    {
        return agileSubprojectMapper.deleteAgileSubprojectById(id);
    }

    @Override
    public List<Integer> selectExpectedCycleById(Long projectId){
        int n = 1;
        AgileSubproject agileSubproject = new AgileSubproject();
        agileSubproject.setProjectId(projectId);
        List<AgileSubproject> list = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);
        //选取expectedCycle最大的值作为max_n
        int max_n = 0;
        for (AgileSubproject agileSubproject1 : list) {
            if (agileSubproject1.getExpectedCycle() > max_n) {
                max_n = agileSubproject1.getExpectedCycle();
            }
        }
        int sum = 0;
        List<AgileSubproject> list_all = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);
        for (AgileSubproject agileSubproject1 : list_all) {
            sum += agileSubproject1.getStoryPoint();
        }

        List<Integer> list_n_storyPoint = new ArrayList<>();
        list_n_storyPoint.add(sum);
        while (n <= max_n) {
            agileSubproject.setExpectedCycle(n);
            List<AgileSubproject> list_n = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);

            if (!list_n.isEmpty()) {
                //计算所有storyPoint的和
                int sum_n = 0;
                for (AgileSubproject agileSubproject1 : list_n) {
                    sum_n += agileSubproject1.getStoryPoint();
                }
                int cycle_left = list_n_storyPoint.get(n-1) - sum_n;

            } else {
                int cycle_left = list_n_storyPoint.get(n-1);
                list_n_storyPoint.add(cycle_left);
            }
            n++;
        }
        return list_n_storyPoint;
    };
    @Override
    public List<Integer> selectFinishedCycleById(Long projectId){
        int n = 1;
        AgileSubproject agileSubproject = new AgileSubproject();
        agileSubproject.setProjectId(projectId);
        List<AgileSubproject> list = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);
        //选取FinishedCycle最大的值作为max_n
        int max_n = 0;
        for (AgileSubproject agileSubproject1 : list) {
            if (agileSubproject1.getFinishedCycle() > max_n) {
                max_n = agileSubproject1.getFinishedCycle();
            }
        }
        int sum = 0;
        List<AgileSubproject> list_all = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);
        for (AgileSubproject agileSubproject1 : list_all) {
            sum += agileSubproject1.getStoryPoint();
        }

        List<Integer> list_n_storyPoint = new ArrayList<>();
        list_n_storyPoint.add(sum);
        while (n <= max_n) {
            agileSubproject.setFinishedCycle(n);
            List<AgileSubproject> list_n = agileSubprojectMapper.selectAgileSubprojectList(agileSubproject);

            if (!list_n.isEmpty()) {
                //计算所有storyPoint的和
                int sum_n = 0;
                for (AgileSubproject agileSubproject1 : list_n) {
                    sum_n += agileSubproject1.getStoryPoint();
                }
                int cycle_left = list_n_storyPoint.get(n-1) - sum_n;

            } else {
                int cycle_left = list_n_storyPoint.get(n-1);
                list_n_storyPoint.add(cycle_left);
            }
            n++;
        }
        return list_n_storyPoint;
    };
}
