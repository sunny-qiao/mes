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
    public class MesBdCsBLL:SuperBLL
    {
	    private MesBdCsDAL dal = new MesBdCsDAL();
        private MesBdCsVAL val = new MesBdCsVAL();

        private static MesBdCsBLL instance;

		public  static MesBdCsBLL Instance
        {
            get { return instance; }
        }

        static MesBdCsBLL()
        {
            instance = new MesBdCsBLL();
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
                        MES_BD_CS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CS mesBdCs= new MES_BD_CS(MES_BD_CS.Fields.GUID);
                mesBdCs.Data = saveEntity.Data;
                mesBdCs.EffectDataFields();

				val.SaveValidate(context,mesBdCs,isAdd);

                 if (isAdd)
                 {
                      mesBdCs.GUID = Guid.NewGuid().ToString("N");
                      mesBdCs.AddUserInfo(context, isAdd);
					 
					  mesBdCs.Validate();
                      mesBdCs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCs.AddUserInfo(context, isAdd);
					 mesBdCs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCs.Validate();
                     mesBdCs.Update(context.Transaction);
                }

               return mesBdCs;

         }
	   
    }
}
