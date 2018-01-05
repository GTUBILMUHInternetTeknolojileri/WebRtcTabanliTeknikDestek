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
    public partial class prefresh : System.Web.UI.Page
    {
        public static int user_id = -1;
        public static string user_ad = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.breadcrumbsAdd("yonetici.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd("personel.aspx", "Kullanıcı", 1);
            this.Master.breadcrumbsAdd(" ", "Şifre Değiştir", 2);
            this.Master.pageHeaderAdd("Kullanıcı", "Şifre değiştirme işlemleri");

            if (!IsPostBack)
            {
                temiz();
                mesaj("Sadece şifresini unutan kullanıcının şifresi değiştirilir.");
                
            }
        }
        protected void temiz()
        {
            user_id = -1;
            PanelMesaj.Visible = false;
            Panelpassword.Visible = false;
            PanelInfo.Visible = false;
            PanelSonuc.Visible = false;
            PanelAra.Visible = true;
            form_field_1.Text = string.Empty;
            btnAra.Visible = true;
            btnOnay.Visible = false;
            form_field_1.Focus();
        }
        protected void ara(object sender, EventArgs e)
        {
            PanelMesaj.Visible = false;
            string st = string.Empty;

            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Kullanıcı adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu1 = "SELECT personel.id, personel.ad, kurum.ad AS kad, yetki, personel.durum FROM personel, kurum WHERE usern = '" + form_field_1.Text.Trim()+"' AND personel.kurum_id = kurum.id";
                    DataTable dtt = new DataTable();
                    SqlDataAdapter sql = new SqlDataAdapter(sorgu1, conn);
                    sql.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {
                        user_id = Convert.ToInt32(dtt.Rows[0]["id"]);
                        user_ad = form_field_1.Text.Trim();
                        btnAra.Visible = false;
                        btnOnay.Visible = true;
                        if (Convert.ToString(dtt.Rows[0]["durum"])=="False")
                        {
                            btnOnay.Visible = false;
                            mesaj("Bu kullanıcı pasif durumda. Önce aktif yapmalısınız.");
                        }

                        if (user_id == Convert.ToInt32(Session["P_Id"]))
                        {
                            btnOnay.Visible = false;
                            mesaj("Kendi şifrenizi buradan değiştiremezsiniz.");
                        }

                        lblUser.Text = form_field_1.Text.Trim();
                        lblAd.Text = Convert.ToString(dtt.Rows[0]["ad"]);
                        lblKurum.Text = Convert.ToString(dtt.Rows[0]["kad"]);
                        lblYetki.Text = (Convert.ToString(dtt.Rows[0]["yetki"])=="1")?"Yönetici":((Convert.ToString(dtt.Rows[0]["yetki"])=="2")?"Kullanıcı":((Convert.ToString(dtt.Rows[0]["yetki"])=="3")?"Teknik Ofis":"Diğer"));
                        PanelInfo.Visible = true;
                        PanelAra.Visible = false;
                    }
                    else
                    {
                        mesaj("Böyle bir kullanıcı yok. Girdiğiniz bilgileri kontrol ediniz.");
                        form_field_1.Text = "";
                        form_field_1.Focus();

                    }
                }
                catch (Exception)
                {
                    temiz();
                    mesaj("Arama esnasında hata oluştu.");
                }
                conn.Dispose();
                conn.Close();
            }
            else
            {
                mesaj(st);
            }
        }
        protected void duzelt(object sender, EventArgs e)
        {
            PanelMesaj.Visible = false;
            PanelInfo.Visible = false;
            PanelSonuc.Visible = true;
            btnOnay.Visible = false;

            SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "update personel set sifre='" + FormsAuthentication.HashPasswordForStoringInConfigFile(("Ab"+user_ad+"macik"), "SHA1") + "' where id=" + user_id;
                    SqlCommand scmd = new SqlCommand(sorgu, conn);
                    scmd.ExecuteNonQuery();
                    lblUserAd.Text = user_ad + " isimli kullanıcının şifresi " + user_ad + " olarak ayarlanmıştır.";
                    lblSifre.Text = user_ad;
                }
                catch (Exception)
                {
                    mesaj("Güncelleme esnasında hata oluştu.");
                }
                conn.Dispose();
                conn.Close();
            
        }
        protected void temizle(object sender, EventArgs e)
        {
            temiz();
        }
        protected void mesajClose(object sender, EventArgs e)
        {
            PanelMesaj.Visible = false;
        }
        protected void mesaj(string msj)
        {
            Mesaj_lbl.Text = msj;
            //ClientScript.RegisterClientScriptBlock(GetType(), "msg", "<script language='javascript'>alert('" + msj + "');</script>");
            PanelMesaj.Visible = true;
        }
    }
}