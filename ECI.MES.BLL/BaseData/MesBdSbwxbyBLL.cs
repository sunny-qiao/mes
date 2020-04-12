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
    public class MesBdSbwxbyBLL:SuperBLL
    {
	    private MesBdSbwxbyDAL dal = new MesBdSbwxbyDAL();
        private MesBdSbwxbyVAL val = new MesBdSbwxbyVAL();

        private static MesBdSbwxbyBLL instance;

		public  static MesBdSbwxbyBLL Instance
        {
            get { return instance; }
        }

        static MesBdSbwxbyBLL()
        {
            instance = new MesBdSbwxbyBLL();
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
                        MES_BD_SBWXBY.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SBWXBY mesBdSbwxby= new MES_BD_SBWXBY(MES_BD_SBWXBY.Fields.GUID);
                mesBdSbwxby.Data = saveEntity.Data;
                mesBdSbwxby.EffectDataFields();

				val.SaveValidate(context,mesBdSbwxby,isAdd);

                 if (isAdd)
                 {
                      mesBdSbwxby.GUID = Guid.NewGuid().ToString("N");
                      mesBdSbwxby.AddUserInfo(context, isAdd);
					 
					  mesBdSbwxby.Validate();
                      mesBdSbwxby.Insert(context.Transaction);
                 }
                else
                {
                     mesBdSbwxby.AddUserInfo(context, isAdd);
					 mesBdSbwxby.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdSbwxby.Validate();
                     mesBdSbwxby.Update(context.Transaction);
                }

               return mesBdSbwxby;

         }
	   
    }
}
