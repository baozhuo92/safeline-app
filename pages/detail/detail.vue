<template>
  <view class="page-container">
    <!-- 加载状态 -->
    <view v-if="loading" class="loading-state">
      <t-loading theme="circular" size="40px" />
      <text class="loading-text">加载中...</text>
    </view>
    
    <!-- 网站信息 -->
    <view v-else-if="siteDetail" class="detail-content">
      <!-- 基础信息卡片 -->
      <view class="info-card clay-card mb-md">
        <view class="info-header">
          <view class="info-title-row">
            <text class="info-title">{{ siteDetail.title || '未命名网站' }}</text>
            <view :class="['status-badge', getModeClass(siteDetail.mode)]">
              {{ getModeText(siteDetail.mode) }}
            </view>
          </view>
          <text class="info-comment">{{ siteDetail.comment || '无备注' }}</text>
        </view>
        
        <view class="info-body">
          <view class="info-row">
            <text class="info-label">域名</text>
            <text class="info-value">{{ formatDomains(siteDetail.server_names) }}</text>
          </view>
          <view class="info-row">
            <text class="info-label">端口</text>
            <text class="info-value">{{ formatPorts(siteDetail.ports) }}</text>
          </view>
          <view class="info-row">
            <text class="info-label">创建时间</text>
            <text class="info-value">{{ formatTime(siteDetail.created_at) }}</text>
          </view>
          <view class="info-row">
            <text class="info-label">更新时间</text>
            <text class="info-value">{{ formatTime(siteDetail.updated_at) }}</text>
          </view>
        </view>
      </view>
      
      <!-- 运行模式切换卡片 -->
      <view class="mode-card clay-card mb-md">
        <view class="mode-header">
          <text class="mode-title">运行模式</text>
        </view>
        
        <view class="mode-switches">
          <view 
            :class="['mode-option', { 'mode-option--active': siteDetail.mode === 0 }]"
            @tap="handleModeSwitch(0)"
          >
            <view class="mode-option-icon mode-option-icon--success">
              <t-icon name="check-circle" size="36rpx" />
            </view>
            <text class="mode-option-label">防护模式</text>
            <text class="mode-option-desc">网站正常运行，启用防护</text>
          </view>
          
          <view 
            :class="['mode-option', { 'mode-option--active': siteDetail.mode === 1 }]"
            @tap="handleModeSwitch(1)"
          >
            <view class="mode-option-icon mode-option-icon--warning">
              <t-icon name="pause-circle" size="36rpx" />
            </view>
            <text class="mode-option-label">维护模式</text>
            <text class="mode-option-desc">网站暂停访问，显示维护页</text>
          </view>
          
          <view 
            :class="['mode-option', { 'mode-option--active': siteDetail.mode === 2 }]"
            @tap="handleModeSwitch(2)"
          >
            <view class="mode-option-icon mode-option-icon--info">
              <t-icon name="view-list" size="36rpx" />
            </view>
            <text class="mode-option-label">观察模式</text>
            <text class="mode-option-desc">不拦截攻击，仅记录日志</text>
          </view>
        </view>
      </view>
      
      <!-- 操作日志卡片 -->
      <view class="log-card clay-card">
        <view class="log-header">
          <text class="log-title">操作日志</text>
          <view v-if="logs.length > 0" class="log-badge">
            {{ logs.length }} 条
          </view>
        </view>
        
        <!-- 空日志状态 -->
        <view v-if="logs.length === 0" class="empty-logs">
          <text class="empty-logs-text">暂无操作日志</text>
        </view>
        
        <!-- 日志列表 -->
        <view v-else class="log-list">
          <view 
            v-for="log in logs" 
            :key="log.id || log.timestamp"
            class="log-item"
          >
            <view class="log-item-header">
              <text class="log-item-time">{{ formatTime(log.timestamp || log.created_at) }}</text>
              <view :class="['log-item-type', getLogTypeClass(log)]">
                {{ log.type || '操作' }}
              </view>
            </view>
            <text class="log-item-content">{{ log.content || log.message || '无详情' }}</text>
            <view class="log-item-footer">
              <text class="log-item-user">{{ log.username || '系统' }}</text>
              <text class="log-item-ip">{{ log.ip || '-' }}</text>
            </view>
          </view>
        </view>
      </view>
    </view>
    
    <!-- 错误状态 -->
    <view v-else class="error-state">
      <text class="error-text">{{ errorMessage }}</text>
      <view class="clay-button-secondary" @tap="loadDetail">
        <text>重新加载</text>
      </view>
    </view>
    
    <!-- Toast 提示 -->
    <t-toast 
      v-if="toastVisible"
      :message="toastMessage"
      :theme="toastTheme"
      duration="2000"
      @close="toastVisible = false"
    />
  </view>
