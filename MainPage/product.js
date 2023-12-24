document.addEventListener('DOMContentLoaded', function() {
  var proContent = document.querySelector('.pro_content');
  var windowHeight = window.innerHeight || document.documentElement.clientHeight;

  function handleScroll() {
      // 取得目前捲動的距離
      var scrollY = window.scrollY || window.pageYOffset;

      // 計算透明度，可以根據需求進行調整
      var opacity = scrollY / windowHeight;

      // 將透明度應用到元素
      proContent.style.opacity = opacity.toFixed(2); // 限制小數點位數

      if (opacity > 0.5) {
          proContent.classList.add('partial-fade');
      } else {
          proContent.classList.remove('partial-fade');
      }
  }

  document.addEventListener('scroll', handleScroll);

  // 初始化處理捲動，以確保頁面打開時的正確透明度
  handleScroll();
});
