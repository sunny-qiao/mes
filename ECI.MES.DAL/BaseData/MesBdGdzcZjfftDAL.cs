using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdGdzcZjfftDAL : BaseDAL
    {
      public MES_BD_GDZC_ZJFFT Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_GDZC_ZJFFT Get(string guid, object ts)
        {
            return MES_BD_GDZC_ZJFFT.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.FGUID,A.BH,A.QSRQ,A.ZZRQ
                           ,A.ZJTS,A.SKSYSM,A.ZH_NZJL,A.ZH_NCZMJZ,A.ZH_LLSYZJL
                           ,A.ZH_NZJLQZ,A.ZH_NCSYZJL,A.ZH_NZJE,A.PJ_NZJL,A.PJ_NCZMJZ
                           ,A.PJ_LLSYZJL,A.PJ_NZJLQZ,A.PJ_NCSYZJL,A.PJ_NZJE,A.SB_NZJL
                           ,A.SB_NCZMJZ,A.SB_LLSYZJL,A.SB_NZJLQZ,A.SB_NCSYZJL,A.SB_NZJE
                           ,A.NCZMJZ,A.NCZJL,A.NZJE,A.NZJL,A.YJZJE
                           ,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER
                           ,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_GDZC_ZJFFT A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.FGUID,A.BH,A.QSRQ,A.ZZRQ
                           ,A.ZJTS,A.SKSYSM,A.ZH_NZJL,A.ZH_NCZMJZ,A.ZH_LLSYZJL
                           ,A.ZH_NZJLQZ,A.ZH_NCSYZJL,A.ZH_NZJE,A.PJ_NZJL,A.PJ_NCZMJZ
                           ,A.PJ_LLSYZJL,A.PJ_NZJLQZ,A.PJ_NCSYZJL,A.PJ_NZJE,A.SB_NZJL
                           ,A.SB_NCZMJZ,A.SB_LLSYZJL,A.SB_NZJLQZ,A.SB_NCSYZJL,A.SB_NZJE
                           ,A.NCZMJZ,A.NCZJL,A.NZJE,A.NZJL,A.YJZJE
                           ,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER
                           ,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_GDZC_ZJFFT A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
