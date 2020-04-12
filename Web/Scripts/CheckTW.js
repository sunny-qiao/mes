$(function () {
 
    $(".text-input").on("keyup", function () {
        checkTW(this);
    }).on("blur", function () {
        checkTW(this);
    })
 
    function checkTW(me) {
        var value = me.value;
        $(me).removeClass("tw-tip")

        var data = { input: value, loading: false };


        if (/.*[\u4E00-\u9FA5]+.*$/.test(value)) {
            eci.post("../../Data.ashx", "HasTW", data, function (res) {
                if (res.hastw == "Y") {
                    $(me).addClass("tw-tip")
                }
            })
        }
    }


})