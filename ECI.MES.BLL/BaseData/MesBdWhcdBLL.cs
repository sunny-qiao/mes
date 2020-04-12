using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ECI.MES.Entity;
using ECI.MES.DAL;
using ECI.MES.VAL;

namespace ECI.MES.BLL
{
    public class MesBdWhcdBLL:SuperBLL
    {
	    private MesBdWhcdDAL dal = new MesBdWhcdDAL();
        private MesBdWhcdVAL val = new MesBdWhcdVAL();

        private static MesBdWhcdBLL instance;

		public  static MesBdWhcdBLL Instance
        {
            get { return instance; }
        }

        static MesBdWhcdBLL()
        {
            instance = new MesBdWhcdBLL();
        }

        public DataTable Load(BLLContext context,string guid)
        {
             return dal.Load(context, guid);
        }

        public SearchResult Search(BLLContext context,Paging paging, EntityBase queryEntity)
        {
            return dal.Search(context, paging, queryEntity);
        }
  
         public void Delete(BLLContext context,List<string> listGuid)
         {
		          

                   foreach (string guid in listGuid)
                    {
					    val.DeleteValidate(context,guid);
                        MES_BD_WHCD.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WHCD mesBdWhcd= new MES_BD_WHCD(MES_BD_WHCD.Fields.GUID);
                mesBdWhcd.Data = saveEntity.Data;
                mesBdWhcd.EffectDataFields();

				val.SaveValidate(context,mesBdWhcd,isAdd);

                 if (isAdd)
                 {
                      mesBdWhcd.GUID = Guid.NewGuid().ToString("N");
                      mesBdWhcd.AddUserInfo(context, isAdd);
					 
					  mesBdWhcd.Validate();
                      mesBdWhcd.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWhcd.AddUserInfo(context, isAdd);
					 mesBdWhcd.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWhcd.Validate();
                     mesBdWhcd.Update(context.Transaction);
                }

               return mesBdWhcd;

         }
	   
    }
}
