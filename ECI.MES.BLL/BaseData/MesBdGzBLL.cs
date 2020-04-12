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
    public class MesBdGzBLL:SuperBLL
    {
	    private MesBdGzDAL dal = new MesBdGzDAL();
        private MesBdGzVAL val = new MesBdGzVAL();

        private static MesBdGzBLL instance;

		public  static MesBdGzBLL Instance
        {
            get { return instance; }
        }

        static MesBdGzBLL()
        {
            instance = new MesBdGzBLL();
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
                        MES_BD_GZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GZ mesBdGz= new MES_BD_GZ(MES_BD_GZ.Fields.GUID);
                mesBdGz.Data = saveEntity.Data;
                mesBdGz.EffectDataFields();

				val.SaveValidate(context,mesBdGz,isAdd);

                 if (isAdd)
                 {
                      mesBdGz.GUID = Guid.NewGuid().ToString("N");
                      mesBdGz.AddUserInfo(context, isAdd);
					 
					  mesBdGz.Validate();
                      mesBdGz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGz.AddUserInfo(context, isAdd);
					 mesBdGz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGz.Validate();
                     mesBdGz.Update(context.Transaction);
                }

               return mesBdGz;

         }
	   
    }
}
