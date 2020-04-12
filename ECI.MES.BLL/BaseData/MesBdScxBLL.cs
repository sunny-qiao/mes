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
    public class MesBdScxBLL:SuperBLL
    {
	    private MesBdScxDAL dal = new MesBdScxDAL();
        private MesBdScxVAL val = new MesBdScxVAL();

        private static MesBdScxBLL instance;

		public  static MesBdScxBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxBLL()
        {
            instance = new MesBdScxBLL();
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
                        MES_BD_SCX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX mesBdScx= new MES_BD_SCX(MES_BD_SCX.Fields.GUID);
                mesBdScx.Data = saveEntity.Data;
                mesBdScx.EffectDataFields();

				val.SaveValidate(context,mesBdScx,isAdd);

                 if (isAdd)
                 {
                      mesBdScx.GUID = Guid.NewGuid().ToString("N");
                      mesBdScx.AddUserInfo(context, isAdd);
					 
					  mesBdScx.Validate();
                      mesBdScx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScx.AddUserInfo(context, isAdd);
					 mesBdScx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScx.Validate();
                     mesBdScx.Update(context.Transaction);
                }

               return mesBdScx;

         }
	   
    }
}
