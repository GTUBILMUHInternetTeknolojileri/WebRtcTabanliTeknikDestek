using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.Xml;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Web.Security;
using System.Data.SqlClient;

namespace TeknikOfis
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["author"] == null)
                    Response.Redirect("Default.aspx");
                else if (Convert.ToString(Session["author"]) != "2")
                    Response.Redirect("Default.aspx");
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }
        }
        public void breadcrumbsAdd(String sayfa, String metin, int deger)
        {
            if (deger == 0)
            {
                Literal Literal1 = new Literal();
                Literal1.Text = "<li><i class=\"ace-icon fa fa-home home-icon\"></i><a href=\"" + sayfa + "\">" + metin + "</a></li>";
                PlaceHolder1.Controls.Add(Literal1);
            }
            else if (deger == 1)
            {
                Literal Literal1 = new Literal();
                Literal1.Text = "<li><a href=\"" + sayfa + "\">" + metin + "</a></li>";
                PlaceHolder1.Controls.Add(Literal1);
            }
            else if (deger == 2)
            {
                Literal Literal1 = new Literal();
                Literal1.Text = "<li class=\"active\">" + metin + "</li>";
                PlaceHolder1.Controls.Add(Literal1);
            }
        }
        public void pageHeaderAdd(String baslik, String aciklama)
        {
            Literal Literal1 = new Literal();
            Literal1.Text = baslik + " <small><i class=\"ace-icon fa fa-angle-double-right\"></i>" + aciklama + "</small>";
            PlaceHolder2.Controls.Add(Literal1);
        }

        /**SQL bağlantısı oluşturmak için*/
        public SqlConnection baglantiV()
        {
            SqlConnection MyConnection = new SqlConnection();
            MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["baglanToV"].ConnectionString;

            if (MyConnection.State == ConnectionState.Closed || MyConnection.State == ConnectionState.Broken)
                MyConnection.Open();
            return MyConnection;
        }
    }
}