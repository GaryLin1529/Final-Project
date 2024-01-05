document.addEventListener("DOMContentLoaded", function () {
    var header = document.querySelector('.header');
    var isHovered = false;

    window.addEventListener('scroll', function () {
        if (window.scrollY > 100 && !isHovered) {
            header.classList.add('hidden'); // 添加隱藏的樣式
        } else {
            header.classList.remove('hidden'); // 移除隱藏的樣式
        }
    });

    header.addEventListener("mouseenter", function () {
        isHovered = true;
        header.classList.remove('hidden'); // 移除隱藏的樣式
    });

    header.addEventListener("mouseleave", function () {
        isHovered = false;
        if (window.scrollY > 100) {
            header.classList.add('hidden'); // 添加隱藏的樣式
        }
    });
});
