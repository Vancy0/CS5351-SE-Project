import request from '@/utils/request'

// 查询子系统列表
export function listSubproject(query) {
  return request({
    url: '/project/subproject/list',
    method: 'get',
    params: query
  })
}

// 查询子系统详细
export function getSubproject(id) {
  return request({
    url: '/project/subproject/' + id,
    method: 'get'
  })
}

// 新增子系统
export function addSubproject(data) {
  return request({
    url: '/project/subproject',
    method: 'post',
    data: data
  })
}

// 修改子系统
export function updateSubproject(data) {
  return request({
    url: '/project/subproject',
    method: 'put',
    data: data
  })
}

// 删除子系统
export function delSubproject(id) {
  return request({
    url: '/project/subproject/' + id,
    method: 'delete'
  })
}
