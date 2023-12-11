let slideIndex = 1;//先預設變數為1

function showslides(props) {
  let i;
  //取得所有slides 因是取class 非id 故用getElementsByClassName
  let slides = document.getElementsByClassName("singleslide");

  //如果n大於slide的長度，表示已經到最後一張，要回到第一章開始播
  if (props > slides.length){
    slideIndex = 1;
  }

  if (props < 1) {
    slideIndex = slides.length;
  }

  //將所有圖片隱藏
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none';
  }

  //console.log(slideIndex -1, 25);

   //array都從0開始，所以要-1，因為slideIndex是從1開始，已經賦予值了
   slides[slideIndex -1].style.display = "flex";
}
  
  function plusSlides(a) {
    showslides((slideIndex += a));
  }


  //點擊按鈕時傳入1 or -1，代表上一張及下一張
  plusSlides(slideIndex);
/*自動播放功能
  slides[slideIndex - 1].style.display = "flex";
  setInterval(showslides, 1000);  
  showSlides(slideIndex);
  */
