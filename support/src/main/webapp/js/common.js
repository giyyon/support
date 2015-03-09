/* Main Banner */
$(document).ready(function(){
	var $careNum=0;
	var $theSize=$(".main_area .m_box").size();

	$(".main_area .m_box").hide();
	$(".main_area .m_box").eq(0).show();

	$(".leftBtn").click(function(){
		$careNum--;
		if($careNum<0) $careNum=$theSize-1;
		$(".main_area .m_box").hide();
		$(".main_area .m_box").eq($careNum).show();
	})

	$(".rightBtn").click(function(){
		$careNum++;
		if($careNum>=$theSize) $careNum=0;
		$(this).parent().children("div");
		$(".main_area .m_box").hide();
		$(".main_area .m_box").eq($careNum).show();
	})
});

/* Radio */
$(function(){
 $(".bene_radio img").click(function(){
  $(".bene_radio img").toggle();
 });
});

/* FAQ accodion
$(document).ready(function(){
    $("#faq dd").hide();
    $("#faq>dt>a").click(function(){
        //2.dd 요소 전부 숨긴다.
        //$("#faq dd").slideUp();
        $(this).parent().next().siblings("dd").slideUp("fast");
        //3. 해당하는 dd요소만 보인다.
        $(this).parent().next().slideDown("normal");

        $("#faq dt").removeClass("faq_active");
        $(this).parent().addClass("faq_active");
    })
})*/

/* Join Tab */
$(document).ready(function(){
    $("#join_tab div").hide();
    $("#join_tab div:eq(0)").show();

    $("#join_tab h3 a").bind("mouseover focus",function(){
        $("#join_tab div").hide();
        $(this).parent().next().show();
        $("#join_tab h3 img").each(function(){
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
        })
    $(this).children().attr("src",
    $(this).children().attr("src").replace("off.png","on.png"));
    })
})

/* Family */
jQuery(function($){
    var family = $('div.familysite');
    var fm_list = family.find('.family_list>li');

    $('.family_list').hide();
    // family show hide

    function over_fs(){$('.family_list').show();}

    function out_fs(){$('.family_list').hide();}

    family.find('a.fm_open').mouseover(over_fs).focus(over_fs);family.mouseleave(out_fs);
    family.find('>ul').mouseleave(out_fs);
    $('*:not(".familysite *")').focus(out_fs);
    // Over Out Menu
});

/*CEO*/
$(function(){
	$(".li01").click(function(){
		$("#company01").css("display","block");
		$("#company02").css("display","none");
		$("#company03").css("display","none");
	})
})

$(function(){
	$(".li02").click(function(){
		$("#company01").css("display","none");
		$("#company02").css("display","block");
		$("#company03").css("display","none");
	})
})

$(function(){
	$(".li03").click(function(){
		$("#company01").css("display","none");
		$("#company02").css("display","none");
		$("#company03").css("display","block");
	})
})
/*FAQ*/
$(function(){
	$(".dt01").click(function(){
	$(".dd01").css("display","block")
	$(".dd02").css("display","none")
	$(".dd03").css("display","none")
	$(".dd04").css("display","none")
	$(".dd05").css("display","none")
	$(".dd06").css("display","none")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt02").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","block")
	$(".dd03").css("display","none")
	$(".dd04").css("display","none")
	$(".dd05").css("display","none")
	$(".dd06").css("display","none")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt03").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","none")
	$(".dd03").css("display","block")
	$(".dd04").css("display","none")
	$(".dd05").css("display","none")
	$(".dd06").css("display","none")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt04").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","none")
	$(".dd03").css("display","none")
	$(".dd04").css("display","block")
	$(".dd05").css("display","none")
	$(".dd06").css("display","none")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt05").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","none")
	$(".dd03").css("display","none")
	$(".dd04").css("display","none")
	$(".dd05").css("display","block")
	$(".dd06").css("display","none")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt06").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","none")
	$(".dd03").css("display","none")
	$(".dd04").css("display","none")
	$(".dd05").css("display","none")
	$(".dd06").css("display","block")
	$(".dd07").css("display","none")
	})
})

$(function(){
	$(".dt07").click(function(){
	$(".dd01").css("display","none")
	$(".dd02").css("display","none")
	$(".dd03").css("display","none")
	$(".dd04").css("display","none")
	$(".dd05").css("display","none")
	$(".dd06").css("display","none")
	$(".dd07").css("display","block")
	})
})
/* allMenu */
function active_item() {
    var obj = document.getElementById("all_item");
    var btn = document.getElementById("all_item_close");

    if(obj.style.display == "" || obj.style.display=="none"){
        obj.style.display="block";
        btn.style.display="block";
        }else {
        obj.style.display="none";
        btn.style.display="none";
    }
    //obj.style.display="block";
}
function active_menu() {
    var obj01 = document.getElementById("m_depth_wrap");
    var btn01 = document.getElementById("m_menu_close");

    if(obj01.style.display == "" || obj01.style.display=="none"){
        obj01.style.display="block";
        btn01.style.display="block";
    }else {
        obj01.style.display="none";
        btn01.style.display="none";
    }
//obj.style.display="block";
}

 /* Gnb */
