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
    public class MesBdGxBLL:SuperBLL
    {
	    private MesBdGxDAL dal = new MesBdGxDAL();
        private MesBdGxVAL val = new MesBdGxVAL();

        private static MesBdGxBLL instance;

		public  static MesBdGxBLL Instance
        {
            get { return instance; }
        }

        static MesBdGxBLL()
        {
            instance = new MesBdGxBLL();
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
                        MES_BD_GX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GX mesBdGx= new MES_BD_GX(MES_BD_GX.Fields.GUID);
                mesBdGx.Data = saveEntity.Data;
                mesBdGx.EffectDataFields();

				val.SaveValidate(context,mesBdGx,isAdd);

                 if (isAdd)
                 {
                      mesBdGx.GUID = Guid.NewGuid().ToString("N");
                      mesBdGx.AddUserInfo(context, isAdd);
					 
					  mesBdGx.Validate();
                      mesBdGx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGx.AddUserInfo(context, isAdd);
					 mesBdGx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGx.Validate();
                     mesBdGx.Update(context.Transaction);
                }

               return mesBdGx;

         }
	   
    }
}