</template>

<script>
import api from '@/utils/api.js'

export default {
  data() {
    return {
      siteId: null,
      siteDetail: null,
      logs: [],
      loading: false,
      errorMessage: '',
      toastVisible: false,
      toastMessage: '',
      toastTheme: 'success'
    }
  },
  
  onLoad(options) {
    if (options.id) {
      this.siteId = parseInt(options.id)
      this.loadDetail()
    } else {
      this.errorMessage = '网站 ID 缺失'
    }
  },
  
  onPullDownRefresh() {
    this.loadDetail()
    uni.stopPullDownRefresh()
  },
  
  methods: {
    async loadDetail() {
      if (!this.siteId) {
        return
      }
      
      this.loading = true
      this.errorMessage = ''
      
      try {
        // 加载网站详情
        const detail = await api.getSiteDetail(this.siteId)
        this.siteDetail = detail
        
        // 加载操作日志
        const logsRes = await api.getSiteLogs(this.siteId, { page: 1, page_size: 50 })
        this.logs = logsRes.data || []
        
      } catch (error) {
        this.errorMessage = error.message || '加载失败'
      } finally {
        this.loading = false
      }
    },
    
    async handleModeSwitch(targetMode) {
      if (!this.siteDetail || this.siteDetail.mode === targetMode) {
        return
      }
      
      const modeText = this.getModeText(targetMode)
      
      uni.showModal({
        title: '切换运行模式',
        content: `确认将网站切换为${modeText}模式？`,
        success: async (res) => {
          if (res.confirm) {
            try {
              uni.showLoading({ title: '切换中...' })
              
              await api.toggleSiteMode([this.siteId], targetMode)
              
              uni.hideLoading()
              
              this.showToast('切换成功', 'success')
              
              // 更新本地状态
              this.siteDetail.mode = targetMode
              
              // 刷新详情和日志
              await this.loadDetail()
              
            } catch (error) {
              uni.hideLoading()
              this.showToast(error.message || '切换失败', 'error')
            }
          }
        }
      })
    },
    
    showToast(message, theme = 'success') {
      this.toastMessage = message
      this.toastTheme = theme
      this.toastVisible = true
    },
    
    getModeText(mode) {
      switch (mode) {
        case 0: return '防护'
        case 1: return '维护'
        case 2: return '观察'
        default: return '未知'
      }
    },
    
    getModeClass(mode) {
      switch (mode) {
        case 0: return 'status-badge--defense'
        case 1: return 'status-badge--offline'
        case 2: return 'status-badge--observe'
        default: return 'status-badge--dryrun'
      }
    },
    
    getLogTypeClass(log) {
      const type = (log.type || '').toLowerCase()
      if (type.includes('mode') || type.includes('切换')) {
        return 'log-type--mode'
      }
      if (type.includes('create') || type.includes('创建')) {
        return 'log-type--create'
      }
      if (type.includes('delete') || type.includes('删除')) {
        return 'log-type--delete'
      }
      return 'log-type--default'
    },
    
    formatDomains(domains) {
      if (!domains || domains.length === 0) {
        return '未配置域名'
      }
      return domains.join('\n')
    },
    
    formatPorts(ports) {
      if (!ports || ports.length === 0) {
        return '未配置端口'
      }
      return ports.join(', ')
    },
    
    formatTime(timestamp) {
      if (!timestamp) {
        return '-'
      }
      
      // 处理字符串类型的时间
      if (typeof timestamp === 'string') {
        return timestamp.replace('T', ' ').split('.')[0]
      }
      
      // 处理 Unix 时间戳（秒或毫秒）
      const ts = timestamp > 9999999999 ? timestamp : timestamp * 1000
      const date = new Date(ts)
      
      const year = date.getFullYear()
      const month = String(date.getMonth() + 1).padStart(2, '0')
      const day = String(date.getDate()).padStart(2, '0')
      const hour = String(date.getHours()).padStart(2, '0')
      const minute = String(date.getMinutes()).padStart(2, '0')
      const second = String(date.getSeconds()).padStart(2, '0')
      
      return `${year}-${month}-${day} ${hour}:${minute}:${second}`
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/styles/common.scss';

.detail-content {
  padding-bottom: $spacing-xl;
}

.loading-state,
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 60vh;
}

.loading-text,
.error-text {
  font-size: $font-size-sm;
  color: $color-text-secondary;
  margin-top: $spacing-sm;
}

.info-card {
  padding: $spacing-md;
}

.info-header {
  margin-bottom: $spacing-md;
}

.info-title-row {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: $spacing-xs;
}

.info-title {
  font-size: $font-size-lg;
  font-weight: 600;
  color: $color-text-primary;
}

.info-comment {
  font-size: $font-size-sm;
  color: $color-text-secondary;
}

.info-body {
  border-top: 1rpx solid $color-border;
  padding-top: $spacing-md;
}

.info-row {
  display: flex;
  margin-bottom: $spacing-sm;
  
  &:last-child {
    margin-bottom: 0;
  }
}

.info-label {
  width: 160rpx;
  font-size: $font-size-sm;
  color: $color-text-secondary;
}

.info-value {
  flex: 1;
  font-size: $font-size-sm;
  color: $color-text-primary;
  word-break: break-all;
}

.mode-card {
  padding: $spacing-md;
}

.mode-header {
  margin-bottom: $spacing-md;
}

.mode-title {
  font-size: $font-size-md;
  font-weight: 600;
  color: $color-text-primary;
}

.mode-switches {
  display: flex;
  flex-direction: column;
  gap: $spacing-sm;
}

.mode-option {
  display: flex;
  align-items: center;
  background: linear-gradient(180deg, #FFFFFF 0%, #FCFCFD 100%);
  border-radius: $radius-md;
  padding: $spacing-md;
  border: 1.5rpx solid $color-border;
  box-shadow:
    0 1rpx 3rpx rgba(0, 0, 0, 0.04),
    0 2rpx 8rpx rgba(0, 0, 0, 0.03);
  transition: all 0.25s cubic-bezier(0.25, 0.1, 0.25, 1);
  
  &--active {
    background: linear-gradient(180deg, $color-primary-light 0%, #CCFCE8 100%);
    border-color: rgba(12, 166, 120, 0.3);
    box-shadow:
      0 4rpx 16rpx rgba(12, 166, 120, 0.18),
      0 1rpx 2rpx rgba(12, 166, 120, 0.08);
    transform: translateY(-1rpx);
  }
}

.mode-option-icon {
  width: 64rpx;
  height: 64rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: $spacing-sm;
  flex-shrink: 0;
  
  &--success { color: $color-success; }
  &--warning { color: $color-danger; }
  &--info { color: $color-info; }
  &--gray { color: $color-text-secondary; }
}

.mode-option-label {
  font-size: $font-size-sm;
  font-weight: 500;
  color: $color-text-primary;
  margin-bottom: 2rpx;
}

.mode-option-desc {
  font-size: $font-size-xs;
  color: $color-text-secondary;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.log-card {
  padding: $spacing-md;
}

.log-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: $spacing-md;
}

.log-title {
  font-size: $font-size-md;
  font-weight: 600;
  color: $color-text-primary;
}

.log-badge {
  padding: 4rpx 12rpx;
  background: $color-primary-light;
  color: $color-primary;
  border-radius: $radius-sm;
  font-size: $font-size-xs;
  font-weight: 500;
}

.empty-logs {
  text-align: center;
  padding: $spacing-lg;
}

.empty-logs-text {
  font-size: $font-size-sm;
  color: $color-text-disabled;
}

.log-list {
  border-top: 1rpx solid $color-border;
}

.log-item {
  padding: $spacing-md;
  border-bottom: 1rpx solid $color-border;
  
  &:last-child {
    border-bottom: none;
  }
}

.log-item-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: $spacing-xs;
}

.log-item-time {
  font-size: $font-size-xs;
  color: $color-text-disabled;
}

.log-item-type {
  padding: 2rpx 12rpx;
  border-radius: $radius-sm;
  font-size: $font-size-xs;
  
  &--mode {
    background: rgba(16, 185, 129, 0.1);
    color: $color-success;
  }
  
  &--create {
    background: rgba(59, 130, 246, 0.1);
    color: $color-info;
  }
  
  &--delete {
    background: rgba(239, 68, 68, 0.1);
    color: $color-danger;
  }
  
  &--default {
    background: rgba(107, 114, 128, 0.1);
    color: $color-text-secondary;
  }
}

.log-item-content {
  font-size: $font-size-sm;
  color: $color-text-primary;
  margin-bottom: $spacing-xs;
}

.log-item-footer {
  display: flex;
  gap: $spacing-sm;
}

.log-item-user,
.log-item-ip {
  font-size: $font-size-xs;
  color: $color-text-disabled;
}
</style>