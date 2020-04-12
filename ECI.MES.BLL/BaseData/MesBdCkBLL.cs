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
    public class MesBdCkBLL:SuperBLL
    {
	    private MesBdCkDAL dal = new MesBdCkDAL();
        private MesBdCkVAL val = new MesBdCkVAL();

        private static MesBdCkBLL instance;

		public  static MesBdCkBLL Instance
        {
            get { return instance; }
        }

        static MesBdCkBLL()
        {
            instance = new MesBdCkBLL();
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
                        MES_BD_CK.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CK mesBdCk= new MES_BD_CK(MES_BD_CK.Fields.GUID);
                mesBdCk.Data = saveEntity.Data;
                mesBdCk.EffectDataFields();

				val.SaveValidate(context,mesBdCk,isAdd);

                 if (isAdd)
                 {
                      mesBdCk.GUID = Guid.NewGuid().ToString("N");
                      mesBdCk.AddUserInfo(context, isAdd);
					 
					  mesBdCk.Validate();
                      mesBdCk.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCk.AddUserInfo(context, isAdd);
					 mesBdCk.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCk.Validate();
                     mesBdCk.Update(context.Transaction);
                }

               return mesBdCk;

         }
	   
    }
}