$(function(){
	$("#navi, #navi_bg").bind('mouseover focusin',function(){
		$( "#navi li div" ).css( 'display','block' );
		$( "#navi_bg" ).css( 'display','block' );
	});

	$("#lnb, #logo, #sub_container").bind('mouseover focusin',function(){
		$( "#navi li div" ).css( 'display','none' );
		$( "#navi_bg" ).css( 'display','none' );
	});
});

$(function(){
	$("#navi, #snavi_bg").bind('mouseover focusin',function(){
		$( "#navi li div" ).css( 'display','block' );
		$( "#snavi_bg" ).css( 'display','block' );
	});

	$("#lnb, #logo, #sub_container").bind('mouseover focusin',function(){
		$( "#navi li div" ).css( 'display','none' );
		$( "#snavi_bg" ).css( 'display','none' );
	});
});

/* Flag */
var m_bn_count=0;
var m_bn_p_click_check= 0;

function m_bn_init(){
    var $j=jQuery;

    m_bn_count = $j("#flag_wrap > ul > li").size();
    $j("#flag_wrap").css({"height":"100%","overflow":"hidden"})
    $j(".dir_prev").click(function(){m_bn_l_click();return false;});
    $j(".dir_next").click(function(){m_bn_r_click();return false;});

}

function m_bn_s_click(){
    var $j=jQuery;
    var count = $j("#flag_wrap > ul > li").size();

    m_bn_p_click_check = 0;
    $j("#flag_wrap > ul").stop();
    $j("#flag_wrap > ul").css({"left":"0px"});
    if(m_bn_count < count){
        $j("#flag_wrap > ul > li:last").remove();
    }
}
function m_bn_r_click(){
    var $j=jQuery;

    m_bn_s_click();
    $j("#flag_wrap > ul > li").eq(0).clone().appendTo($j("#flag_wrap > ul"));
    $j("#flag_wrap > ul > li").eq(0).remove();
}
function m_bn_l_click(){
    var $j=jQuery;

    m_bn_s_click();
    $j("#flag_wrap > ul > li:last").clone().prependTo($j("#flag_wrap > ul"));
    $j("#flag_wrap > ul > li:last").remove();
}

/* Moblie GNB */
jQuery(function($){
	var menu_v = $('div#m_depth_wrap');
	var sItem = menu_v.find('>ul>li');
	var ssItem = menu_v.find('>ul>li>ul>li');
	var lastEvent = null;

	sItem.find('>ul').css('display','none');
	menu_v.find('>ul>li>ul>li[class=active]').parents('li').attr('class','active');
	menu_v.find('>ul>li[class=active]').find('>ul').css('display','block');

	function menu_vToggle(event){
		var t = $(this);

		if (this == lastEvent) return false;
		lastEvent = this;
		setTimeout(function(){ lastEvent=null }, 200);

		if (t.next('ul').is(':hidden')) {
			sItem.find('>ul').slideUp(100);
			t.next('ul').slideDown(100);
		} else if(!t.next('ul').length) {
			sItem.find('>ul').slideUp(100);
		} else {
			t.next('ul').slideUp(100);
		}

		if (t.parent('li').hasClass('active')){
			t.parent('li').removeClass('active');
		} else {
			sItem.removeClass('active');
			t.parent('li').addClass('active');
		}
	}
	sItem.find('>a').click(menu_vToggle).focus(menu_vToggle);

	function subMenuActive(){
		ssItem.removeClass('active');
		$(this).parent(ssItem).addClass('active');
	};
	ssItem.find('>a').click(subMenuActive).focus(subMenuActive);

	menu_v.find('>ul>li>ul').prev('a').append('<span class="i"></span>');
});




/***********************************************************************************/

