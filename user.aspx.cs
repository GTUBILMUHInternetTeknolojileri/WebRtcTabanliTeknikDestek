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
    public partial class user1 : System.Web.UI.Page
    {
        public static int durumu = -1;
        public static string arizaId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.breadcrumbsAdd("user.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd(" ", "Arızalarım", 2);
            this.Master.pageHeaderAdd("Arızalarım", "Arıza İşlemleri");
            if (!IsPostBack)
            {
                PanelMesaj.Visible = false;
                yenile();
            }
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
        protected void giris_click(object sender, EventArgs e)
        {
            mesaj("user.aspx#modal-forma");
        }
        protected void yenile()
        {
            string my_sql_grid = "SELECT id,CONVERT(VARCHAR(4), yil) + '/' + CONVERT(VARCHAR(10), no) AS ariza_no,adate,ilgili_ad,tur_id,marka,model,serino,aciklama,gdate,durum,tel,dahili,faks FROM ariza WHERE kurum_id=" + Session["Kurum_Id"] + " ORDER BY durum,yil,no DESC";
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
                    string sorgu1 = "SELECT * FROM ariza_tur WHERE id = " + gridview.ToString() + " ORDER BY id DESC";
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
        protected string DurumKontrol(object gridview)
        {
            string msj = string.Empty;
            if (object.ReferenceEquals(gridview, DBNull.Value))
            {
                msj = "-";
            }
            else
            {
                if (gridview.ToString() == "0")
                {
                    msj = "<span class=\"label label-sm label-info arrowed-in\">Onayda</span>";
                }
                else if (gridview.ToString() == "1")
                {
                    msj = "<span class=\"label label-sm label-danger arrowed-in\">Açık</span>";
                }
                else if (gridview.ToString() == "2")
                {
                    msj = "<span class=\"label label-sm label-warning arrowed-in\">Beklemede</span>";
                }
                else
                {
                    msj = "<span class=\"label label-sm label-inverse\">Kapalı</span>";
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
            GridViewRow row = GridView1.Rows[0];
            if (e.CommandName == "duzelt")
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if (GridView1.Rows[i].Cells[0].Text == e.CommandArgument.ToString())
                    {
                        row = GridView1.Rows[i];
                    }
                }
                arizaId = row.Cells[0].Text;

                ariza_numarasi.Text = (row.Cells[1].Text).Trim();
                kisi.Text = string.Compare((row.Cells[3].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[3].Text);
                form_DropDownList_1.ClearSelection();
                form_DropDownList_1.Items.Clear();
                setArizaTur(((Label)row.Cells[4].FindControl("lbl_tur")).Text);
                marka.Text = string.Compare((row.Cells[5].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[5].Text);
                model.Text = string.Compare((row.Cells[6].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[6].Text);
                seri_no.Text = string.Compare((row.Cells[7].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[7].Text);
                comment.Text = string.Compare((row.Cells[8].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[8].Text);
                phone.Text = string.Compare((row.Cells[11].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[11].Text);
                dahili.Text = string.Compare((row.Cells[12].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[12].Text);
                faks.Text = string.Compare((row.Cells[13].Text).Trim(), "&nbsp;", true) == 0 ? string.Empty : (row.Cells[13].Text);
                
                this.ModalPopupDuzelt.Show();
            }
            else if (e.CommandName == "sil")
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if (GridView1.Rows[i].Cells[0].Text == e.CommandArgument.ToString())
                    {
                        row = GridView1.Rows[i];
                    }
                }
                arizaId = row.Cells[0].Text;
                arizaNoD.Text = row.Cells[1].Text;
                //mesaj(arizaId + " delete");
                this.ModalPopupDelete.Show();
            }
            else if (e.CommandName == "inform")
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if (GridView1.Rows[i].Cells[0].Text == e.CommandArgument.ToString())
                    {
                        row = GridView1.Rows[i];
                    }
                }
                durumu = Convert.ToInt32(row.Cells[10].Text);
                arizaNo.Text = row.Cells[1].Text;
                ilgiliAd.Text = row.Cells[3].Text;
                telNo.Text = row.Cells[11].Text + " (" + row.Cells[12].Text + ")"; //+dahili
                faksNo.Text = row.Cells[13].Text;
                markaAd.Text = row.Cells[5].Text;
                modelAd.Text = row.Cells[6].Text;
                seriNo.Text = row.Cells[7].Text;
                arizaAd.Text = ((Label)row.Cells[4].FindControl("lbl_tur")).Text;
                tarih.Text = row.Cells[2].Text;
                aciklama.Text = row.Cells[8].Text;
                mdate.Text = row.Cells[9].Text;
                /*if (row.Cells[10].Text == "1")
                    durumu = 1;*/
                //mesaj("e:" + e.CommandArgument.ToString());
                /*try
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
                }*/
                if(durumu>=1)
                    mesaj("e:" + e.CommandArgument.ToString());
                this.programmaticModalPopup.Show();
            }
            else
                return;
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            //this.GridView1.Columns[0].Visible = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if(GridView1.Rows[i].Cells[10].Text!="0")
                {
                    ((LinkButton)GridView1.Rows[i].Cells[10].FindControl("btnEdit")).Visible = false;
                    ((LinkButton)GridView1.Rows[i].Cells[10].FindControl("btnDelete")).Visible = false;
                }
                GridView1.Rows[i].Cells[0].Visible = false;
                GridView1.Rows[i].Cells[7].Visible = false;
                GridView1.Rows[i].Cells[9].Visible = false;
                GridView1.Rows[i].Cells[10].Visible = false;
                GridView1.Rows[i].Cells[11].Visible = false;
                GridView1.Rows[i].Cells[12].Visible = false;
                GridView1.Rows[i].Cells[13].Visible = false;
            }
            GridView1.HeaderRow.Cells[0].Visible = false;
            GridView1.HeaderRow.Cells[7].Visible = false;
            GridView1.HeaderRow.Cells[9].Visible = false;
            GridView1.HeaderRow.Cells[10].Visible = false;
            GridView1.HeaderRow.Cells[11].Visible = false;
            GridView1.HeaderRow.Cells[12].Visible = false;
            GridView1.HeaderRow.Cells[13].Visible = false;
        }
        protected void gw_b(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
              //... <i>Increment the running totals</i> ...
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
              // Determine the average UnitPrice
              // Display the summary data in the appropriate cells

                /*e.Row.Cells[1].Text = "Avg.: " + "20,20";//avgUnitPrice.ToString("c");
                e.Row.Cells[2].Text = "Total: 5";
                e.Row.Cells[3].Text = "Total: 55";
                 
                 //tasarım ekranı için.
                 <asp:LinkButton ID="btnDelete" runat="server" Text="" class="ace-icon fa fa-search  bigger-110 orange"
                            CausesValidation="false" CommandName="SendMail" CommandArgument='<%# Eval("id") %>' />
                 <asp:LinkButton ID="btnDelete" runat="server" Text="" class="ace-icon fa fa-refresh  bigger-110 green"
                            CausesValidation="false" CommandName="SendMail" CommandArgument='<%# Eval("id") %>' />
                 */
            }
        }
        protected void showModalPopupServerOperatorButton_Click(object sender, EventArgs e)
        {
            this.programmaticModalPopup.Show();
        }
        protected void hideModalPopupViaServer_Click(object sender, EventArgs e)
        {
            this.programmaticModalPopup.Hide();
            this.ModalPopupDelete.Hide();
        }
        protected void hideModalPopupDuzelt_Click(object sender, EventArgs e)
        {
            this.ModalPopupDuzelt.Hide();
        }
        protected void poupSilcek(object sender, EventArgs e)
        {
            SqlConnection conn = this.Master.baglantiV();
            try
            {
                string ssql = "delete from ariza where id=" + arizaId;
                SqlCommand cms = new SqlCommand(ssql, conn);
                cms.ExecuteNonQuery();
                yenile();
            }
            catch (Exception)
            {
                mesaj("Silme işleminde hata oluştu.");
            }
            conn.Dispose();
            conn.Close();
            arizaId = string.Empty;
        }
        protected void poupDuzeltim(object sender, EventArgs e)
        {
            string st = string.Empty;

            if (String.IsNullOrEmpty(kisi.Text.Trim()))
            {
                st = st + "İrtibata geçilecek kişi adını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(phone.Text.Trim()))
            {
                st = st + "İrtibata geçilecek kişinin telefon numarasını girmelisiniz. ";
            }
            if (string.Compare(form_DropDownList_1.SelectedItem.Text, "Ariza Türü seçiniz.") == 0)
            {
                st = st + "Arıza türünü seçmelisiniz. ";
            }
            if (String.IsNullOrEmpty(marka.Text.Trim()))
            {
                st = st + "Arızalı cihazın markasını girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(model.Text.Trim()))
            {
                st = st + "Arızalı cihazın modelini girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(comment.Text.Trim()))
            {
                st = st + "Arıza hakkında kısa bir açıklama girmelisiniz. ";
            }
            if (String.IsNullOrEmpty(st))
            {
                SqlConnection conn = this.Master.baglantiV();
                try
                {
                    string sorgu = "update ariza set ilgili_ad='" + kisi.Text.Trim().ToUpper()
                            + "',tel='" + phone.Text.Trim()
                            + "',dahili='" + dahili.Text.Trim()
                            + "',faks='" + faks.Text.Trim()
                            + "',tur_id=" + form_DropDownList_1.SelectedItem.Value
                            + ",marka='" + marka.Text.Trim().ToUpper()
                            + "',model='" + model.Text.Trim().ToUpper()
                            + "',serino='" + seri_no.Text.Trim().ToUpper() 
                            + "',aciklama='" + comment.Text.Trim()
                            + "' where id=" + arizaId;
                        SqlCommand scmd = new SqlCommand(sorgu, conn);
                        scmd.ExecuteNonQuery();
                        yenile();
                }
                catch (Exception)
                {
                    mesaj("Düzeltme işleminde hata oluştu.");
                }
                conn.Dispose();
                conn.Close();
                arizaId = string.Empty;
                this.programmaticModalPopup.Hide();
                /*yenile();
                hideModalPopupDuzelt_Click(sender,e);*/
                //mesaj(kisi.Text + "," + phone.Text + "," + dahili.Text + "," + faks.Text + "," + form_DropDownList_1.SelectedItem.Text + "," + marka.Text + "," + model.Text + "," + seri_no.Text + "," + comment.Text + "\n");
            }
        }
        protected void setArizaTur(string gelen)
        {
            SqlConnection conn = this.Master.baglantiV();

            /************* DropDownList1 işlemleri *************/
            string sorgu = "SELECT id, ad FROM ariza_tur ORDER BY ad ASC";
            SqlCommand sqlCommand = new SqlCommand(sorgu, conn);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);

            form_DropDownList_1.DataSource = dataTable;
            form_DropDownList_1.DataTextField = "ad";
            form_DropDownList_1.DataValueField = "id";
            form_DropDownList_1.DataBind();

            //Add the item at the first position.
            form_DropDownList_1.Items.Insert(0, "Ariza Türü seçiniz.");
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
    }
}