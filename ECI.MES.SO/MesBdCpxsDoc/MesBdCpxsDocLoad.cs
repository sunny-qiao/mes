using PL.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ECI.MES.BLL;
using ECI.MES.ServiceList;

namespace ECI.MES.SO
{
    public  class MesBdCpxsDocLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdCpxsDocLoad;

            context.Response.DataTable = MesBdCpxsDocBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}