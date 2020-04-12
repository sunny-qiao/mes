<%@ WebHandler Language="C#" Class="CalendarHandler" %>

using System;
using System.Web;
using PL.Base;
using ECI.Speed.Entity;

public class CalendarHandler : BaseHandler
{

    public void Save(EciResponse ajax)
    {
        string guid = PageHelper.Request("guid");
        string type = PageHelper.Request("type");


        ECI_CALENDAR calendar = new ECI_CALENDAR("GUID", guid);
        calendar.Begin();
        calendar.TYPE = type;
        calendar.UPDATE_DATE = DateTime.Now;
        calendar.UPDATE_USER = EciSession.UserInfo.UserName;

        calendar.Update();

        ajax.Message = "更新成功";
    }
}