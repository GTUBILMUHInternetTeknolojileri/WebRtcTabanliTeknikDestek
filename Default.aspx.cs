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
            /*Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Server.Transfer("login.aspx");*/


            Session["P_Id"] = "1";
            Session["P_Ad"] = "Ahmet DURNA";
            Session["user"] = "durna";
            Session["Kurum_Id"] = "1";
            Session["author"] = "1";

            Response.Redirect("yonetici.aspx");
        }
        
    }
}