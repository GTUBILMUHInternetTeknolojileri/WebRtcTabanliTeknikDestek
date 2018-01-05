using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;
using System.Web.UI.HtmlControls;

namespace TeknikOfis
{
    public partial class ariza_ekle : System.Web.UI.Page
    {
        public static int step = 1;
        public static string arizano = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.breadcrumbsAdd("user.aspx", "Ana sayfa", 0);
            this.Master.breadcrumbsAdd(" ", "Arıza Girişi", 2);
            this.Master.pageHeaderAdd("Arıza Girişi", "(Ekle, Düzelt, Sil)");

            if (!IsPostBack)
            {
                PanelMesaj.Visible = false;
                step = 1;
                kul.Text=Session["P_Ad"]+" ("+Session["user"]+")";
                Kname.Text = "";
                try
                {
                    string sorgu1 = "SELECT * FROM kurum WHERE id = " + Session["Kurum_Id"];
                    SqlConnection con = this.Master.baglantiV();
                    DataTable dtt = new DataTable();
                    SqlDataAdapter sql = new SqlDataAdapter(sorgu1, con);
                    sql.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {
                        Kname.Text = dtt.Rows[0]["ad"].ToString();
                        Kadres.Text = dtt.Rows[0]["adres"].ToString();
                    }
                    con.Dispose();
                    con.Close();
                }
                catch
                {
                    //hata oldu.
                }
                form_DropDownList_1.ClearSelection();
                form_DropDownList_1.Items.Clear();
                setArizaTur("");
                PanelPrint.Visible = false;
            }
        }
        protected void geri(object sender, EventArgs e)
        {
            if (step > 1)
                --step;
        }
        protected void ileri(object sender, EventArgs e)
        {
            if (step < 4)
                ++step;
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
        protected void kaydet(object sender, EventArgs e)
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
                st = st + "arıza türünü seçmelisiniz. ";
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
                    string no = string.Empty;
					string kdate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string srg = "SELECT L.no + 1 AS missed_no FROM   ariza AS L LEFT JOIN ariza AS R ON (L.no + 1 = R.no) WHERE  R.no IS NULL AND L.yil = " + DateTime.Now.Year.ToString() + " ORDER BY missed_no";
                    SqlCommand scmd = new SqlCommand(srg, conn);
                    no = Convert.ToString(scmd.ExecuteScalar());
                    if (String.IsNullOrEmpty(no))
                    {
                        no = "1";
                    }
                    string sorgu = "insert into ariza(kurum_id,user_id,tur_id,tel,dahili,faks,marka,model,serino,aciklama,adate,durum,ilgili_ad,yil,no) values (" +
                        Session["Kurum_Id"] + "," + Session["P_Id"] + "," + form_DropDownList_1.SelectedItem.Value + ",'" + phone.Text.Trim() + "','" + dahili.Text.Trim() + "','" + faks.Text.Trim() +
                        "','" + marka.Text.Trim().ToUpper() + "','" + model.Text.Trim().ToUpper() + "','" + serino.Text.Trim().ToUpper() + "','" + comment.Text.Trim().ToUpper() +
                        "','" + kdate + "',0,'" + kisi.Text.Trim().ToUpper() + "'," + DateTime.Now.Year.ToString() + ","+no+"); SELECT SCOPE_IDENTITY();";
                    scmd.CommandText = sorgu;
                    //ID = Convert.ToInt32(scmd.ExecuteScalar());*/
                    arizano = scmd.ExecuteScalar().ToString();
                    if (!String.IsNullOrEmpty(arizano))
                    {
                        PanelMesaj.Visible = false;
                        PanelGiris.Visible = false;
                        PanelPrint.Visible = true;
						/*string navigateURL = "arizaprint.aspx?no=" + arizano + "&id=" + form_DropDownList_1.SelectedItem.Text;
                        string target = "_parent";
                        string windowProperties = "toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,height=' + (parseInt(window.innerHeight) * .5) + ',width=' + (parseInt(window.innerWidth) * 0.5) + '";
                        string scriptText = "window.open('" + navigateURL + "','" + target + "','" + windowProperties + "');";
                        //Response.Redirect("aprint.aspx");
                        //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Print", scriptText, true);
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popitup('arizaprint.aspx?no=2')", true);
                        /*temiz();
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "1;url=user.aspx";
                        this.Page.Controls.Add(meta);*/
                    }
                }
                catch (Exception)
                {
                    mesaj("Kayıt esnasında bir hata oluştu.");
                }
            }
            else
                mesaj(st);
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
        protected void temiz()
        {
            arizano = string.Empty;
            step = 1;
            PanelMesaj.Visible = false;
            kisi.Text = string.Empty;
            phone.Text = string.Empty;
            dahili.Text = string.Empty;
            faks.Text = string.Empty;
            marka.Text = string.Empty;
            form_DropDownList_1.ClearSelection();
            //form_DropDownList_1.Items.Clear();
            //setArizaTur("");
            model.Text = string.Empty;
            serino.Text = string.Empty;
            comment.Text = string.Empty;
            kisi.Focus();
        }
        protected void goster(object sender, EventArgs e)
        {
            Response.Redirect("user.aspx");
        }
    }
}