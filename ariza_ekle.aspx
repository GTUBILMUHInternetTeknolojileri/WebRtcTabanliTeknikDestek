<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ariza_ekle.aspx.cs" Inherits="TeknikOfis.ariza_ekle" %>

<%@ MasterType VirtualPath="~/user.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Arýza Ýþlemleri (MACÝK-Teknik Ofis)</title>
    <meta name="description" content="Kullanýcý arýza giriþ ekraný" />
    <link rel="stylesheet" href="assets/css/select2.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelMesaj" runat="server">
        <div class="alert alert-danger">
            <button runat="server" id="btnMesaj" onserverclick="mesajClose" type="button" class="close" data-dismiss="alert">
                <i class="ace-icon fa fa-times"></i>
            </button>

            <strong>
                <i class="ace-icon fa fa-times"></i>
                Uyarý!
            </strong>
            <asp:Label ID="Mesaj_lbl" runat="server" Text="Something is wrong."></asp:Label>
            <br />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelGiris" runat="server">
        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat">
                <h4 class="widget-title lighter">Ariza Ekleme Sihirbazý</h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div id="fuelux-wizard-container">
                        <div>
                            <ul class="steps">
                                <li data-step="1" class="<%  if (step != 1)
                                                             { %> # <%}
                                                             else
                                                             { %> active <% } %>">
                                    <span class="step">1</span>
                                    <span class="title">Bilgileriniz</span>
                                </li>

                                <li data-step="2" class="<%  if (step != 2)
                                                             { %> # <%}
                                                             else
                                                             { %> active <% } %>">
                                    <span class="step">2</span>
                                    <span class="title">Arýza ve Cihaz Bilgileri</span>
                                </li>

                                <li data-step="3" class="<%  if (step != 3)
                                                             { %> # <%}
                                                             else
                                                             { %> active <% } %>">
                                    <span class="step">3</span>
                                    <span class="title">Açýklama</span>
                                </li>

                                <li data-step="4" class="<%  if (step != 4)
                                                             { %> # <%}
                                                             else
                                                             { %> active <% } %>">
                                    <span class="step">4</span>
                                    <span class="title">Form Onay</span>
                                </li>
                            </ul>
                        </div>

                        <hr />

                        <div class="step-content pos-rel">
                            <div class="step-pane" data-step="1">
                                <h3 class="lighter block green">Aþaðýdaki bilgileri girip kontrol ediniz.</h3>
                                <div class="form-horizontal" id="sample-form">
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 no-padding-right" for="name">Kullanýcý:</label>
                                        <div class="col-sm-9">
                                            <div class="clearfix">
                                                <asp:Label ID="kul" runat="server" Text="MACÝK" class="col-xs-12 col-sm-5"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 no-padding-right" for="name">Kurum Adý:</label>
                                        <div class="col-sm-9">
                                            <div class="clearfix">
                                                <asp:Label ID="Kname" runat="server" Text="MACÝK" class="col-xs-12 col-sm-5"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 no-padding-right" for="name"></label>
                                        <div class="col-sm-9">
                                            <div class="clearfix">
                                                <asp:Label ID="Kadres" runat="server" Text="MACÝK" class="col-xs-12 col-sm-5"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr hr-double"></div>
                                    <h4 class="lighter block gray">Ýritbata geçilecek kiþi. (Arýza Bildiren)</h4>
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="kisi">Ad Soyad:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <asp:TextBox ID="kisi" runat="server" TabIndex="1" placeholder="Ad Soyad" class="col-xs-10 col-sm-4" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">Telefon No:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-phone"></i>
                                                </span>
                                                <asp:TextBox ID="phone" runat="server" TabIndex="2" placeholder="Tel" class="col-xs-10 col-sm-3 input-mask-phone" TextMode="Phone" MaxLength="14"></asp:TextBox>
                                                <span class="help-inline col-xs-12 col-sm-7">
                                                    <span class="middle">(999) 999-9999</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-2"></div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Dahili:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <asp:TextBox ID="dahili" runat="server" TabIndex="3" placeholder="Dahili" class="col-xs-12 col-sm-1 input-mask-dahili" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                                <span class="help-inline col-xs-12 col-sm-7">
                                                    <span class="middle">(Varsa dahiliniz.)</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-2"></div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">Faks No:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-phone"></i>
                                                </span>
                                                <asp:TextBox ID="faks" runat="server" TabIndex="4" placeholder="Faks" class="col-xs-10 col-sm-3 input-mask-phone" TextMode="Phone" MaxLength="14"></asp:TextBox>
                                                <span class="help-inline col-xs-12 col-sm-7">
                                                    <span class="middle">(999) 999-9999</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="step-pane" data-step="2">
                                <h3 class="lighter block green">Aþaðýdaki bilgileri girip kontrol ediniz.</h3>
                                <div class="form-horizontal" id="step2-form">
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="form_DropDownList_1">Arýza Türleri </label>
                                        <div class="col-xs-12 col-sm-9">
                                            <asp:DropDownList ID="form_DropDownList_1" runat="server" TabIndex="5"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="hr hr-dotted"></div>
                                    <h4 class="lighter block green">Arýzalý cihazýn:</h4>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form_field_1">Marka </label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="marka" runat="server" TabIndex="6" placeholder="Markasý" class="col-xs-10 col-sm-5" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form_field_1">Model </label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="model" runat="server" TabIndex="7" placeholder="Modeli" class="col-xs-10 col-sm-5" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form_field_1">Seri No </label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="serino" runat="server" TabIndex="8" placeholder="Seri Numarasý" class="col-xs-10 col-sm-5" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="step-pane" data-step="3">
                                <h3 class="lighter block green">Kýsaca arýza detaylarýný yazýnýz.</h3>
                                <div class="form-horizontal" id="step3-form">
                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="comment">Açýklama</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <asp:TextBox ID="comment" runat="server" TabIndex="9" TextMode="MultiLine" class="col-sm-9"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="step-pane active" data-step="4">
                                <div class="center">
                                    <h3 class="green">Tebrikler!</h3>
                                    Formu hazýrladýnýz. Form kaydedildikten sonra otomatik olarak yazdýrýlacaktýr.
                                </div>
                                <div class="space-8"></div>
                                <div class="center">
                                    <h4 class="blue">Hazýrlanan formu</h4>
                                    <asp:LinkButton runat="server" ID="btnKaydet" Text="<i class='ace-icon fa fa-floppy-o bigger-160'></i> Kaydet"
                                        OnClick="kaydet" class="btn btn-app btn-danger btn-xs radius-4" TabIndex="8" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="wizard-actions">
                        <asp:LinkButton runat="server" ID="btnGeri" Text="<i class='ace-icon fa fa-arrow-left'></i> Geri"
                            OnClick="geri" class="btn btn-pre" TabIndex="8" />

                        <asp:LinkButton runat="server" ID="LinkIleri" Text="Ýleri <i class='ace-icon fa fa-arrow-right icon-on-right'></i>"
                            OnClick="ileri" class="btn btn-success btn-next" TabIndex="9" data-last="Finish" />

                    </div>
                </div>
                <!-- /.widget-main -->
            </div>
            <!-- /.widget-body -->
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelPrint" runat="server">
        <asp:LinkButton runat="server" ID="LinkButton1" Text="<i class='ace-icon fa fa-pencil-square-o bigger-110'></i> Arýzalarým"
                                        OnClick="goster" class="btn btn-xs btn-info" TabIndex="9" />
        <div>
       <iframe width="700" height="1100" frameborder="0" src="arizaprint.aspx?no=<%=arizano %>"></iframe></div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- page specific plugin scripts -->
    <script src="assets/js/fuelux.wizard.min.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>
    <script src="assets/js/additional-methods.min.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js"></script>
    <script src="assets/js/select2.min.js"></script>

    <script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>

    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        jQuery(function ($) {

            $('[data-rel=tooltip]').tooltip();

            $(".select2").css('width', '200px').select2({ allowClear: true })
            .on('change', function () {
                $(this).closest('form').validate().element($(this));
            });


            var $validation = false;
            $('#fuelux-wizard-container')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
                //buttons: '.wizard-actions:eq(0)'
            })
            .on('actionclicked.fu.wizard', function (e, info) {
                if (info.step == 1 && $validation) {
                    if (!$('#validation-form').valid()) e.preventDefault();
                }
            })
            .on('finished.fu.wizard', function (e) {
                bootbox.dialog({
                    message: "Thank you! Your information was successfully saved!",
                    buttons: {
                        "success": {
                            "label": "OK",
                            "className": "btn-sm btn-primary"
                        }
                    }
                });
            }).on('stepclick.fu.wizard', function (e) {
                //e.preventDefault();//this will prevent clicking and selecting steps
            });


            //jump to a step
            /**
            var wizard = $('#fuelux-wizard-container').data('fu.wizard')
            wizard.currentStep = 3;
            wizard.setState();
            */

            //determine selected step
            //wizard.selectedItem().step



            //hide or show the other form which requires validation
            //this is for demo only, you usullay want just one form in your application
            $('#skip-validation').removeAttr('checked').on('click', function () {
                $validation = this.checked;
                if (this.checked) {
                    $('#sample-form').hide();
                    $('#validation-form').removeClass('hide');
                }
                else {
                    $('#validation-form').addClass('hide');
                    $('#sample-form').show();
                }
            })



            //documentation : http://docs.jquery.com/Plugins/Validation/validate


            $.mask.definitions['~'] = '[+-]';
            $('#phone').mask('(999) 999-9999');
            $('.input-mask-dahili').mask('9999');
            $('.input-mask-date').mask('99/99/9999');
            $('.input-mask-phone').mask('(999) 999-9999');
            $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
            $(".input-mask-product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });

            jQuery.validator.addMethod("phone", function (value, element) {
                return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
            }, "Enter a valid phone number.");

            $('#validation-form').validate({
                errorElement: 'div',
                errorClass: 'help-block',
                focusInvalid: false,
                ignore: "",
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    password2: {
                        required: true,
                        minlength: 5,
                        equalTo: "#password"
                    },
                    name: {
                        required: true
                    },
                    phone: {
                        required: true,
                        phone: 'required'
                    },
                    url: {
                        required: true,
                        url: true
                    },
                    comment: {
                        required: true
                    },
                    state: {
                        required: true
                    },
                    platform: {
                        required: true
                    },
                    subscription: {
                        required: true
                    },
                    gender: {
                        required: true,
                    },
                    agree: {
                        required: true,
                    }
                },

                messages: {
                    email: {
                        required: "Please provide a valid email.",
                        email: "Please provide a valid email."
                    },
                    password: {
                        required: "Please specify a password.",
                        minlength: "Please specify a secure password."
                    },
                    state: "Please choose state",
                    subscription: "Please choose at least one option",
                    gender: "Please choose gender",
                    agree: "Please accept our policy"
                },


                highlight: function (e) {
                    $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                },

                success: function (e) {
                    $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                    $(e).remove();
                },

                errorPlacement: function (error, element) {
                    if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                        var controls = element.closest('div[class*="col-"]');
                        if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                        else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                    }
                    else if (element.is('.select2')) {
                        error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                    }
                    else if (element.is('.chosen-select')) {
                        error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                    }
                    else error.insertAfter(element.parent());
                },

                submitHandler: function (form) {
                },
                invalidHandler: function (form) {
                }
            });




            $('#modal-wizard-container').ace_wizard();
            $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');


            /**
            $('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
                $(this).closest('form').validate().element($(this));
            });
            
            $('#mychosen').chosen().on('change', function(ev) {
                $(this).closest('form').validate().element($(this));
            });
            */


            $(document).one('ajaxloadstart.page', function (e) {
                //in ajax mode, remove remaining elements before leaving page
                $('[class*=select2]').remove();
            });
        })
    </script>
</asp:Content>
