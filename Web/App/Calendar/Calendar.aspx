<%@ page language="C#" autoeventwireup="true" inherits="App_Calendar_Calendar, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="~/App/Calendar/EDate.ascx" TagPrefix="uc1" TagName="EDate" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->


    <style type="text/css">
        .calendar {
            float: left;
            margin: 4px;
        }

        .week {
            text-align: center;
            background-color: #FFCC66;
            font-weight: bold;
            height: 1px;
        }

        .day-r {
            background-color: pink;
        }

        .day-h {
            background-color: Highlight;
        }
    </style>

    <script type="text/javascript">
        function setBack(a) {
            var cell = $(a);
            var isWork = cell.hasClass("day-w");

            cell.removeClass("day-w").removeClass("day-r").removeClass("day-h");

            var className = dom("rbRest").checked ? "day-r" : "day-h";
            var saveValue = dom("rbRest").checked ? "R" : "H";

            if (isWork) {
                cell.addClass(className);
            }
            else {
                cell.addClass("day-w");
                saveValue = "W";
            }

            var guid = cell.attr("guid");

            var data = { guid: guid, type: saveValue }
            data.loading = false;

            $("#tip").hide();

            eci.post("CalendarHandler.ashx", "Save", data, function (response) {

                if (response.success) {
                    $("#tip").fadeIn(1000);
                }
                else {
                    msg.ajax(response);
                }
            })
        }

        var handler = 0;

        function set(a) {
            var cell = $(a);
            var work = document.getElementById("rbWork").checked;
            var holiday = document.getElementById("rbHoliday").checked;
            var rest = document.getElementById("rbRest").checked;

            cell.removeClass("day-w").removeClass("day-r").removeClass("day-h");

            var saveValue = "W";
            var className = "day-w";
            if (holiday) { saveValue = "H"; className = "day-h"; }
            if (rest) { saveValue = "R"; className = "day-r"; }

            cell.addClass(className);

            var guid = cell.attr("guid");

            var data = { guid: guid, type: saveValue }
            data.loading = false;

            $("#tip").hide();

            eci.post("CalendarHandler.ashx", "Save", data, function (response) {

                if (response.success) {
                    clearTimeout(handler)

                    $("#tip").fadeIn(1000);
                    handler = setTimeout(hideMessage, 5000);
                }
                else {
                    msg.ajax(response);
                }
            })
        }

        function hideMessage() {
            $("#tip").fadeOut(1000);
        }

        $(function () {

            $(window).scroll(function () {
                $("#divIcon").css("top", this.scrollY);
            })


        })

    </script>

    <style type="text/css">
        .line {
            border: 0px;
            border-top: 1px solid #808080;
            width: 200px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidEntityId" />
        <asp:HiddenField runat="server" ID="hidEntityType" />

        <div>

            <div id="divIcon" style="margin: 10px; position: absolute; left: 10px; top: 10px;">
                <div style="margin-bottom: 10px;">

                    <span><b>日历年份：</b></span>
                    <br />
                    <asp:ECombox runat="server" ID="cboYear" Height="25" AutoPostBack="true" OnSelectedIndexChanged="cboYear_SelectedIndexChanged">
                    </asp:ECombox>
                </div>

                <hr class="line" />

                <div style="margin-top: 10px;">
                    <b>将日期设置为：</b>

                    <br />
                    <asp:RadioButton ID="rbWork" runat="server" GroupName="G" Text="工作日期" />
                    <br />
                    <asp:RadioButton ID="rbHoliday" runat="server" GroupName="G" Checked="true" Text="法定假休息日" />
                    <br />
                    <asp:RadioButton ID="rbRest" runat="server" GroupName="G" Text="非法定休息日" />
                </div>
                <hr class="line" />

                <div style="margin-top: 10px;">
                    <b>设置方式：</b>
                    <br />
                    直接点击右侧日历中<br />
                    需要设置的日期
                </div>

                <hr class="line" />
                <div style="margin-top: 10px; margin-bottom: 10px;">
                    <b>日期颜色说明：</b>
                    <br />
                    <div style="background-color: #FFFFCC; height: 30px; width: 105px; border: 1px solid #FFCC66; text-align: center; line-height: 30px;">工作日</div>
                    <div style="background-color: Highlight; height: 30px; width: 105px; border: 1px solid #FFCC66; text-align: center; line-height: 30px; margin-top: 5px;">法定休息日</div>
                    <div style="background-color: pink; height: 30px; width: 105px; border: 1px solid #FFCC66; text-align: center; line-height: 30px; margin-top: 5px;">非法定休息日</div>

                </div>

                <hr class="line" />

                <div id="tip" style="margin-top: 10px; border: 1px solid #808080; color: darkred; font-size: 14px; background-color: aliceblue; text-align: center; padding: 5px; display: none;">
                    数据保存成功
                </div>


            </div>

            <div style="border: 0px solid red; margin-top: 0px; margin-left: auto; margin-right: auto; width: auto; width: 700px;">

                <div>
                    <uc1:EDate runat="server" ID="EDate1" />
                    <uc1:EDate runat="server" ID="EDate2" />
                    <uc1:EDate runat="server" ID="EDate3" />
                </div>
                <div>

                    <uc1:EDate runat="server" ID="EDate4" />
                    <uc1:EDate runat="server" ID="EDate5" />
                    <uc1:EDate runat="server" ID="EDate6" />
                </div>
                <div>
                    <uc1:EDate runat="server" ID="EDate7" />
                    <uc1:EDate runat="server" ID="EDate8" />
                    <uc1:EDate runat="server" ID="EDate9" />
                </div>
                <div>

                    <uc1:EDate runat="server" ID="EDate10" />
                    <uc1:EDate runat="server" ID="EDate11" />
                    <uc1:EDate runat="server" ID="EDate12" />
                </div>




            </div>




        </div>
    </form>
</body>
</html>
