function yazdir(yazdirilacakBolum) {
    //Yeni bir sayfa create ediyoruz. Yazdırılacak veriyi yeni sayfada açacağız.
    var pp = window.open();
    //Yeni sayfaya HTML ve Head taglarını açıyoruz.
    pp.document.writeln('<HTML><HEAD><title>MACİK-Teknik Ofis Arıza Bildirim Formu</title></HEAD>');
    //css imizi ekliyoruz
    pp.document.writeln('<link rel="stylesheet" href="assets/css/to-ariza-bildir-print.css" type="text/css"/>');
    //head tag ını kapatıyoruz.
    pp.document.writeln('</HEAD>');
    //Body tag ı ekliyoruz
    pp.document.writeln('<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">');
    //Form tag ı ekliyoruz
    pp.document.writeln('<form  method="post">');
    //yazdır ve kapat diye 2 tane buton ekliyoruz.
    pp.document.writeln('<TABLE width=100%><TR><TD></TD></TR>');
    pp.document.writeln('<TR><TD align=right>');
    pp.document.writeln('<INPUT ID="PRINT" type="button" value="Yazdır" ');
    pp.document.writeln('onclick="javascript:location.reload(true);window.print();">');
    pp.document.writeln('<INPUT ID="CLOSE" type="button" value="Kapat" ');
    pp.document.writeln('onclick="window.close();">');
    pp.document.writeln('</TD></TR><TR><TD></TD></TR></TABLE>');
    //yazdırılıcak bölümü sayfaya yazıyoruz.
    //Görüldüğü gibi yazdırılacak bölümün önce child elemanlarına erişiyoruz.
    //Daha sonrada bu child elemanlardan yazdirma class ı içermeyenleri alıp
    //objeler adında bir değişken listesinde topluyoruz.
    objeler = $("#" + yazdirilacakBolum).children().not(".yazdirma");
    //objeler değişken listesine map fonksiyonu ile erişip bunları array e dönüştürüyoruz
    //array dönüşen kısmında her bir elemanı için html() fonksiyonu ile
    //html içeriğini alıyoruz. Bunuda documan a yazdırıyoruz.
    pp.document.writeln(objeler.map(function() {
                    return $(this).html();
                }).get().join(" ") );
    //form,body ve html taglarını kapatıyoruz.
    pp.document.writeln('</form></body></HTML>');
}	