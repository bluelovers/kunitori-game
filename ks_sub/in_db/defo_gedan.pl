
sub MOVE {

require "$mpg_r/sub_db/tw.pl";

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

$datev2.="
<script type=\"text/javascript\" src=\"$CSS_URI/messe.js\"></script>
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/messe.css\" />
";
$datev4.="msid='$in{'id'}';mspass='$in{'pass'}';";
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);


	$next_time = int(($p_jikan{$f_id} - $tt) / 60);
	$next_time2 = int(($m_tt - $tt) / 60);


require "./w_db/map5.pl";

	open(IN,"./p_db/my_log/$f_id.cgi");
	@LOG_DATA = <IN>;
	close(IN);
	$p=0;
	while($p < 5){
$log_list .= "<span class=\"c000080\">●</span>$LOG_DATA[$p]<br />";
$p++;
	}


			$addc_okiniiri{"1"} = "お気に入り登録解除";
			$addc_okiniiri{""} = "お気に入り登録";
	$jyusin_m = "";
	$kuniate_m = "";
	$sendlist = "";

	$sendlist = "";
	$sendlist2 = "";
	$sendlist_gaikou = "<option value=\"\">外交権限がありません</option>";
	$sendlist_friend = "<option value=\"\">お気に入り武将未登録</option>";

	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "j0";
		foreach(@MES_REG){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/);

			$add_mes = "<strong><span class=\"cFFA500\">$messe_f_name\@$t_name[$messe_f_taizai_iti]</span>から$messe_e_nameへ</strong> <br />";
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","",""," usemap=#um_$add_no","<map name=\"um_$add_no\"><area shape=\"rect\" coordas=\"0,0,100,100\"></map>");
			$jyusin_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFFFFF\">$add_mes「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"70\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\">
<form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\">
<input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"45\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";

			$koate_l{$messe_f_id} = $messe_f_name;
	$add_no ++;
		}

	if($gundan_no{$p_gundanno{$f_id}}){$gundan_name = "$gundan_name{$fgundan_id}/ ";
	open(IN,"./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG3 = <IN>;
	close(IN);
	$add_no = "g0";
		foreach(@MES_REG3){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","",""," usemap=#um_$add_no","<map name=\"um_$add_no\"><area shape=\"rect\" coordas=\"0,0,100,100\"></map>");
			$gundan_mes .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFA500\"><strong>$messe_e_name・$messe_f_nameから$p_name{$f_id}へ</strong></span><br /><span class=\"cFFFFFF\">  「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>


<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div><div id=\"$add_no\" class=\"d_none\">
<input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"45\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>
";
			$koate_l_gundan{$messe_f_id} = $messe_f_name;



	$add_no ++;
		}
	$sendlist .= "<option value=\"m_gundan\">$gundan_name軍団の人へ</option>";
	}else{$gundan_name = "未所属 / ";
	}

	open(IN,"./w_db/kuni/$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "k0";
		foreach(@MES_REG){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","",""," usemap=#um_$add_no","<map name=\"um_$add_no\"><area shape=\"rect\" coordas=\"0,0,100,100\"></map>");
			$kuniate_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFCC33\"><strong>	$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ</strong></span><br /><span class=\"cFFFFFF\">  「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=fm$add_no onsubmit=\"fidins(this);\" utn=\"utn\"><div><div id=\"$add_no\" class=\"d_none\">
<input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"45\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\">
<input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";
			$koate_l_kuni{$messe_f_id} = $messe_f_name;

	$add_no ++;
		}

$add_k_name=" / 国内";
			if(!$k_kunino{$fk_id} and $fk_id){
$add_k_name="系・放浪武将";
			}

	$next_time += 5;
	$next_time2 += 5;
	&TT_GET;


			$addc_kousin_f{"1"} = "";
			$addc_kousin_f{""} = "<iframe src=\"./?.m.=0ksi&amp;.i.=k\" name=\"0ksi\" id=\"0ksi\" width=\"1\" height=\"1\" frameborder=\"0\">更新発動フレーム</iframe>";
			$addc_kousin_f{"0"} = "<iframe src=\"./?.m.=0ksi&amp;.i.=k\" name=\"0ksi\" id=\"0ksi\" width=\"1\" height=\"1\" frameborder=\"0\">更新発動フレーム</iframe>";

	&HEADER;
print <<"PRI";
<a id="0"></a>
次のターンまで$next_time分・次の月まで$next_time2分

<table width=\"100%\" class=\"bgc808000\" border=\"1\">
<tr><td class=\"bgcF8F0E0\">$S_MES</td></tr>
<tr><td class=\"kbgcc0\">$log_list</td></tr>
</table>



<div class=\"messe_div\">
<div class=\"messe_block1\">
<div class=\"txtl\">
<a id=\"1\"><a id=\"4\"></a>\n<a href="#0">↑</a> <a href=\"#0\">・</a> <a href=\"#2\">↓</a> $p_name{$f_id}宛て（10件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"15\" />
<select name=.mes_id.>$sendlist_friend</select><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\"></div></form>
</td>
<td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#4\" method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" /></div></form>
</td></tr>
$jyusin_m
</table>
</div>
<div class=\"messe_block2\">

<div class=\"txtl\"><a id=\"11\"></a>\n<a href=\"#0\">↑</a> <a href=\"#0\">・</a> <a href=\"#12\">↓</a> $k_name_d[$fk_id]$add_k_name宛て（10件まで）
</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=text name=\".naiyou.\" size=\"45\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"k_$p_kunino{$f_id}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=$p_name{$f_id} />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div></form>
</td><td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#11\" method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" /></div></form>
</td></tr>
$kuniate_m
</table>
<div class=\"txtl\">
<a id=\"12\"><a id=\"2\"></a>\n<a href=\"#11\">↑</a> <a href=\"#0\">・</a> <a href=\"#13\">↓</a> $gundan_name軍団宛て（5件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=text name=\".naiyou.\" size=\"45\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"m_gundan\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form>
</td>
<td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#2\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" /></div></form>
</td>
</tr>
$unit_mes
</table>

</div>
</div>
<div class=\"clear_b\"></div>
$addc_kousin_f{$KOUSIN_AUTO}

PRI
	&FOOTER;
}

1;
