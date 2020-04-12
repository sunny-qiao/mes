<%@ WebHandler Language="C#" Class="AccessHandler" %>

using System;
using System.Web;
using PL.Base;
using System.Diagnostics;

public class AccessHandler : BaseHandler
{
    public void AccessWeb(EciResponse ajax)
    {
        string webUrl = PageHelper.Request("Url");

        Stopwatch watch = new Stopwatch();
        watch.Start();

        try
        {
            string content = EciWebClient.GetContent(webUrl, string.Empty, 60000);

            ajax.Success = true;
            ajax["COST"] = watch.ElapsedMilliseconds.ToString();
            ajax["CONTENT"] = content;
        }
        catch (Exception ex)
        {
            ajax["COST"] = watch.ElapsedMilliseconds.ToString();
            ajax.Success = false;
            ajax.Message = ex.Message;
        }
    }

}