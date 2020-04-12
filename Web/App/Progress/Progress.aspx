<%@ page language="C#" autoeventwireup="true" inherits="App_Progress_Progress, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>进度信息</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link href="../../Plugin/AmazeUI/Themes/assets/css/amazeui.min.css" rel="stylesheet" />
    <script src="../../Plugin/AmazeUI/Scripts/amazeui.min.js"></script>

    <style>
        .step-ok {
            border: 0px solid red;
            float: left;
            margin-right: 0px;
            background: url('images/backok.png') repeat-x;
            background-position-y: center;
        }

        .step-no {
            border: 0px solid red;
            float: left;
            margin-right: 0px;
            background: url('images/backno.png') repeat-x;
            background-position-y: center;
        }

        .step-name {
            height: 20px;
            margin-right: 8px;
            min-width: 100px;
            font-size: 13px;
        }
    </style>

    <script type="text/javascript">

        var taskId;
        var isCompleted = false;
        var isError = false;
        var startTime;
        var $stepContainer;

        function monitorProgress() {

            if (isCompleted) { return; }

            var data = { taskId: taskId, loading: false };
            eci.postme("GetProgress", data, function (r) {

                if (r == null) {
                    isCompleted = true;
                    isError = true;
                    $(".cost").text("无法获取进度信息").addClass("notnull");
                    $("#btnClose").addClass("btn-green").attr("value", "关闭");

                    return;
                }

                //if (!r.success) {
                //    isCompleted = true;
                //    isError = true;

                //    $(".cost").text(r.message).addClass("notnull");
                //    $("#btnClose").addClass("btn-green").attr("value", "关闭");

                //    return;
                //}

                var type = r.Type;

                if (type == "1") {
                    displayType1(r);
                }
                else {
                    displayType2(r);
                }


                if (r.Status == "0") {
                    isCompleted = true;
                    isError = true;
                    $(".info").html("任务异常：" + r.Message).addClass("notnull");
                    $("#btnClose").addClass("btn-orange").attr("value", "关闭");

                    $(".am-progress-bar").addClass("am-progress-bar-warning");

                    return;
                }


            })
        }


        function displayType1(r) {
            if (r.CurrentStepName) {
                $(".current-step-name").text("当前执行：" + r.CurrentStepName);
            }

            var percent = r.Percent + "%";
            $(".am-progress-bar").css("width", percent).text(percent);

            if (r.Percent >= 100) {
                completed();
            }
            else {
                queryProgressStatus();
            }
        }

        function displayType2(r) {

            $stepContainer.html("");

            var completedCount = 0;
            $(r.ListDetail).each(function () {
                var html = "";

                var status = this.Completed ? "ok" : "no";

                completedCount += (this.Completed ? 1 : 0);

                html += '<div class="step-' + status + '">';
                html += '    <div class="step-name"></div>';
                html += '        <div>';
                html += '             <img src="images/' + status + '.png" style="height: 50px; width: 50px;" />';
                html += '          </div>';
                html += '        <div class="step-name">' + this.StepName + '</div>';
                html += '</div>';

                $stepContainer.append(html)

            })

            var percent = completedCount * 100 / r.ListDetail.length + "%";
            $(".am-progress-bar").css("width", percent).text(percent);

            if (completedCount >= r.ListDetail.length) {
                completed();
            }
            else {
                queryProgressStatus();
            }
        }

        function completed() {
            isCompleted = true;
            $(".am-progress").removeClass("am-active");
            $("#btnClose").addClass("btn-green").attr("value", "关闭");
            //$(".current-step-name").text("任务执行完毕").css("color", "green");

            var autoClose = $("#hidClose").val();

            if (autoClose) {
                pageClose();
            }
        }

        function showCost() {
            var endTime = new Date()
            var cost = endTime.getTime() - startTime.getTime();

            if (!isCompleted) {

                var second = 0;
                var minute = 0;
                second = Math.floor(cost / 1000);

                minute = Math.floor(second / 60);
                second = second % 60;

                var message = "已经用时：";
                if (minute > 0) {
                    message += " " + minute + " 分";
                }

                message += " " + second + " 秒";

                $(".cost").text(message);
                setTimeout(showCost, 500);
            }
        }

        function queryProgressStatus() {
            setTimeout(monitorProgress, 1000);
        }

        function pageClose() {
            if (!isCompleted) {
                msg.tip("任务执行中,不可以关闭");
            }
            else {
                eci.close();

                var type = $("#hidType").val();

                removeTask();

                if (isError) {
                    window.parent.taskError(type);
                }
                else {
                    window.parent.taskSuccess(type);
                }
            }
        }

        function removeTask() {
            var data = { taskId: taskId, loading: false };
            eci.postme("RemoveProgressTask", data, function (r) {

            });
        }


        $(function () {
            $stepContainer = $("#stepContainer");
            $stepContainer.html("");
            taskId = $("#hidTaskId").val();
            if (taskId == "") {
                $(".cost").text("没有传入TaskId参数").addClass("notnull");
                $("#btnClose").addClass("btn-green").attr("value", "关闭");
                return;
            }

            startTime = new Date();
            taskId = $("#hidTaskId").val();
            queryProgressStatus();
            setTimeout(showCost, 100);
        })

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidTaskId" runat="server" />
        <input type="hidden" id="hidType" runat="server" />
        <input type="hidden" id="hidClose" runat="server" />

        <div style="margin: 0px; padding: 0px; padding-top: 4px;">
            <div style="text-align: center; width: 600px; margin-left: auto; margin-right: auto;">

                <div style="border: 0px solid red; height: 30px; line-height: 40px">
                    <div class="cost" style="float: left; width: auto;"></div>
                    <div class="info" style="float: left; margin-left: 10px; width: auto; display: inline-block;"></div>
                </div>
                <div class="am-progress am-progress-striped am-active" style="height: 40px; clear: both; margin-bottom: 10px;">
                    <div class="am-progress-bar am-progress-bar-success" style="line-height: 40px;"></div>
                </div>

                <div id="stepContainer" style="display: inline-block; margin-left: auto; margin-right: auto;">

                    <div class="step-ok">
                        <div class="step-name"></div>
                        <div>
                            <img src="images/ok.png" style="height: 50px; width: 50px;" />
                        </div>
                        <div class="step-name">步骤一</div>
                    </div>

                    <div class="step-no">
                        <div class="step-name"></div>
                        <div>
                            <img src="images/no.png" style="height: 50px; width: 50px;" />
                        </div>
                        <div class="step-name">步骤三</div>
                    </div>

                </div>

                <div style="height: 30px;">
                    <div class="current-step-name"></div>
                </div>

                <div style="margin-top: 5px;">
                    <input id="btnClose" type="button" class="btn-blue" value="任务执行中" style="width: 100px;" onclick="pageClose()" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
