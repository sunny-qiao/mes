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
    public class MesBdZyGetLower : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdZyGetLower;

            string id = context.Request["ID"];
            DataTable data = MesBdZyBLL.Instance.GetLower(context.BLLContext, id);

            context.Response.DataTable = data;

        }
    }
}