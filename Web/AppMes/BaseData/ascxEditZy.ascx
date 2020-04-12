<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ascxEditZy.ascx.cs" Inherits="AppMes_BaseData_ascxEditZy" %>

<table class="grid" cellpadding="0" cellspacing="0" style="width: 100%;">
    <tr>
        <th style="width: 10%"></th>
        <th style="width: 20%"></th>
        <th style="width: 10%"></th>
        <th style="width: 20%"></th>
        <th style="width: 10%"></th>
        <th style="width: 20%"></th>

    </tr>

    <tr>
        <td class="lbl">工号</td>
        <td>
            <asp:ETextBox runat="server" ID="txtGh" DataField="GH" NotNull="true" Width="85%"></asp:ETextBox></td>
        <td class="lbl">职员代码</td>
        <td>
            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Width="85%"></asp:ETextBox></td>
        <td class="lbl">职员名</td>
        <td>
            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Width="85%"></asp:ETextBox></td>

    </tr>
    <tr>
        <td class="lbl">职员状态</td>
        <td>
            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" AddEmpty="true" ECIType="ZY_STATUS" Width="85%"></asp:ECombox></td>
        <td class="lbl">移动电话</td>
        <td>
            <asp:ETextBox runat="server" ID="txtTel" DataField="TEL" Width="85%"></asp:ETextBox></td>
        <td class="lbl">身份证号码</td>
        <td>
            <asp:ETextBox runat="server" ID="txtIdCard" DataField="ID_CARD" Width="85%"></asp:ETextBox></td>

    </tr>
    <tr>
        <td class="lbl">开户银行</td>
        <td>
            <asp:ETextBox runat="server" ID="txtKhyh" DataField="KHYH" Width="85%"></asp:ETextBox></td>
        <td class="lbl">开户名</td>
        <td>
            <asp:ETextBox runat="server" ID="txtKhm" DataField="KHM" Width="85%"></asp:ETextBox></td>

        <td class="lbl">银行账号</td>
        <td>
            <asp:ETextBox runat="server" ID="txtBank" DataField="BANK" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">文化程度</td>
        <td>
            <asp:ETextBox runat="server" ID="txtWhcd" DataField="WHCD" Width="85%"></asp:ETextBox></td>
        <td class="lbl">毕业学校</td>
        <td>
            <asp:ETextBox runat="server" ID="txtByxx" DataField="BYXX" Width="85%"></asp:ETextBox></td>


        <td class="lbl">毕业专业</td>
        <td>
            <asp:ETextBox runat="server" ID="txtByzy" DataField="BYZY" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">毕业年份</td>
        <td>
            <asp:ETextBox runat="server" ID="txtBynf" DataField="BYNF" Width="85%"></asp:ETextBox></td>

        <td class="lbl">省份</td>
        <td>
            <asp:EChoose runat="server" ID="txtProvince" DataField="PROVINCE" ECIType="PROVINCE" Width="85%"></asp:EChoose></td>

        <td class="lbl">城市</td>
        <td>
            <asp:EChoose runat="server" ID="txtCity" DataField="CITY" ECIType="CITY" Width="85%"></asp:EChoose></td>
    </tr>
    <tr>
        <td class="lbl">住址</td>
        <td>
            <asp:ETextBox runat="server" ID="txtAddress" DataField="ADDRESS" Width="85%"></asp:ETextBox></td>
        <td class="lbl">电子邮件</td>
        <td>
            <asp:ETextBox runat="server" ID="txtMail" DataField="MAIL" Width="85%"></asp:ETextBox></td>

        <td class="lbl">备注</td>
        <td>
            <asp:ETextBox runat="server" ID="txtRemark" DataField="REMARK" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属1</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs1" DataField="JS1" Width="85%"></asp:ETextBox></td>
        <td class="lbl">家属1关系</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs1Relation" DataField="JS1_RELATION" Width="85%"></asp:ETextBox></td>


        <td class="lbl">家属1电话</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs1Tel" DataField="JS1_TEL" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属1住址</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs1Address" DataField="JS1_ADDRESS" Width="85%"></asp:ETextBox></td>
        <td class="lbl">家属2</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs2" DataField="JS2" Width="85%"></asp:ETextBox></td>


        <td class="lbl">家属2关系</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs2Relation" DataField="JS2_RELATION" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属2电话</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs2Tel" DataField="JS2_TEL" Width="85%"></asp:ETextBox></td>
        <td class="lbl">家属2住址</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs2Address" DataField="JS2_ADDRESS" Width="85%"></asp:ETextBox></td>


        <td class="lbl">家属3</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs3" DataField="JS3" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属3关系</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs3Relation" DataField="JS3_RELATION" Width="85%"></asp:ETextBox></td>
        <td class="lbl">家属3电话</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs3Tel" DataField="JS3_TEL" Width="85%"></asp:ETextBox></td>


        <td class="lbl">家属3住址</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs3Address" DataField="JS3_ADDRESS" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属4</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs4" DataField="JS4" Width="85%"></asp:ETextBox></td>
        <td class="lbl">家属4关系</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs4Relation" DataField="JS4_RELATION" Width="85%"></asp:ETextBox></td>


        <td class="lbl">家属4电话</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs4Tel" DataField="JS4_TEL" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">家属4住址</td>
        <td>
            <asp:ETextBox runat="server" ID="txtJs4Address" DataField="JS4_ADDRESS" Width="85%"></asp:ETextBox></td>
        <td class="lbl">车牌号</td>
        <td>
            <asp:ETextBox runat="server" ID="txtCarNo" DataField="CAR_NO" Width="85%"></asp:ETextBox></td>


        <td class="lbl">车辆类型</td>
        <td>
            <asp:ETextBox runat="server" ID="txtCarType" DataField="CAR_TYPE" Width="85%"></asp:ETextBox></td>
    </tr>
    <tr>
        <td class="lbl">职员缩略图</td>
        <td>
            <asp:FileUpload ID="txtFileUpload" runat="server" DataField="PIC1" Width="85%" />
        </td>
        <td class="lbl" style="display: none">照片2</td>
        <td style="display: none">
            <asp:FileUpload ID="txtFileUpload2" runat="server" DataField="PIC2" Width="85%" />
        </td>

    </tr>
    <tr>
        <td colspan="6">
            <asp:ETab runat="server" ID="tabZy" ActiveTabIndex="0">
                <asp:ETabItem runat="server" ID="tabStatus" Title="职员工种及状态" Frame="true"></asp:ETabItem>
                <asp:ETabItem runat="server" ID="tabDoc" Title="文件录入" Frame="true"></asp:ETabItem>
            </asp:ETab>
        </td>
    </tr>
</table>



<div style="display: none;">
    <asp:ETextBox runat="server" ID="txtPARENTID" Width="85%" ReadOnly="true"></asp:ETextBox>
    <asp:ETextBox runat="server" ID="txtFLAG" Width="85%" ReadOnly="true"></asp:ETextBox>
    <asp:ETextBox runat="server" ID="txtGUID" Width="85%" ReadOnly="true"></asp:ETextBox>
</div>
