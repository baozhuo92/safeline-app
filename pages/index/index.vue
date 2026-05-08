<template>
  <view class="page-container">
    <!-- 状态筛选 Tab -->
    <view class="filter-tabs">
      <view 
        class="filter-tab-item"
        :class="{ 'filter-tab-item--active': currentMode === null }"
        @tap="handleModeFilter(null)"
      >
        <text class="filter-tab-text">全部</text>
      </view>
      <view 
        class="filter-tab-item"
        :class="{ 'filter-tab-item--active': currentMode === 0 }"
        @tap="handleModeFilter(0)"
      >
        <text class="filter-tab-text filter-tab-text--success">防护</text>
      </view>
      <view 
        class="filter-tab-item"
        :class="{ 'filter-tab-item--active': currentMode === 1 }"
        @tap="handleModeFilter(1)"
      >
        <text class="filter-tab-text filter-tab-text--danger">维护</text>
      </view>
      <view 
        class="filter-tab-item"
        :class="{ 'filter-tab-item--active': currentMode === 2 }"
        @tap="handleModeFilter(2)"
      >
        <text class="filter-tab-text filter-tab-text--info">观察</text>
      </view>
    </view>
    
    <!-- 网站列表 -->
    <view class="site-list">
      <!-- 加载状态 -->
      <view v-if="loading" class="loading-state">
        <t-loading theme="circular" size="40px" />
        <text class="loading-text">加载中...</text>
      </view>
      
      <!-- 空状态 -->
      <view v-else-if="!loading && filteredList.length === 0" class="empty-state">
        <image class="empty-state__icon" src="/static/icons/empty.png" mode="aspectFit" />
        <text class="empty-state__text">{{ emptyText }}</text>
        <view v-if="!hasConfig" class="clay-button-secondary" @tap="goToSettings">
          <text>去设置 API</text>
        </view>
      </view>
      
      <!-- 网站卡片列表 -->
      <view v-else class="site-cards">
        <view 
          v-for="site in filteredList" 
          :key="site.id"
          class="site-card clay-card clay-card-hover mb-md"
        >
          <!-- 左侧：网站信息 -->
          <view class="site-card-left" @tap="goToDetail(site.id)">
            <view class="site-icon-wrapper">
              <image 
                v-if="site.icon" 
                class="site-icon-img"
                :src="site.icon"
                mode="aspectFit"
              />
              <view v-else :class="['site-icon', getModeIconClass(site.mode)]">
                <t-icon name="internet" size="36rpx" />
              </view>
            </view>
            <view class="site-info">
              <text class="site-title">{{ site.title || '未命名网站' }}</text>
              <text class="site-domain">{{ formatDomains(site.server_names) }}</text>
              <view :class="['status-badge-mini', getModeClass(site.mode)]">
                {{ getModeText(site.mode) }}
              </view>
            </view>
          </view>
          
          <!-- 右侧：状态开关 -->
          <view class="site-card-right">
            <switch 
              :checked="site.mode === 0"
              @change="(e) => handleSwitchChange(site, e)"
              color="#10B981"
            />
          </view>
        </view>
        
        <!-- 加载更多 -->
        <view v-if="hasMore" class="load-more">
          <t-loading theme="circular" size="30px" />
          <text class="load-more-text">加载更多...</text>
        </view>
        
        <!-- 加载完毕 -->
        <view v-if="!hasMore && filteredList.length > 0" class="load-complete">
          <text class="load-complete-text">已加载全部网站</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import api from '@/utils/api.js'

