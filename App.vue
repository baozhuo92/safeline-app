<script>
export default {
  onLaunch: function() {
    console.log('Safeline App Launch')
  },
  onShow: function() {
    console.log('Safeline App Show')
  },
  onHide: function() {
    console.log('Safeline App Hide')
  }
}
</script>

<style lang="scss">
@import '@/styles/common.scss';

page {
  background-color: #F0F1F3;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif;
}
</style>