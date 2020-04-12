<%@ page language="C#" autoeventwireup="true" inherits="App_DataHelp_ListConfigAdvance, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>列表自定义配置</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .sort-item {
            margin-bottom: 4px;
        }
    </style>




    <script type="text/javascript">
        function up(obj) {
            var tr = $(obj).parents("tr");
            upTr(tr);
        }

        function down(obj) {
            var tr = $(obj).parents("tr");
            downTr(tr);
        }


        function upTr(tr) {
            var prevTR = tr.prev();

            var index = prevTR.index();

            if (index == 0) return;

            if (prevTR.length > 0) {

                //获取上一行的seq;
                var prevSeq = prevTR.find(".seq").val();
                //获取当前行的seq
                var currentSeq = tr.find(".seq").val();

                prevTR.find(".seq").val(currentSeq);
                tr.find(".seq").val(prevSeq);

                prevTR.insertAfter(tr);
            }

            setseq();
        }

        function downTr(tr) {
            var nextTR = tr.next();
            if (nextTR.length > 0) {
                nextTR.insertBefore(tr);
            }

            setseq();
        }

        var row;

        $(function () {

            $(".move").focus(function () {
                $(this).addClass("myfocus");

            }).blur(function () {
                $(this).removeClass("myfocus");

            });


            $(".eci-grid-row").click(function () {
                row = $(this);
            });

            $(window).keydown(function () {

                if (event.keyCode == 38) {
                    upTr(row);
                }
                else if (event.keyCode == 40) {
                    downTr(row);
                }

            });
        });

        function setseq() {
            $(".seq").each(function (index) {

                $(this).val((index + 1) * 10);
            });
        }

        function dragAction(obj) {
            var configCode = $("#hidConfigCode").val();
            window.location.href = "ListConfigListDrag.aspx?ConfigCode=" + configCode;
        }

        function deleteAction(obj) {
            msg.confirm("确定要删除自定义配置吗?", obj);
        }

        function deleteOK() {
            msg.alert("企业配置信息清除成功", {
                closed: function () {
                    eci.close();
                }
            })
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidId" />

        <div class="fitH">


            <div id="toolbar" style="padding-left: 10px;">

                <asp:EButton runat="server" ID="btnSave" Text="保存" Icon="save" OnClick="btnSave_Click" />


                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div style="margin: 10px;">

                <asp:EPanel runat="server" ID="EPanel1" Icon="function" Title="基本设置">

                    <div style="margin: 20px;">

                        <div style="margin-top: 4px;">
                            分页大小:
                                <asp:ECombox runat="server" ID="cboPageSize" Width="150" Height="30">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>1000</asp:ListItem>
                                </asp:ECombox>

                        </div>

                         <div style="margin-top: 4px;">
                            固定列数:
                                <asp:ECombox runat="server" ID="cboFixCount" Width="150" Height="30">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:ECombox>
                        </div>
                    </div>

                </asp:EPanel>

                <br />

                <asp:EPanel runat="server" ID="divSort" Title="排序设置" Icon="function">

                    <div style="margin: 20px;">

                        <div class="sort-item">
                            排序字段:
                <asp:ECombox runat="server" ID="cboSort1" Width="150" Height="30"></asp:ECombox>
                            排序类型:
                <asp:ECombox runat="server" ID="cboSortType1" Width="150" Height="30">
                    <asp:ListItem Value=""></asp:ListItem>
                    <asp:ListItem Value="ASC">升序</asp:ListItem>
                    <asp:ListItem Value="DESC">降序</asp:ListItem>
                </asp:ECombox>
                        </div>

                        <div class="sort-item">
                            排序字段:
                <asp:ECombox runat="server" ID="cboSort2" Width="150" Height="30"></asp:ECombox>
                            排序类型:
                <asp:ECombox runat="server" ID="cboSortType2" Width="150" Height="30">
                    <asp:ListItem Value=""></asp:ListItem>
                    <asp:ListItem Value="ASC">升序</asp:ListItem>
                    <asp:ListItem Value="DESC">降序</asp:ListItem>
                </asp:ECombox>
                        </div>

                        <div class="sort-item">
                            排序字段:
                <asp:ECombox runat="server" ID="cboSort3" Width="150" Height="30"></asp:ECombox>
                            排序类型:
                <asp:ECombox runat="server" ID="cboSortType3" Width="150" Height="30">
                    <asp:ListItem Value=""></asp:ListItem>
                    <asp:ListItem Value="ASC">升序</asp:ListItem>
                    <asp:ListItem Value="DESC">降序</asp:ListItem>
                </asp:ECombox>
                        </div>
                    </div>
                </asp:EPanel>

            </div>



        </div>
    </form>
</body>
</html>
