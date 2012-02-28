
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
《 戦 争 》<br /><br />他国領に攻撃を仕掛けます。<br />国策「八紘一宇」を布いている国（遠方攻撃可\）、<br />並びに交戦相手国（隣接都市限定）の所属都市への攻撃行動が可\能です。
<br /><br />
何処へ攻め込みますか？</span>
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

	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

		$cd_op0z="";
		$cd_op0o=0;
		$cd_op0n="";
	foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

		if($cd_id eq "idou2" and $in{'no'} > $cd_op0o){
		$cd_op0z=$cd_op2;
		}
		$cd_op0o++;
	}
		if($cd_op0z ne ""){

		$ft_id = $cd_op0z;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$cd_op0n="最終移動予約先の都市・";
		$cd_op0n2="最終移動予約先";
		}else{
		$cd_op0n2="現在地";
$cd_op0z = $p_taizai_iti{$f_id};
		}

	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne "" and $t_kunino[$_] ne $p_kunino{$f_id}){
		print "<option value=\"$_\">$t_name[$_]</option>";
		}
	}

		print "<option value=\"999\">＝＝＝</option>";
$kyuukoku = 0;

	$xx=0;
			$zcl = "CCCCCC";
			if($k_kokusaku{$fk_id} eq "10"){
			$zcl = "FFF0FF";
			}
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			$bgcmap[$xx] = $zcl;
		$senhit2=0;
		&KOUSEN_AITE_HIT("$senhit2","$t_kunino[$dt_id]","$fk_id");
		$senhit2=$kousen_aite_hit;
			if($t_kunino[$dt_id] eq $p_kunino{$f_id}){
			$bgcmap[$xx] = "EFFFFF";
			}elsif($senhit2){
			$bgcmap[$xx] = "FFF0FF";
			}
		$xx++;
	}

			$bgcmap[$cd_op0z] = "FFFFCC";
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne "" and $t_kunino[$_] ne $p_kunino{$f_id}){
			$move_list .= "$t_name[$_]・";
			if($bgcmap[$_] eq "CCCCCC"){
			$bgcmap[$_] = "FFCFCF";
			}elsif($bgcmap[$_] eq "EFFFFF"){
			$bgcmap[$_] = "CFEFFF";
			}elsif($bgcmap[$_] eq "FFF0FF"){
			$bgcmap[$_] = "DDA0DD";
			}
		}
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
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから攻め込むボタンを押してください<br />（$cd_op0n2：金色／隣接都市：赤色／隣接自国領：青色／自国領：シアン色／交戦相手国：紫色）</span>
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


<br /><br />【$cd_op0n$t_name{$ft_id}から戦争\可\能な街】<br />$move_list
$no_list<br />
<input type=\"hidden\" name=\".m.\" value=\"sensou2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<select name=\".rty.\">
<option value=\"0\">運を天に任せる</option>
<option value=\"1\">山林</option>
<option value=\"2\">山道</option>
<option value=\"3\">川原沿い</option>
<option value=\"4\">草原</option>
<option value=\"5\">林道</option>
<option value=\"6\">森林</option>
</select>
<select name=\".rts.\">
<option value=\"0\">運を天に任せる</option>
<option value=\"21\">西門</option>
<option value=\"22\">北門</option>
<option value=\"23\">東門</option>
<option value=\"24\">南門</option>
</select>
<select name=\".sen.\">
<option value=\"0\">通常設定</option>
<option value=\"3\">国境戦設定</option>
<option value=\"2\">野戦限定</option>
<option value=\"4\">敵城包囲</option>
<option value=\"1\">城攻め限定</option>
<option value=\"5\">城壁戦限定</option></select>
<select name=\".bsen.\">
<option value=\"0\">隊長の指示に従う</option>
<option value=\"1\">この戦法で固定</option></select>
<input type=\"submit\" value=\"攻め込む\" />
<br /><br />
<select name=\".yosoku.\">
<option value=\"\">コマンド画面の設定に従い時間計算を行う（デフォルト）</option>
<option value=\"0\">常にこの戦闘に敗北すると予測して時間計算を行う</option>
<option value=\"1\">常にこの戦闘に勝利すると予測して時間計算を行う</option>
</select>
</div></form>

<div class=\"clear_b\"></div>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form><br />
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>  

PRI

	&FOOTER;

	exit;

}
1;