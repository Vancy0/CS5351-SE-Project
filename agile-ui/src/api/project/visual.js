import request from '@/utils/request'

// 查询子系统列表
export function getExpectedLine(id) {
  return request({
    url: '/project/subproject/getExpectedCycle/' + id,
    method: 'get',
    params: id
  })
}


export function getActualLine(id) {
    return request({
      url: '/project/subproject/getFinishedCycle/' + id,
      method: 'get',
      params: id
    })
  }
