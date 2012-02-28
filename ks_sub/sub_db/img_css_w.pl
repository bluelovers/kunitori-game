
sub IMG_SAKUSEI {
	$img_sakusei_kekka = "<img src=\'$_[0]\' width=\'$_[1]\' height=\'$_[2]\' />";

}

#旧Ver
sub IMG_SAKUSEI_Z {
	$img_sakusei_kekka = "<object data=\"$_[0]\" altHTML=\"<img src=\'$_[0]\' width=\'$_[1]\' height=\'$_[2]\' />\" onerror=\"this.altHTML=\'\';\" width=\"$_[1]\" height=\"$_[2]\" type=\"image/$_[3]\" id=\"$_[4]\"></object><script type=\"text/javascript\"><!-- \n document.$_[4].outerHTML = document.$_[4].altHTML; \n // --></script>";

}

#&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide_d","$img_height_d","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");

sub IMG_B_CG_SAKUSEI {
$add_img_b ="$_[7]";
$add_img_w =$_[1]+3;
$add_img_h =$_[2]+3;

$add_img_b =~ s/#//g;
#$add_img_t ="$_[11]";
#$add_img_t =~ s/(＼W)/sprintf("%%%02X", unpack("C", $1))/eg;
#$add_img_t =~ s/([^\w ])/'%' . unpack('H2', $1)/eg;
#$add_img_t =~ tr/ /+/; 
	$img_sakusei_kekka = "<object width=\"$add_img_w\" height=\"$add_img_h\" data=\"$URI/cg/$_[5]\_$_[1]\_$_[6].html\" type=\"text/html\" id=\"$_[4]$_[11]\"></object>$_[12]";

}


sub IMG_CSS_SEISEI {
$p_img_w{$p_cg_sabano{$w_id}}="$IMG{$p_cg_sabano{$w_id}}/";
$p_img_w{$p_cg_sabano{$w_id}}.=int($p_cgno_d{$w_id});
$p_img_w{"gif"}="$p_cgno_d{$w_id}";
$p_img_w{"jpg"}="$p_cgno_d{$w_id}";
$p_img_w{"png"}="$p_cgno_d{$w_id}";
$p_img_w{"jpeg"}="$p_cgno_d{$w_id}";
$p_img{$w_id}=$p_img_w{$p_cg_sabano{$w_id}};
$p_img_f{$w_id}=$p_img_kakutyou{$p_cg_sabano{$w_id}};
$p_img_m{$w_id}=$p_img_mime{$p_cg_sabano{$w_id}};
&IMG_CSS_SEISEI0;
}

