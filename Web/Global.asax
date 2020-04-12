<%@ Application Language="C#" %>
<%@ Import Namespace="PL.Base" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        EciServer.ServerPath = PageHelper.ServerPath;
        EciServer.InitFramework();
        EciWeb.InitFramework();

        APIServiceProxy proxy = new APIServiceProxy(true);
        SOA.RegisterProxy("PT", proxy);
        SOA.RegisterProxy("ECI.MES.SO", proxy);

        App.WebApp = new ECI.MES.UI.WebApp();
    }

</script>
