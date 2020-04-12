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
    public class MesBdZqBLL:SuperBLL
    {
	    private MesBdZqDAL dal = new MesBdZqDAL();
        private MesBdZqVAL val = new MesBdZqVAL();

        private static MesBdZqBLL instance;

		public  static MesBdZqBLL Instance
        {
            get { return instance; }
        }

        static MesBdZqBLL()
        {
            instance = new MesBdZqBLL();
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
                        MES_BD_ZQ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_ZQ mesBdZq= new MES_BD_ZQ(MES_BD_ZQ.Fields.GUID);
                mesBdZq.Data = saveEntity.Data;
                mesBdZq.EffectDataFields();

				val.SaveValidate(context,mesBdZq,isAdd);

                 if (isAdd)
                 {
                      mesBdZq.GUID = Guid.NewGuid().ToString("N");
                      mesBdZq.AddUserInfo(context, isAdd);
					 
					  mesBdZq.Validate();
                      mesBdZq.Insert(context.Transaction);
                 }
                else
                {
                     mesBdZq.AddUserInfo(context, isAdd);
					 mesBdZq.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdZq.Validate();
                     mesBdZq.Update(context.Transaction);
                }

               return mesBdZq;

         }
	   
    }
}
