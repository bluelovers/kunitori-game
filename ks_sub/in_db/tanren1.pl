
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
require "./$mpg_r/sub_db/tw.pl";
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

				
	&HEADER;
	$no = $in{'no'} + 1;

	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";



<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 自己鍛錬 》<br /><br />鍛錬をつむ事で経験値が上昇します。
<br /><br />
$p_name{$f_id}様はどの能力\を鍛えますか？</span>
</td></tr></table>

PRI
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");
	print <<"PRI";
<table class=\"bgc414141\" width=\"600\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td rowspan=\"3\" width=\"100\">$img_sakusei_kekka</td><td>武力</td><td class=\"txth\" width=\"30\">$p_buryoku{$f_id}</td><td>知力</td><td class=\"txth\" width=\"30\">$p_tiryoku{$f_id}</td><td>統率</td><td class=\"txth\" width=\"30\">$p_tousotu{$f_id}</td><td>三種</td><td class=\"txth\" width=\"30\">$p_sougou{$f_id}</td><td>十種</td><td class=\"txth\" width=\"30\">$p_10syu_sougou{$f_id}</td>
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>騎乗</td><td class=\"txth\">$p_kijyou{$f_id}</td><td>射撃</td><td class=\"txth\">$p_syageki{$f_id}</td><td>武術</td><td class=\"txth\">$p_bujyutu{$f_id}</td><td>呪術</td><td class=\"txth\">$p_jyujyutu{$f_id}</td><td>諜報</td><td class=\"txth\">$p_tyouhou{$f_id}</td>
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>重機</td><td class=\"txth\">$p_jyuukisouda{$f_id}</td><td>調教</td><td class=\"txth\">$p_tyoukyou{$f_id}</td><td>人望</td><td class=\"txth\">$p_jinbou{$f_id}</td><td>政治</td><td class=\"txth\">$p_seiji{$f_id}</td><td>商才</td><td class=\"txth\">$p_sinyou{$f_id}</td>
</tr>
</table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".num.\" size=\"6\">
<option value=\"1\">武力（強）＋統率（弱）
<option value=\"12\">武力（強）＋知力（弱）
<option value=\"2\">知力（強）＋統率（弱）
<option value=\"22\">知力（強）＋武力（弱）
<option value=\"3\">統率（強）＋武力（弱）
<option value=\"32\">統率（強）＋知力（弱）
</select>
<select name=\".num2.\" size=\"10\">
<option value=\"100\">騎乗能力
<option value=\"101\">射撃能力
<option value=\"102\">武術
<option value=\"103\">呪術能力
<option value=\"104\">諜報能力
<option value=\"105\">重機操舵
<option value=\"106\">調教技術
<option value=\"107\">人望
<option value=\"108\">政治力
<option value=\"109\">商才
</select>
$no_list
<input type=\"hidden\" name=\".m.\" value=\"tanren2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"鍛える\" /></div></form>
<table>
<pre>
武力＝武将単騎の戦闘力
知力＝武将の智謀
統率＝兵士を率いる力

騎乗＝騎馬系兵種熟練度UP
射撃＝弓系兵種熟練度UP
武術＝歩兵系兵種熟練度UP
呪術＝神仙・妖魔・方士系兵種熟練度UP
諜報＝計略系コマンドの効果がUP
重機＝兵器系兵種熟練度UP
調教＝猛獣・蛇使い系兵種熟練度UP
人望＝施し系コマンドの効果がUP
政治＝内政系コマンドの効果がUP
商才＝売買系コマンドで特典が発生
</pre>
</table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;