if (typeof(COMMON_JS) == 'undefined') {
	if (typeof rt_path == 'undefined')
        alert('rt_path 변수가 선언되지 않았습니다.');

    var COMMON_JS = true;

    function win_open(url, name, option) {
        var popup = window.open(rt_path + '/' + url, name, option);
        popup.focus();
    }

    // 쪽지 창
    function win_memo(url) {
		if (!url)
			url = "member/memo/lists";
        win_open(url, "winMemo", "left=50,top=50,width=616,height=460,scrollbars=1");
    }

	// 자기소개 창
    function win_profile(mb_id) {
        win_open("member/profile/qry/"+mb_id, 'winProfile', 'left=50,top=50,width=400,height=500,scrollbars=1');
    }

    // 우편번호 창
    function win_zip(frm_name, frm_zip1, frm_zip2, frm_addr1, frm_addr2) {
        url = "useful/zip/qry/"+frm_name+"/"+frm_zip1+"/"+frm_zip2+"/"+frm_addr1+"/"+frm_addr2;
        win_open(url, "winZip", "left=50,top=50,width=416,height=357,scrollbars=1");
    }

	 // 우편번호 창1
    function win_zip1(frm_name, frm_zip1, frm_zip2, frm_addr1, frm_addr2) {
        url = "useful/zip/qry1/"+frm_name+"/"+frm_zip1+"/"+frm_zip2+"/"+frm_addr1+"/"+frm_addr2;
        win_open(url, "winZip", "left=50,top=50,width=416,height=357,scrollbars=1");
    }

	// POST 전송, 결과값 리턴
    function post_s(href, parm, del) {
        if (!del || confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?")) {
			$.post(rt_path + '/' + href, parm, function(req) {
                document.write(req);
			});
		}
    }

    // POST 이동
    function post_goto(url, parm, target) {
        var f = document.createElement('form');

        var objs, value;
        for (var key in parm) {
            value = parm[key];
            objs = document.createElement('input');
            objs.setAttribute('type', 'hidden');
            objs.setAttribute('name', key);
            objs.setAttribute('value', value);
            f.appendChild(objs);
        }

        if (target)
            f.setAttribute('target', target);

        f.setAttribute('method', 'post');
        f.setAttribute('action', rt_path + '/' + url);
        document.body.appendChild(f);
        f.submit();
    }

    // POST 창
    function post_win(name, url, parm, opt) {
        var temp_win = window.open('', name, opt);
            post_goto(url, parm, name);
    }

	// 일반 삭제 검사 확인
    function del(href) {
        if(confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?"))
            document.location.href = rt_path + '/' + href;
    }

	// 플래시에 변수 추가 fh
	function flash_movie(src, ids, width, height, wmode, fh) {
        var wh = "";
        if (parseInt(width) && parseInt(height))
            wh = " width='"+width+"' height='"+height+"' ";
        return "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' "+wh+" id="+ids+"><param name=wmode value="+wmode+"><param name=movie value="+src+"><param name=quality value=high><param name=flashvars value="+fh+"><embed src="+src+" quality=high wmode="+wmode+" flashvars="+fh+" type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash' "+wh+"></embed></object>";
    }

	// 동영상 파일
    function obj_movie(src, ids, width, height, autostart) {
        var wh = "";
        if (parseInt(width) && parseInt(height))
            wh = " width='"+width+"' height='"+height+"' ";
        if (!autostart) autostart = false;
        return "<embed src='"+src+"' "+wh+" autostart='"+autostart+"'></embed>";
    }

	// 아이프레임 높이 자동조절
	function reSize(obj) {
		try {
			var objBody = frames[obj].document.body;
			var objFrame = document.getElementById(obj);
			ifrmHeight = objBody.scrollHeight + (objBody.offsetHeight - objBody.clientHeight);
			objFrame.style.height = ifrmHeight;
		}
		catch(e) {}
	}

	function sEncode(val) {
		return encodeURIComponent(val).replace(/%/g, '.');
	}

    // script 에서 js 파일 로드
    function importScript(FILES) {
        var _importScript = function(filename) {
        	if (filename) {
        		document.write('<script type="text/javascript" src="'+rt_path+'/js/'+filename+'.js"></s'+'cript>');
            }
        };

        for (var i=0; i<FILES.length; i++) {
        	_importScript(FILES[i]);
        }
    }

    // jQuery textarea
    function txresize(tx, type, size) {
        var tx = $('#'+tx);
        if (type == 1)
            tx.animate({'height':'-='+size+'px'}, 'fast');
        else if (type == 2)
            tx.animate({'height':size}, 'fast');
        else if (type == 3)
            tx.animate({'height':'+='+size+'px'}, 'fast');
    }

	// 팝업 닫기
	function popup_close(id, onday) {
		if (onday) {
			var today = new Date();
			today.setTime(today.getTime() + (60*60*1000*24));
			document.cookie = id + "=" + escape( true ) + "; path=/; expires=" + today.toGMTString() + ";";

		}

		if (window.parent.name.indexOf(id) != -1)
			window.close();
		else
			document.getElementById(id).style.display = 'none';
	}
}

