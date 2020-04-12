var lineMove = false;
var currTh = null;
$(document).ready(function () {

    $("body").append("<div id=\"line\" style=\"width:2px;height:200px;border-left:2px dashed #95B8E7;cursor:w-resize;position:absolute;display:none\" ></div> ");
    $("body").bind("selectstart", function () { return !lineMove; });
    $(".eci-grid th").bind("selectstart", function () { return false; });

    $("body").bind("mousemove", function (event) {
        if (lineMove == true) {
            $("#line").css({ "left": event.clientX }).show().css("z-index", 1000);
        }
    });

    $(".eci-grid th").bind("mousemove", function (event) {

        var th = $(this);
        if (th.hasClass("noresize")) { return;}
        if (th.prevAll().length <= 0 || th.nextAll().length < 1) {
            return;
        }
        var left = th.offset().left;
        if (event.clientX - left < 4 || (th.width() - (event.clientX - left)) < 4) {
            th.css({ 'cursor': 'w-resize' });
        }
        else {
            th.css({ 'cursor': 'default' });
        }
    });

    $(".eci-grid th").bind("mousedown", function (event) {
        var th = $(this);
        if (th.hasClass("noresize")) { return; }
        if (th.prevAll().length <= 0 | th.nextAll().length < 1) { return; }
        var pos = th.offset();
        if (event.clientX - pos.left < 4 || (th.width() - (event.clientX - pos.left)) < 4) {
            var height = th.parent().parent().height() + th.parents(".eci-grid").find(".eci-grid-rows-view").height();
            var top = pos.top;
            $("#line").css({ "height": height, "top": top, "left": event.clientX, "display": "" });
            lineMove = true;
            if (event.clientX - pos.left < th.width() / 2) {
                currTh = th.prev();
            }
            else {
                currTh = th;
            }
        }
    });

    $("body").bind("mouseup", function (event) {
        if (lineMove == true) {
            $("#line").hide();
            lineMove = false;

            setwidth(currTh, event);
        }
    });

    $(".eci-grid th").bind("mouseup", function (event) {
        if (lineMove == true) {
            $("#line").hide();
            lineMove = false;
            setwidth(currTh, event);
        }
    });

    var setwidth = function (currTh, event) {
        var pos = currTh.offset();
        var index = currTh.prevAll().length;
        var width = event.clientX - pos.left;
        currTh.width(width);

        var currInputTr = currTh.parent().parent().find("tr:first");

        var th = currInputTr.children().eq(index);
        th.width(width);

        th.find("input").val(th.width());

        var cell1 = currTh.parents(".eci-grid").find(".eci-grid-table-content")[0].rows[0].cells[index];
        $(cell1).width(currTh.width() + 5);

    }
});