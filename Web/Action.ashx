<%@ WebHandler Language="C#" Class="Action" %>
using System;
using System.Web;
using PL.Base;

public class Action : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        ActionHandler.ProcessRequest(context);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}