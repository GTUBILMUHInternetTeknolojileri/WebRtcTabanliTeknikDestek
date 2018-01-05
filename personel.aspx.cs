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
using System.Xml;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Web.Security;

namespace TeknikOfis
{
    public partial class personel : System.Web.UI.Page
    {
        public static int personel_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.breadcrumbsAdd("yonetici.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd("personel.aspx", "Kullanıcı", 1);
            this.Master.breadcrumbsAdd(" ", "İşlemleri", 2);
            this.Master.pageHeaderAdd("Kullanıcı", "İşlemleri (Ekle, Düzelt, Sil)");

            if (!IsPostBack)
            {
                form_DropDownList_2.Items.Add(new ListItem("Yetki seçiniz.", "0"));
                form_DropDownList_2.Items.Add(new ListItem("Yönetici", "1"));
                form_DropDownList_2.Items.Add(new ListItem("Kullanıcı", "2"));
                form_DropDownList_2.Items.Add(new ListItem("Teknik Ofis", "3"));
                temiz();
                yenile();
            }
        }
        protected void temiz()
        {
            personel_id = -1;
            PanelMesaj.Visible = false;
            form_field_1.Text = string.Empty;
            form_field_2.Text = string.Empty;
            form_field_3.Text = string.Empty;
            form_field_4.Text = string.Empty;
            form_field_5.Text = string.Empty;
            form_DropDownList_1.ClearSelection();
            form_DropDownList_1.Items.Clear();
            setKurum("");
            form_field_6.Text = string.Empty;
            form_DropDownList_2.ClearSelection();
            form_checkBox_1.Checked = false;
            PanelDurum.Visible = false;
            btnKaydet.Visible = true;
            btnDuzelt.Visible = false;
            btnSil.Visible = false;
            form_field_1.Focus();
        }
        protected void kaydet(object sender, EventArgs e)
        {
            string st = string.Empty;

            if (string.Compare(form_DropDownList_1.SelectedItem.Value, "Kurum seçiniz.") == 0)
            {
                st = st + " Kurum seçmelisiniz.";
            }
            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Kişinin adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(form_field_6.Text.Trim()))
            {
                st = st + " Kullanıcı adını girmelisiniz. ";
            }
            if (string.Compare(form_DropDownList_2.SelectedItem.Value, "Yetki seçiniz.") == 0)
            {
                st = st + " Kişiye yetki vermelisiniz.";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                    try
                    {
                        string sorgu = "insert into personel(ad,sicil,unvan,tel,gorev,kurum_id,usern,sifre,yetki,durum,user_id,date) values ('"
                            + form_field_1.Text.Trim().ToUpper() + "','" + form_field_2.Text.Trim().ToUpper() + "','" + form_field_3.Text.Trim().ToUpper() + "','" 
                            + form_field_4.Text.Trim().ToUpper() + "','" + form_field_5.Text.Trim().ToUpper() + "'," + form_DropDownList_1.SelectedItem.Value
                            + ",'" + form_field_6.Text.Trim() + "','" + FormsAuthentication.HashPasswordForStoringInConfigFile(("Ab" + form_field_6.Text.Trim() + "macik"), "SHA1")
                            + "'," + form_DropDownList_2.SelectedItem.Value + ",1," + Session["P_Id"] + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";
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

            if (string.Compare(form_DropDownList_1.SelectedItem.Value, "Kurum seçiniz.") == 0)
            {
                st = st + " Kurum seçmelisiniz.";
            }
            if (String.IsNullOrEmpty(form_field_1.Text.Trim()))
            {
                st = st + " Kişinin adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(form_field_6.Text.Trim()))
            {
                st = st + " Kullanıcı adını girmelisiniz. ";
            }
            if (string.Compare(form_DropDownList_2.SelectedItem.Value, "Yetki seçiniz.") == 0)
            {
                st = st + " Kişiye yetki vermelisiniz.";
            }
            if (Session["P_Id"].ToString()== personel_id.ToString() && string.Compare(Session["author"].ToString(), form_DropDownList_2.SelectedItem.Value.ToString()) != 0)
                st += " Kendi yetkinizi değiştiremezsiniz.";

            if (Session["P_Id"].ToString() == personel_id.ToString() && form_checkBox_1.Checked)
                st += " Kendinizi pasif yapamazsınız.";

            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "update personel set ad='" + form_field_1.Text.Trim().ToUpper()
                        + "',sicil='" + form_field_2.Text.Trim().ToUpper()
                        + "',unvan='" + form_field_3.Text.Trim().ToUpper()
                        + "',tel='" + form_field_4.Text.Trim().ToUpper()
                        + "',gorev='" + form_field_5.Text.Trim().ToUpper()
                        + "',kurum_id=" + form_DropDownList_1.SelectedItem.Value
                        + ",usern='" + form_field_6.Text.Trim()
                        + "',yetki=" + form_DropDownList_2.SelectedItem.Value
                        + ",durum=" + (form_checkBox_1.Checked ? 0 : 1) 
                        + ",user_id=" + Session["P_Id"]
                        + ",date='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                        + "' where id=" + personel_id;
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
            if (Session["P_Id"].ToString() == personel_id.ToString())
            {
                mesaj("Kendinizi silemezsiniz.");
                return;
            }    

            SqlConnection conn = this.Master.baglantiV();
            try
            {
                bool var = false;
                int count = 0;
                /*string sorgu1 = "SELECT user_id FROM ariza WHERE user_id = " + personel_id;
                DataTable dtt = new DataTable();
                SqlDataAdapter sql = new SqlDataAdapter(sorgu1, conn);
                sql.Fill(dtt);
                if (dtt.Rows.Count > 0)
                    var = true;*/

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "SELECT count(*) FROM hareket WHERE user_id = " + personel_id;
                //SqlDataReader dr = cmd.ExecuteReader();
                count = (int)cmd.ExecuteScalar();
                if(count>0)
                    var = true;

                cmd.CommandText = "SELECT count(*) FROM ariza WHERE user_id = " + personel_id;
                count = (int)cmd.ExecuteScalar();
                if (count > 0)
                    var = true;

                cmd.CommandText = "SELECT count(*) FROM atama WHERE user_id = " + personel_id + " OR ouser_id = " + personel_id;
                count = (int)cmd.ExecuteScalar();
                if (count > 0)
                    var = true;

                cmd.CommandText = "SELECT count(*) FROM personel WHERE user_id = " + personel_id;
                count = (int)cmd.ExecuteScalar();
                if (count > 0)
                    var = true;

                if(var==false)
                {
                    string ssql = "delete from personel where id=" + personel_id;
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
        protected void setKurum(string gelen)
        {
            SqlConnection conn = this.Master.baglantiV();

            /************* DropDownList1 işlemleri *************/
            string sorgu = "SELECT id, ad FROM kurum ORDER BY ad ASC";
            SqlCommand sqlCommand = new SqlCommand(sorgu, conn);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);

            form_DropDownList_1.DataSource = dataTable;
            form_DropDownList_1.DataTextField = "ad";
            form_DropDownList_1.DataValueField = "id";
            form_DropDownList_1.DataBind();

            //Add the item at the first position.
            form_DropDownList_1.Items.Insert(0, "Kurum seçiniz.");
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
            PanelMesaj.Visible = true;
        }
        protected void yenile()
        {
            string my_sql_grid = "SELECT * FROM personel ORDER BY ad ASC";
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
        protected string KurumKontrol(object gridview)
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
                    string sorgu1 = "SELECT * FROM kurum WHERE id = " + gridview.ToString() + " ORDER BY id DESC";
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
            }
            return msj;
        }
        protected string YetkiKontrol(object gridview)
        {
            string msj = string.Empty;
            if (object.ReferenceEquals(gridview, DBNull.Value))
            {
                msj = "-";
            }
            else
            {
                msj = (gridview.ToString() == "1") ? "Yönetici" : ((gridview.ToString() == "2") ? "Kullanıcı" : ((gridview.ToString() == "3") ? "Teknik Ofis" : "Diğer"));
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
                if (gridview.ToString() == "True")
                {
                    msj = "<span class=\"label label-sm label-success\">Aktif</span>";
                }
                else
                {
                    msj = "<span class=\"label label-sm label-inverse arrowed-in\">Pasif</span>";
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

                personel_id = Int32.Parse((row.Cells[0].Text).Trim());

                btnKaydet.Visible = false;
                btnDuzelt.Visible = true;
                btnSil.Visible = true;
                PanelDurum.Visible = true;

                form_field_1.Text = (row.Cells[1].Text).Trim();
                form_field_2.Text = string.Compare((row.Cells[2].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[2].Text);
                form_field_3.Text = string.Compare((row.Cells[3].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[3].Text);
                form_field_4.Text = string.Compare((row.Cells[4].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[4].Text);
                form_field_5.Text = string.Compare((row.Cells[5].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[5].Text);
                setKurum(((Label)row.Cells[6].FindControl("lbl_tur")).Text);
                form_field_6.Text = string.Compare((row.Cells[7].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[7].Text);
                form_DropDownList_2.ClearSelection();
                form_DropDownList_2.Items[((string.Compare(((Label)row.Cells[8].FindControl("lbl_yt")).Text, "Yönetici", true) == 0) ? 1 : ((string.Compare(((Label)row.Cells[8].FindControl("lbl_yt")).Text, "Kullanıcı", true) == 0) ? 2 : ((string.Compare(((Label)row.Cells[8].FindControl("lbl_yt")).Text, "Teknik Ofis", true) == 0) ? 3 : 4)))].Selected = true;
                form_checkBox_1.Checked = string.Compare(((Label)row.Cells[9].FindControl("lbl_durum")).Text, "<span class=\"label label-sm label-success\">Aktif</span>", true) == 0 ? false : true;
                
            }
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            //this.GridView1.Columns[2].Visible = false;
            //this.GridView1.Columns[6].Visible = false;
            /*for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridView1.Rows[i].Cells[2].Visible = false;
                GridView1.Rows[i].Cells[6].Visible = false;
            }
            GridView1.HeaderRow.Cells[2].Visible = false;
            GridView1.HeaderRow.Cells[6].Visible = false;*/
        }
    }
}