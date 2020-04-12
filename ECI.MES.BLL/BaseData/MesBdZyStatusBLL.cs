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
    public class MesBdZyStatusBLL:SuperBLL
    {
	    private MesBdZyStatusDAL dal = new MesBdZyStatusDAL();
        private MesBdZyStatusVAL val = new MesBdZyStatusVAL();

        private static MesBdZyStatusBLL instance;

		public  static MesBdZyStatusBLL Instance
        {
            get { return instance; }
        }

        static MesBdZyStatusBLL()
        {
            instance = new MesBdZyStatusBLL();
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
                        MES_BD_ZY_STATUS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_ZY_STATUS mesBdZyStatus= new MES_BD_ZY_STATUS(MES_BD_ZY_STATUS.Fields.GUID);
                mesBdZyStatus.Data = saveEntity.Data;
                mesBdZyStatus.EffectDataFields();

				val.SaveValidate(context,mesBdZyStatus,isAdd);

                 if (isAdd)
                 {
                      mesBdZyStatus.GUID = Guid.NewGuid().ToString("N");
                      mesBdZyStatus.AddUserInfo(context, isAdd);
					 
					  mesBdZyStatus.Validate();
                      mesBdZyStatus.Insert(context.Transaction);
                 }
                else
                {
                     mesBdZyStatus.AddUserInfo(context, isAdd);
					 mesBdZyStatus.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdZyStatus.Validate();
                     mesBdZyStatus.Update(context.Transaction);
                }

               return mesBdZyStatus;

         }
	   
    }
}
