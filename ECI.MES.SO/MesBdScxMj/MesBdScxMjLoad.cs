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
    public  class MesBdScxMjLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdScxMjLoad;

            context.Response.DataTable = MesBdScxMjBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}