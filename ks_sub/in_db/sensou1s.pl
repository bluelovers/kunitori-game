
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
require "./$mpg_r/sub_db/tw.pl";
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

				
	&HEADER;
	$no = $in{'no'} + 1;
	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}


	$add_d = sprintf("%02d\分%02d\秒", int($p_kousin_s{$f_id}/60), $p_kousin_s{$f_id}%60);
	$add_b = sprintf("%02d\分%02d\秒", int($p_b_kousin_s{$f_id}/60), $p_b_kousin_s{$f_id}%60);
	$add_h = sprintf("%02d\分%02d\秒", int($p_h_kousin_s{$f_id}/60), $p_h_kousin_s{$f_id}%60);
require "./$mpg_r/sub_db/minzoku.pl";
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";



<table width=\"400\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"52\">兵：行軍</td><td class=\"txth\" width=\"77\">$HEIKOUGUN[$p_h_kougun{$f_id}]</td><td width=\"80\">兵：速度/疲労</td><td class=\"txth\" width=\"45\">$p_h_idou_sokudo{$f_id}/$p_h_hirou{$f_id}</td><td width=\"91\">勝利時所要時間</td><td class=\"txth\" width=\"65\">$add_h</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"52\">将：行軍</td><td class=\"txth\" width=\"77\">$BUKOUGUN[$p_b_kougun{$f_id}]</td><td width=\"80\">将：速度/疲労</td><td class=\"txth\" width=\"45\">$p_b_idou_sokudo{$f_id}/$p_b_hirou{$f_id}</td><td width=\"91\">敗北時所要時間</td><td class=\"txth\" width=\"65\">$add_b</td></tr>
</table><br /><br />

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 城を強襲 》<br /><br />都市を支配する城へ攻め込みます。
<br />守備部隊との戦闘を避け、城の衛兵と直接戦闘できます。
<br />衛兵との戦いに勝利すると稀に金品を強奪することがあります。 
<br />都市の防衛力を0にすると、当該都市を占領した上でそのまま建国することができます。

<br /><br />
$t_name{$ft_id}の城へ攻め込みますか？</span>
</td></tr></table>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<br /><br />$move_list
$no_list<br />
<input type=\"hidden\" name=\".m.\" value=\"sensou2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".sen.\" value=\"90\" />
<input type=\"hidden\" name=\".num.\" value=\"$ft_id\" />
<input type=\"submit\" value=\"$t_name{$ft_id}の城へ攻め込む\" />
<br /><br />
<select name=\".yosoku.\">
<option value=\"\">コマンド画面の設定に従い時間計算を行う（デフォルト）</option>
<option value=\"0\">常にこの戦闘に敗北すると予測して時間計算を行う</option>
<option value=\"1\">常にこの戦闘に勝利すると予測して時間計算を行う</option>
</select></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form><br />
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>  

PRI

	&FOOTER;

	exit;

}
1;