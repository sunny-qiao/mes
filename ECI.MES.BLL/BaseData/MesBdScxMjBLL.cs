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
    public class MesBdScxMjBLL:SuperBLL
    {
	    private MesBdScxMjDAL dal = new MesBdScxMjDAL();
        private MesBdScxMjVAL val = new MesBdScxMjVAL();

        private static MesBdScxMjBLL instance;

		public  static MesBdScxMjBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxMjBLL()
        {
            instance = new MesBdScxMjBLL();
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
                        MES_BD_SCX_MJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_MJ mesBdScxMj= new MES_BD_SCX_MJ(MES_BD_SCX_MJ.Fields.GUID);
                mesBdScxMj.Data = saveEntity.Data;
                mesBdScxMj.EffectDataFields();

				val.SaveValidate(context,mesBdScxMj,isAdd);

                 if (isAdd)
                 {
                      mesBdScxMj.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxMj.AddUserInfo(context, isAdd);
					 
					  mesBdScxMj.Validate();
                      mesBdScxMj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxMj.AddUserInfo(context, isAdd);
					 mesBdScxMj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxMj.Validate();
                     mesBdScxMj.Update(context.Transaction);
                }

               return mesBdScxMj;

         }
	   
    }
}
