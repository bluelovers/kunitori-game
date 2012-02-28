
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("tosi_db","$ft_id","$ft_id");
		}
	}
closedir(DFR);


	$zc=0;
	while ($zc<$tosi_kazu) {
		$t_list .= "<option value=\"$zc\">$t_name[$zc]【$k_name_d[$t_kunino[$zc]]】</option>";
		$zc++;
	}
	$zc=0;
	while ($zc<$tosi_kazu) {
							$ft_id = $zc;
		$add_tn_l[$zc] = "$t_name[$zc]の賊砦";
	if($in{'k_no'} eq "z$zc"){$t_list .= "<option value=\"$in{'k_no'}\" selected=\"selected\">$add_tn_l[$zc]【$k_name_d[$t_zokuno[$ft_id]]】</option>";
	}else{
		$t_list .= "<option value=\"z$zc\">$add_tn_l[$zc]【$k_name_d[$t_zokuno[$ft_id]]】</option>";
	}
		$zc++;
	}
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);
	if($tuki_genzai<1){
	$come1 = "遠方建国＆遠方仕官";
	$come2 = "遠くの都市に建国又は仕官できます。（新規登録同様にターンを消費しません）";
	$come3 = "<tr class=\"bgcF8F0E0\"><td width=\"100\">対象都市</td><td class=\"bgcFFF8F0\">
<select name=\".k_no.\" size=\"24\">
<option value=\"\"> ※説明※ </option>
<option value=\"\"> 都市の名称【国家の名称】</option>
<option value=\"\"> 【無所属】は空白地</option>
<option value=\"\"> ーーーーーーーーーーーー</option>
$t_list
</select>
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object> </td></tr>";
	}else{
							$ft_id = $p_taizai_iti{$f_id};

	$come1 = "建 国";
	$come2 = "空白地に国を建国します。";
$intosi = $p_taizai_iti{$f_id};
	$zokuhit = 0;
	if($t_kunino{$ft_id}) {
	$zokuhit = 1;
	$come1 = "賊旗揚げ";
	$come2 = "賊空白域において賊を旗揚げします。<br />ゲーム途中で賊を新規旗揚げするには、<br />軍資金として金200000が必要になります。";

	}
	$comez = "<tr class=\"bgcF8F0E0\"><td width=\"100\">賊名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".zokumei.\" size=\"30\" value=\"$in{'zokumei'}\" /><br />・賊砦でスタートする場合、建国成功後の新国家の名称と共に、賊の名称を決めてください。<br /> [全角大文字で１～８文字以内]/末尾に（○○賊）\表示\は有りません。</td></tr>";

	}

$eleele = "<div class=\"kuniiro_div\">";
	$i=0;
	foreach(@ELE_BG){
$eleele .= "<div class=\"kuniiro_block\"><span class=\"kcm$i\">■</span><br /><input type=\"radio\" name=.ele. value=\"$i\" /></div>";
	$i++;
	}

$eleele .= "</div><div class=\"clear_b\"></div>";

	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
$khsn4 =~ s/<br $TAG_s0>/\n/g;
$khsnp =~ s/<br $TAG_s0>/\n/g;
$hsk =~ s/<br $TAG_s0>/\n/g;
	print <<"PRI";
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 $come1 》
<br /><br />
<br /><br />
$come2</span>
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
PRI


print <<"PRI";
<input type=\"hidden\" name=\".m.\" value=\"kenkoku2\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgcF8F0E0\"><td width=\"100\"></td><td></td></tr>
<tr><td class=\"txth bgcFFF0F5\" colspan=\"2\">$come1</td></tr>
<tr class=\"bgcF8F0E0\"><td width=\"100\">国名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".kokumei.\" size=\"30\" value=\"$in{'kokumei'}\" /><br />・新国家の名称を決めてください。<br /> [全角大文字で１～８文字]</td></tr>
$comez
<tr class=\"bgcF8F0E0\"><td width=\"100\">天子</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".mes.\" size=\"30\" value=\"$in{'mes'}\" /><br />・新国家の皇帝となる天子の名称を決めてください。<br /> [全角大文字で１～８文字以内]/例：霊帝。楓姫。</td></tr>
<tr><td class=\"bgcF8F0E0\">国の色</td><td class=\"bgcFFF8F0\"><table border=\"1\">$eleele・国の色を決めてください。</table></td></tr>$come3
</table>
<input type=\"submit\" value=\"$come1\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;