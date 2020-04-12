<%@ page language="C#" autoeventwireup="true" inherits="App_DataHelp_ListConfigList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>列表自定义配置</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .myfocus {
            background: green;
        }

        .mytr {
            border: 1px solid red;
            background: pink;
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

        function more() {
            var id = $("#hidId").val();
            var url = "ListConfigAdvance.aspx?id=" + id;

            eci.dialog("更多设置", url);
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidConfigOwner" />
        <asp:HiddenField runat="server" ID="hidConfigCode" />
        <asp:HiddenField runat="server" ID="hidId" />
        <asp:HiddenField runat="server" ID="hidIsAdd" />

        <div class="fitH">

            <table class="grid" runat="server" visible="false">
                <tr>
                    <td class="lbl"></td>
                    <td></td>
                    <td class="lbl"></td>
                    <td></td>
                </tr>
            </table>

            <div id="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" Icon="save" OnClick="btnSave_Click" />
 
                <asp:EButton runat="server" ID="btnEditByDrag" Text="拖动调整" Icon="cog_start" OnClick="btnEditByDrag_Click" />

                <asp:EButton runat="server" ID="btnDelete" Text="清除配置" IsClient="true" OnClientClick="deleteAction(this)" Icon="delete" OnClick="btnDelete_Click" />


                <asp:EButton runat="server" ID="btnAdvance" Text="更多配置选项" Icon="function" IsClient="true" OnClientClick="more()" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>

            <div id="datagrid">
                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle,10" runat="server" BorderStyle="None"
                    EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableFooter="false" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" FitWindow="true" KeyField="DATA_FIELD" PageSize="20">
                    <Columns>

                        <asp:TemplateField ItemStyle-Width="180px" HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:EButton Icon="up" IsClient="true" Text="上移" OnClientClick="up(this)" runat="server" />
                                <asp:EButton Icon="down" IsClient="true" Text="下移" OnClientClick="down(this)" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="DATA_FIELD" HeaderText="字段"
                            ItemStyle-Width="0px"></asp:BoundField>

                        <asp:BoundField DataField="SORT_FIELD" HeaderText="排序字段"
                            ItemStyle-Width="0px"></asp:BoundField>

                        <asp:BoundField DataField="HEADER_TEXT" HeaderText="显示名称"
                            ItemStyle-Width="220px"></asp:BoundField>

                        <asp:ETemplateField ItemStyle-Width="60px" HeaderText="是否显示" DataField="IS_SHOW" ItemStyle-HorizontalAlign="Center" TwoWay="chkIsShow">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkIsShow" TrueValue="Y" FalseValue="N" />
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField ItemStyle-Width="120px" HeaderText="显示顺序" DataField="SEQ" TwoWay="txtSeq">
                            <ItemTemplate>
                                <asp:ETextBox CssClassEx="seq" Text='<%#Eval("SEQ") %>' IsNum="true" runat="server" ID="txtSeq" Style="width: 95%" />
                            </ItemTemplate>

                        </asp:ETemplateField>

                        <asp:ETemplateField ItemStyle-Width="120px" HeaderText="显示宽度" DataField="WIDTH" TwoWay="txtWidth">
                            <ItemTemplate>
                                <asp:ETextBox CssClass="text-input " Text='<%#Eval("WIDTH") %>' IsNum="true" runat="server" ID="txtWidth" Style="width: 95%" />
                            </ItemTemplate>

                        </asp:ETemplateField>

                    </Columns>
                </asp:EGridView>
            </div>

        </div>

    </form>
</body>
</html>
