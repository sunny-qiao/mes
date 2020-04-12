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
    public class MesBdWlDocBLL:SuperBLL
    {
	    private MesBdWlDocDAL dal = new MesBdWlDocDAL();
        private MesBdWlDocVAL val = new MesBdWlDocVAL();

        private static MesBdWlDocBLL instance;

		public  static MesBdWlDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlDocBLL()
        {
            instance = new MesBdWlDocBLL();
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
                        MES_BD_WL_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WL_DOC mesBdWlDoc= new MES_BD_WL_DOC(MES_BD_WL_DOC.Fields.GUID);
                mesBdWlDoc.Data = saveEntity.Data;
                mesBdWlDoc.EffectDataFields();

				val.SaveValidate(context,mesBdWlDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdWlDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlDoc.AddUserInfo(context, isAdd);
					 
					  mesBdWlDoc.Validate();
                      mesBdWlDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlDoc.AddUserInfo(context, isAdd);
					 mesBdWlDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlDoc.Validate();
                     mesBdWlDoc.Update(context.Transaction);
                }

               return mesBdWlDoc;

         }
	   
    }
}
