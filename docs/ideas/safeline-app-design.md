# Safeline App - 雷池网站管理应用

## 问题陈述

如何让用户能够便捷地通过移动端管理雷池网站的防护/维护状态切换？

## 推荐方向

**标准管理型**：兼顾效率与信息完整性，符合移动端管理习惯。

- 首页提供快捷操作入口（状态筛选 + 列表 + 开关切换）
- 详情页展示完整信息（基础信息 + 模式切换 + 操作日志）
- 设置页管理 API 配置（Base URL + Token + 连接测试）

## 技术栈

| 技术 | 说明 |
|------|------|
| **框架** | UniApp (跨端：iOS/Android/H5/小程序) |
| **UI 组件库** | TDesign UniApp v0.9.0 |
| **设计风格** | Hyperrealism（超写实） |
| **主色调** | 翡翠绿 `#0CA678` |
| **辅色** | 白色 `#FFFFFF`、浅灰 `#F0F1F3` |
| **数据存储** | uni.setStorageSync / uni.getStorageSync |
| **样式** | SCSS |

## 页面结构

```
pages/
├── index/index.vue          # 首页：网站列表 + 固定筛选Tab
├── detail/detail.vue        # 详情页：网站详情 + 模式切换 + 操作日志
└── settings/settings.vue    # 设置页：API 配置 + 使用说明
```

### 首页 (index)

**功能**：
- iOS 风格分段控件筛选 Tab（全部 / 防护 / 维护 / 观察），sticky 固定不随页面滚动
- 网站卡片列表：左侧 base64 图标 + 名称 + 域名 + 状态标签，右侧开关
- 原生页面下拉刷新（`onPullDownRefresh`）+ 触底加载更多（`onReachBottom`）
- 开关切换带全屏 loading 遮罩防重复提交，8 秒超时保险

**状态均已覆盖**：
- 加载中：转圈动画
- 空数据：空状态插图 + "暂无网站" + "去设置 API" 按钮
- 错误：Toast 提示
- 正常：网站卡片列表

### 详情页 (detail)

**功能**：
- 网站基础信息卡片（名称、域名、端口、时间）
- 三种运行模式可视化选择（防护/维护/观察），选中态高亮
- 操作日志列表（时间、类型、内容、用户、IP）
- 下拉刷新

### 设置页 (settings)

**功能**：
- API Base URL 输入框
- API Token 输入框
- 连接测试按钮（带 loading）
- 保存配置按钮（保存后自动跳转首页）
- 使用说明（四步配置指引）
- 关于信息

## API 服务层设计

### 认证方式

请求头携带 `X-SLCE-API-TOKEN` 进行认证，由雷池管理后台生成。

### 核心 API 接口

| 接口 | 方法 | 说明 |
|------|------|------|
| `/api/open/site` | GET | 获取网站列表 |
| `/api/open/site/{id}` | GET | 获取网站详情 |
| `/api/open/site/mode` | PUT | 批量更新网站运行模式 |
| `/api/open/site/{id}/log` | GET | 获取网站操作日志 |

### 请求配置

- 超时时间：10 秒
- 响应格式：`{ data, err, msg }`
- HTTP 状态码 401 → 认证失败

### 网站 mode 字段含义

| 值 | 名称 | 说明 | UI 颜色 |
|----|------|------|---------|
| `0` | **defense** | 防护模式（网站正常运行） | `#0CA678` 绿 |
| `1` | **offline** | 维护模式（暂停访问） | `#E03131` 红 |
| `2` | **dry run** | 观察模式（仅记录不拦截） | `#339AF0` 蓝 |

### 网站对象关键字段

```javascript
{
  "id": 0,                    // 网站 ID
  "title": "string",          // 网站标题
  "icon": "base64...",        // 网站图标（base64）
  "server_names": ["string"], // 域名列表
  "mode": 0,                  // 运行模式（0=防护，1=维护，2=观察）
  "is_enabled": true,         // 是否启用
  "ports": ["string"],        // 端口列表
  "comment": "string",        // 备注
  "created_at": "string",     // 创建时间
  "updated_at": "string"      // 更新时间
}
```

### API 服务层封装

```javascript
// utils/api.js
const API = {
  // 配置管理
  getConfig(),              // 从本地存储获取配置
  setConfig(config),        // 保存配置到本地存储
  testConnection(),         // 测试 API 连接

  // 网站管理
  getSiteList(params),      // 获取网站列表
  getSiteDetail(id),        // 获取网站详情
  toggleSiteMode(ids, mode),// 批量切换运行模式

  // 日志管理
  getSiteLogs(siteId, params), // 获取操作日志

  // 工具方法
  formatModeText(mode),     // 格式化模式文本
  formatModeColor(mode)     // 获取模式对应颜色
}
```

## Hyperrealism 设计规范

### 设计理念

超写实风格核心要素：
- **三层深度阴影**：紧贴细影 + 中距投影 + 远距环境光遮蔽，模拟真实物理光照
- **玻璃质感**：卡片顶部伪元素高光线，模拟光源反射
- **光泽按钮**：自上而下渐变 + 顶部 50% 反射层 + 按压下沉
- **高对比度**：深色文字 `#1A1A1A`，浓郁主色 `#0CA678`
- **物理缓动**：`cubic-bezier(0.25, 0.1, 0.25, 1)`

### 色彩体系

