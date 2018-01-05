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

using System.Drawing;
using System.Drawing.Design;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace TeknikOfis
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guvenlik(100, 40, "Tahoma", 14, 20, 10, Server.MapPath("assets/images/arkaplan.png"));
            }
        }
        private void Guvenlik(int H, int W, string fonts, int Punto, int X, int Y, string arkaplanResmi)
        {
            Bitmap bmp = new Bitmap(H, W);
            Graphics g = Graphics.FromImage(bmp);
            Font font = new Font(fonts, Punto);
            Random r = new Random();
            int sayi = r.Next(1000, 99999);
            ViewState["captcha"] = sayi;
            System.Drawing.Image img = System.Drawing.Image.FromFile(arkaplanResmi);
            g.DrawImage(img, 1, 1);
            g.DrawString(sayi.ToString(), font, Brushes.DarkRed, X, Y);
            g.CompositingQuality = CompositingQuality.HighQuality;
            bmp.Save(Server.MapPath("assets/images/captcha.png"), ImageFormat.Png);
        }
        protected void sayikontrol(object source, ServerValidateEventArgs args)
        {
            if (ViewState["captcha"] != null)
            {
                if (TextBox1.Value != ViewState["captcha"].ToString())
                {
                    Guvenlik(100, 40, "Tahoma", 14, 20, 10, Server.MapPath("assets/images/arkaplan.png"));
                    args.IsValid = false;
                    return;
                }
            }
            else
            {
                Guvenlik(100, 40, "Tahoma", 14, 20, 10, Server.MapPath("assets/images/arkaplan.png"));
                args.IsValid = false;
                return;
            }

        }
        protected void giris(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            try
            {
                string sorgu1 = "select * from personel where usern = '" + user_txt.Value.Trim() + "' and sifre='" + FormsAuthentication.HashPasswordForStoringInConfigFile(("Ab" + password_txt.Value.Trim() + "macik"), "SHA1") + "'";
                SqlConnection con = baglantiA();
                DataTable dtt = new DataTable();
                SqlDataAdapter sql = new SqlDataAdapter(sorgu1, con);
                sql.Fill(dtt);
                if (dtt.Rows.Count > 0)
                {
                    //Uyar.Visible = false;

                    Session["P_Id"] = dtt.Rows[0]["id"].ToString();
                    Session["P_Ad"] = dtt.Rows[0]["ad"].ToString();
                    Session["user"] = dtt.Rows[0]["sicil"].ToString();
                    Session["Kurum_Id"] = dtt.Rows[0]["kurum_id"].ToString();
                    Session["author"] = dtt.Rows[0]["yetki"].ToString();
                    
                    if (dtt.Rows[0]["yetki"].ToString() == "1")
                        Response.Redirect("yonetici.aspx");
                    else if (dtt.Rows[0]["yetki"].ToString() == "2")
                        Response.Redirect("user.aspx");
                    else if (dtt.Rows[0]["yetki"].ToString() == "3")
                        Response.Redirect("teknik.aspx");
                }
                else
                {
                    //Uyar.Text = "Siciliz ve/veya parolanız yanlış ya da AYOS sisteminde kaydınız yok. Lüften yetkili ile irtibata geçiniz.";
                    //Uyar.Visible = true;
                    Response.Write("Kayıt yok.");
                    user_txt.Focus();
                }
                con.Dispose();
                con.Close();
            }
            catch
            {
                Response.Write("Bağlantıda sorun var.\n");
            }
        }

        /**SQL bağlantısı oluşturmak için*/
        public SqlConnection baglantiA()
        {
            SqlConnection MyConnection = new SqlConnection();
            MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["baglanToV"].ConnectionString;

            if (MyConnection.State == ConnectionState.Closed || MyConnection.State == ConnectionState.Broken)
                MyConnection.Open();
            return MyConnection;
        }
    }
}