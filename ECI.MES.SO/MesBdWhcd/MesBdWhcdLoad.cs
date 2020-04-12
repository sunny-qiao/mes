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
    public  class MesBdWhcdLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdWhcdLoad;

            context.Response.DataTable = MesBdWhcdBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}