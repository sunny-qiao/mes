using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdScxBcDAL : BaseDAL
    {
      public MES_BD_SCX_BC Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_SCX_BC Get(string guid, object ts)
        {
            return MES_BD_SCX_BC.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.FGUID,A.SCX,A.DEPT,A.IS_TY
                           ,A.BH,A.BCBH,A.BCM,A.BCM_SHORT,A.SBKQJBH
                           ,A.BSBYKQJBH,A.XBKQJBH,A.XBBYKQJBH,A.CLKH_QS_RQCZ,A.CLKH_QS_TIME
                           ,A.CLKH_JS_RQCZ,A.CLKH_JS_TIME,A.SBRQCZ1,A.SB_TIME1,A.XBRQCZ1
                           ,A.XB_TIME1,A.SBKQKS_TIME1,A.CDKS_TIME1,A.YZCD_TIME1,A.SBKG_TIME1
                           ,A.XBKG_TIME1,A.XBYZZTKS_TIME1,A.XBZTKS_TIME1,A.JBKS__TIME1,A.XBZZKQ_TIME1
                           ,A.SBRQCZ2,A.SB_TIME2,A.XBRQCZ2,A.XB_TIME2,A.SBKQKS_TIME2
                           ,A.CDKS_TIME2,A.YZCD_TIME2,A.SBKG_TIME2,A.XBKG_TIME2,A.XBYZZTKS_TIME2
                           ,A.XBZTKS_TIME2,A.JBKS__TIME2,A.XBZZKQ_TIME2,A.REMARK,A.CREATE_USER
                           ,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE
                           ,A.COMPANY_CODE,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_SCX_BC A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.FGUID,A.SCX,A.DEPT,A.IS_TY
                           ,A.BH,A.BCBH,A.BCM,A.BCM_SHORT,A.SBKQJBH
                           ,A.BSBYKQJBH,A.XBKQJBH,A.XBBYKQJBH,A.CLKH_QS_RQCZ,A.CLKH_QS_TIME
                           ,A.CLKH_JS_RQCZ,A.CLKH_JS_TIME,A.SBRQCZ1,A.SB_TIME1,A.XBRQCZ1
                           ,A.XB_TIME1,A.SBKQKS_TIME1,A.CDKS_TIME1,A.YZCD_TIME1,A.SBKG_TIME1
                           ,A.XBKG_TIME1,A.XBYZZTKS_TIME1,A.XBZTKS_TIME1,A.JBKS__TIME1,A.XBZZKQ_TIME1
                           ,A.SBRQCZ2,A.SB_TIME2,A.XBRQCZ2,A.XB_TIME2,A.SBKQKS_TIME2
                           ,A.CDKS_TIME2,A.YZCD_TIME2,A.SBKG_TIME2,A.XBKG_TIME2,A.XBYZZTKS_TIME2
                           ,A.XBZTKS_TIME2,A.JBKS__TIME2,A.XBZZKQ_TIME2,A.REMARK,A.CREATE_USER
                           ,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE
                           ,A.COMPANY_CODE,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_SCX_BC A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
