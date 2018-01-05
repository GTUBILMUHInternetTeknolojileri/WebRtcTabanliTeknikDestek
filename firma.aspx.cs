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
using System.Text;
using System.Data.SqlClient;

namespace TeknikOfis
{
    public partial class firma : System.Web.UI.Page
    {
        public static int kurum_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //tarihim.Text = DateTime.Now.Date.ToString("dd.MM.yyyy");
            this.Master.breadcrumbsAdd("yonetici.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd("firma.aspx", "Kurum", 1);
            this.Master.breadcrumbsAdd(" ", "İşlemleri", 2);
            this.Master.pageHeaderAdd("Kurum", "İşlemleri (Ekle, Düzelt, Sil)");
            
            if (!IsPostBack)
            {
                temiz();
                yenile();
            }
        }
        protected void temiz()
        {
            kurum_id = -1;
            PanelMesaj.Visible = false;
            form_field_1.Text = string.Empty;
            form_field_2.Text = string.Empty;
            form_field_3.Text = string.Empty;
            form_field_4.Text = string.Empty;
            form_field_5.Text = string.Empty;
            form_field_6.Text = string.Empty;
            form_checkBox_1.Checked = false;
            PanelDurum.Visible = false;
            form_DropDownList_1.Items.Clear();
            btnKaydet.Visible = true;
            btnDuzelt.Visible = false;
            btnSil.Visible = false;
            form_DropDownList_1.ClearSelection();
            setTips("");
            form_field_1.Focus();
        }
        protected void kaydet(object sender, EventArgs e)
        {
            string st = string.Empty;

            if (string.Compare(form_DropDownList_1.SelectedItem.Value, "Kurum türünü seçiniz.") == 0)
            {
                st = st + " Kurum türünü seçmelisiniz.";
            }

            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Kurum adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "insert into kurum(ad,adres,il,tel,faks,eposta,tur_id,durum) values ('" + form_field_1.Text.Trim().ToUpper() + "','" + form_field_2.Text.Trim().ToUpper() + "','" + form_field_3.Text.Trim().ToUpper() + "','" + form_field_4.Text + "','" + form_field_5.Text + "','" + form_field_6.Text + "'," + form_DropDownList_1.SelectedItem.Value + ",1)";
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

            if (string.Compare(form_DropDownList_1.SelectedItem.Value, "Kurum türünü seçiniz.") == 0)
            {
                st = st + " Kurum türünü seçmelisiniz.";
            }

            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Kurum adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "update kurum set ad='" + form_field_1.Text.Trim().ToUpper() + "',adres='" + form_field_2.Text.Trim().ToUpper() + "',il='" + form_field_3.Text.Trim().ToUpper() + "',tel='" + form_field_4.Text + "',faks='" + form_field_5.Text + "',eposta='" + form_field_6.Text + "',tur_id=" + form_DropDownList_1.SelectedItem.Value + ",durum=" + (form_checkBox_1.Checked?0:1) + " where id=" + kurum_id;
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
                string sorgu1 = "SELECT kurum_id FROM personel WHERE kurum_id = " + kurum_id;
                DataTable dtt = new DataTable();
                SqlDataAdapter sql = new SqlDataAdapter(sorgu1, conn);
                sql.Fill(dtt);
                if (dtt.Rows.Count > 0)
                {
                    mesaj("Silmek istediğiniz kurum kullanılmaktadır.Silemezsiniz.");
                }
                else
                {
                    string ssql = "delete from kurum where id=" + kurum_id;
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
        protected void setTips(string gelen)
        {
            SqlConnection conn = this.Master.baglantiV();

            /************* DropDownList1 işlemleri *************/
            string sorgu = "SELECT id, ad FROM kurum_tip ORDER BY ad ASC";
            SqlCommand sqlCommand = new SqlCommand(sorgu, conn);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);

            form_DropDownList_1.DataSource = dataTable;
            form_DropDownList_1.DataTextField = "ad";
            form_DropDownList_1.DataValueField = "id";
            form_DropDownList_1.DataBind();

            //Add the item at the first position.
            form_DropDownList_1.Items.Insert(0, "Kurum türünü seçiniz.");
            form_DropDownList_1.Items[0].Selected = true;
            sqlDataAdapter.Dispose();
            sqlCommand.Dispose();
            
            for (int i = 0; i < form_DropDownList_1.Items.Count; i++)
            {
                if (string.Compare(form_DropDownList_1.Items[i].Text, gelen) == 0)
                {
                    form_DropDownList_1.ClearSelection();
                    form_DropDownList_1.Items[i].Selected = true;
                }
            }
            //Close the connection.
            conn.Dispose();
            conn.Close();
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
            string my_sql_grid = "SELECT * FROM kurum ORDER BY id DESC";
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
        protected string TurKontrol(object gridview)
        {
            string msj = string.Empty;
            if (object.ReferenceEquals(gridview, DBNull.Value))
            {
                msj = "-";
            }
            else
            {

                try
                {
                    string sorgu1 = "SELECT * FROM kurum_tip WHERE id = " + gridview.ToString() + " ORDER BY id DESC";
                    SqlConnection con = this.Master.baglantiV();
                    DataTable dtt = new DataTable();
                    SqlDataAdapter sql = new SqlDataAdapter(sorgu1, con);
                    sql.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {
                        msj = dtt.Rows[0]["ad"].ToString();
                    }
                    con.Dispose();
                    con.Close();
                }
                catch
                {
                    mesaj("Veritabanı bağlantısında bir sorun oluştu. Lütfen yetkili ile irtibata geçiniz.");
                }
                /*for (int i = 0; i < DropDownList5.Items.Count; i++)
                {
                    if (DropDownList5.Items[i].Value == gridview.ToString())
                    {
                        msj = DropDownList5.Items[i].Text+"("+ "A" +")";
                    }
                }*/
            }
            return msj;
        }
        protected string DurumKontrol(object gridview)
        {
            string msj = string.Empty;
            if (object.ReferenceEquals(gridview, DBNull.Value))
            {
                msj = "-";
            }
            else
            {
                if (gridview.ToString()=="True")
                {
                    msj = "<span class=\"label label-sm label-success\">Faaliyette</span>";
                }
                else
                {
                    msj = "<span class=\"label label-sm label-inverse arrowed-in\">Kapalı</span>"; 
                }
            }
            return msj;
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

                kurum_id = Int32.Parse((row.Cells[0].Text).Trim());
                
                btnKaydet.Visible = false;
                btnDuzelt.Visible = true;
                btnSil.Visible = true;
                PanelDurum.Visible = true;

                form_field_1.Text=(row.Cells[1].Text).Trim();
                form_field_2.Text = string.Compare((row.Cells[2].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[2].Text);
                form_field_3.Text = string.Compare((row.Cells[3].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[3].Text);
                form_field_4.Text = string.Compare((row.Cells[4].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[4].Text);
                form_field_5.Text = string.Compare((row.Cells[5].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[5].Text);
                form_field_6.Text = string.Compare((row.Cells[6].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[6].Text);
                form_checkBox_1.Checked = string.Compare(((Label)row.Cells[8].FindControl("lbl_durum")).Text, "<span class=\"label label-sm label-success\">Faaliyette</span>", true) == 0 ? false : true;
                setTips(((Label)row.Cells[7].FindControl("lbl_tur")).Text);
            }
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            //this.GridView1.Columns[2].Visible = false;
            //this.GridView1.Columns[6].Visible = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridView1.Rows[i].Cells[2].Visible = false;
                GridView1.Rows[i].Cells[6].Visible = false;
            }
            GridView1.HeaderRow.Cells[2].Visible = false;
            GridView1.HeaderRow.Cells[6].Visible = false;
        }
    }
}