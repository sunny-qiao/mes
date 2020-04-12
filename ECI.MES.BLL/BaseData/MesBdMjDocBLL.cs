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
    public class MesBdMjDocBLL:SuperBLL
    {
	    private MesBdMjDocDAL dal = new MesBdMjDocDAL();
        private MesBdMjDocVAL val = new MesBdMjDocVAL();

        private static MesBdMjDocBLL instance;

		public  static MesBdMjDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjDocBLL()
        {
            instance = new MesBdMjDocBLL();
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
                        MES_BD_MJ_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ_DOC mesBdMjDoc= new MES_BD_MJ_DOC(MES_BD_MJ_DOC.Fields.GUID);
                mesBdMjDoc.Data = saveEntity.Data;
                mesBdMjDoc.EffectDataFields();

				val.SaveValidate(context,mesBdMjDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdMjDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjDoc.AddUserInfo(context, isAdd);
					 
					  mesBdMjDoc.Validate();
                      mesBdMjDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjDoc.AddUserInfo(context, isAdd);
					 mesBdMjDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjDoc.Validate();
                     mesBdMjDoc.Update(context.Transaction);
                }

               return mesBdMjDoc;

         }
	   
    }
}
