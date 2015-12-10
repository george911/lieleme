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
//= require autocomplete-rails
// require ckeditor-jquery
//= require_tree .
//  删除 require bootstrap-sprockets
//= require turbolinks
//= require jquery.raty
//= require ratyrate
// //= require letsrate

//一定要放在底部
//= require moment
//= require bootstrap-datetimepicker
// fullcalendar放到datetimepicker后面
//= require fullcalendar


$(function() {
	if(window.innerHeight > window.innerWidth){
		$("#iframe_padding").addClass("padding_portrait");
		$("#iframe_padding").removeClass("padding_landscope");
		$("#iframe").addClass("portrait");
		$("#iframe").removeClass("landscope");}
        else{
		$("#iframe_padding").removeClass("padding_portrait");
		$("#iframe_padding").addClass("padding_landscope");
		$("#iframe").addClass("landscope");
		$("#iframe").removeClass("portrait")}
});
		
$(window).on( "orientationchange", function(event) {
	if(window.innerHeight > window.innerWidth){
		$("#iframe_padding").addClass("padding_portrait");
		$("#iframe_padding").removeClass("padding_landscope");
		$("#iframe").addClass("portrait");
		$("#iframe").removeClass("landscope");}
        else{
		$("#iframe_padding").removeClass("padding_portrait");
		$("#iframe_padding").addClass("padding_landscope");
		$("#iframe").addClass("landscope");
		$("#iframe").removeClass("portrait")}
});
$(function() {
  $('#job_avatar, #micropost_avatar').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
          console.log(file);
          img.src = file.target.result;
          $('#target').html(img);
			          }
        reader.readAsDataURL(image);
        console.log(files);
        });
});

$(document).ready(function(){
  $('#calendar').fullCalendar({
    dayNamesShort: ['日','一','二','三','四','五','  六'],
    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月'],
    //render front/show.json.jbuilder,通过json把数据传递给fullcalendar
    events: '/front.json',
    header: { 
    left: 'prev title',
    title: 'MM',
    center: 'agendaWeek,month',
    right: 'next'}, // buttons for switching between views
    views: {
      month: { // name of view
        titleFormat: ' '}
		     },
    firstDay: 0,
    allDayDefault: false,
    allDaySlot: false,
    firstHour: 9, //v1版本使用firstHour,v2版本使用scrollTime
    ignoreTimezone: false,
    eventColor: '#AB6D86',
    eventRender: function (event, element) {
	        var dataToFind = moment(event.start).format('YYYY-MM-DD');
		    $("td[data-date='"+dataToFind+"']").addClass('dayWithEvent');
    },
    eventClick: function(calEvent, jsEvent, view) {
      function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
        }

      var your_date = calEvent.start;
      var t = Date.parse(your_date); // date in milliseconds since January 1, 1970
      var d = new Date(t);
      var h=addZero(d.getHours());
      var m=addZero(d.getMinutes());

        alert(h+":"+m+"与" + calEvent.title+"面试");
    }
 });
});
$(function(){
  $('#selectAll').click(function() {
  if (this.checked) {
    $(':checkbox').each(function() {
      this.checked = true;                        
       });
} else {
    $('input[id^="my_talent_ids"]').each(function() {
      this.checked = false;                        
    });
  } 
});
});
$(function() {
  $('.back').click(function() {
    return false;
  });
});

$(window).load(function() {
  $('#notice_popup').modal('show');
  });

// notice 动画
// $(function() {
 //  $('#notice').delay(500).fadeIn('normal', function() {
  //   $(this).delay(5000).fadeOut();
   // });
// });

$(function () {
	  $('[data-toggle="popover"]').popover()
})

// 首页需要的js
$(function(){
	$('a[title]').tooltip();
});

// 修改邀请时面试理由选择
// 34行用select不用#interview_content是因为select全局寻找而后者只是寻找第一个符合要求的。find(':selected')在select下拉菜单里寻找选中的选项,data('id')得到data-id的值
$(document).ready(function() {
  $('select').change(function(event) {
    var value = $(this).find(':selected').data('id');
    var job = "#job_"+value
      console.log(value);      
      console.log(job);      
      $(job).toggleClass("hidden");
	});
});
// 邀请面试时理由选择
$(document).ready(function() {
  $('#interview_content').change(function(event) {
    var value = $(this).val;
      console.log(value);      
      $("#job_select").toggleClass("hidden");
	});
});

// front/show.html.erb页面offer的猎头hover高亮
$(document).ready(function() {
	$('#offer td').hover(function() {
		$(this).addClass('hover');
	}, function() {
		$(this).removeClass('hover');
	});
});
// my_invites页面推荐候选人按钮的hover显示JS
$(document).ready(function() {
	$('#my_invite  tr').hover(function() {
		$(this).removeClass('hover');
	}, function() {
		$(this).addClass('hover');
	});
});
// 操作按钮的hover显示JS
$(document).ready(function() {
	$('#my_jobs  tr').hover(function() {
		$(this).removeClass('hover');
	}, function() {
		$(this).addClass('hover');
	});
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
