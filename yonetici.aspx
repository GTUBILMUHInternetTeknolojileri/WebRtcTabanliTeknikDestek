<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici.Master" AutoEventWireup="true" CodeBehind="yonetici.aspx.cs" Inherits="TeknikOfis.yonetici1" %>
<%@ MasterType VirtualPath="~/yonetici.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Arıza bildirimlerine personel atama sayfası (MACİK-Teknik Ofis)</title>
    <meta name="description" content="Kullanıcının, açmış olduğu arıza bildirimlerine personel atama sayfası" />

    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="assets/css/chosen.min.css" />
    <link rel="stylesheet" href="assets/css/datepicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
    <link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="assets/css/colorpicker.min.css" />

    <link rel="stylesheet" href="assets/css/bootstrap-duallistbox.min.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-multiselect.min.css" />

    <style>
        /*Modal Popup*/
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
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

    <div class="col-xs-12">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnSorting="GridView1_Sorting"
            AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging" OnDataBound="GridView1_DataBound" OnRowDataBound="gw_b"
            PageSize="20" OnRowCommand="ContactsGridView_RowCommand" TabIndex="1" class="col-sm-12" ShowFooter="False"
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" HtmlEncode="False" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="ariza_no" HeaderText="Arıza No"
                    SortExpression="ariza_no" HtmlEncode="False" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="adate" HeaderText="Bildirme T."
                    SortExpression="adate" HtmlEncode="False" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="ilgili_ad" HeaderText="Bildiren"
                    SortExpression="ilgili_ad" HtmlEncode="False" />
                <asp:TemplateField HeaderText="Arıza Türü" SortExpression="tur_id">
                    <ItemTemplate>
                        <asp:Label ID="lbl_tur" runat="server" Text='<%# TurKontrol(Eval("tur_id")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="marka" HeaderText="Marka" SortExpression="marka" HtmlEncode="False" />
                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" HtmlEncode="False" />
                <asp:BoundField DataField="serino" HeaderText="Seri No" SortExpression="serino" HtmlEncode="False" />
                <asp:BoundField DataField="aciklama" HeaderText="Açıklama" SortExpression="aciklama" HtmlEncode="False" />
                <asp:BoundField DataField="gdate" HeaderText="Geliş Tarihi" SortExpression="gdate" HtmlEncode="False" />
                <asp:BoundField DataField="durum" HeaderText="durum" SortExpression="durum" HtmlEncode="False" />
                <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" HtmlEncode="False" />
                <asp:BoundField DataField="dahili" HeaderText="dahili" SortExpression="dahili" HtmlEncode="False" />
                <asp:BoundField DataField="faks" HeaderText="faks" SortExpression="faks" HtmlEncode="False" />
                <asp:TemplateField HeaderText="Durumu" SortExpression="durum" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_durum" runat="server" Text='<%# DurumKontrol(Eval("durum")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnLook" runat="server" Text="" class="ace-icon fa fa-search-plus center bigger-110 grey"
                            CausesValidation="false" CommandName="inform" CommandArgument='<%# Eval("id") %>' />

                        <asp:LinkButton ID="btnEdit" runat="server" Text="" class="ace-icon fa fa-user center bigger-110 blue"
                            CausesValidation="false" CommandName="duzelt" CommandArgument='<%# Eval("id") %>' />

                        <asp:LinkButton ID="btnDelete" runat="server" Text="" class="ace-icon fa fa-trash-o center bigger-110 red"
                            CausesValidation="false" CommandName="sil" CommandArgument='<%# Eval("id") %>' />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </div>
    
    <asp:Button runat="server" ID="hiddenTargetControlForModalPopup" Style="display: none" />
    <ajaxToolkit:ModalPopupExtender runat="server" ID="programmaticModalPopup" BehaviorID="programmaticModalPopupBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="programmaticPopup"
        BackgroundCssClass="modalBackground" DropShadow="true" PopupDragHandleControlID="programmaticPopupDragHandle"
        RepositionMode="RepositionOnWindowScroll">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" CssClass="modalPopup" ID="programmaticPopup" Width="500">
        <div class="page-content">
            <asp:Panel runat="Server" ID="programmaticPopupDragHandle" Style="cursor: move;">
                <div class="modal-header">
                    <asp:LinkButton runat="server" ID="LinkButton1" Text="&times;"
                        OnClick="hideModalPopupViaServer_Click" class="close red" />
                    <h4 class="blue bigger">Arıza Bilgileri</h4>
                </div>
            </asp:Panel>

            <div class="tabbable">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
                    <li class="active">
                        <a data-toggle="tab" href="#home2">Arıza</a>
                    </li>
                    <%if (durumu >= 2)
                      { %>
                    <li>
                        <a data-toggle="tab" href="#profile2"><%if (durumu == 2)
                                                                { %>Beklemede<%}
                                                                else
                                                                {%>Sonuç<%} %></a></li>
                    <%} %>
                </ul>
                <div class="tab-content">
                    <div id="home2" class="tab-pane in active">
                        <div class="col-xs-12">
                            <div class="row">
                                <span>Ariza Numarası:</span>
                                <b>
                                    <asp:Label ID="arizaNo" runat="server" Text="a"></asp:Label></b>
                            </div>
                            <div class="row">
                                <span>İlgili:</span>
                                <asp:Label ID="ilgiliAd" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Tel:</span>
                                <asp:Label ID="telNo" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Faks:</span>
                                <asp:Label ID="faksNo" runat="server" Text="a"></asp:Label>
                            </div>
                            <hr />
                            <span class="label-grey">Cihaz Bilgileri</span>
                            <div class="row">
                                <span>Marka:</span>
                                <asp:Label ID="markaAd" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Model:</span>
                                <asp:Label ID="modelAd" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Seri No:</span>
                                <asp:Label ID="seriNo" runat="server" Text="a"></asp:Label>
                            </div>
                            <hr />
                            <span class="label-grey">Arıza Bilgileri</span>
                            <div class="row">
                                <span>Arıza:</span>
                                <asp:Label ID="arizaAd" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Arıza Tarihi:</span>
                                <asp:Label ID="tarih" runat="server" Text="a"></asp:Label>
                            </div>
                            <%if (durumu >= 1)
                              { %>
                            <div class="row">
                                <span>Müdahale Tarihi:</span>
                                <b>
                                    <asp:Label ID="mdate" runat="server" Text="a"></asp:Label></b>
                            </div>
                            <%} %>
                            <div class="row">
                                <span>Açıklama:</span>
                                <asp:Label ID="aciklama" runat="server" Text="a"></asp:Label>
                            </div>
                        </div>
                        <p>.</p>
                    </div>

                    <div id="profile2" class="tab-pane">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                        <asp:LinkButton runat="server" ID="hideModalPopupViaServer" Text="<i class='ace-icon fa fa-check'></i> Tamam"
                            OnClick="hideModalPopupViaServer_Click" class="btn btn-sm btn-primary" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <!-- PAGE CONTENT ENDS -->
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="ModalPopupDelete" BehaviorID="ModalPopupDeleteBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="PopupDelete"
        BackgroundCssClass="modalBackground" DropShadow="true" PopupDragHandleControlID="DragHandleDelete"
        RepositionMode="RepositionOnWindowScroll">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" CssClass="modalPopup" ID="PopupDelete">
        <div class="page-content">
            <asp:Panel runat="Server" ID="DragHandleDelete" Style="cursor: move;">
                <div class="modal-header">
                    <asp:LinkButton runat="server" ID="LinkButton2" Text="&times;"
                        OnClick="hideModalPopupViaServer_Click" class="close red" />
                    <h4 class="blue bigger">Arıza Bilgileri</h4>
                </div>
            </asp:Panel>

            <div class="message-body">
                <div class="row">
                    <div class="center">
                        <b>
                            <asp:Label ID="arizaNoD" runat="server" Text="a"></asp:Label></b>
                        <span>numaralı kayıt silinecek.</span>
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="row">
                    <div class="center">
                        <asp:LinkButton runat="server" ID="LinkButton3" Text="<i class='ace-icon fa fa-trash-o'></i> Sil"
                            OnClick="poupSilcek" class="btn btn-sm btn-danger" data-dismiss="modal" />
                        <asp:LinkButton runat="server" ID="LinkButton4" Text="<i class='ace-icon fa fa-check'></i> İptal"
                            OnClick="hideModalPopupViaServer_Click" class="btn btn-sm btn-primary" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <!-- PAGE CONTENT ENDS -->
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="ModalPopupDuzelt" BehaviorID="ModalPopupDuzeltBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="PopupDuzelt"
        BackgroundCssClass="modalBackground" DropShadow="true" PopupDragHandleControlID="DragHandleDuzelt"
        RepositionMode="RepositionOnWindowScroll">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" CssClass="modalPopup" ID="PopupDuzelt" Width="500">
        <div class="page-content">
            <asp:Panel runat="Server" ID="DragHandleDuzelt" Style="cursor: move;">
                <div class="modal-header">
                    <asp:LinkButton runat="server" ID="LinkButton5" Text="&times;"
                        OnClick="hideModalPopupViaServer_Click" class="close red" />
                    <h4 class="blue bigger">Arıza Bilgileri</h4>
                </div>
            </asp:Panel>
            <div class="tabbable">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab5">
                    <li>
                        <a data-toggle="tab" href="#arizam">Arıza</a>
                    </li>
                    <li class="active">
                        <a data-toggle="tab" href="#personel">Ekip İşlemleri</a>
                    </li>
                </ul>
                
                <div class="tab-content">
                    <div id="arizam"  class="tab-pane">
                        <div class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">Arıza No </label>

                                    <div class="col-sm-9">
                                        <asp:Label ID="ariza_numarasi" runat="server" Text="2017/1" Font-Size="X-Large" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <span class="label-grey">Cihaz Bilgileri</span>
                            <div class="row">
                                <span>Marka:</span>
                                <asp:Label ID="marka1" runat="server" Text="a"></asp:Label>
                            </div>
                                
                            <div class="row">
                                <span>Model:</span>
                                <asp:Label ID="model1" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Seri No:</span>
                                <asp:Label ID="seri_no1" runat="server" Text="a"></asp:Label>
                            </div>
                            <hr />
                            <span class="label-grey">Arıza Bilgileri</span>
                            <div class="row">
                                <span>Arıza:</span>
                                <asp:Label ID="ariza1" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Arıza Tarihi:</span>
                                <asp:Label ID="arizaTarih" runat="server" Text="a"></asp:Label>
                            </div>
                            <div class="row">
                                <span>Açıklama:</span>
                                <asp:Label ID="detay" runat="server" Text="a"></asp:Label>
                            </div>
                            </div>
                    </div>

                    <div id="personel" class="tab-pane in active">
                        <div class="form-horizontal" role="form">
                            <span class="label-grey">Personel Listesi</span>    
                                <asp:UpdatePanel ID="odalar2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate> 
                            <div class="row">
                                    <div class="col-sm-8">
                                        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" SelectionMode="Single" TabIndex="6" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                                    </div>
                                    
                                </div>
                            <hr />
                            <span class="label-grey">Seçilen Personel</span>
                            <div class="row">
                                <div class="col-sm-8">
                                    <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" SelectionMode="Single" TabIndex="7" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"></asp:ListBox>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers> 
                            <asp:AsyncPostBackTrigger ControlID="ListBox1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="ListBox2" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>          
                        </Triggers> 
                    </asp:UpdatePanel>
                                <label class="col-sm-12 no-padding align-center red">Lütfen (*) olan alanları boş bırakmayınız.</label>
                                <div class="clearfix form-actions">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:LinkButton runat="server" ID="LinkButton6" Text="<i class='ace-icon fa fa-pencil-square-o'></i> Kaydet"
                                            OnClick="Ekip_Ekle" class="btn btn-sm btn-danger" data-dismiss="modal" TabIndex="10" />
                                        <asp:LinkButton runat="server" ID="LinkButton7" Text="<i class='ace-icon fa fa-check'></i> İptal" TabIndex="11"
                                            OnClick="hideModalPopupDuzelt_Click" class="btn btn-sm btn-primary" data-dismiss="modal" />
                                    </div>
                                </div>
                    
                                </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- PAGE CONTENT ENDS -->
    </asp:Panel>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- page specific plugin scripts -->
    <!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
    <script src="assets/js/jquery-ui.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="assets/js/chosen.jquery.min.js"></script>
    <script src="assets/js/fuelux.spinner.min.js"></script>
    <script src="assets/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/js/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/daterangepicker.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="assets/js/jquery.knob.min.js"></script>
    <script src="assets/js/jquery.autosize.min.js"></script>
    <script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js"></script>
    <script src="assets/js/bootstrap-tag.min.js"></script>

    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        jQuery(function ($) {
            $('#id-disable-check').on('click', function () {
                var inp = $('#form-input-readonly').get(0);
                if (inp.hasAttribute('disabled')) {
                    inp.setAttribute('readonly', 'true');
                    inp.removeAttribute('disabled');
                    inp.value = "This text field is readonly!";
                }
                else {
                    inp.setAttribute('disabled', 'disabled');
                    inp.removeAttribute('readonly');
                    inp.value = "This text field is disabled!";
                }
            });


            if (!ace.vars['touch']) {
                $('.chosen-select').chosen({ allow_single_deselect: true });
                //resize the chosen on window resize

                $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({ 'width': $this.parent().width() });
                    })
                }).trigger('resize.chosen');
                //resize chosen on sidebar collapse/expand
                $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                    if (event_name != 'sidebar_collapsed') return;
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({ 'width': $this.parent().width() });
                    })
                });


                $('#chosen-multiple-style .btn').on('click', function (e) {
                    var target = $(this).find('input[type=radio]');
                    var which = parseInt(target.val());
                    if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                    else $('#form-field-select-4').removeClass('tag-input-style');
                });
            }


            $('[data-rel=tooltip]').tooltip({ container: 'body' });
            $('[data-rel=popover]').popover({ container: 'body' });

            $('textarea[class*=autosize]').autosize({ append: "\n" });
            $('textarea.limited').inputlimiter({
                remText: '%n character%s remaining...',
                limitText: 'max allowed : %n.'
            });

            $.mask.definitions['~'] = '[+-]';
            $('.input-mask-date').mask('99/99/9999');
            $('.input-mask-phone').mask('(999) 999-9999');
            $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
            $(".input-mask-product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });



            $("#input-size-slider").css('width', '200px').slider({
                value: 1,
                range: "min",
                min: 1,
                max: 8,
                step: 1,
                slide: function (event, ui) {
                    var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
                    var val = parseInt(ui.value);
                    $('#form-field-4').attr('class', sizing[val]).val('.' + sizing[val]);
                }
            });

            $("#input-span-slider").slider({
                value: 1,
                range: "min",
                min: 1,
                max: 12,
                step: 1,
                slide: function (event, ui) {
                    var val = parseInt(ui.value);
                    $('#form-field-5').attr('class', 'col-xs-' + val).val('.col-xs-' + val);
                }
            });



            //"jQuery UI Slider"
            //range slider tooltip example
            $("#slider-range").css('height', '200px').slider({
                orientation: "vertical",
                range: true,
                min: 0,
                max: 100,
                values: [17, 67],
                slide: function (event, ui) {
                    var val = ui.values[$(ui.handle).index() - 1] + "";

                    if (!ui.handle.firstChild) {
                        $("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
                        .prependTo(ui.handle);
                    }
                    $(ui.handle.firstChild).show().children().eq(1).text(val);
                }
            }).find('span.ui-slider-handle').on('blur', function () {
                $(this.firstChild).hide();
            });


            $("#slider-range-max").slider({
                range: "max",
                min: 1,
                max: 10,
                value: 2
            });

            $("#slider-eq > span").css({ width: '90%', 'float': 'left', margin: '15px' }).each(function () {
                // read initial values from markup and remove that
                var value = parseInt($(this).text(), 10);
                $(this).empty().slider({
                    value: value,
                    range: "min",
                    animate: true

                });
            });

            $("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item


            $('#id-input-file-1 , #id-input-file-2').ace_file_input({
                no_file: 'No File ...',
                btn_choose: 'Choose',
                btn_change: 'Change',
                droppable: false,
                onchange: null,
                thumbnail: false //| true | large
                //whitelist:'gif|png|jpg|jpeg'
                //blacklist:'exe|php'
                //onchange:''
                //
            });
            //pre-show a file name, for example a previously selected file
            //$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])


            $('#id-input-file-3').ace_file_input({
                style: 'well',
                btn_choose: 'Drop files here or click to choose',
                btn_change: null,
                no_icon: 'ace-icon fa fa-cloud-upload',
                droppable: true,
                thumbnail: 'small'//large | fit
                //,icon_remove:null//set null, to hide remove/reset button
                /**,before_change:function(files, dropped) {
                    //Check an example below
                    //or examples/file-upload.html
                    return true;
                }*/
                /**,before_remove : function() {
                    return true;
                }*/
                ,
                preview_error: function (filename, error_code) {
                    //name of the file that failed
                    //error_code values
                    //1 = 'FILE_LOAD_FAILED',
                    //2 = 'IMAGE_LOAD_FAILED',
                    //3 = 'THUMBNAIL_FAILED'
                    //alert(error_code);
                }

            }).on('change', function () {
                //console.log($(this).data('ace_input_files'));
                //console.log($(this).data('ace_input_method'));
            });


            //$('#id-input-file-3')
            //.ace_file_input('show_file_list', [
            //{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
            //{type: 'file', name: 'hello.txt'}
            //]);




            //dynamically change allowed formats by changing allowExt && allowMime function
            $('#id-file-format').removeAttr('checked').on('change', function () {
                var whitelist_ext, whitelist_mime;
                var btn_choose
                var no_icon
                if (this.checked) {
                    btn_choose = "Drop images here or click to choose";
                    no_icon = "ace-icon fa fa-picture-o";

                    whitelist_ext = ["jpeg", "jpg", "png", "gif", "bmp"];
                    whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
                }
                else {
                    btn_choose = "Drop files here or click to choose";
                    no_icon = "ace-icon fa fa-cloud-upload";

                    whitelist_ext = null;//all extensions are acceptable
                    whitelist_mime = null;//all mimes are acceptable
                }
                var file_input = $('#id-input-file-3');
                file_input
                .ace_file_input('update_settings',
                {
                    'btn_choose': btn_choose,
                    'no_icon': no_icon,
                    'allowExt': whitelist_ext,
                    'allowMime': whitelist_mime
                })
                file_input.ace_file_input('reset_input');

                file_input
                .off('file.error.ace')
                .on('file.error.ace', function (e, info) {
                    //console.log(info.file_count);//number of selected files
                    //console.log(info.invalid_count);//number of invalid files
                    //console.log(info.error_list);//a list of errors in the following format

                    //info.error_count['ext']
                    //info.error_count['mime']
                    //info.error_count['size']

                    //info.error_list['ext']  = [list of file names with invalid extension]
                    //info.error_list['mime'] = [list of file names with invalid mimetype]
                    //info.error_list['size'] = [list of file names with invalid size]


                    /**
                    if( !info.dropped ) {
                        //perhapse reset file field if files have been selected, and there are invalid files among them
                        //when files are dropped, only valid files will be added to our file array
                        e.preventDefault();//it will rest input
                    }
                    */


                    //if files have been selected (not dropped), you can choose to reset input
                    //because browser keeps all selected files anyway and this cannot be changed
                    //we can only reset file field to become empty again
                    //on any case you still should check files with your server side script
                    //because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
                });

            });

            $('#spinner1').ace_spinner({ value: 0, min: 0, max: 200, step: 10, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                //alert($('#spinner1').val())
            });
            $('#spinner2').ace_spinner({ value: 0, min: 0, max: 10000, step: 100, touch_spinner: true, icon_up: 'ace-icon fa fa-caret-up bigger-110', icon_down: 'ace-icon fa fa-caret-down bigger-110' });
            $('#spinner3').ace_spinner({ value: 0, min: -100, max: 100, step: 10, on_sides: true, icon_up: 'ace-icon fa fa-plus bigger-110', icon_down: 'ace-icon fa fa-minus bigger-110', btn_up_class: 'btn-success', btn_down_class: 'btn-danger' });
            $('#spinner4').ace_spinner({ value: 0, min: -100, max: 100, step: 10, on_sides: true, icon_up: 'ace-icon fa fa-plus', icon_down: 'ace-icon fa fa-minus', btn_up_class: 'btn-purple', btn_down_class: 'btn-purple' });

            //$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
            //or
            //$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
            //$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0


            //datepicker plugin
            //link
            $('.date-picker').datepicker({
                autoclose: true,
                todayHighlight: true
            })
            //show datepicker when clicking on the icon
            .next().on(ace.click_event, function () {
                $(this).prev().focus();
            });

            //or change it into a date range picker
            $('.input-daterange').datepicker({ autoclose: true });


            //to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
            $('input[name=date-range-picker]').daterangepicker({
                'applyClass': 'btn-sm btn-success',
                'cancelClass': 'btn-sm btn-default',
                locale: {
                    applyLabel: 'Apply',
                    cancelLabel: 'Cancel',
                }
            })
            .prev().on(ace.click_event, function () {
                $(this).next().focus();
            });


            $('#timepicker1').timepicker({
                minuteStep: 1,
                showSeconds: true,
                showMeridian: false
            }).next().on(ace.click_event, function () {
                $(this).prev().focus();
            });

            $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function () {
                $(this).prev().focus();
            });


            $('#colorpicker1').colorpicker();

            $('#simple-colorpicker-1').ace_colorpicker();
            //$('#simple-colorpicker-1').ace_colorpicker('pick', 2);//select 2nd color
            //$('#simple-colorpicker-1').ace_colorpicker('pick', '#fbe983');//select #fbe983 color
            //var picker = $('#simple-colorpicker-1').data('ace_colorpicker')
            //picker.pick('red', true);//insert the color if it doesn't exist


            $(".knob").knob();


            var tag_input = $('#form-field-tags');
            try {
                tag_input.tag(
                  {
                      placeholder: tag_input.attr('placeholder'),
                      //enable typeahead by specifying the source array
                      source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
                      /**
                      //or fetch data from database, fetch those that match "query"
                      source: function(query, process) {
                        $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
                        .done(function(result_items){
                          process(result_items);
                        });
                      }
                      */
                  }
                )

                //programmatically add a new
                var $tag_obj = $('#form-field-tags').data('tag');
                $tag_obj.add('Programmatically Added');
            }
            catch (e) {
                //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
                tag_input.after('<textarea id="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
                //$('#form-field-tags').autosize({append: "\n"});
            }


            /////////
            $('#modal-forma input[type=file]').ace_file_input({
                style: 'well',
                btn_choose: 'Drop files here or click to choose',
                btn_change: null,
                no_icon: 'ace-icon fa fa-cloud-upload',
                droppable: true,
                thumbnail: 'large'
            })

            //chosen plugin inside a modal will have a zero width because the select element is originally hidden
            //and its width cannot be determined.
            //so we set the width after modal is show
            $('#modal-forma').on('shown.bs.modal', function () {
                if (!ace.vars['touch']) {
                    $(this).find('.chosen-container').each(function () {
                        $(this).find('a:first-child').css('width', '210px');
                        $(this).find('.chosen-drop').css('width', '210px');
                        $(this).find('.chosen-search input').css('width', '200px');
                    });
                }
            })
            /**
            //or you can activate the chosen plugin after modal is shown
            //this way select element becomes visible with dimensions and chosen works as expected
            $('#modal-forma').on('shown', function () {
                $(this).find('.modal-chosen').chosen();
            })
            */



            $(document).one('ajaxloadstart.page', function (e) {
                $('textarea[class*=autosize]').trigger('autosize.destroy');
                $('.limiterBox,.autosizejs').remove();
                $('.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu').remove();
            });

        });
    </script>
</asp:Content>
