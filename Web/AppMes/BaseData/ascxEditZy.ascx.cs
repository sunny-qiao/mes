using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AppMes_BaseData_ascxEditZy : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cboStatus.InitItems();
            tabStatus.Url = "frmMesBdZyStatusEdit.aspx?key=" + txtGUID.Text + "&code=" + this.txtCode.Text.Trim();
            tabDoc.Url = "frmMesBdZyDocEdit.aspx?key=" + txtGUID.Text + "&code=" + this.txtCode.Text.Trim();
        }
    }
}