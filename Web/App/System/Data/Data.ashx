<%@ WebHandler Language="C#" Class="Data" %>

using System;
using System.Web;
using PL.Base;


public class Data : BaseHandler
{
    public void EciVersionGetNextVersion(EciResponse ajax)
    {
        EciRequest request = new EciRequest(SpeedServiceList.EciVersionGetNextVersion);
        request["TYPE"] = PageHelper.Request("TYPE");

        ajax.Data = request.Execute().Data;
    }

    public void EciNoticePublish(EciResponse ajax)
    {
        string guid = PageHelper.Request("guid");
        EciRequest request = new EciRequest(SpeedServiceList.EciNoticePublish);
        request["guid"] = guid;

        ajax.Data = request.Execute().Data;
    }

    public void EciNoticeStop(EciResponse ajax)
    {
        string guid = PageHelper.Request("guid");
        EciRequest request = new EciRequest(SpeedServiceList.EciNoticeStop);
        request["guid"] = guid;

        ajax.Data = request.Execute().Data;
    }
}