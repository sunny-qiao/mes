<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciTableEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>程序设计-详细配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
     
 
    </script>
    <style type="text/css">
        .title {
            line-height: 20px;
            font-size: medium;
            font-style: normal;
            font-family: 宋体;
            text-align: right;
            white-space: nowrap;
            padding-right: 4px;
            background:green;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="程序设计-详细配置"></asp:ETitle>
            

            <div id="toolbar" class="toolbar">
                <input type="hidden" id="hidKey" runat="server" />
                <asp:EButton runat="server" ID="btnSave" Text="保存"
                    NeedCheck="true" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" IsClient="true" />
            </div>
            <div class="workarea" layout="toolbar,pagetitle">

                <table class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 130px"></th>
                        <th style="width: 100%"></th>


                    </tr>
                    <tr>
                        <td class="lbl">程序信息</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCODE" DataField="CODE" Width="40%" ReadOnly="True"></asp:ETextBox>
                            <asp:ETextBox runat="server" ID="txtMAIN_ALIAS" DataField="MAIN_ALIAS" Width="44%" ReadOnly="True"></asp:ETextBox></td>


                    </tr>

                    <tr>
                        <td class="title"><strong>查询设置</strong></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td class="lbl">查询显示列数</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtQUERY_COLUMN_COUNT" DataField="QUERY_COLUMN_COUNT" Width="85%" IsNum="true"> </asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="lbl">分页大小</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDEFAULT_PAGE_SIZE" DataField="DEFAULT_PAGE_SIZE" Width="85%" IsNum="true"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">
                            <label for="chkDEFAULT_SELECT">默认选择功能</label>
                        </td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkDEFAULT_SELECT" DataField="DEFAULT_SELECT" TrueValue="1" FalseValue="0" /></td>


                    </tr>
                    <tr>
                        <td class="lbl lbl-top">固定条件</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDEFAULT_CONDITION" DataField="DEFAULT_CONDITION" Width="85%" TextMode="MultiLine" Rows="4" ></asp:ETextBox>
                            
                            <div class="notnull">*填写请注意,不要写 AND</div></td>


                    </tr>
                    <tr>
                        <td class="lbl lbl-top">查询语句</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGRID_SQL" DataField="GRID_SQL" Width="85%" TextMode="MultiLine" Rows="10"></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="title"><strong>编辑设置</strong></td>
                        <td>&nbsp;</td>


                    </tr>
                    <tr>
                        <td class="lbl">编辑页布局</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGRID_LAYOUT" DataField="GRID_LAYOUT" Width="85%"></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="lbl lbl-top">数据源</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDATA_SOURCE" DataField="DATA_SOURCE" Width="85%" TextMode="MultiLine" Rows="10"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">
                            <label for="chkKEEP_ADD_STATUS">保存后保持新增状态</label></td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkKEEP_ADD_STATUS" DataField="KEEP_ADD_STATUS" TrueValue="1" FalseValue="0" /></td>

                    </tr>
                    <tr>
                        <td class="lbl">
                            <label for="chkFILE_UPLOAD">文件上传</label></td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkFILE_UPLOAD" DataField="FILE_UPLOAD" TrueValue="1" FalseValue="0" /></td>

                    </tr>

                    <tr>
                        <td class="lbl">
                            <label for="chkPRIMARY_KEY_INPUT">主键从界面维护</label></td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkPRIMARY_KEY_INPUT" DataField="PRIMARY_KEY_INPUT" TrueValue="1" FalseValue="0" /></td>


                    </tr>

                    <tr>
                        <td class="lbl">固定保存</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPL_SAVE_FIXED" DataField="PL_SAVE_FIXED" Width="85%"></asp:ETextBox></td>


                    </tr>


                    <tr>
                        <td class="title"><strong>其它设置</strong></td>
                        <td>&nbsp;</td>


                    </tr>

                    <tr>
                        <td class="lbl">自定义参数</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPARAM" DataField="PARAM" Width="85%"></asp:ETextBox></td>


                    </tr>

                    <tr>
                        <td class="lbl lbl-top">样式文件</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSTYLE_FILE" DataField="STYLE_FILE" Width="85%" TextMode="MultiLine" Rows="3"></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="lbl lbl-top">脚本文件</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtJS_FILE" DataField="JS_FILE" Width="85%" TextMode="MultiLine" Rows="3"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl lbl-top">前台脚本</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtJS_SCRIPT" DataField="JS_SCRIPT" Width="85%" TextMode="MultiLine" Rows="20"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl lbl-top">页面备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtREMARKS" DataField="REMARKS" Width="85%" TextMode="MultiLine" Rows="4"></asp:ETextBox></td>


                    </tr>


                </table>
                <br />
            </div>
        </div>



    </form>
</body>
</html>
