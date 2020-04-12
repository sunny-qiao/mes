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
    public class MesBdZyDocBLL:SuperBLL
    {
	    private MesBdZyDocDAL dal = new MesBdZyDocDAL();
        private MesBdZyDocVAL val = new MesBdZyDocVAL();

        private static MesBdZyDocBLL instance;

		public  static MesBdZyDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdZyDocBLL()
        {
            instance = new MesBdZyDocBLL();
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
                        MES_BD_ZY_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_ZY_DOC mesBdZyDoc= new MES_BD_ZY_DOC(MES_BD_ZY_DOC.Fields.GUID);
                mesBdZyDoc.Data = saveEntity.Data;
                mesBdZyDoc.EffectDataFields();

				val.SaveValidate(context,mesBdZyDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdZyDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdZyDoc.AddUserInfo(context, isAdd);
					 
					  mesBdZyDoc.Validate();
                      mesBdZyDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdZyDoc.AddUserInfo(context, isAdd);
					 mesBdZyDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdZyDoc.Validate();
                     mesBdZyDoc.Update(context.Transaction);
                }

               return mesBdZyDoc;

         }
	   
    }
}
