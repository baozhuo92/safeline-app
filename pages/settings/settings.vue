<template>
  <view class="page-container">
    <view class="settings-content">
      <!-- API 配置卡片 -->
      <view class="config-card clay-card mb-md">
        <view class="card-header">
          <text class="card-title">API 配置</text>
        </view>
        
        <view class="config-form">
          <!-- Base URL 输入 -->
          <view class="form-item">
            <text class="form-label">Base URL</text>
            <view class="input-wrapper">
              <input 
                v-model="config.baseUrl"
                class="form-input"
                placeholder="https://web.520527.xyz:54321/api"
                type="text"
              />
            </view>
            <text class="form-hint">雷池 API 的 Base URL</text>
          </view>
          
          <!-- Token 输入 -->
          <view class="form-item">
            <text class="form-label">API Token</text>
            <view class="input-wrapper">
              <input 
                v-model="config.token"
                class="form-input"
                placeholder="输入 API Token"
                type="text"
              />
            </view>
            <text class="form-hint">从雷池后台获取的认证 Token</text>
          </view>
          
          <!-- 操作按钮 -->
          <view class="form-actions">
            <view class="btn-secondary" @tap="handleTest">
              <text>测试连接</text>
            </view>
            <view class="btn-primary" @tap="handleSave">
              <text>保存配置</text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 使用说明卡片 -->
      <view class="help-card clay-card mb-md">
        <view class="card-header">
          <text class="card-title">使用说明</text>
        </view>
        
        <view class="help-content">
          <view class="help-item">
            <view class="help-number">1</view>
            <view class="help-text">
              <text class="help-text-title">获取 API Token</text>
              <text class="help-text-desc">登录雷池管理后台，在"系统设置" → "API Token"中生成或复制 Token</text>
            </view>
          </view>
          
          <view class="help-item">
            <view class="help-number">2</view>
            <view class="help-text">
              <text class="help-text-title">配置 Base URL</text>
              <text class="help-text-desc">Base URL 通常为雷池管理后台地址 + "/api"，如 https://your-domain:port/api</text>
            </view>
          </view>
          
          <view class="help-item">
            <view class="help-number">3</view>
            <view class="help-text">
              <text class="help-text-title">测试连接</text>
              <text class="help-text-desc">点击"测试连接"按钮验证配置是否正确</text>
            </view>
          </view>
          
          <view class="help-item">
            <view class="help-number">4</view>
            <view class="help-text">
              <text class="help-text-title">开始使用</text>
              <text class="help-text-desc">保存配置后，即可在首页查看和管理网站</text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 关于卡片 -->
      <view class="about-card clay-card">
        <view class="card-header">
          <text class="card-title">关于</text>
        </view>
        
        <view class="about-content">
          <view class="about-row">
            <text class="about-label">应用名称</text>
            <text class="about-value">Safeline App</text>
          </view>
          <view class="about-row">
            <text class="about-label">版本号</text>
            <text class="about-value">1.0.0</text>
          </view>
          <view class="about-row">
            <text class="about-label">功能说明</text>
            <text class="about-value">雷池网站管理移动端应用</text>
          </view>
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
      config: {
        baseUrl: '',
        token: ''
      }
    }
  },
  
  onLoad() {
    this.loadConfig()
  },
  
  methods: {
    loadConfig() {
      const savedConfig = api.getConfig()
      if (savedConfig) {
        this.config = {
          baseUrl: savedConfig.baseUrl || '',
          token: savedConfig.token || ''
        }
      }
    },
    
    async handleTest() {
      if (!this.config.baseUrl || !this.config.token) {
        uni.showToast({ title: '请填写完整的配置信息', icon: 'none', duration: 2000 })
        return
      }
      
      let baseUrl = this.config.baseUrl.trim()
      if (!baseUrl.startsWith('http')) {
        baseUrl = 'https://' + baseUrl
      }
      if (!baseUrl.endsWith('/api')) {
        baseUrl = baseUrl.replace(/\/$/, '') + '/api'
      }
      
      const testConfig = {
        baseUrl,
        token: this.config.token.trim()
      }
      
      api.setConfig(testConfig)
      
      uni.showLoading({ title: '测试中...', mask: true })
      
      try {
        const result = await api.testConnection()
        uni.hideLoading()
        
        if (result.success) {
          uni.showToast({ title: '连接成功', icon: 'success', duration: 2000 })
        } else {
          uni.showToast({ title: result.message || '连接失败', icon: 'error', duration: 2000 })
        }
      } catch (error) {
        uni.hideLoading()
        uni.showToast({ title: error.message || '连接失败', icon: 'error', duration: 2000 })
      }
    },
    
    handleSave() {
      if (!this.config.baseUrl || !this.config.token) {
        uni.showToast({ title: '请填写完整的配置信息', icon: 'none', duration: 2000 })
        return
      }
      
      let baseUrl = this.config.baseUrl.trim()
      if (!baseUrl.startsWith('http')) {
        baseUrl = 'https://' + baseUrl
      }
      if (!baseUrl.endsWith('/api')) {
        baseUrl = baseUrl.replace(/\/$/, '') + '/api'
      }
      
      const saveConfig = {
        baseUrl,
        token: this.config.token.trim()
      }
      
      const success = api.setConfig(saveConfig)
      
      if (success) {
        uni.showToast({ title: '保存成功', icon: 'success', duration: 1500 })
        setTimeout(() => {
          uni.switchTab({ url: '/pages/index/index' })
        }, 1500)
      } else {
        uni.showToast({ title: '保存失败', icon: 'error', duration: 2000 })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/styles/common.scss';

.settings-content {
  padding-bottom: $spacing-xl;
}

.config-card,
.help-card,
.about-card {
  padding: $spacing-md;
}

.card-header {
  margin-bottom: $spacing-md;
  padding-bottom: $spacing-sm;
  border-bottom: 1rpx solid $color-border;
}

.card-title {
  font-size: $font-size-md;
  font-weight: 600;
  color: $color-text-primary;
}

.config-form {
  padding-top: $spacing-sm;
}

.form-item {
  margin-bottom: $spacing-lg;
}

.form-label {
  display: block;
  font-size: $font-size-sm;
  font-weight: 500;
  color: $color-text-primary;
  margin-bottom: $spacing-xs;
}

.input-wrapper {
  width: 100%;
}

.form-input {
  width: 100%;
  height: 72rpx;
  padding: 0 $spacing-sm;
  font-size: $font-size-sm;
  color: $color-text-primary;
  background: linear-gradient(180deg, #FFFFFF 0%, #FAFBFC 100%);
  border-radius: $radius-sm;
  border: 1.5rpx solid $color-border;
  box-sizing: border-box;
  box-shadow:
    0 1rpx 3rpx rgba(0, 0, 0, 0.04),
    inset 0 1rpx 2rpx rgba(0, 0, 0, 0.03);
  
  &::placeholder {
    color: $color-text-disabled;
  }
}

.form-hint {
  display: block;
  font-size: $font-size-xs;
  color: $color-text-disabled;
  margin-top: 8rpx;
}

.form-actions {
  display: flex;
  gap: $spacing-sm;
  margin-top: $spacing-lg;
}

.btn-secondary {
  flex: 1;
  height: 72rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(180deg, #FFFFFF 0%, #F8F9FA 100%);
  color: $color-primary;
  border: 1.5rpx solid rgba(12, 166, 120, 0.25);
  border-radius: $radius-md;
  font-size: $font-size-sm;
  font-weight: 600;
  letter-spacing: 1rpx;
  box-shadow:
    0 2rpx 6rpx rgba(0, 0, 0, 0.04),
    0 1rpx 2rpx rgba(0, 0, 0, 0.03);
  
  &:active {
    background: $color-primary-light;
    transform: scale(0.96);
  }
}

.btn-primary {
  flex: 1;
  height: 72rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(180deg, #0EDC9C 0%, #0CA678 60%, #087F5B 100%);
  color: $color-white;
  border: none;
  border-radius: $radius-md;
  font-size: $font-size-sm;
  font-weight: 600;
  letter-spacing: 1rpx;
  box-shadow:
    0 4rpx 12rpx $color-primary-glow,
    0 1rpx 2rpx rgba(0, 0, 0, 0.15),
    inset 0 1rpx 0 rgba(255, 255, 255, 0.25);
  
  &:active {
    transform: scale(0.96);
    box-shadow:
      0 2rpx 6rpx $color-primary-glow,
      inset 0 2rpx 4rpx rgba(0, 0, 0, 0.15);
  }
}

.help-content {
  padding-top: $spacing-sm;
}

.help-item {
  display: flex;
  margin-bottom: $spacing-md;
  
  &:last-child {
    margin-bottom: 0;
  }
}

.help-number {
  width: 48rpx;
  height: 48rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  background: $color-primary-light;
  color: $color-primary;
  border-radius: 50%;
  font-size: $font-size-sm;
  font-weight: 600;
  margin-right: $spacing-sm;
  flex-shrink: 0;
}

.help-text {
  flex: 1;
}

.help-text-title {
  display: block;
  font-size: $font-size-sm;
  font-weight: 500;
  color: $color-text-primary;
  margin-bottom: 4rpx;
}

.help-text-desc {
  font-size: $font-size-xs;
  color: $color-text-secondary;
  line-height: 1.5;
}

.about-content {
  padding-top: $spacing-sm;
}

.about-row {
  display: flex;
  justify-content: space-between;
  padding: $spacing-sm 0;
  border-bottom: 1rpx solid $color-border;
  
  &:last-child {
    border-bottom: none;
  }
}

.about-label {
  font-size: $font-size-sm;
  color: $color-text-secondary;
}

.about-value {
  font-size: $font-size-sm;
  color: $color-text-primary;
}
</style>