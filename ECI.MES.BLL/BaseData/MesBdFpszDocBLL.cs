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
    public class MesBdFpszDocBLL:SuperBLL
    {
	    private MesBdFpszDocDAL dal = new MesBdFpszDocDAL();
        private MesBdFpszDocVAL val = new MesBdFpszDocVAL();

        private static MesBdFpszDocBLL instance;

		public  static MesBdFpszDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdFpszDocBLL()
        {
            instance = new MesBdFpszDocBLL();
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
                        MES_BD_FPSZ_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_FPSZ_DOC mesBdFpszDoc= new MES_BD_FPSZ_DOC(MES_BD_FPSZ_DOC.Fields.GUID);
                mesBdFpszDoc.Data = saveEntity.Data;
                mesBdFpszDoc.EffectDataFields();

				val.SaveValidate(context,mesBdFpszDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdFpszDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdFpszDoc.AddUserInfo(context, isAdd);
					 
					  mesBdFpszDoc.Validate();
                      mesBdFpszDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdFpszDoc.AddUserInfo(context, isAdd);
					 mesBdFpszDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdFpszDoc.Validate();
                     mesBdFpszDoc.Update(context.Transaction);
                }

               return mesBdFpszDoc;

         }
	   
    }
}
