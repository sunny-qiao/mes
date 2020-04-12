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
    public class MesBdGysBLL:SuperBLL
    {
	    private MesBdGysDAL dal = new MesBdGysDAL();
        private MesBdGysVAL val = new MesBdGysVAL();

        private static MesBdGysBLL instance;

		public  static MesBdGysBLL Instance
        {
            get { return instance; }
        }

        static MesBdGysBLL()
        {
            instance = new MesBdGysBLL();
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
                        MES_BD_GYS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GYS mesBdGys= new MES_BD_GYS(MES_BD_GYS.Fields.GUID);
                mesBdGys.Data = saveEntity.Data;
                mesBdGys.EffectDataFields();

				val.SaveValidate(context,mesBdGys,isAdd);

                 if (isAdd)
                 {
                      mesBdGys.GUID = Guid.NewGuid().ToString("N");
                      mesBdGys.AddUserInfo(context, isAdd);
					 
					  mesBdGys.Validate();
                      mesBdGys.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGys.AddUserInfo(context, isAdd);
					 mesBdGys.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGys.Validate();
                     mesBdGys.Update(context.Transaction);
                }

               return mesBdGys;

         }
	   
    }
}
