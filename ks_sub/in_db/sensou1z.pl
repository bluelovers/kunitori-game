
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
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=52>兵：行軍</td><td class=\"txth\" width=77>$HEIKOUGUN[$p_h_kougun{$f_id}]</td><td width=\"80\">兵：速度/疲労</td><td class=\"txth\" width=\"45\">$p_h_idou_sokudo{$f_id}/$p_h_hirou{$f_id}</td><td width=91>勝利時所要時間</td><td class=\"txth\" width=65>$add_h</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=52>将：行軍</td><td class=\"txth\" width=77>$BUKOUGUN[$p_b_kougun{$f_id}]</td><td width=\"80\">将：速度/疲労</td><td class=\"txth\" width=\"45\">$p_b_idou_sokudo{$f_id}/$p_b_hirou{$f_id}</td><td width=91>敗北時所要時間</td><td class=\"txth\" width=65>$add_b</td></tr>
</table><br /><br />

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 賊退治 》<br /><br />支配領域内の賊砦へ攻め込みます。遠方からでも攻撃可\能です。<br />
賊は良かれ悪かれ内政を荒らしまくります。<br />力をつけ有害になった賊は早めに討伐しておいた方が良いでしょう。

<br /><br />
何処の賊砦へ攻め込みますか？</span>
</td></tr></table>

<br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"s_map_div\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

PRI

		if($ichit < 1){
	print <<"PRI";

<div class=\"s_map_block1\">
PRI
		}
	print <<"PRI";
<select name=\".num.\" size=\"10\">
PRI



	$xx=0;
			$zcl = "CCCCCC";
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;

			$bgcmap[$xx] = $zcl;
		if($t_kunino[$dt_id] eq $p_kunino{$f_id}){
			$bgcmap[$xx] = "EFFFFF";
			if($t_zokuno[$dt_id]){
			$bgcmap[$xx] = "FFF0FF";
			print "<option value=\"$xx\">$t_name[$xx]の賊砦【$k_name_d[$t_zokuno[$dt_id]]】</option>";
			}
		}
		$xx++;
	}


print <<"PRI";
</select>
PRI
		if($ichit < 1){
require "./w_db/trmap.pl";
print <<"PRI";
</div>
<div class=\"s_map_block2\">
	<table class=\"bgc60AF60\" width=\"660\" border=\"0\">
<tr><td width=\"30\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td></tr>

	<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"11\">
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから攻め込むボタンを押してください<br />（自国領賊砦無し：シアン色／自国領賊砦在り：紫色）</span>
	</td>	</tr>



		<tr>
            <td width=\"20\" class=\"bgcF8F0E8\">-</td>
			<td width=\"70\" class=\"bgcF8F0E0\">1</td>
			<td width=\"70\" class=\"bgcF8F0E0\">2</td>
			<td width=\"70\" class=\"bgcF8F0E0\">3</td>
			<td width=\"70\" class=\"bgcF8F0E0\">4</td>
			<td width=\"70\" class=\"bgcF8F0E0\">5</td>
			<td width=\"70\" class=\"bgcF8F0E0\">6</td>
			<td width=\"70\" class=\"bgcF8F0E0\">7</td>
			<td width=\"70\" class=\"bgcF8F0E0\">8</td>
			<td width=\"70\" class=\"bgcF8F0E0\">9</td>
			<td width=\"70\" class=\"bgcF8F0E0\">10</td>
		</tr>
$trmap


	</table>

</div>

<div class=\"clear_b\"></div>
PRI
		}
print <<"PRI";


<br /><br />
$no_list
<input type=\"hidden\" name=\".m.\" value=\"sensou2\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=.sen. value=80>
<input type=\"submit\" value=\"攻め込む\">
<br /><br />
<select name=\".yosoku.\">
<option value=\"\">コマンド画面の設定に従い時間計算を行う（デフォルト）</option>
<option value=\"0\">常にこの戦闘に敗北すると予測して時間計算を行う</option>
<option value=\"1\">常にこの戦闘に勝利すると予測して時間計算を行う</option>
</select></div></form>

<div class=\"clear_b\"></div>
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