export default {
  data() {
    return {
      currentMode: null,
      siteList: [],
      loading: false,
      hasMore: true,
      page: 1,
      pageSize: 20,
      total: 0,
      hasConfig: false
    }
  },
  
  computed: {
    emptyText() {
      if (!this.hasConfig) {
        return '请先配置 API'
      }
      return '暂无网站'
    },
    
    filteredList() {
      let list = this.siteList
      
      if (this.currentMode !== null) {
        list = list.filter(site => site.mode === this.currentMode)
      }
      
      return list
    }
  },
  
  onLoad() {
    this.checkConfig()
  },
  
  onShow() {
    this.checkConfig()
    if (this.hasConfig) {
      this.refreshList()
    }
  },
  
  onPullDownRefresh() {
    this.refreshList().then(() => {
      uni.stopPullDownRefresh()
    })
  },
  
  onReachBottom() {
    this.handleLoadMore()
  },
  
  methods: {
    async checkConfig() {
      const config = api.getConfig()
      this.hasConfig = config && config.baseUrl && config.token
    },
    
    async refreshList() {
      this.page = 1
      this.hasMore = true
      this.siteList = []
      await this.loadSiteList()
    },
    
    async loadSiteList() {
      if (!this.hasConfig) {
        return
      }
      
      this.loading = true
      
      try {
        const params = {
          page: this.page,
          page_size: this.pageSize
        }
        
        const res = await api.getSiteList(params)
        
        const newList = res.data || []
        this.total = res.total || 0
        
        this.siteList = [...this.siteList, ...newList]
        
        this.hasMore = this.siteList.length < this.total
        
      } catch (error) {
        uni.showToast({ title: error.message, icon: 'error', duration: 2000 })
      } finally {
        this.loading = false
      }
    },
    
    handleModeFilter(mode) {
      this.currentMode = mode
    },
    
    async handleLoadMore() {
      if (!this.hasMore || this.loading) {
        return
      }
      
      this.page++
      await this.loadSiteList()
    },
    
    async handleSwitchChange(site, event) {
      const newValue = event.detail.value
      const targetMode = newValue ? 0 : 1
      const modeText = targetMode === 0 ? '防护' : '维护'
      
      uni.showLoading({ title: '切换中...', mask: true })
      
      // 8秒保险超时，防止网络卡死
      const safetyTimer = setTimeout(() => {
        uni.hideLoading()
        uni.showToast({ title: '请求超时，请重试', icon: 'none', duration: 2000 })
      }, 8000)
      
      try {
        await api.toggleSiteMode([site.id], targetMode)
        
        clearTimeout(safetyTimer)
        uni.hideLoading()
        
        // 更新本地状态
        const index = this.siteList.findIndex(s => s.id === site.id)
        if (index !== -1) {
          this.$set(this.siteList[index], 'mode', targetMode)
        }
        
        uni.hideToast()
        uni.showToast({
          title: `${site.title || '网站'}已切换为${modeText}模式`,
          icon: 'none',
          duration: 1500
        })
        
      } catch (error) {
        clearTimeout(safetyTimer)
        uni.hideLoading()
        uni.showToast({ title: error.message, icon: 'error', duration: 2000 })
      }
    },
    
    goToDetail(siteId) {
      uni.navigateTo({
        url: `/pages/detail/detail?id=${siteId}`
      })
    },
    
    goToSettings() {
      uni.switchTab({
        url: '/pages/settings/settings'
      })
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
    
    getModeIconClass(mode) {
      switch (mode) {
        case 0: return 'site-icon--success'
        case 1: return 'site-icon--danger'
        case 2: return 'site-icon--info'
        default: return 'site-icon--gray'
      }
    },
    
    formatDomains(domains) {
      if (!domains || domains.length === 0) {
        return '未配置域名'
      }
      if (domains.length === 1) {
        return domains[0]
      }
      return `${domains[0]} 等${domains.length}个域名`
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/styles/common.scss';

.filter-tabs {
  position: sticky;
  top: 0;
  z-index: 100;
  display: flex;
  gap: $spacing-xs;
  padding: $spacing-sm 6rpx;
  background: $color-bg;
}

.filter-tab-item {
  flex: 1;
  padding: 14rpx 0;
  text-align: center;
  border-radius: $radius-sm;
  border: none;
  transition: all 0.2s cubic-bezier(0.25, 0.1, 0.25, 1);
  
  &--active {
    background: linear-gradient(180deg, #FFFFFF 0%, #FCFCFD 100%);
    box-shadow:
      0 2rpx 8rpx rgba(0, 0, 0, 0.08),
      0 1rpx 2rpx rgba(0, 0, 0, 0.04);
  }
}

.filter-tab-text {
  font-size: $font-size-sm;
  font-weight: 500;
  color: $color-text-secondary;
  transition: color 0.2s;
  
  .filter-tab-item--active & {
    font-weight: 600;
    color: $color-text-primary;
  }
  
  &--success { color: $color-success; }
  &--danger { color: $color-danger; }
  &--info { color: $color-info; }
}

.site-list {
  margin-top: $spacing-sm;
  background-color: linear-gradient(180deg, #FFFFFF 0%, #FCFCFD 100%);
}

.site-cards {
  padding-bottom: $spacing-xl;
}

.site-card {
  padding: $spacing-md;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.site-card-left {
  flex: 1;
  display: flex;
  align-items: center;
  margin-right: $spacing-sm;
  min-width: 0;
}

.site-icon-wrapper {
  width: 72rpx;
  height: 72rpx;
  margin-right: $spacing-sm;
  flex-shrink: 0;
}

.site-icon-img {
  width: 72rpx;
  height: 72rpx;
  border-radius: $radius-sm;
}

.site-icon {
  width: 72rpx;
  height: 72rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: $radius-md;
  position: relative;
  overflow: hidden;
  
  /* 顶部反射高光 */
  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 15%;
    right: 15%;
    height: 40%;
    background: linear-gradient(180deg, rgba(255,255,255,0.5) 0%, transparent 100%);
    border-radius: $radius-md $radius-md 0 0;
  }
  
  &--success {
    background: linear-gradient(135deg, #B2F2DB 0%, $color-primary-light 50%, #C3FAE8 100%);
    color: $color-success;
    box-shadow:
      0 4rpx 12rpx rgba(12, 166, 120, 0.2),
      inset 0 1rpx 0 rgba(255, 255, 255, 0.6);
  }
  
  &--danger {
    background: linear-gradient(135deg, #FFC9C9 0%, #FFE3E3 50%, #FFC9C9 100%);
    color: $color-danger;
    box-shadow:
      0 4rpx 12rpx rgba(224, 49, 49, 0.2),
      inset 0 1rpx 0 rgba(255, 255, 255, 0.6);
  }
  
  &--info {
    background: linear-gradient(135deg, #D0EBFF 0%, #E7F5FF 50%, #D0EBFF 100%);
    color: $color-info;
    box-shadow:
      0 4rpx 12rpx rgba(51, 154, 240, 0.2),
      inset 0 1rpx 0 rgba(255, 255, 255, 0.6);
  }
  
  &--gray {
    background: linear-gradient(135deg, #DEE2E6 0%, #E9ECEF 50%, #DEE2E6 100%);
    color: $color-text-secondary;
    box-shadow:
      0 4rpx 12rpx rgba(0, 0, 0, 0.08),
      inset 0 1rpx 0 rgba(255, 255, 255, 0.6);
  }
}

.site-info {
  flex: 1;
  min-width: 0;
}

.site-title {
  font-size: $font-size-md;
  font-weight: 600;
  color: $color-text-primary;
  margin-bottom: 4rpx;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.site-domain {
  font-size: $font-size-xs;
  color: $color-text-secondary;
  margin-bottom: 8rpx;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.status-badge-mini {
  display: inline-flex;
  align-items: center;
  padding: 2rpx 10rpx;
  border-radius: 12rpx;
  font-size: 18rpx;
  font-weight: 600;
  letter-spacing: 0.5rpx;
  
  &--defense {
    background: linear-gradient(180deg, rgba(12, 166, 120, 0.12), rgba(12, 166, 120, 0.06));
    color: $color-success;
    border: 1rpx solid rgba(12, 166, 120, 0.2);
  }
  
  &--offline {
    background: linear-gradient(180deg, rgba(224, 49, 49, 0.12), rgba(224, 49, 49, 0.06));
    color: $color-danger;
    border: 1rpx solid rgba(224, 49, 49, 0.2);
  }
  
  &--observe {
    background: linear-gradient(180deg, rgba(51, 154, 240, 0.12), rgba(51, 154, 240, 0.06));
    color: $color-info;
    border: 1rpx solid rgba(51, 154, 240, 0.2);
  }
  
  &--dryrun {
    background: linear-gradient(180deg, rgba(107, 114, 128, 0.12), rgba(107, 114, 128, 0.06));
    color: $color-text-secondary;
    border: 1rpx solid rgba(107, 114, 128, 0.2);
  }
}

.site-card-right {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-shrink: 0;
  padding-left: $spacing-xs;
}

.loading-state,
.load-more {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: $spacing-lg;
}

.loading-text,
.load-more-text {
  font-size: $font-size-sm;
  color: $color-text-secondary;
  margin-top: $spacing-sm;
}

.load-complete {
  text-align: center;
  padding: $spacing-lg;
}

.load-complete-text {
  font-size: $font-size-xs;
  color: $color-text-disabled;
}
</style>