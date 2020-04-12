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
    public class MesBdMjCsBLL:SuperBLL
    {
	    private MesBdMjCsDAL dal = new MesBdMjCsDAL();
        private MesBdMjCsVAL val = new MesBdMjCsVAL();

        private static MesBdMjCsBLL instance;

		public  static MesBdMjCsBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjCsBLL()
        {
            instance = new MesBdMjCsBLL();
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
                        MES_BD_MJ_CS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ_CS mesBdMjCs= new MES_BD_MJ_CS(MES_BD_MJ_CS.Fields.GUID);
                mesBdMjCs.Data = saveEntity.Data;
                mesBdMjCs.EffectDataFields();

				val.SaveValidate(context,mesBdMjCs,isAdd);

                 if (isAdd)
                 {
                      mesBdMjCs.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjCs.AddUserInfo(context, isAdd);
					 
					  mesBdMjCs.Validate();
                      mesBdMjCs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjCs.AddUserInfo(context, isAdd);
					 mesBdMjCs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjCs.Validate();
                     mesBdMjCs.Update(context.Transaction);
                }

               return mesBdMjCs;

         }
	   
    }
}
