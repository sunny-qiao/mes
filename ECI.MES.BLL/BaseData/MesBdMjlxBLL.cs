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
    public class MesBdMjlxBLL:SuperBLL
    {
	    private MesBdMjlxDAL dal = new MesBdMjlxDAL();
        private MesBdMjlxVAL val = new MesBdMjlxVAL();

        private static MesBdMjlxBLL instance;

		public  static MesBdMjlxBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjlxBLL()
        {
            instance = new MesBdMjlxBLL();
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
                        MES_BD_MJLX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJLX mesBdMjlx= new MES_BD_MJLX(MES_BD_MJLX.Fields.GUID);
                mesBdMjlx.Data = saveEntity.Data;
                mesBdMjlx.EffectDataFields();

				val.SaveValidate(context,mesBdMjlx,isAdd);

                 if (isAdd)
                 {
                      mesBdMjlx.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjlx.AddUserInfo(context, isAdd);
					 
					  mesBdMjlx.Validate();
                      mesBdMjlx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjlx.AddUserInfo(context, isAdd);
					 mesBdMjlx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjlx.Validate();
                     mesBdMjlx.Update(context.Transaction);
                }

               return mesBdMjlx;

         }
	   
    }
}
