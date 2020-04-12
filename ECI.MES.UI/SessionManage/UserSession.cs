using PL.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECI.MES.UI
{
    public class UserSession
    {
        /// <summary>
        /// 关区代码
        /// </summary>
        public static string CustomCode
        {
            get { return EciSession.UserInfo.Data["_CUSTOM_CODE"]; }
            set { EciSession.UserInfo.Data["_CUSTOM_CODE"] = value; }
        }
    }
}

