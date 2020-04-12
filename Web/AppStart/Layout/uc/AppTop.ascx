<%@ control language="C#" autoeventwireup="true" inherits="AppStartPT_Layout_uc_AppTop, ECI.Web" %>

<!--固定应用图标-->
<ul class="nav" style="overflow-x: hidden; overflow-y: hidden; border: 0px solid red;">
    <% if (PL.Base.AppConfig.AppDisplayType == "Fix")
        {
    %>

    <%foreach (PL.Base.AppInfo item in this.ListAppInfo)
        {
            FixIndex++;
            if (FixIndex > AppFixSize) { break; }

    %>

    <li class="module">
        <a href="javascript:void(0);" type="fix" data-id="<%=item.AppId %>" data-code="<%=item.Code %>" data-url="<%=item.Url %>" data-type="<%=item.Type %>" data-action="<%=item.Action %>" data-target="<%=item.Target %>" onclick="SystemChange('<%=item.AppId %>','<%=item.Code%>',this)">
            <img alt="" src="<%=item.Image %>" width="<%=ImageSize %>" height="<%=ImageSize %>" />
            <h2><%=item.Name%></h2>
        </a>
    </li>
    <%}%>

    <%}%>


    <li runat="server" id="currentli">
        <a href="javascript:void(0);">
            <img id="currentImg" class="current-img" alt="" src="../../Samples/MyApp/MyApp.png" />
            <h2 id="current" runat="server">我的业务</h2>
        </a>
    </li>

    <%foreach (PL.Base.AppInfo item in this.ListTopAppInfo)
        {%>

    <li class="top-app" data-id="<%=item.AppId %>">

        <a href="javascript:void(0);">
            <img class="current-img" alt="" src="<%=item.Image%>" />
            <h2><%=item.Name%></h2>
        </a>
    </li>

    <%}%>
</ul>


<!--浮动应用图标-->
<% if (PL.Base.AppConfig.AppDisplayType == "Float" || PL.Base.AppConfig.AppDisplayType == "Fix" && this.ListAppInfo.Count > AppFixSize)
    {%>

<div id="app" class="nav-app">

    <%foreach (PL.Base.AppInfo item in this.ListAppInfo)
        {
            FloatIndex++;

            if (PL.Base.AppConfig.AppDisplayType == "Fix" && FloatIndex < FixIndex)
            {
                continue;
            }

    %>
    <div class="appItem" style="float: left; margin: 4px; text-align: center;" data-parentid="<%=item.ParentId %>">
        <a href="javascript:void(0);" type="float" data-children="<%=item.HasChildren.ToString().ToLower() %>" data-id="<%=item.AppId %>" data-code="<%=item.Code %>" data-url="<%=item.Url %>" data-aboutme-url="<%=item.AbountMeUrl %>" data-type="<%=item.Type %>" data-action="<%=item.Action %>" data-target="<%=item.Target %>" onclick="SystemChange('<%=item.AppId %>','<%=item.Code%>',this)">
            <img alt="" src="<%=item.Image%>" width="<%=PL.Base.EciServer.AppSize%>" height="<%=PL.Base.EciServer.AppSize%>" title="<%=item.Tip%>" />
            <h2><%=item.Name %></h2>
        </a>
    </div>

    <% 
        } %>
</div>

<div id="app2" class="nav-app2">
    <%foreach (PL.Base.AppInfo one in this.ListAppInfo)
        {
            if (one.HasChildren)
            {
                foreach (PL.Base.AppInfo item in one.Children)
                { %>

    <div class="appItem appItem2 <%=one.AppId %>" style="float: left; margin: 4px; text-align: center;">
        <a href="javascript:void(0);" data-level="2" data-id="<%=item.AppId %>" data-code="<%=item.Code %>" data-url="<%=item.Url %>" data-aboutme-url="<%=item.AbountMeUrl %>" data-type="<%=item.Type %>" data-action="<%=item.Action %>" data-target="<%=item.Target %>" onclick="SystemChange('<%=item.AppId %>','<%=item.Code%>',this)">
            <img alt="" src="<%=item.Image%>" width="60" height="60" title="<%=item.Tip%>" />
            <h2><%=item.Name %>2</h2>
        </a>
    </div>

    <%}
            }
        } %>
</div>
<%} %>


<!--组织机构选择-->
<asp:EWindow runat="server" ID="divOrg" Title="选择机构" Width="800" Icon="chart_organisation">
    <div id="org" class="nav-org">

        <%if (this.ListOrgInfo != null)
            { %>

        <%foreach (PL.Base.OrgInfo item in this.ListOrgInfo)
            { %>
        <div class="orgItem" style="float: left; margin: 4px; text-align: center;">
            <a href="javascript:void(0);" data-id="<%=item.OrgId %>" data-code="<%=item.Code %>" data-name="<%=item.Name %>" onclick="OrgSelect(this)">
                <img alt="" src="../../Samples/Org/<%=item.Image%>.png" width="60" height="60" title="<%=item.Image%>.png" />
                <h2><%=item.Name %></h2>
            </a>
        </div>
        <%  }
            } %>
    </div>
</asp:EWindow>
