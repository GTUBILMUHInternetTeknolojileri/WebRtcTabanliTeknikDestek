using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;

namespace TeknikOfis
{
    public partial class arizaprint : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                try
                {
                    string sorgu1 = "SELECT ariza.yil, ariza.no, kurum.ad,kurum.adres,ariza.tel,ariza.dahili,ariza.faks,ariza.marka,ariza.model,ariza.serino,ariza.aciklama,ariza.adate,ariza.ilgili_ad,ariza_tur.ad AS adT FROM ariza, kurum, ariza_tur WHERE ariza.kurum_id = kurum.id AND ariza_tur.id = ariza.tur_id AND ariza.id = " + Request.QueryString["no"];
                    SqlConnection con = baglantiV();
                    DataTable dtt = new DataTable();
                    SqlDataAdapter sql = new SqlDataAdapter(sorgu1, con);
                    sql.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {
                        lblNo.Text = dtt.Rows[0]["yil"].ToString() + "-" + dtt.Rows[0]["no"].ToString();
                        lblKurum.Text = dtt.Rows[0]["ad"].ToString();
                        lblAdres.Text = dtt.Rows[0]["adres"].ToString();
                        lblDate.Text = dtt.Rows[0]["adate"].ToString();
                        lblAd.Text = lblAd2.Text = dtt.Rows[0]["ilgili_ad"].ToString();
                        lblTel.Text = dtt.Rows[0]["tel"].ToString();
                        lblDahili.Text = dtt.Rows[0]["dahili"].ToString();
                        lblFaks.Text = dtt.Rows[0]["faks"].ToString();
                        lblMarka.Text = dtt.Rows[0]["marka"].ToString();
                        lblModel.Text = dtt.Rows[0]["model"].ToString();
                        lblSeri.Text = dtt.Rows[0]["serino"].ToString();
                        lblAriza.Text = dtt.Rows[0]["adT"].ToString();
                        lblAciklama.Text = dtt.Rows[0]["aciklama"].ToString();
                    }
                    con.Dispose();
                    con.Close();
                }
                catch
                {
                    Response.Write("Hata oldu. ");
                }
            }

            ClientScript.RegisterClientScriptBlock(this.GetType(), "print", "window.print()", true);
        }
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