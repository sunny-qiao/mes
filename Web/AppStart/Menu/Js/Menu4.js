var over = false;
var containerHeight = 0;
var headerHeight = 0;
var body;

String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

function load() {
    var html = '<div style="text-align:center;padding-top:30px;font-size:12px;"><img src="../../Themes/Default/Images/Loading.gif"    /><div style="margin-top:10px;">功能加载中……</div></div>';

    $("#form1").html(html);
}

$(function () {

    fitH();

    $a = $(".m_g_item");

    var showPageNav = $("#hidPageNav").val();
    showPageNav = showPageNav == "true"
    var pageNav;

    $a.click(function () {
        var $this = $(this);
        var function_name = $this.attr("function_name");
        var function_id = $this.attr("function_id");

        var url = $this.attr("href");

        if (showPageNav) {
            pageNav = getMenuNavigateByDom($this);
        }

        if (url == "") {
            url = "app/build/build.aspx";
        }

        if (url.indexOf("pop:") == 0) {
            url = url.substr(4);

            if (url.indexOf("http") < 0 && url.indexOf("../") < 0) {
                url = "../../" + url;
            }
 
            window.parent.mainOpenUrl(url);
        }
        else {

            if (url.indexOf("http") < 0 && url.indexOf("../") < 0) {
                url = "../../" + url;
            }

            if (showPageNav) {

                if (url.indexOf('?') < 0) {
                    url += "?_PageNav=" + pageNav;
                }
                else {
                    url += "&_PageNav=" + pageNav;
                }
            }

            window.parent.mainOpenTab(function_id, function_name, url);
        }

        return false;
    });

    $("#container").click(function () {

        if (event.ctrlKey) {
            var logValue = $("#hidLog").val();
            parent.eci.textView(logValue, { width: 800 });
        }
    })

});

function getMenuNavigateByDom($dom) {
    var menu = $dom.text().trim();

    var parentId = $dom.attr("parentId");

    if (parentId) {
        var $dom = $("#" + parentId);
        menu = getMenuNavigateByDom($dom) + "=>" + menu;
    }

    return menu;
}

function fitH() {
    $(".fitH").each(function () {
        $this = $(this);

        var layoutHeight = getLayoutHeight($this);

        $this.height($(window).height() - layoutHeight);
    });
}

function getLayoutHeight($t) {
    h = 0;
    var m = $t.attr("layout");
    if (m) {
        var a = m.split(',');
        $.each(a, function (i, v) {
            h += isNaN(v) ? $("#" + v).outerHeight() : parseFloat(v);
        });
    }

    return h;
}

function menuLayout() {

    var winHeight = $(window).height();
    headerHeight = 0;

    var $header = $(".panel-header");

     var padding= $(".panel-header").css("padding-top").replace("px","")*2;

    if ($header.length > 0) {

        $header.each(function () {
            headerHeight += $(this).height() + padding;
        });

        containerHeight = $("#container").height() + 0;

        if (headerHeight + 250 > containerHeight) {

            over = true;

            $("#menu").height(headerHeight);
        }
        else {
            $("#menu").height(containerHeight - 2);
        }

    }

    var bodyHeight = winHeight - headerHeight - 15;
    $(".accordion-body").height(bodyHeight);
}

var currentNode;

$(function () {

    headerHeight = 0;

    var $header = $(".panel-header");

    if ($header.length == 0) {
 
        var winHeight = $(window).height();

        var containerHeight = winHeight;

        $("#container").height(containerHeight);
    }

    if ($header.length > 0) {

        menuLayout();

        $(window).resize(function () {
            fitH();
            setMenuLayout();
        });

        $header.click(function () {
            var my = $(this);
            var root = my.parents(".easyui-accordion");
            body = my.parent().find(".accordion-body");
            var isHidden = body.is(":hidden");

            if (isHidden) {
                //显示
                //其它的项，先隐藏
                root.find(".accordion-header-selected").removeClass("accordion-header-selected");
                root.find(".accordion-body").hide();
                root.find(".accordion-collapse").addClass("accordion-expand");

                //当前项-显示
                my.addClass("accordion-header-selected");
                //body.show();
                body.slideDown(function () {
                    setMenuLayout();
                });

                my.find(".accordion-collapse").removeClass("accordion-expand");
            }
            else {
                //将当前选定项隐藏
                my.removeClass("accordion-header-selected");
                my.find(".accordion-collapse").addClass("accordion-expand");
                //body.hide();
                body.slideUp();
            }
        });

        $header[0].click();

        $(".tree-node").click(function () {
 
            var level = $(this).attr("level");
           
            var my = $(this);
            var body = my.parent().find("ul");
            if (body.length == 0) { return; }

            var isHidden = body.is(":hidden");
  
            var brother = my.parent().parent().find(".tree-node[level=" + level + "]");

            //alert(brother.length)
            //alert(brother.html())

            $(brother).each(function () {
                nodeAction(this, false);
            })

            nodeAction(this, isHidden);


            //if (isHidden) {
            //    body.show();
            //    my.find(".tree-hit").removeClass("tree-collapsed").addClass("tree-expanded");
            //    my.find(".tree-folder").addClass("tree-folder-open");
            //}
            //else {
            //    body.hide();
            //    my.find(".tree-hit").removeClass("tree-expanded").addClass("tree-collapsed");
            //    my.find(".tree-folder").removeClass("tree-folder-open");
            //}
        });


        function nodeAction(node, status) {
            var my = $(node);
            var body = my.parent().find("ul");
            if (body.length == 0) { return; }

            if (status) {
                body.show();
                my.find(".tree-hit").removeClass("tree-collapsed").addClass("tree-expanded");
                my.find(".tree-folder").addClass("tree-folder-open");
            }
            else {
                body.hide();
                my.find(".tree-hit").removeClass("tree-expanded").addClass("tree-collapsed");
                my.find(".tree-folder").removeClass("tree-folder-open");
            }

        }



        $(".tree-node").find("div").click(function () {
             
            if (currentNode) {
                $(currentNode).removeClass("current");
            }

            currentNode = this;

            $(this).addClass("current");
        });
    }

});

function setMenuLayout() {
    var winHeight = $(window).height();
    var bodyHeight = winHeight - headerHeight - 15;

    var over = false;
    if (bodyHeight < 250) {
        bodyHeight = 250;
        over = true;
    }
    body.height(bodyHeight);

    var menuHeight = headerHeight + bodyHeight + 10;
    var containerHeight = 0;

    if (over) {
        containerHeight = winHeight - 5;
    }
    else {
        containerHeight = menuHeight + 2;
    }

    $("#menu").height(menuHeight);
    $("#container").height(containerHeight);
}