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
    public class MesBdMjBLL:SuperBLL
    {
	    private MesBdMjDAL dal = new MesBdMjDAL();
        private MesBdMjVAL val = new MesBdMjVAL();

        private static MesBdMjBLL instance;

		public  static MesBdMjBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjBLL()
        {
            instance = new MesBdMjBLL();
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
                        MES_BD_MJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ mesBdMj= new MES_BD_MJ(MES_BD_MJ.Fields.GUID);
                mesBdMj.Data = saveEntity.Data;
                mesBdMj.EffectDataFields();

				val.SaveValidate(context,mesBdMj,isAdd);

                 if (isAdd)
                 {
                      mesBdMj.GUID = Guid.NewGuid().ToString("N");
                      mesBdMj.AddUserInfo(context, isAdd);
					 
					  mesBdMj.Validate();
                      mesBdMj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMj.AddUserInfo(context, isAdd);
					 mesBdMj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMj.Validate();
                     mesBdMj.Update(context.Transaction);
                }

               return mesBdMj;

         }
	   
    }
}