#新Ver・シンプル版
sub IMG_CSS_SEISEI0 {

	$add_taitoru1 = "";
	$add_taitoru2 = "";

$img_sakusei_kekka = "$p_img{$w_id}$p_img_f{$w_id}";
$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;

$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide\" height=\"$img_height\" />
</div></body></html>
";
$img_sakusei_kekka2_d ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide_d\" height=\"$img_height_d\" />
</div></body></html>
";


		open(OUT,">./cg/$w_id\_$img_wide_d\_.html");
		print OUT $img_sakusei_kekka2_d;
		close(OUT);

		open(OUT,">./cg/$w_id\_$img_wide\_.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);

$i =0;
	while ($i<10) {
$img_sakusei_kekka = "$p_img{$w_id}${$p_cgno{$w_id}}[$i]$p_img_f{$w_id}";
$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;
$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide\" height=\"$img_height\" />
</div></body></html>
";
$img_sakusei_kekka2_d ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide_d\" height=\"$img_height_d\" />
</div></body></html>
";
		open(OUT,">./cg/$w_id\_$img_wide_d\_$i.html");
		print OUT $img_sakusei_kekka2_d;
		close(OUT);

		open(OUT,">./cg/$w_id\_$img_wide\_$i.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);
$i++;
	}
}


#旧Ver・動作重め・JSを使いダブルクリックで強制外部呼出し・シンプル版と置き換えるときは使いたい方のサブルーチン名をIMG_CSS_SEISEIにするだけ

sub IMG_CSS_SEISEI_Z {


$p_img_w{$p_cg_sabano{$w_id}}="$IMG{$p_cg_sabano{$w_id}}/";
$p_img_w{$p_cg_sabano{$w_id}}.=int($p_cgno_d{$w_id});
$p_img_w{"gif"}="$p_cgno_d{$w_id}";
$p_img_w{"jpg"}="$p_cgno_d{$w_id}";
$p_img_w{"png"}="$p_cgno_d{$w_id}";
$p_img_w{"jpeg"}="$p_cgno_d{$w_id}";
$p_img{$w_id}=$p_img_w{$p_cg_sabano{$w_id}};
$p_img_f{$w_id}=$p_img_kakutyou{$p_cg_sabano{$w_id}};
$p_img_m{$w_id}=$p_img_mime{$p_cg_sabano{$w_id}};
	$add_taitoru1 = "";
	$add_taitoru2 = "";
 if ($p_cg_sabano{$w_id} =~ m/[^0-9]/) {
	$add_taitoru1 = " title=\"ユーザーサイド自作画像リンク/表示\されない時はダブルクリック/無断転載厳禁/注※$GAME_TITLEはこの画像について一切関知していません。掲載元サーバーはこちら⇒$p_img{$w_id}$p_img_f{$w_id}他\" ondblclick=\"gazou();\"";
	$add_taitoru2 = "function gazou(){
	document.open();
document.write('<meta http-equiv=\"refresh\" content=\"0; url='+cg_url+'\" />');
	document.close();
}";
#	$add_taitoru .= "/無断転載厳禁/注※$GAME_TITLEはこの画像について一切関知していません。掲載元サーバーはこちら⇒$p_img{$w_id}$p_img_f{$w_id}他";
 }

$img_sakusei_kekka = "$p_img{$w_id}$p_img_f{$w_id}";
$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;

$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
<script type=\"text/javascript\"><!--
cg_url='$img_sakusei_kekka';
$add_taitoru2
// --></script>
</head><body $add_taitoru1>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide\" height=\"$img_height\" />
</div></body></html>
";
$img_sakusei_kekka2_d ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
<script type=\"text/javascript\"><!--
cg_url='$img_sakusei_kekka';
$add_taitoru2
// --></script>
</head><body $add_taitoru1>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide_d\" height=\"$img_height_d\" />
</div></body></html>
";


		open(OUT,">./cg/$w_id\_$img_wide_d\_.html");
		print OUT $img_sakusei_kekka2_d;
		close(OUT);

		open(OUT,">./cg/$w_id\_$img_wide\_.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);

$i =0;
	while ($i<10) {
$img_sakusei_kekka = "$p_img{$w_id}${$p_cgno{$w_id}}[$i]$p_img_f{$w_id}";
$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;
$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
<script type=\"text/javascript\"><!--
cg_url='$img_sakusei_kekka';
$add_taitoru2
// --></script>
</head><body $add_taitoru1>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide\" height=\"$img_height\" />
</div></body></html>
";
$img_sakusei_kekka2_d ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" /><title>$GAME_TITLE/自作画像Link</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
<script type=\"text/javascript\"><!--
cg_url='$img_sakusei_kekka';
$add_taitoru2
// --></script>
</head><body $add_taitoru1>$TAG_div_s{$doc_mode}
<img src=\"$img_sakusei_kekka\" width=\"$img_wide_d\" height=\"$img_height_d\" />
</div></body></html>
";
		open(OUT,">./cg/$w_id\_$img_wide_d\_$i.html");
		print OUT $img_sakusei_kekka2_d;
		close(OUT);

		open(OUT,">./cg/$w_id\_$img_wide\_$i.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);
$i++;
	}
}


sub IMG_SAKUSEIa {
	$img_sakusei_kekka = "<object data=\"$_[0]\" altHTML=\"<img src=\'$_[0]\' width=\'$_[1]\' height=\'$_[2]\' />\" onerror=\"this.altHTML=\'\';\" width=\"$_[1]\" height=\"$_[2]\" type=\"image/$_[3]\" id=\"$_[4]\"></object><script type=\"text/javascript\"><!-- \n document.$_[4].outerHTML = document.$_[4].altHTML; \n // --></script>";

}

sub IMG_B_CG_SAKUSEIa {
$add_img_b ="$_[7]";
$add_img_w =$_[1]+3;
$add_img_h =$_[2]+3;

$add_img_b =~ s/#//g;
#$add_img_t ="$_[11]";
#$add_img_t =~ s/(＼W)/sprintf("%%%02X", unpack("C", $1))/eg;
#$add_img_t =~ s/([^\w ])/'%' . unpack('H2', $1)/eg;
#$add_img_t =~ tr/ /+/; 
	$img_sakusei_kekka = "<object width=\"$add_img_w\" height=\"$add_img_h\" data=\"$URI/cg/$_[5].html?$_[1],$_[2],$_[6],$add_img_b,$_[8],$_[9],$_[10]\" type=\"text/html\" id=\"$_[4]$_[11]\"></object>$_[12]";

}

sub IMG_CSS_SEISEIa {

	$add_taitoru1 = "";
	$add_taitoru2 = "";
 if ($p_cg_sabano{$w_id} =~ m/[^0-9]/) {
	$add_taitoru1 = " title=\"ユーザーサイド自作画像リンク/表示\されない時はダブルクリック/無断転載厳禁/注※$GAME_TITLEはこの画像について一切関知していません。掲載元サーバーはこちら⇒$p_img{$w_id}$p_img_f{$w_id}他\" ondblclick=\"gazou();\"";
	$add_taitoru2 = "function gazou(){
	document.open();
document.write('<meta http-equiv=\"refresh\" content=\"0; url='+cg_url+'\" />');
	document.close();
}";
#	$add_taitoru .= "/無断転載厳禁/注※$GAME_TITLEはこの画像について一切関知していません。掲載元サーバーはこちら⇒$p_img{$w_id}$p_img_f{$w_id}他";
 }

		$add_id="$menck\_$w_id\_d";
@add_cg_css_l = grep( !/^$add_id/, @add_cg_css_l );
	$img_sakusei_kekka = "cg_youso['$add_id']='$p_img{$w_id}$p_img_f{$w_id}';cg_youso['m_$add_id$i']='$p_img_m{$w_id}';";
$i =0;
	while ($i<10) {
	$img_sakusei_kekka .= "cg_youso['$add_id$i']='$p_img{$w_id}${$p_cgno{$w_id}}[$i]$p_img_f{$w_id}';cg_youso['m_$add_id$i']='$p_img_m{$w_id}';";
$i++;
	}

$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;

$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head>$TAG_d_head{$doc_mode}<title>国取式画像転送装置「神楽」Ver1.00。表示\されている画像の著作権についてはリンク先のサーバー管理者に直接お問い合わせ下さい。無断転載厳禁。このスクリプトの著作者は⇒(c)kunitori.com</title>
<script type=\"text/javascript\" src=\"$CSS_URI/kagura.js\"></script>

<script type=\"text/javascript\"><!--
$img_sakusei_kekka
cg_urli='$menck\_$w_id\_d'+ cg_op;
document.bgColor=cg_bgc;
cg_url=cg_youso[cg_urli];
if (!cg_url) {cg_url='http://kunitori.com/0.gif';}
$add_taitoru2
// --></script>
";

#location.href
#<link rel=\"stylesheet\" type=\"text/css\" href=\"http://kunitori.com/kscss/utf8/overflow_h.css\" />
$img_sakusei_kekka2 .="
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body $add_taitoru1>$TAG_div_s{$doc_mode}
<script type=\"text/javascript\"><!--
	document.open();
if (document.all) {document.write('<img src=\"' + cg_url + '\" width=\"' + cg_w + '\" height=\"' + cg_h + '\" />');}else{	document.write('<object width=\"' + cg_w + '\" height=\"' + cg_h + '\" data=\"' + cg_url + '\" type=\"image/$p_img_m{$w_id}\" id=\"$menck\_$w_id\_d\" class=\"ofhidden\"></object>');}
// --></script>
<noscript><img src=\"$p_img{$w_id}$p_img_f{$w_id}\" /></noscript>
</div></body></html>
";
		open(OUT,">./cg/$w_id.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);
}


#########アクト１は必ず動作番号に？オブジェクトの下部が内部的に同じIDでいけるかは不明　ID-感情分岐-アクト１（$_[4]のIDの前になんかの文字）ってのがベストか？
1;