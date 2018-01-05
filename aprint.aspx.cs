using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeknikOfis
{
    public partial class aprint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popitup('arizaprint.aspx?no=2')", true);
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "print", "window.print()", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "yazdir('print_div');false;", true);
        }
    }
}