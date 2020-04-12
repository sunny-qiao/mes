<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdBgwjlbEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdBgwjlbEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>表格文件类别设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdBgwjlbEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="表格文件类别设置维护"></asp:ETitle>

            <div id="toolbar" class="toolbar">
              <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
              <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
              <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table  id="tbEdit" class="grid" cellpadding="0" cellspacing="0" >
                    <tr>
                        <th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>

                    </tr>
                        <tr>
                        <td class="lbl">使用表格名</td>
<td><asp:EChoose runat="server" ID ="txtBgm"  DataField="BGM" ECIType="SJKBG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">保存文件类别名</td>
<td><asp:ETextBox runat="server" ID ="txtWjlbm"  DataField="WJLBM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">服务器文件保存位置</td>
<td><asp:ETextBox runat="server" ID ="txtFwqwjPath"  DataField="FWQWJ_PATH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">文件名是否自动修改为表名+数据条名+文件名</td>
<td><asp:ETextBox runat="server" ID ="txtIsXgwjm"  DataField="IS_XGWJM" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
