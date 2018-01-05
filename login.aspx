<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TeknikOfis.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="tr">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Giriş Sayfası - MACİK Teknik Ofis</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="login-layout">
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h1>
                                    <img class="nav-user-photo" src="assets/images/macik1.png" width="60" alt="MACİK" />
                                    <span class="orange">MACİK</span>
                                    <span class="white" id="id-text2">Teknik Ofis</span>
                                </h1>
                                <h4 class="blue" id="id-company-text">&copy; Maltepe Açık Ceza İnfaz Kurumu</h4>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="login-box" class="login-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-cogs orange"></i>
                                                Teknik ofis giriş bilgileri
                                            </h4>

                                            <div class="space-6"></div>

                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                            <fieldset>
                                                <label class="block clearfix">
                                                    <span class="block input-icon input-icon-right">
                                                        <input id="user_txt" runat="server" tabindex="1" type="text" class="form-control" placeholder="Kullanıcı adı" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kullanıcı adını kontrol ediniz." ControlToValidate="user_txt" Display="None"></asp:RequiredFieldValidator>
                                                        <i class="ace-icon fa fa-user"></i>
                                                    </span>
                                                </label>

                                                <label class="block clearfix">
                                                    <span class="block input-icon input-icon-right">
                                                        <input id="password_txt" runat="server" tabindex="2" type="password" class="form-control" placeholder="Şifre" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Şifrenizi kontrol ediniz." ControlToValidate="password_txt" Display="None"></asp:RequiredFieldValidator>
                                                        <i class="ace-icon fa fa-lock"></i>
                                                    </span>
                                                </label>
                                                <div class="form-inline">
                                                    
                                                            <span class="block">
                                                                <input id="TextBox1" runat="server" tabindex="3" type="text" class="col-xs-12 col-sm-8" placeholder="Kod" />
                                                            </span>
                                                            <span class="block">
                                                                <img class="nav-user-photo" src="assets/images/captcha.png" alt="sayi" title="sayi" height="30" />
                                                            </span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                            ControlToValidate="TextBox1" ErrorMessage="Doğrulama Kodunu Girin" Display="None"></asp:RequiredFieldValidator>

                                                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                                                            ErrorMessage="Doğrulama kodu yanlış" ControlToValidate="TextBox1" OnServerValidate="sayikontrol" Display="None"></asp:CustomValidator>
                                                </div>

                                                <div class="space"></div>

                                                <div class="clearfix">
                                                    <label class="inline">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl">Remember Me</span>
                                                    </label>

                                                    <button id="giris_btn" runat="server" onserverclick="giris" tabindex="3" type="button" class="width-35 pull-right btn btn-sm btn-primary">
                                                        <i class="ace-icon fa fa-key"></i>
                                                        <span class="bigger-110">Giriş</span>
                                                    </button>
                                                </div>

                                                <div class="space-4"></div>
                                            </fieldset>


                                            <div class="social-or-login center">
                                                <span class="bigger-110">Herhangi bir sorunda</span>
                                            </div>

                                            <div class="space-6"></div>

                                            <div class="social-login center">
                                                <h5 class="header orange lighter bigger">
                                                    <b>Tel : 0216 561 20 72</b>
                                                </h5>
                                                <h5 class="header orange lighter bigger">
                                                    <b>Faks : 0216 561 80 70</b>
                                                </h5>
                                                <h5 class="header orange lighter bigger">E-posta : abbmaltepe.acik@adalet.gov.tr
                                                </h5>
                                            </div>
                                        </div>
                                        <!-- /.widget-main -->


                                    </div>
                                    <!-- /.widget-body -->
                                </div>
                                <!-- /.login-box -->

                            </div>
                            <!-- /.position-relative -->

                            <div class="navbar-fixed-top align-right">
                                <br />
                                &nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
                                &nbsp;
								<span class="blue">/</span>
                                &nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
                                &nbsp;
								<span class="blue">/</span>
                                &nbsp;
								<a id="btn-login-light" href="#">Light</a>
                                &nbsp; &nbsp; &nbsp;
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.main-content -->
        </div>
        <!-- /.main-container -->

        <!-- basic scripts -->

        <!--[if !IE]> -->
        <script src="assets/js/jquery.2.1.1.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

        <!--[if !IE]> -->
        <script type="text/javascript">
            window.jQuery || document.write("<script src='assets/js/jquery.min.js'>" + "<" + "/script>");
        </script>

        <!-- <![endif]-->

        <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function ($) {
                $(document).on('click', '.toolbar a[data-target]', function (e) {
                    e.preventDefault();
                    var target = $(this).data('target');
                    $('.widget-box.visible').removeClass('visible');//hide others
                    $(target).addClass('visible');//show target
                });
            });



            //you don't need this, just used for changing background
            jQuery(function ($) {
                $('#btn-login-dark').on('click', function (e) {
                    $('body').attr('class', 'login-layout');
                    $('#id-text2').attr('class', 'white');
                    $('#id-company-text').attr('class', 'blue');

                    e.preventDefault();
                });
                $('#btn-login-light').on('click', function (e) {
                    $('body').attr('class', 'login-layout light-login');
                    $('#id-text2').attr('class', 'grey');
                    $('#id-company-text').attr('class', 'blue');

                    e.preventDefault();
                });
                $('#btn-login-blur').on('click', function (e) {
                    $('body').attr('class', 'login-layout blur-login');
                    $('#id-text2').attr('class', 'white');
                    $('#id-company-text').attr('class', 'light-blue');

                    e.preventDefault();
                });

            });
        </script>
    </form>
</body>
</html>
