<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici.Master" AutoEventWireup="true" CodeBehind="prefresh.aspx.cs" Inherits="TeknikOfis.prefresh" %>
<%@ MasterType VirtualPath="~/yonetici.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Personel şifre işlemleri (MACİK-Teknik Ofis)</title>
    <meta name="description" content="Kurum bilgileri işleme ekranı" />

    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="assets/css/chosen.min.css" />
    <link rel="stylesheet" href="assets/css/datepicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
    <link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="assets/css/colorpicker.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelMesaj" runat="server">
        <div class="alert alert-danger">
            <button runat="server" id="btnMesaj" onserverclick="mesajClose" type="button" class="close" data-dismiss="alert">
                <i class="ace-icon fa fa-times"></i>
            </button>

            <strong>
                <i class="ace-icon fa fa-times"></i>
                Uyarı!
            </strong>
            <asp:Label ID="Mesaj_lbl" runat="server" Text="Something is wrong."></asp:Label>
            <br />
        </div>
    </asp:Panel>
    <div class="form-horizontal" role="form">
        <asp:Panel ID="Panelpassword" runat="server">
            <div id="edit-password" class="tab-pane">
                <div class="space-10"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form_field_pass1">Yeni şifre</label>

                    <div class="col-sm-9">
                        <input runat="server" tabindex="1" type="password" id="form_field_pass1" />
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form_field_pass2">Şifre onay</label>

                    <div class="col-sm-9">
                        <input runat="server" tabindex="2" type="password" id="form_field_pass2" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelAra" runat="server">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-username"> </label>
                <div class="col-sm-9">
                    <label class="col-sm-5">Şifresi değiştirilecek kullanıcının </label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_1">Kullanıcı Adı </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="form_field_1" runat="server" TabIndex="1" placeholder="Kullanıcı Adı" class="col-xs-10 col-sm-5"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelInfo" runat="server">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_2">  </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblUser" runat="server" Text="Kullanıcı" class="col-sm-5"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_2">Kullanıcının Adı </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblAd" runat="server" Text="Kullanıcı Adı" class="col-sm-5"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_3">Kurumu </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblKurum" runat="server" Text="Kurum " class="col-sm-5"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_3">Yetki </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblYetki" runat="server" Text="Yetki " class="col-sm-5"></asp:Label>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelSonuc" runat="server">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_2"> </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblUserAd" runat="server" Text="Kullanıcı" class="col-sm-10"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form_field_2">Şifre:  </label>
                <div class="col-sm-9">
                    <asp:Label ID="lblSifre" runat="server" Text="Kullanıcı" class="col-sm-5"></asp:Label>
                </div>
            </div>
        </asp:Panel>
        <div class="space-4"></div>

        <div class="clearfix form-actions">
            <div class="col-md-offset-3 col-md-9">
                <button runat="server" id="btnAra" onserverclick="ara" class="btn btn-info" tabindex="2">
                    <i class="ace-icon fa fa-search bigger-110"></i>
                    Ara
                </button>
                &nbsp; &nbsp; &nbsp;
                <button runat="server" id="btnOnay" onserverclick="duzelt" class="btn btn-info btn-danger" tabindex="3">
                    <i class="ace-icon fa fa-refresh bigger-110"></i>
                    Onay
                </button>

                &nbsp; &nbsp; &nbsp;
                <button runat="server" id="btnTemiz" onserverclick="temizle" class="btn btn-inverse" tabindex="4">
                    <i class="ace-icon fa fa-undo bigger-110"></i>
                    Temizle
                </button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
