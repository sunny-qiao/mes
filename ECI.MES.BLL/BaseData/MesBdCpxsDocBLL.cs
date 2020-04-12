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
    public class MesBdCpxsDocBLL:SuperBLL
    {
	    private MesBdCpxsDocDAL dal = new MesBdCpxsDocDAL();
        private MesBdCpxsDocVAL val = new MesBdCpxsDocVAL();

        private static MesBdCpxsDocBLL instance;

		public  static MesBdCpxsDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdCpxsDocBLL()
        {
            instance = new MesBdCpxsDocBLL();
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
                        MES_BD_CPXS_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CPXS_DOC mesBdCpxsDoc= new MES_BD_CPXS_DOC(MES_BD_CPXS_DOC.Fields.GUID);
                mesBdCpxsDoc.Data = saveEntity.Data;
                mesBdCpxsDoc.EffectDataFields();

				val.SaveValidate(context,mesBdCpxsDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdCpxsDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdCpxsDoc.AddUserInfo(context, isAdd);
					 
					  mesBdCpxsDoc.Validate();
                      mesBdCpxsDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCpxsDoc.AddUserInfo(context, isAdd);
					 mesBdCpxsDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCpxsDoc.Validate();
                     mesBdCpxsDoc.Update(context.Transaction);
                }

               return mesBdCpxsDoc;

         }
	   
    }
}
