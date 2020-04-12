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
    public class MesBdWlGysBLL:SuperBLL
    {
	    private MesBdWlGysDAL dal = new MesBdWlGysDAL();
        private MesBdWlGysVAL val = new MesBdWlGysVAL();

        private static MesBdWlGysBLL instance;

		public  static MesBdWlGysBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlGysBLL()
        {
            instance = new MesBdWlGysBLL();
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
                        MES_BD_WL_GYS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WL_GYS mesBdWlGys= new MES_BD_WL_GYS(MES_BD_WL_GYS.Fields.GUID);
                mesBdWlGys.Data = saveEntity.Data;
                mesBdWlGys.EffectDataFields();

				val.SaveValidate(context,mesBdWlGys,isAdd);

                 if (isAdd)
                 {
                      mesBdWlGys.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlGys.AddUserInfo(context, isAdd);
					 
					  mesBdWlGys.Validate();
                      mesBdWlGys.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlGys.AddUserInfo(context, isAdd);
					 mesBdWlGys.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlGys.Validate();
                     mesBdWlGys.Update(context.Transaction);
                }

               return mesBdWlGys;

         }
	   
    }
}
