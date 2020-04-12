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
    public class MesBdScxCpplBLL:SuperBLL
    {
	    private MesBdScxCpplDAL dal = new MesBdScxCpplDAL();
        private MesBdScxCpplVAL val = new MesBdScxCpplVAL();

        private static MesBdScxCpplBLL instance;

		public  static MesBdScxCpplBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxCpplBLL()
        {
            instance = new MesBdScxCpplBLL();
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
                        MES_BD_SCX_CPPL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_CPPL mesBdScxCppl= new MES_BD_SCX_CPPL(MES_BD_SCX_CPPL.Fields.GUID);
                mesBdScxCppl.Data = saveEntity.Data;
                mesBdScxCppl.EffectDataFields();

				val.SaveValidate(context,mesBdScxCppl,isAdd);

                 if (isAdd)
                 {
                      mesBdScxCppl.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxCppl.AddUserInfo(context, isAdd);
					 
					  mesBdScxCppl.Validate();
                      mesBdScxCppl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxCppl.AddUserInfo(context, isAdd);
					 mesBdScxCppl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxCppl.Validate();
                     mesBdScxCppl.Update(context.Transaction);
                }

               return mesBdScxCppl;

         }
	   
    }
}
