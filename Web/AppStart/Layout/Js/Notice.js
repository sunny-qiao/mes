$(function () {

    if (window.error) { return; }

    //系统通知
    if ($("#hidNoticeGuid").length == 1) {

        var noticeGuid = $("#hidNoticeGuid").val();

        if (noticeGuid != "") {
            var url = "../../App/System/EciNoticeView.aspx?key=" + noticeGuid;

            eci.dialog(lang.M00039, url, { width: 1200, target: "notice" });
        }
    }



    var messageInterval = $("#form1").attr("messageInterval");

    messageInterval = parseFloat(messageInterval) * 1000;

   

    if (messageInterval > 0) {
        getMessage();
        setInterval(getMessage, messageInterval);
    }
});


var messageSetTime = 0;

function setMessageTime(time)
{
    messageSetTime = time;
}

var messageData;

function getMessage(byRead) {

    if ( $("#dialogMessage").length>0 && !$("#dialogMessage").is(":hidden")) {
        return;
    }

    var now = new Date();
    var time = now.getTime();

    if (time < messageSetTime) { return false; }

    eci.post("../../Data.ashx", "GetMessage", { loading:false}, function (data) {
        if (data.success) {

            var count = parseFloat(data.count);

            if (count > 9) {
                count = "9+";
            }

            $("#messageQty").html(count);

            if (byRead)
            {
                return;
            }

            if (data.count != "0") {
                var option = { id: "dialogMessage", height: 350, width: 600 }
                messageData = data;
                eci.dialog(lang.M00036, "../../App/Message/MessageView.aspx?id=" + data.id, option);
            }
        }
        else {
            msg.ajax(data)
        }

    })
}



function viewMessage() {

    var url = "../../App/Message/MessageList.aspx";

    eci.dialog(lang.M00037, url, { width: 1200, target: "list" });
}


function viewNotice() {

    var url = "../../App/System/EciNoticeListView.aspx";

    eci.dialog(lang.M00038, url, { width: 1200, target: "list" });
}

