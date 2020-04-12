<%@ WebHandler Language="C#" Class="PTAPI" %>

using System;
using System.Web;
using PL.Base;
using PL.Base.API;
using System.Collections.Generic;

public class PTAPI : APIHandler
{
    public void GetInstanceParam(APIMessage message)
    {
        message.Success = true;
        string sysCode = PageHelper.Request("SysCode");
        string instanceId = PageHelper.Request("InstanceId");
        string key = PageHelper.Request("Key");

        if (sysCode.NullOrEmpty()) { throw new AppException("调用异常，没有传入参数[SysCode]"); }
        if (instanceId.NullOrEmpty()) { throw new AppException("调用异常，没有传入参数[InstanceId]"); }
        if (key.NullOrEmpty()) { throw new AppException("调用异常，没有传入参数[key]"); }

        string value = EciParam.GetInstanceParam(instanceId, key);

        message.MessageData = value;
    }
}