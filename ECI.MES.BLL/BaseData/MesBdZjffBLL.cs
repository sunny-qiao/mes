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
    public class MesBdZjffBLL:SuperBLL
    {
	    private MesBdZjffDAL dal = new MesBdZjffDAL();
        private MesBdZjffVAL val = new MesBdZjffVAL();

        private static MesBdZjffBLL instance;

		public  static MesBdZjffBLL Instance
        {
            get { return instance; }
        }

        static MesBdZjffBLL()
        {
            instance = new MesBdZjffBLL();
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
                        MES_BD_ZJFF.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_ZJFF mesBdZjff= new MES_BD_ZJFF(MES_BD_ZJFF.Fields.GUID);
                mesBdZjff.Data = saveEntity.Data;
                mesBdZjff.EffectDataFields();

				val.SaveValidate(context,mesBdZjff,isAdd);

                 if (isAdd)
                 {
                      mesBdZjff.GUID = Guid.NewGuid().ToString("N");
                      mesBdZjff.AddUserInfo(context, isAdd);
					 
					  mesBdZjff.Validate();
                      mesBdZjff.Insert(context.Transaction);
                 }
                else
                {
                     mesBdZjff.AddUserInfo(context, isAdd);
					 mesBdZjff.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdZjff.Validate();
                     mesBdZjff.Update(context.Transaction);
                }

               return mesBdZjff;

         }
	   
    }
}
