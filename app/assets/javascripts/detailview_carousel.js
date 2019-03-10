$(function(){
  /* ロードイベント */
  //パネルの幅
  var carouselWidth = parseInt($('#carousel-panel').css('width').replace('px',''));
  // //パネルの左ボーダー
  var borderLWidth = parseInt($('#carousel-panel').css('border-left-width').replace('px',''));
  // //パネルの右ボーダー
  var borderRWidth = parseInt($('#carousel-panel').css('border-right-width').replace('px',''));
  // //#carousel-panelの全体の幅
  var totalWidth = carouselWidth + borderLWidth + borderRWidth;
  //carousel-innerのmargin-left初期値
  var defaultMargin = (totalWidth+ borderLWidth) * -1;
  //カルーセルで使用する画像
  var carouselImage = [];
  $('.carousel-column').each(function(){
    carouselImage.push($('img', this).attr('alt'));
  });
  //現在アクティブなインジゲーター
  var currentIndicator = 0;

  //carousel-innerの左マージンのズレを調整する
  $('#carousel-inner').css('margin-left', defaultMargin + 'px');

  /* クリックイベント */
  //戻るボタンがクリックされた時の処理
  $('#carousel-prev').click(function(){
    //パネルのサイズ１個分右にずらす
    $('#carousel-inner').animate({marginLeft:defaultMargin + carouselWidth + 'px'}, 'slow', 'swing', function(){
      endAnimate('prev');
      });
    });
  //進むボタンがクリックされた時の処理
  $('#carousel-next').click(function(){
    //パネルのサイズ１個分左にずらす
    $('#carousel-inner').animate({marginLeft:defaultMargin - carouselWidth + 'px'}, 'slow', 'swing', function(){
      endAnimate('next');
    });
  });

  //インジゲーターをクリックした時の処理
  $('#carousel-indicator li').click(function(){
    //クリックしたインジゲーターのインデックスが
    //アクティブなインジケーターのインデックスより大きい時、パネルを進める
    if(currentIndicator < $('#carousel-indicator li').index(this)){
    //進むボタンをクリックする回数
      var difference = $('#carousel-indicator li').index(this) - currentIndicator;
      //インデックスの差分進むボタンをクリックする
      for(var i = 0; i < difference; i++){
        $('#carousel-next').click();
      }
    }
    //クリックしたインジゲーターのインデックスが
    //クリックしたインジケーターのインデックスより大きい時、パネルを戻す
    else if(currentIndicator > $('#carousel-indicator li').index(this)){
      //戻るボタンをクリックする回数
      var difference = currentIndicator - $('#carousel-indicator li').index(this);
      //インデックスの差分戻るボタンをクリックする
      for(var i = 0; i < difference; i++){
        $('#carousel-prev').click();
      }
    }
  });

  /* ユーザー定義 */

  var endAnimate = function(str){
    if(str == 'prev'){
      //一番右端のパネルを一番左端に移動する
      $('#carousel-inner ul.carousel-column:last-child').prependTo('#carousel-inner');
    }
    else if(str == 'next'){
      //一番右端のパネルを一番左端に移動する
      $('#carousel-inner ul.carousel-column:first-child').appendTo('#carousel-inner');
    }
     //margin-leftを初期値に戻す
     $('#carousel-inner').css('margin-left', defaultMargin + 'px');
     //インジケーターのリセット
     $('#carousel-indicator li').removeClass('active');
     //activeクラスを付けなおす
     for(var i = 0; i < carouselImage.length; i++){
       if($('.carousel-column:nth(0) img').attr('alt') == carouselImage[i]){
         $('#carousel-indicator li:nth(' + i + ')').addClass('active');
         currentIndicator = i;
       }
     }
  };
});
