/**
 * 雷池 API 服务封装
 * 文档：https://web.520527.xyz:54321/swagger/index.html
 */

const STORAGE_KEY = 'safeline_config'

/**
 * API 配置结构
 * @typedef {Object} ApiConfig
 * @property {string} baseUrl - API Base URL
 * @property {string} token - API Token
 */

/**
 * 网站运行模式枚举
 * @enum {number}
 */
const SiteMode = {
  DEFENSE: 0,    // 防护模式（启用）
  OFFLINE: 1,    // 维护模式
  DRY_RUN: 2     // 模拟运行
}

/**
 * 获取 API 配置
 * @returns {ApiConfig|null}
 */
function getConfig() {
  try {
    const config = uni.getStorageSync(STORAGE_KEY)
    if (config && config.baseUrl && config.token) {
      return config
    }
    return null
  } catch (e) {
    console.error('获取配置失败:', e)
    return null
  }
}

/**
 * 保存 API 配置
 * @param {ApiConfig} config
 * @returns {boolean}
 */
function setConfig(config) {
  try {
    uni.setStorageSync(STORAGE_KEY, config)
    return true
  } catch (e) {
    console.error('保存配置失败:', e)
    return false
  }
}

/**
 * 测试 API 连接
 * @returns {Promise<{success: boolean, message: string}>}
 */
async function testConnection() {
  const config = getConfig()
  if (!config) {
    return { success: false, message: '请先配置 API' }
  }
  
  try {
    const res = await request('/open/system', 'GET')
    return { success: true, message: '连接成功' }
  } catch (e) {
    return { success: false, message: e.message || '连接失败' }
  }
}

/**
 * 获取网站列表
 * @param {Object} params
 * @param {number} params.page - 页码
 * @param {number} params.page_size - 每页数量
 * @param {string} params.order - 排序方式
 * @param {string} params.order_by - 排序字段
 * @returns {Promise<{data: Array, total: number}>}
 */
async function getSiteList(params = {}) {
  const { page = 1, page_size = 20, order, order_by } = params
  
  const queryParams = []
  if (page) queryParams.push(`page=${page}`)
  if (page_size) queryParams.push(`page_size=${page_size}`)
  if (order) queryParams.push(`order=${order}`)
  if (order_by) queryParams.push(`order_by=${order_by}`)
  
  const url = `/open/site${queryParams.length ? '?' + queryParams.join('&') : ''}`
  
  const res = await request(url, 'GET')
  return res.data || { data: [], total: 0 }
}

/**
 * 获取网站详情
 * @param {number} id - 网站 ID
 * @returns {Promise<Object>}
 */
async function getSiteDetail(id) {
  if (!id) {
    throw new Error('网站 ID 不能为空')
  }
  
  const res = await request(`/open/site/${id}`, 'GET')
  return res.data
}

/**
 * 切换网站运行模式
 * @param {Array<number>} ids - 网站 ID 数组
 * @param {number} mode - 运行模式（0=防护，1=维护，2=模拟）
 * @returns {Promise<boolean>}
 */
async function toggleSiteMode(ids, mode) {
  if (!ids || ids.length === 0) {
    throw new Error('网站 ID 不能为空')
  }
  
  if (![0, 1, 2].includes(mode)) {
    throw new Error('运行模式值无效')
  }
  
  await request('/open/site/mode', 'PUT', { ids, mode })
  return true
}

/**
 * 获取网站操作日志
 * @param {number} siteId - 网站 ID
 * @param {Object} params
 * @param {number} params.page - 页码
 * @param {number} params.page_size - 每页数量
 * @returns {Promise<{data: Array, total: number}>}
 */
async function getSiteLogs(siteId, params = {}) {
  if (!siteId) {
    throw new Error('网站 ID 不能为空')
  }
  
  const { page = 1, page_size = 50 } = params
  
  const queryParams = []
  if (page) queryParams.push(`page=${page}`)
  if (page_size) queryParams.push(`page_size=${page_size}`)
  
  const url = `/open/site/${siteId}/log${queryParams.length ? '?' + queryParams.join('&') : ''}`
  
  const res = await request(url, 'GET')
  return res.data || { data: [], total: 0 }
}

/**
 * 统一请求方法
 * @private
 * @param {string} url - API 路径
 * @param {string} method - HTTP 方法
 * @param {Object} data - 请求体数据
 * @returns {Promise<Object>}
 */
async function request(url, method, data = null) {
  const config = getConfig()
  if (!config) {
    throw new Error('请先配置 API')
  }
  
  const fullUrl = `${config.baseUrl.replace(/\/$/, '')}${url}`
  
  return new Promise((resolve, reject) => {
    uni.request({
      url: fullUrl,
      method,
      data,
      timeout: 10000,
      header: {
        'X-SLCE-API-TOKEN': config.token,
        'Content-Type': 'application/json'
      },
      success: (res) => {
        if (res.statusCode === 200) {
          const body = res.data
          if (body.err) {
            reject(new Error(body.msg || '请求失败'))
          } else {
            resolve(body)
          }
        } else if (res.statusCode === 401) {
          reject(new Error('认证失败，请检查 Token'))
        } else {
          reject(new Error(`请求失败: ${res.statusCode}`))
        }
      },
      fail: (err) => {
        reject(new Error(err.errMsg || '网络请求失败'))
      }
    })
  })
}

/**
 * 格式化网站模式显示文本
 * @param {number} mode
 * @returns {string}
 */
function formatModeText(mode) {
  switch (mode) {
    case SiteMode.DEFENSE:
      return '防护'
    case SiteMode.OFFLINE:
      return '维护'
    case SiteMode.DRY_RUN:
      return '观察'
    default:
      return '未知'
  }
}

/**
 * 格式化网站模式颜色
 * @param {number} mode
 * @returns {string} - 颜色值
 */
function formatModeColor(mode) {
  switch (mode) {
    case SiteMode.DEFENSE:
      return '#10B981' // 绿色 - 启用
    case SiteMode.OFFLINE:
      return '#F59E0B' // 橙色 - 维护
    case SiteMode.DRY_RUN:
      return '#6B7280' // 灰色 - 模拟
    default:
      return '#6B7280'
  }
}

export default {
  SiteMode,
  getConfig,
  setConfig,
  testConnection,
  getSiteList,
  getSiteDetail,
  toggleSiteMode,
  getSiteLogs,
  formatModeText,
  formatModeColor
}