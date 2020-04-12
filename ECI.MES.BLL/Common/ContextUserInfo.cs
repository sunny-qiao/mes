using PL.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECI.MES.BLL
{
    public static class ContextUserInfo
    {
        public static void AddUserInfo(this EntityBase entity, BLLContext context, bool isAdd)
        {
            entity.IsNull("实体为空");
            UserInfo curUser = context.UserInfo;

            entity["UPDATE_USER"] = curUser.LoginNo;
            entity["UPDATE_USER_NAME"] = curUser.UserName;
            entity["UPDATE_DATE"] = DateTime.Now.ToFullString();
            if (isAdd)
            {
                entity["CREATE_USER"] = curUser.LoginNo;
                entity["CREATE_USER_NAME"] = curUser.UserName;
                entity["CREATE_DATE"] = DateTime.Now.ToFullString();
                entity["COMPANY_CODE"] = curUser.CompanyCode;
                entity["COMPANY_NAME"] = curUser.CompanyName;
            }
        }

    }
}

