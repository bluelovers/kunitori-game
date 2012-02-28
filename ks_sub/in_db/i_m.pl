
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "$mpg_r/sub_db/tw.pl";

	open(IN,"./w_db/gundan_list.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);


							$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");
							$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");

	$sendlist = "";
	$sendlist2 = "";
	$sendlist_gaikou = "<option value=\"\">外交権限がありません</option>";
	$sendlist_friend = "<option value=\"\">お気に入り武将未登録</option>";

	open(IN,"./w_db/guest/msbk_$f_id.cgi");
	@add_list = <IN>;
	close(IN);
		if (@add_list){
			$sendlist_friend = "";
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
			$koate_l{$mdsid} = $mdsname;
			$add_okiniiri{$mdsid} = 1;
			$sendlist_friend .= "<option value=\"$mdsid\">$mdsnameへ</option>";
	}
		}
			$addc_okiniiri{"1"} = "お気に入り登録解除";
			$addc_okiniiri{""} = "お気に入り登録";
$KOATE=10;

$add_gaiko_f{$k_yakusyoku_id{$fk_id}[24]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[1]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[2]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[3]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[4]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[5]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[6]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[16]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[17]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[18]}=1;
	if($add_gaiko_f{$f_id}){

	$sendlist_gaikou = "";
		foreach(@k_seizon_l){
		$ek_id=$_;

			$koate_l_k{$ek_id} = $k_name_d[$ek_id];
			$sendlist_gaikou .= "<option value=\"k_$ek_id\">$k_name_d[$ek_id]へ</option>";

		}
	$sendlist2 = $sendlist_gaikou;
	}

	$jyusin_m = "";
	$sousin_m = "";
	$tosiate_m = "";
	$gundan_mes = "";
	$butai_mes = "";
	$kuniate_m = "";

	if($gundan_no{$p_gundanno{$f_id}}){$gundan_name = "$gundan_name{$fgundan_id}/ ";
	open(IN,"./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "g0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$gundan_mes .= "$messe_e_name・$messe_f_nameから$p_p_b_a_i{$f_id}へ「<strong>$messe_naiyou</strong>」<br />
";
			$koate_l_gundan{$messe_f_id} = $messe_f_name;



	$add_no ++;
	$w_mes_i ++;
		}
	$sendlist .= "<option value=\"m_gundan\">$gundan_name軍団の人へ</option>";
	}else{$gundan_name = "未所属 / ";
	}

	if($butai_no{$p_butaino{$f_id}}){$butai_name = "$butai_name{$fbutai_id}/ ";
	open(IN,"./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "b0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$butai_mes .= "$messe_e_name・$messe_f_nameから$p_p_b_a_i{$f_id}へ「<strong>$messe_naiyou</strong>」<br />";

			$koate_l_butai{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}
	$sendlist .= "<option value=\"m_butai\">$butai_name部隊の人へ</option>";
	}else{$butai_name = "未所属 / ";
	}

	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "j0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$jyusin_m .= "$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ「<strong>$messe_naiyou</strong>」<br />";

			$koate_l{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}
	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "s0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$sousin_m .= "$p_p_b_a_i{$f_id}から$messe_e_nameへ「<strong>$messe_naiyou</strong>」<br />";

			$koate_l{$messe_e_id} = $messe_e_name;
	$add_no ++;
	$w_mes_i ++;
		}

	open(IN,"./w_db/mati/$p_taizai_iti{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "t0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$tosiate_m .= "$messe_f_name\@$t_name[$messe_f_taizai_iti]から<「<strong>$messe_naiyou</strong>」<br />";
			$koate_l_mati{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}



	open(IN,"./w_db/kuni/$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "k0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$kuniate_m .= "$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ「<strong>$messe_naiyou</strong>」<br />";
			$koate_l_kuni{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}

	open(IN,"./w_db/kuni/gaiko_$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "gaiko0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			$kuniate_m2 .= "$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ「<strong>$messe_naiyou</strong>」<br />";
			$koate_l_gaikou{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}

	@NEWADD = ();
	$hit = 0;
	$i = 0;
	open(IN,"./w_db/jyusin/m_$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "m0";
	$w_mes_i = 0;
		while($w_mes_i < 2){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
#$messe_e_name =~ s/<(.*?)>//g;
#$messe_f_name =~ s/<(.*?)>//g;
#$messe_naiyou =~ s/<(.*?)>//g;
$messe_e_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_f_name =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$messe_naiyou =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
			if($messe_f_kuni eq $p_kunino{$f_id}){
			push(@NEWADD,"$MES_REG[$w_mes_i]");
			}elsif($k_kunino[$messe_f_kuni] and -e "./p_db/p/$messe_f_id.cgi"){
			$touyou_bun .= "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".idno.\" value=\"$i\" /><input type=\"hidden\" name=\".m.\" value=\"kunikae\" />$messe_f_nameが$k_name_d[$messe_f_kuni]への仕官を勧めています。「<strong>$messe_naiyou</strong>」<input type=\"radio\" name=\".sel.\" value=\"0\" />承諾<input type=\"radio\" name=\".sel.\" value=\"1\" />断る<input type=\"radio\" name=\".sel.\" value=\"2\" />無視<input type=\"submit\" value=\"返答\" /><br /></div></form>
";
			$koate_l{$messe_f_id} = $messe_f_name;
			push(@NEWADD,"$MES_REG[$w_mes_i]");
			}else{
	$hit = 1;

			}
	$add_no ++;
	$w_mes_i ++;
	$i ++;
		}



delete $koate_l{'m_sakujyo'}; 
foreach $key ( keys %koate_l ) {
	$koate_l_f{$key} = "$koate_l{$key}さん";
}
foreach $key ( keys %koate_l_kuni ) {
	$koate_l_f{$key} = "$koate_l_kuni{$key}さん";
}
foreach $key ( keys %koate_l_butai ) {
	$koate_l_f{$key} = "$koate_l_butai{$key}さん";
}
foreach $key ( keys %koate_l_gundan ) {
	$koate_l_f{$key} = "$koate_l_gundan{$key}さん";
}
foreach $key ( keys %koate_l_gaikou ) {
	$koate_l_f{$key} = "$koate_l_gaikou{$key}さん";
}
foreach $key ( keys %koate_l_mati ) {
	$koate_l_f{$key} = "$koate_l_mati{$key}さん";
}
foreach $key ( keys %koate_l_k ) {
	$koate_l_f{$key} = "$koate_l_k{$key}";
}
foreach $key ( keys %koate_l_f ) {
	$sendlist .= "<option value=\"$key\">$koate_l_f{$key}へ</option>";
}
			if($hit){
				open(OUT,">./w_db/jyusin/m_$f_id.cgi");
				print OUT @NEWADD;
				close(OUT);
			}

$add_k_name=" / 国内";
			if(!$k_kunino{$fk_id} and $fk_id){
$add_k_name="系・放浪武将";
			}
			
			
	&HEADER;
print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"10\" />
<select name=\".mes_id.\"><option value=\"k_$k_kunino[$fk_id]\">$k_name[$fk_id]へ</option><option value=\"m_tosi\">$t_name[$p_taizai_iti{$f_id}]の人々へ</option>$sendlist$sendlist2$sendlist_friend</select>
<input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
</div></form>
<a href=\"#11\">国内宛</a>&nbsp;&nbsp;<a href=\"#4\">個人宛</a>&nbsp;&nbsp;<a href=\"#2\">軍団宛</a>&nbsp;&nbsp;<a href=\"#3\">部隊宛</a>&nbsp;&nbsp;<a href=\"#1\">都市宛</a>&nbsp;&nbsp;<a href=\"#12\">外交文</a>&nbsp;&nbsp;<a href=\"#13\">密書文</a>&nbsp;&nbsp;<a href=\"#5\">送信済</a>

<hr />
<a id=\"11\"></a>\n<a href=\"#0\">・</a> $k_name_d[$fk_id]$add_k_name宛て（5件まで）<br />
$kuniate_m
<hr />
<a id=\"4\"></a>\n<a href=\"#0\">・</a> $p_name{$f_id}個宛て（$KOATE件まで）<br />
$jyusin_m
<hr />
<a id=\"2\"></a>\n<a href=\"#0\">・</a> $gundan_name軍団宛て（5件まで）<br />
$gundan_mes
<hr />
<a id=\"3\"></a>\n<a href=\"#0\">・</a> $butai_name部隊宛て（5件まで）<br />
$butai_mes
<hr />

<a id=\"1\"></a>\n<a href=\"#0\">・</a> $t_name[$p_taizai_iti{$f_id}]の人々へ（5件まで）<br />
$tosiate_m
<hr />
<a id=\"12\"></a>\n<a href=\"#0\">・</a> $k_name_d{$fk_id}宛て外交書類（10件まで）<br />
$kuniate_m2
<hr />
<a id=\"13\"></a>\n<a href=\"#0\">・</a> $p_name{$f_id}宛て密書（10件まで）<br />
$touyou_bun

<hr />
<a id=\"5\"></a> <a href=\"#0\">・</a> 送信済み（5件まで）<br />
$sousin_m
PRI
	&FOOTER;


}

1;