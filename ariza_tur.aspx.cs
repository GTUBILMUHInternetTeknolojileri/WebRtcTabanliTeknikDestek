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
using System.Data.SqlClient;

namespace TeknikOfis
{
    public partial class ariza_tur : System.Web.UI.Page
    {
        public static int arizaTur_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.breadcrumbsAdd("yonetici.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd(" ", "Ariza Tür İşlemleri", 2);
            this.Master.pageHeaderAdd("Arıza Tür", "İşlemleri (Ekle,Düzelt,Sil)");

            if (!IsPostBack)
            {
                temiz();
                yenile();
            }
        }
        protected void temiz()
        {
            arizaTur_id = -1;
            PanelMesaj.Visible = false;
            form_field_1.Text = string.Empty;
            btnKaydet.Visible = true;
            btnDuzelt.Visible = false;
            btnSil.Visible = false;
            form_field_1.Focus();
        }
        protected void kaydet(object sender, EventArgs e)
        {
            string st = string.Empty;

            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Arıza türü girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "insert into ariza_tur(ad) values ('" + form_field_1.Text.Trim().ToUpper() + "')";
                    //mesaj(sorgu);
                    SqlCommand scmd = new SqlCommand(sorgu, conn);
                    scmd.ExecuteNonQuery();
                    temiz();
                    yenile();
                }
                catch (Exception)
                {
                    mesaj("Kayıt esnasında hata oluştu.");
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
            string st = string.Empty;

            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Arıza türü girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "update ariza_tur set ad='" + form_field_1.Text.Trim().ToUpper() + "' where id=" + arizaTur_id;
                    SqlCommand scmd = new SqlCommand(sorgu, conn);
                    scmd.ExecuteNonQuery();
                    temiz();
                    yenile();
                }
                catch (Exception)
                {
                    mesaj("Güncelleme esnasında hata oluştu.");
                }
                conn.Dispose();
                conn.Close();
            }
            else
            {
                mesaj(st);
            }
        }
        protected void sil(object sender, EventArgs e)
        {
            SqlConnection conn = this.Master.baglantiV();
            try
            {
                string sorgu1 = "SELECT tur_id FROM ariza WHERE tur_id = " + arizaTur_id;
                DataTable dtt = new DataTable();
                SqlDataAdapter sql = new SqlDataAdapter(sorgu1, conn);
                sql.Fill(dtt);
                if (dtt.Rows.Count > 0)
                {
                    mesaj("Silmek istediğiniz ariza türü kullanılmaktadır. Silemezsiniz.");
                }
                else
                {
                    string ssql = "delete from ariza_tur where id=" + arizaTur_id;
                    SqlCommand cms = new SqlCommand(ssql, conn);
                    cms.ExecuteNonQuery();
                    temiz();
                    yenile();
                }
            }
            catch (Exception)
            {
                mesaj("Silme işleminde hata oluştu.");
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
        protected void yenile()
        {
            string my_sql_grid = "SELECT * FROM ariza_tur ORDER BY id DESC";
            SqlConnection conn = this.Master.baglantiV();
            SqlCommand sqlCommand = new SqlCommand(my_sql_grid, conn);

            string sortDirection = "", sortExpression = "";
            DataSet ds = new DataSet();
            using (SqlDataAdapter sda = new SqlDataAdapter(sqlCommand))
            {
                sda.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    DataView dv = ds.Tables[0].DefaultView;
                    if (ViewState["SortDirection"] != null)
                    {
                        sortDirection = ViewState["SortDirection"].ToString();
                    }
                    if (ViewState["SortExpression"] != null)
                    {
                        sortExpression = ViewState["SortExpression"].ToString();
                        dv.Sort = string.Concat(sortExpression, " ", sortDirection);
                    }

                    GridView1.DataSource = dv;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            yenile();
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (ViewState["SortDirection"] == null || ViewState["SortExpression"].ToString() != e.SortExpression)
            {
                ViewState["SortDirection"] = "ASC";
                GridView1.PageIndex = 0;
            }
            else if (ViewState["SortDirection"].ToString() == "ASC")
            {
                ViewState["SortDirection"] = "DESC";
            }
            else if (ViewState["SortDirection"].ToString() == "DESC")
            {
                ViewState["SortDirection"] = "ASC";
            }

            ViewState["SortExpression"] = e.SortExpression;
            yenile();
        }
        protected void ContactsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Duzelt")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                arizaTur_id = Int32.Parse((row.Cells[0].Text).Trim());

                btnKaydet.Visible = false;
                btnDuzelt.Visible = true;
                btnSil.Visible = true;

                form_field_1.Text = (row.Cells[1].Text).Trim();
            }
        }
    }
}