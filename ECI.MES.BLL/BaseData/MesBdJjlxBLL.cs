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
    public class MesBdJjlxBLL:SuperBLL
    {
	    private MesBdJjlxDAL dal = new MesBdJjlxDAL();
        private MesBdJjlxVAL val = new MesBdJjlxVAL();

        private static MesBdJjlxBLL instance;

		public  static MesBdJjlxBLL Instance
        {
            get { return instance; }
        }

        static MesBdJjlxBLL()
        {
            instance = new MesBdJjlxBLL();
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
                        MES_BD_JJLX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_JJLX mesBdJjlx= new MES_BD_JJLX(MES_BD_JJLX.Fields.GUID);
                mesBdJjlx.Data = saveEntity.Data;
                mesBdJjlx.EffectDataFields();

				val.SaveValidate(context,mesBdJjlx,isAdd);

                 if (isAdd)
                 {
                      mesBdJjlx.GUID = Guid.NewGuid().ToString("N");
                      mesBdJjlx.AddUserInfo(context, isAdd);
					 
					  mesBdJjlx.Validate();
                      mesBdJjlx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdJjlx.AddUserInfo(context, isAdd);
					 mesBdJjlx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdJjlx.Validate();
                     mesBdJjlx.Update(context.Transaction);
                }

               return mesBdJjlx;

         }
	   
    }
}
