$(function () {
    $("#input").on("keydown", function (e) {
        if (e.keyCode == 38 || e.keyCode == 40) { //38 page up  40 page down
            e.preventDefault();
            e.stopPropagation();
            var $active = $(".sug_menu  .active");
            var $first = $(".sug_menu li").first();
            var $last = $(".sug_menu li").last();
            var $prex= $active.prev("li");
            var $next = $active.next("li");
            var k = $("#input").val();

            $active.attr("class", "");
            if (k==$last.data("org")) {
                $prex = $last
                $next= $first
            }else {
                k= $last.data("org");
            }

            if(e.keyCode == 38&&$prex.length!=0){
                $prex.attr("class","active");
                k = $prex.text();
            }
            if(e.keyCode == 40&&$next.length!=0){
                $next.attr("class","active");
                k = $next.text();
            }
            if(k){
                $("#input").val(k)
            }
        }
    });

    $("#input").on("keyup", function (e) {
        if(e.keyCode != 38 && e.keyCode != 40){
            getSug($(this).val());
        }
    });

    function getSug(val) {

        $.ajax({
                type: "GET",
                url: "http://mingyi.sogou.com/suggnew/english?key=" + val + "&type=medic&ori=yes&pr=medic&abtestid=0&m=mingyi_callBack",
                dataType: "jsonp",
            }
        )
    }

    $(".sug_menu").on("click", "li", function () {
        var k = $(this).text()
        $("input[name='k']").val(k);
        $("#btn").click();
    });

    $(".sug_menu").on("mouseenter ", function () {
        $(".sug_menu li").attr("class", "");
    });
    sugCss();


    window.addEventListener("orientationchange", function () {
        sugCss();

    }, false);

    $("body").on("click", function () {
        if ($(this).attr("id") !== "input" || $(this).attr("id") !== "sug_menu") {
            hideSug()
        } else if ($(this).attr("id") == "input") {
            getSug()
        }
    });

});

function mingyi_callBack(data) {
    var k = data[0];
    var sugList = data[1];
    if (sugList.length > 0) {
        var $sug = getSug();
        var child = "";
        for (var i = 0; i < sugList.length; i++) {
            var sug = sugList[i];
            var index = sug.lastIndexOf(k);
            if (0 < index && index < sug.length - 2) {
                var alert = sug.substr(index + 1);
                child = child + "<li data-org='" + k + "'>" + k + "<b>" + alert + "</b></li>"
            } else if (index >= sug.length - 2) {
                child = child + "<li data-org='" + k + "'>" + sug + "</li>"
            } else if (index <= 0) {
                child = child + "<li data-org='" + k + "'><b>" + sug + "</b></li>"
            }
        }
        $sug.html(child);
        showSug();
    } else {
        hideSug()
    }
}


function changeCss($em, offset, w, h) {
    var style = "top:" + offset.top + "px;left:" + offset.left + "px;width:" + w + "px";
    $em.attr("style", style)
}

function sugCss() {
    var $input = $("input[name='k']");
    var offset = $input.position();
    offset.top = offset.top + $input.innerHeight();
    var w = $input.innerWidth() + 1;
    changeCss($(".sug_menu"), offset, w, "auto")
}
function hideSug() {
    $(".sug_menu").hide()
    $(".sug_menu").html("");
}
function showSug() {
    $(".sug_menu").show()
}
function getSug() {
    return $(".sug_menu")
}