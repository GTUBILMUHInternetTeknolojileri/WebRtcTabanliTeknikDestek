<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="arizaprint.aspx.cs" Inherits="TeknikOfis.arizaprint" %>

<!DOCTYPE html>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head runat="server">
    <title>MACİK-Teknik Ofis Arıza Bildirim Formu</title>
    <meta http-equiv="Content-Type" content="text/html; charset=Windows-1254" />
    <meta name="ProgId" content="Excel.Sheet" />
    <meta name="Generator" content="Microsoft Excel 14" />
    <link rel="File-List" href="ariza_bildirim_formu_dosyalar/filelist.xml" />
    <!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
    <style id="teknik ofis arıza bildirim formu_28290_Styles">
        <!-- table {
            mso-displayed-decimal-separator: "\,";
            mso-displayed-thousand-separator: "\.";
        }

        .xl6528290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl6628290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: bottom;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl6728290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl6828290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: middle;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl6928290 {
            padding: 0px;
            mso-ignore: padding;
            color: #595959;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl7028290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7128290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: left;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7228290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7328290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: middle;
            border: .5pt solid windowtext;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl7428290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7528290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: central;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7628290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: normal;
        }

        .xl7728290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7828290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl7928290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border: .5pt solid windowtext;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl8028290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8128290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8228290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8328290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8428290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8528290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8628290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: general;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            mso-background-source: auto;
            mso-pattern: auto;
            white-space: nowrap;
        }

        .xl8728290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8828290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl8928290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9028290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9128290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9228290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: top;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9328290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9428290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 162;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9528290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: bottom;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9628290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: bottom;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9728290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: bottom;
            border-top: .5pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9828290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl9928290 {
            padding: 0px;
            mso-ignore: padding;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl10028290 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl10028291 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-left: none;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }

        .xl10028292 {
            padding: 0px;
            mso-ignore: padding;
            color: #00000A;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            mso-font-charset: 1;
            mso-number-format: General;
            text-align: left;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-left: none;
            background: white;
            mso-pattern: #FFFFCC none;
            white-space: normal;
        }
        -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td align="right">
                    <input id="PRINT" type="button" value="Yazdır" onclick="javascript: location.reload(true); window.print();">
                    <input id="CLOSE" type="button" value="Kapat" onclick="window.close();">
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlPrint" runat="server">
            <div id="print_div">
                <div id="teknik ofis arıza bildirim formu_28290" align="center">

                    <table border="0" cellpadding="0" cellspacing="0" width="679" style='border-collapse: collapse; table-layout: fixed; width: 510pt'>
                        <col class="xl6728290" width="149" style='mso-width-source: userset; mso-width-alt: 5449; width: 112pt' />
                        <col class="xl6728290" width="115" style='width: 86pt' />
                        <col class="xl6728290" width="80" style='mso-width-source: userset; mso-width-alt: 2925; width: 60pt' />
                        <col class="xl6728290" width="100" style='mso-width-source: userset; mso-width-alt: 3949; width: 81pt' />
                        <col class="xl6728290" width="54" style='mso-width-source: userset; mso-width-alt: 1974; width: 41pt' />
                        <col class="xl6728290" width="173" style='width: 130pt' />
                        <tr height="45" style='mso-height-source: userset; height: 36.0pt'>
                            <td rowspan="3" height="144" width="149" style='height: 100.0pt; width: 112pt'
                                align="left" valign="top"><span style='mso-ignore: vglayout; position: absolute; z-index: 2; margin-left: 8px; margin-top: 0px; width: 142px; height: 142px'>
                                    <img width="142" height="142"
                                        src="ariza_bildirim_formu_dosyalar/teknik%20ofis%20arıza%20bildirim%20formu_28290_image002.png"
                                        v:shapes="Resim_x0020_2" /></span><span style='mso-ignore: vglayout2'>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td rowspan="3" height="144" class="xl6628290" width="149" style='height: 100.0pt; width: 112pt'></td>
                                                </tr>
                                            </table>
                                        </span></td>
                            <td colspan="4" class="xl7628290" width="357" style='width: 268pt'>MALTEPE AÇIK CEZA
  İNFAZ KURUMU</td>
                            <td rowspan="3" height="144" width="173" style='height: 100.0pt; width: 130pt'
                                align="left" valign="top"><span style='mso-ignore: vglayout; position: absolute; z-index: 3; margin-left: 11px; margin-top: 3px; width: 153px; height: 135px'>
                                    <img width="153" height="135" src="ariza_bildirim_formu_dosyalar/teknik%20ofis%20arıza%20bildirim%20formu_28290_image004.png"
                                        v:shapes="Resim_x0020_3" /></span><span style='mso-ignore: vglayout2'>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td rowspan="3" height="144" class="xl6628290" width="173" style='height: 100.0pt; width: 130pt'></td>
                                                </tr>
                                            </table>
                                        </span></td>
                        </tr>
                        <tr height="45" style='mso-height-source: userset; height: 36.0pt'>
                            <td colspan="4" height="45" class="xl7628290" width="357" style='height: 36.0pt; width: 268pt'>İŞYURDU MÜDÜRLÜĞÜ</td>
                        </tr>
                        <tr height="45" style='mso-height-source: userset; height: 36.0pt'>
                            <td colspan="4" height="45" class="xl7628290" width="357" style='height: 36.0pt; width: 268pt'>TEKNİK OFİS BİRİMİ’NE</td>
                        </tr>
                        <tr height="20" style='height: 15.75pt'>
                            <td height="20" class="xl10028291" width="149" style='height: 15.75pt; width: 112pt'>TAKİP NO:</td>
                            <td height="20" class="xl10028292" width="149" style='height: 15.75pt; width: 112pt'>
                                <asp:Label ID="lblNo" runat="server" Text=""></asp:Label>
                            </td>

                            <td colspan="4" height="20" class="xl6528290" style='height: 15.75pt'>EK-1</td>

                        </tr>
                        <tr class="xl6828290" height="20" style='mso-height-source: userset; height: 25pt'>
                            <td colspan="6" height="20" width="679" style='height: 25pt; width: 510pt'
                                align="left" valign="top">
                                <span style='mso-ignore: vglayout2'>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="6" height="20" class="xl10028290" width="679" style='height: 25pt; width: 510pt'>ARIZA BİLDİRİM FORMU</td>
                                        </tr>
                                    </table>
                                </span></td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td colspan="6" height="20" class="xl8028290" width="679" style='border-right: 1.0pt solid black; height: 25pt; width: 510pt'>ARIZA BİLDİREN</td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8328290" width="149" style='height: 25pt; border-top: none; width: 112pt'>KURUM ADI:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblKurum" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8328290" width="149" style='height: 25pt; border-top: none; width: 112pt'>ADRESİ:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblAdres" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>TARİH VE SAAT:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8328290" width="149" style='height: 25pt; border-top: none; width: 112pt'>ARIZA BİLDİREN:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblAd" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>TELEFON NO:</td>
                            <td class="xl7228290" width="115" style='border-top: none; border-left: none; width: 86pt'>
                                <asp:Label ID="lblTel" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="xl7928290" style='border-top: none; border-left: none'>DAHİLİ:</td>
                            <td class="xl7328290" style='border-top: none; border-left: none'>
                                <asp:Label ID="lblDahili" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="xl7828290" width="54" style='border-top: none; border-left: none; width: 41pt'>FAKS:</td>
                            <td class="xl8628290" style='border-top: none; border-left: none'>
                                <asp:Label ID="lblFaks" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td colspan="6" height="20" class="xl8728290" width="679" style='border-right: 1.0pt solid black; height: 25pt; width: 510pt'>ARIZALI CİHAZIN</td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>MARKASI:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblMarka" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>MODELİ:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblModel" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>SERİ NO:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblSeri" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td height="20" class="xl8528290" width="149" style='height: 25pt; border-top: none; width: 112pt'>ARIZA TİPİ:</td>
                            <td colspan="5" class="xl7128290" width="530" style='border-right: 1.0pt solid black; border-left: none; width: 398pt'>
                                <asp:Label ID="lblAriza" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="20" style='mso-height-source: userset; height: 25pt'>
                            <td colspan="6" height="20" class="xl8928290" width="679" style='border-right: 1.0pt solid black; height: 25pt; width: 510pt'>ARIZA AÇIKLAMASI</td>
                        </tr>
                        <tr height="231" style='mso-height-source: userset; height: 173.25pt'>
                            <td colspan="6" height="231" class="xl9228290" width="679" style='border-right: 1.0pt solid black; height: 173.25pt; width: 510pt'>
                                <asp:Label ID="lblAciklama" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr height="41" style='mso-height-source: userset; height: 30.75pt'>
                            <td colspan="3" height="41" class="xl9328290" width="344" style='height: 30.75pt; width: 258pt'>ARIZA BİLDİREN</td>
                            <td colspan="3" class="xl7428290" width="335" style='border-right: 1.0pt solid black; border-left: none; width: 252pt'>KURUM YETKİLİSİ</td>
                        </tr>
                        <tr height="43" style='mso-height-source: userset; height: 32.25pt'>
                            <td height="43" class="xl8328290" width="149" style='height: 32.25pt; border-top: none; width: 112pt'>ADI SOYADI:</td>
                            <td colspan="2" class="xl7528290" width="195" style='border-left: none; width: 146pt'>
                                <asp:Label ID="lblAd2" runat="server" Text="Label"></asp:Label></td>
                            <td class="xl7728290" width="100" style='border-top: none; border-left: none; width: 81pt'>ADI SOYADI:</td>
                            <td colspan="2" class="xl7528290" width="227" style='border-right: 1.0pt solid black; border-left: none; width: 171pt'><span style='mso-spacerun: yes'></span></td>
                        </tr>
                        <tr height="43" style='mso-height-source: userset; height: 32.25pt'>
                            <td height="43" class="xl9828290" width="149" style='height: 32.25pt; border-top: none; width: 112pt'>İMZA</td>
                            <td colspan="2" class="xl9628290" width="195" style='border-left: none; width: 146pt'>&nbsp;</td>
                            <td class="xl9928290" width="100" style='border-top: none; border-left: none; width: 81pt'>İMZA</td>
                            <td colspan="2" class="xl9628290" width="227" style='border-right: 1.0pt solid black; border-left: none; width: 171pt'>&nbsp;</td>
                        </tr>
                        <tr height="20" style='height: 15.75pt'>
                            <td height="20" class="xl6928290" colspan="6" style='height: 15.75pt'>İletişim Tel : 0206 561 20 72
                                <span style='mso-spacerun: yes'></span>Faks : 0206 561 80 70
                                <span style='mso-spacerun: yes'></span>E-Posta : ariza@macik.gov.tr
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
