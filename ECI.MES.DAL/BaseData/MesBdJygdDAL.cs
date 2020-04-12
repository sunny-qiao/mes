using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdJygdDAL : BaseDAL
    {
      public MES_BD_JYGD Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_JYGD Get(string guid, object ts)
        {
            return MES_BD_JYGD.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.BH,A.NAME,A.SJCJ,A.CKCK
                           ,A.RKCK,A.FP1,A.FP1_RKCK,A.FP1_CLJG,A.FP1_CLJG_RKCK
                           ,A.FP2,A.FP2_RKCK,A.FP2_CLJG,A.FP2_CLJG_RKCK,A.FP3
                           ,A.FP3_RKCK,A.FP3_CLJG,A.FP3_CLJG_RKCK,A.FP4,A.FP4_RKCK
                           ,A.FP4_CLJG,A.FP4_CLJG_RKCK,A.FP5,A.FP5_RKCK,A.FP5_CLJG
                           ,A.FP5_CLJG_RKCK,A.FP6,A.FP6_RKCK,A.FP6_CLJG,A.FP6_CLJG_RKCK
                           ,A.FP7,A.FP7_RKCK,A.FP7_CLJG,A.FP7_CLJG_RKCK,A.FP8
                           ,A.FP8_RKCK,A.FP8_CLJG,A.FP8_CLJG_RKCK,A.FP9,A.FP9_RKCK
                           ,A.FP9_CLJG,A.FP9_CLJG_RKCK,A.FP10,A.FP10_RKCK,A.FP10_CLJG
                           ,A.FP10_CLJG_RKCK,A.FP11,A.FP11_RKCK,A.FP11_CLJG,A.FP11_CLJG_RKCK
                           ,A.FP12,A.FP12_RKCK,A.FP12_CLJG,A.FP12_CLJG_RKCK,A.FP13
                           ,A.FP13_RKCK,A.FP13_CLJG,A.FP13_CLJG_RKCK,A.FP14,A.FP14_RKCK
                           ,A.FP14_CLJG,A.FP14_CLJG_RKCK,A.FP15,A.FP15_RKCK,A.FP15_CLJG
                           ,A.FP15_CLJG_RKCK,A.FP16,A.FP16_RKCK,A.FP16_CLJG,A.FP16_CLJG_RKCK
                           ,A.FP17,A.FP17_RKCK,A.FP17_CLJG,A.FP17_CLJG_RKCK,A.FP18
                           ,A.FP18_RKCK,A.FP18_CLJG,A.FP18_CLJG_RKCK,A.FP19,A.FP19_RKCK
                           ,A.FP19_CLJG,A.FP19_CLJG_RKCK,A.FP20,A.FP20_RKCK,A.FP20_CLJG
                           ,A.FP20_CLJG_RKCK,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE
                           ,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME
                            ";
           sql +=" FROM MES_BD_JYGD A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.BH,A.NAME,A.SJCJ,A.CKCK
                           ,A.RKCK,A.FP1,A.FP1_RKCK,A.FP1_CLJG,A.FP1_CLJG_RKCK
                           ,A.FP2,A.FP2_RKCK,A.FP2_CLJG,A.FP2_CLJG_RKCK,A.FP3
                           ,A.FP3_RKCK,A.FP3_CLJG,A.FP3_CLJG_RKCK,A.FP4,A.FP4_RKCK
                           ,A.FP4_CLJG,A.FP4_CLJG_RKCK,A.FP5,A.FP5_RKCK,A.FP5_CLJG
                           ,A.FP5_CLJG_RKCK,A.FP6,A.FP6_RKCK,A.FP6_CLJG,A.FP6_CLJG_RKCK
                           ,A.FP7,A.FP7_RKCK,A.FP7_CLJG,A.FP7_CLJG_RKCK,A.FP8
                           ,A.FP8_RKCK,A.FP8_CLJG,A.FP8_CLJG_RKCK,A.FP9,A.FP9_RKCK
                           ,A.FP9_CLJG,A.FP9_CLJG_RKCK,A.FP10,A.FP10_RKCK,A.FP10_CLJG
                           ,A.FP10_CLJG_RKCK,A.FP11,A.FP11_RKCK,A.FP11_CLJG,A.FP11_CLJG_RKCK
                           ,A.FP12,A.FP12_RKCK,A.FP12_CLJG,A.FP12_CLJG_RKCK,A.FP13
                           ,A.FP13_RKCK,A.FP13_CLJG,A.FP13_CLJG_RKCK,A.FP14,A.FP14_RKCK
                           ,A.FP14_CLJG,A.FP14_CLJG_RKCK,A.FP15,A.FP15_RKCK,A.FP15_CLJG
                           ,A.FP15_CLJG_RKCK,A.FP16,A.FP16_RKCK,A.FP16_CLJG,A.FP16_CLJG_RKCK
                           ,A.FP17,A.FP17_RKCK,A.FP17_CLJG,A.FP17_CLJG_RKCK,A.FP18
                           ,A.FP18_RKCK,A.FP18_CLJG,A.FP18_CLJG_RKCK,A.FP19,A.FP19_RKCK
                           ,A.FP19_CLJG,A.FP19_CLJG_RKCK,A.FP20,A.FP20_RKCK,A.FP20_CLJG
                           ,A.FP20_CLJG_RKCK,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE
                           ,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME
                            ";
            sql +=" FROM MES_BD_JYGD A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
