using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdGdzcDAL : BaseDAL
    {
      public MES_BD_GDZC Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_GDZC Get(string guid, object ts)
        {
            return MES_BD_GDZC.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.BH,A.NAME,A.WL,A.ZJFS
                           ,A.GHR,A.GGXH,A.ZZCS,A.ZZCS_TEL,A.ZZHM
                           ,A.ZZRQ,A.GZRQ,A.LRRQ,A.LRR,A.TYRQ
                           ,A.ZXRQ,A.ZXYY,A.KSSYRQ,A.UNIT,A.QTY
                           ,A.DGL,A.SBLB,A.PRICE,A.YZ,A.YJJCZ
                           ,A.JCZL,A.YJZZJE,A.YJZZJL,A.YJSYSM,A.YJNSZH
                           ,A.ZJFF,A.YJSCX,A.YJGZL,A.YJGZL_UNIT,A.DWGZLZJE
                           ,A.DYYSCZGL,A.GZLJSZZJE,A.SCJZRQ,A.DQQSRQ,A.QSRQDY
                           ,A.DQZZRQDY,A.ZZRQDY,A.BZQZJE,A.DYZJL,A.YZJE
                           ,A.YJTNF,A.YJTYF,A.YJZNFZJE,A.LJZJ,A.JZ
                           ,A.DYZJKM,A.CFDD,A.JZMJ,A.CSJG,A.PYKE
                           ,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER
                           ,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_GDZC A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.BH,A.NAME,A.WL,A.ZJFS
                           ,A.GHR,A.GGXH,A.ZZCS,A.ZZCS_TEL,A.ZZHM
                           ,A.ZZRQ,A.GZRQ,A.LRRQ,A.LRR,A.TYRQ
                           ,A.ZXRQ,A.ZXYY,A.KSSYRQ,A.UNIT,A.QTY
                           ,A.DGL,A.SBLB,A.PRICE,A.YZ,A.YJJCZ
                           ,A.JCZL,A.YJZZJE,A.YJZZJL,A.YJSYSM,A.YJNSZH
                           ,A.ZJFF,A.YJSCX,A.YJGZL,A.YJGZL_UNIT,A.DWGZLZJE
                           ,A.DYYSCZGL,A.GZLJSZZJE,A.SCJZRQ,A.DQQSRQ,A.QSRQDY
                           ,A.DQZZRQDY,A.ZZRQDY,A.BZQZJE,A.DYZJL,A.YZJE
                           ,A.YJTNF,A.YJTYF,A.YJZNFZJE,A.LJZJ,A.JZ
                           ,A.DYZJKM,A.CFDD,A.JZMJ,A.CSJG,A.PYKE
                           ,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER
                           ,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_GDZC A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
