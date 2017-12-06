using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeknikOfis
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("login.aspx");
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Server.Transfer("login.aspx");

            Response.Redirect("yonetici.aspx");
        }
        
    }
}
