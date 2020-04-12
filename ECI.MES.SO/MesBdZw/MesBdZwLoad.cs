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
    public  class MesBdZwLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdZwLoad;

            context.Response.DataTable = MesBdZwBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}