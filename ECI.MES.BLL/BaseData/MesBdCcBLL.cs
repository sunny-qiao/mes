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
    public class MesBdCcBLL:SuperBLL
    {
	    private MesBdCcDAL dal = new MesBdCcDAL();
        private MesBdCcVAL val = new MesBdCcVAL();

        private static MesBdCcBLL instance;

		public  static MesBdCcBLL Instance
        {
            get { return instance; }
        }

        static MesBdCcBLL()
        {
            instance = new MesBdCcBLL();
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
                        MES_BD_CC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CC mesBdCc= new MES_BD_CC(MES_BD_CC.Fields.GUID);
                mesBdCc.Data = saveEntity.Data;
                mesBdCc.EffectDataFields();

				val.SaveValidate(context,mesBdCc,isAdd);

                 if (isAdd)
                 {
                      mesBdCc.GUID = Guid.NewGuid().ToString("N");
                      mesBdCc.AddUserInfo(context, isAdd);
					 
					  mesBdCc.Validate();
                      mesBdCc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCc.AddUserInfo(context, isAdd);
					 mesBdCc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCc.Validate();
                     mesBdCc.Update(context.Transaction);
                }

               return mesBdCc;

         }
	   
    }
}
