// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//  删除 require bootstrap-sprockets
//= require turbolinks
//= require jquery.raty
//= require letsrate
// 首页需要的js
$(function(){
	$('a[title]').tooltip();
});

// 猎头服务评价按钮的hover显示JS
$(document).ready(function() {
	$('#line_item  tr').hover(function() {
		$(this).removeClass('hover');
	}, function() {
		$(this).addClass('hover');
	});
});

$(document).ready(function() {
  $('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
  });

  $('tr[href]').click(function(event) {
  var url="home/users/"+$(this).attr("href");
  $('#profile-outline').load(url+" #special");
  $('tr[href]').removeClass('selected'); //删行所有行的td的selected class,不能只寻找tr
  $(this).addClass('selected');//只添加这一行的selected class
  event.preventDefault();

//debug用
  id = $(this).attr("href");
  console.log(id);
  });
 
  $('#tab1').on('click', function() {
  $('td').removeClass('hit');//把第一个找到的element removeClass
  $(this).addClass('hit');//给点击的td添加css
  });

  $('#tab2').on('click', function() {
  $('td').removeClass('hit');//把第一个找到的element removeClass
  $(this).addClass('hit');//给点击的td添加css
  });

  $("#label-1").click(function() { // 如果label-1被点击,
    if ($(this).text() == "修改点评") // 原来是修改点评，则切换标签成"放弃"
      $(this).text("放弃")
    else
      $(this).text("修改点评"); //反之,点击了放弃则切换文字到"修改点评"
  });
  $("#label-2").click(function() {
    if ($(this).text() == "我也说两句")
      $(this).text("放弃")
    else
      $(this).text("我也说两句");
  });
  
  $("#label-3").click(function() {
    if ($(this).text() == "我来评价他")
      $(this).text("收起")
    else
      $(this).text("我来评价他");
  });
  
  $("#label-4").click(function() {
    if ($(this).text() == "修改对他的评价")
      $(this).text("收起")
    else
      $(this).text("修改对他的评价");
  });


});
