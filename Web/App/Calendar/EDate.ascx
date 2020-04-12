<%@ control language="C#" autoeventwireup="true" inherits="AppDemo_Form_EDate, ECI.Web" %>

<div class="calendar">
    <table id="Calendar" onselectstart="return false" runat="server"  cellspacing="0" cellpadding="2" rules="all" title="日历" border="1" style="width: 220px; height: 200px; font-size: 8pt; font-family: Verdana; color: #663399; border-width: 1px; border-style: solid; border-color: #FFCC66; background-color: #FFFFCC; border-collapse: collapse;">
        <tr>
            <td colspan="7" style="background-color: #990000;">
                <table cellspacing="0" border="0" style="color: #FFFFCC; font-family: Verdana; font-size: 9pt; font-weight: bold; width: 100%; border-collapse: collapse;">
                    <tbody>
                        <tr>
                            <td align="center" style="width: 100%;">
                                <asp:Label runat="server" ID="lblYearMonth"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <th class="week" abbr="星期日" scope="col">日</th>
            <th class="week" abbr="星期一" scope="col">一</th>
            <th class="week" abbr="星期二" scope="col">二</th>
            <th class="week" abbr="星期三" scope="col">三</th>
            <th class="week" abbr="星期四" scope="col">四</th>
            <th class="week" abbr="星期五" scope="col">五</th>
            <th class="week" abbr="星期六" scope="col">六</th>
        </tr>
    </table>
</div>
