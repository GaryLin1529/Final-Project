function submitComment() {
    var userName = document.getElementById('userName').value;
    var userOpinion = document.getElementById('userOpinion').value;
    var starRating = document.querySelector('.rating input[name="rating"]').value;
   
    var starIcons = generateStarIcons(starRating);
    // 創建評論內容
    var commentEntry = `
        <div class="comment-entry">
            <div class="stars">${generateStarIcons(starRating)}</div>
            <div>使用者名字：${userName}</div>
            <div>評論：${userOpinion}</div>
        </div>
    `;

    // 將評論內容附加到歷史區域
    document.getElementById('commentHistory').innerHTML += commentEntry;

    // 清空輸入欄位
    document.getElementById('userName').value = '';
    document.getElementById('userOpinion').value = '';
}


function generateStarIcons(rating) {
    var stars = '';
    for (var i = 0; i < 5; i++) {
        stars += `<i class='bx ${i < rating ? 'bxs' : 'bx'}-star' style="--i: ${i};"></i>`;
    }
    return stars;
}