| 用途 | 色值 | 说明 |
|------|------|------|
| **主色** | `#0CA678` | 浓郁翡翠绿 |
| **主色浅** | `#E6FCF5` | 极浅绿背景 |
| **主色深** | `#087F5B` | 按钮底部渐变 |
| **主色发光** | `rgba(12, 166, 120, 0.35)` | 按钮 glow 阴影 |
| **页面背景** | `#F0F1F3` | 微灰纹理感 |
| **卡片背景** | `#FFFFFF` → `#FCFCFD` | 顶部至底部微渐变 |
| **NavigationBar** | `#FFFFFF` | 与内容区明显区分 |
| **文字-主** | `#1A1A1A` | 深黑 |
| **文字-次** | `#5C5C5C` | 中灰 |
| **文字-禁** | `#ADB5BD` | 浅灰 |
| **边框** | `#DEE2E6` | 分割线 |
| **成功/防护** | `#0CA678` | 绿色 |
| **危险/维护** | `#E03131` | 红色 |
| **信息/观察** | `#339AF0` | 蓝色 |

### 视觉层次

```
┌─────────────────────────┐
│  NavigationBar #FFFFFF   │ ← 白色顶栏，与内容区明确区分
├─────────────────────────┤
│  内容区背景 #F0F1F3       │ ← 统一灰色基底
│  ┌───────────────────┐   │
│  │  分段筛选控件       │   │ ← sticky 固定，融入背景
│  └───────────────────┘   │
│  ┌───────────────────┐   │
│  │  网站卡片（白色）    │   │ ← 深度阴影悬浮感
│  └───────────────────┘   │
└─────────────────────────┘
```

### 卡片样式

```css
.clay-card {
  background: linear-gradient(180deg, #FFFFFF 0%, #FCFCFD 100%);
  border-radius: 20rpx;
  border: 1rpx solid rgba(0, 0, 0, 0.06);
  /* 三层阴影 */
  box-shadow:
    0 1rpx 2rpx rgba(0, 0, 0, 0.04),
    0 6rpx 16rpx rgba(0, 0, 0, 0.08),
    0 16rpx 40rpx rgba(0, 0, 0, 0.06);
}
/* 顶部反射高光线 */
.clay-card::after {
  content: '';
  position: absolute;
  top: 0; left: 16rpx; right: 16rpx;
  height: 1rpx;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.9), transparent);
}
```

### 按钮样式

```css
.clay-button {
  background: linear-gradient(180deg, #0EDC9C 0%, #0CA678 60%, #087F5B 100%);
  /* 底部发光 + 高光 */
  box-shadow:
    0 4rpx 12rpx rgba(12, 166, 120, 0.35),
    0 1rpx 2rpx rgba(0, 0, 0, 0.15),
    inset 0 1rpx 0 rgba(255, 255, 255, 0.25);
}
/* 顶部玻璃反射 */
.clay-button::after {
  content: '';
  position: absolute;
  top: 0; left: 10%; right: 10%;
  height: 50%;
  background: linear-gradient(180deg, rgba(255,255,255,0.3), transparent);
}
```

### 字体规范

| 层级 | 字号 | 行高 | 用途 |
|------|------|------|------|
| H1 | 48rpx | 64rpx | 页面标题 |
| H2 | 40rpx | 56rpx | 区块标题 |
| H3 | 32rpx | 44rpx | 卡片标题 |
| 正文 | 28rpx | 40rpx | 正文内容 |
| 辅助 | 24rpx | 36rpx | 说明文字 |

### 间距规范

基于 8rpx 单位：
- 紧密：8rpx
- 同组：16rpx
- 区块内：24rpx
- 区块间：32rpx
- 页面边距：32rpx

### 状态颜色映射

| 状态 | CSS 类 | 背景 | 前景色 |
|------|--------|------|--------|
| 防护 | `--success` / `--defense` | `rgba(12,166,120,0.12)` | `#0CA678` |
| 维护 | `--danger` / `--offline` | `rgba(224,49,49,0.12)` | `#E03131` |
| 观察 | `--info` / `--observe` | `rgba(51,154,240,0.12)` | `#339AF0` |

### 分段控件（Tab）

- 外层灰色底槽 `background: $color-bg`
- 未选中：纯文字，无背景无边框
- 选中：白色胶囊 + 微阴影
- `position: sticky; top: 0; z-index: 100` - 滚动时固定
- 上下内边距 16rpx

## 关键假设与验证

- [x] 用户主要在移动端操作 → UniApp 跨端框架已选定
- [x] API 认证方式为 `X-SLCE-API-TOKEN` 请求头 → 已实现
- [x] 网站 mode 字段：0=防护、1=维护、2=观察 → 已确认并实现
- [x] 操作日志接口独立存在 → 使用 `/api/open/site/{id}/log`
- [x] 网站图标为 base64 格式 → 已支持 image 标签渲染

## MVP 范围

### 包含

1. 首页：网站列表 + 状态筛选 + 开关切换 + 下拉刷新 + 触底加载
2. 详情页：网站信息 + 模式切换 + 操作日志 + 下拉刷新
3. 设置页：API 配置 + 连接测试 + 使用说明
4. 四种状态覆盖：加载中 / 空数据 / 错误 / 正常
5. Hyperrealism 设计风格 + 翡翠绿主色调
6. 本地存储 API 配置
7. 请求超时（10s）+ 切换保险超时（8s）
8. 切换遮罩防重复提交
9. 固定筛选 Tab 栏
10. 原生页面滚动（无 scroll-view）

### 不包含

- **搜索功能** → 已移除，分段筛选足够
- **数据统计与图表** → 简化为模式展示
- **实时推送** → 手动刷新即可
- **批量操作** → API 支持但 UI 未实现
- **高级日志筛选** → 仅展示最近 50 条
- **暗黑模式** → MVP 阶段暂不支持
- **多语言** → 仅简体中文
- **scroll-view 滚动容器** → 已替换为原生页面滚动
