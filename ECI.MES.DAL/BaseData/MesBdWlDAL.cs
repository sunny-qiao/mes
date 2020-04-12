using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdWlDAL : BaseDAL
    {
      public MES_BD_WL Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_WL Get(string guid, object ts)
        {
            return MES_BD_WL.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.BH,A.WLSX_CODE,A.WLQZPL_CODE,A.WLPL_CODE
                           ,A.WG_NAME,A.NAME,A.CODE,A.EN_NAME,A.TJLB1
                           ,A.TJLB2,A.TJLB3,A.TJLB4,A.DZ,A.DZJD
                           ,A.CD,A.CDJD,A.MJ,A.MJJD,A.TJ
                           ,A.TJJD,A.UNIT,A.UNIT_JD,A.FZ_UNIT1,A.FZ_UNIT1_RATE
                           ,A.FZ_UNIT1_JD,A.FZ_UNIT2,A.FZ_UNIT2_RATE,A.FZ_UNIT2_JD,A.FZ_UNIT3
                           ,A.FZ_UNIT3_RATE,A.FZ_UNIT3_JD,A.FZ_UNIT4,A.FZ_UNIT4_RATE,A.FZ_UNIT4_JD
                           ,A.RK_WAREHOUSE,A.SCBM,A.ZDKC,A.DKC,A.ZCKC
                           ,A.ZGKC,A.STATUS,A.IS_SB,A.PRICE,A.PRICE_JD
                           ,A.PRICE_CG,A.CH_CODE,A.XSSR_CODE,A.SXCB_CODE,A.CBCY_CODE
                           ,A.DGWZKM,A.RATE,A.PIC1,A.PIC2,A.PIC3
                           ,A.PIC4,A.PIC5,A.PIC6,A.PIC7,A.PIC8
                           ,A.PIC9,A.PIC10,A.PIC1_PATH,A.PIC2_PATH,A.PIC3_PATH
                           ,A.PIC4_PATH,A.PIC5_PATH,A.PIC6_PATH,A.PIC7_PATH,A.PIC8_PATH
                           ,A.PIC9_PATH,A.PIC10_PATH,A.TXM,A.FILE1,A.FILE1_PATH
                           ,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME
                           ,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_WL A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.BH,A.WLSX_CODE,A.WLQZPL_CODE,A.WLPL_CODE
                           ,A.WG_NAME,A.NAME,A.CODE,A.EN_NAME,A.TJLB1
                           ,A.TJLB2,A.TJLB3,A.TJLB4,A.DZ,A.DZJD
                           ,A.CD,A.CDJD,A.MJ,A.MJJD,A.TJ
                           ,A.TJJD,A.UNIT,A.UNIT_JD,A.FZ_UNIT1,A.FZ_UNIT1_RATE
                           ,A.FZ_UNIT1_JD,A.FZ_UNIT2,A.FZ_UNIT2_RATE,A.FZ_UNIT2_JD,A.FZ_UNIT3
                           ,A.FZ_UNIT3_RATE,A.FZ_UNIT3_JD,A.FZ_UNIT4,A.FZ_UNIT4_RATE,A.FZ_UNIT4_JD
                           ,A.RK_WAREHOUSE,A.SCBM,A.ZDKC,A.DKC,A.ZCKC
                           ,A.ZGKC,A.STATUS,A.IS_SB,A.PRICE,A.PRICE_JD
                           ,A.PRICE_CG,A.CH_CODE,A.XSSR_CODE,A.SXCB_CODE,A.CBCY_CODE
                           ,A.DGWZKM,A.RATE,A.PIC1,A.PIC2,A.PIC3
                           ,A.PIC4,A.PIC5,A.PIC6,A.PIC7,A.PIC8
                           ,A.PIC9,A.PIC10,A.PIC1_PATH,A.PIC2_PATH,A.PIC3_PATH
                           ,A.PIC4_PATH,A.PIC5_PATH,A.PIC6_PATH,A.PIC7_PATH,A.PIC8_PATH
                           ,A.PIC9_PATH,A.PIC10_PATH,A.TXM,A.FILE1,A.FILE1_PATH
                           ,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME
                           ,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_WL A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
