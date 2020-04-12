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
    public class MesBdGysGywlBLL:SuperBLL
    {
	    private MesBdGysGywlDAL dal = new MesBdGysGywlDAL();
        private MesBdGysGywlVAL val = new MesBdGysGywlVAL();

        private static MesBdGysGywlBLL instance;

		public  static MesBdGysGywlBLL Instance
        {
            get { return instance; }
        }

        static MesBdGysGywlBLL()
        {
            instance = new MesBdGysGywlBLL();
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
                        MES_BD_GYS_GYWL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GYS_GYWL mesBdGysGywl= new MES_BD_GYS_GYWL(MES_BD_GYS_GYWL.Fields.GUID);
                mesBdGysGywl.Data = saveEntity.Data;
                mesBdGysGywl.EffectDataFields();

				val.SaveValidate(context,mesBdGysGywl,isAdd);

                 if (isAdd)
                 {
                      mesBdGysGywl.GUID = Guid.NewGuid().ToString("N");
                      mesBdGysGywl.AddUserInfo(context, isAdd);
					 
					  mesBdGysGywl.Validate();
                      mesBdGysGywl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGysGywl.AddUserInfo(context, isAdd);
					 mesBdGysGywl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGysGywl.Validate();
                     mesBdGysGywl.Update(context.Transaction);
                }

               return mesBdGysGywl;

         }
	   
    }
}
