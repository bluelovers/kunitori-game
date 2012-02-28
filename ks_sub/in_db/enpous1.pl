
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "./$mpg_r/sub_db/tw.pl";
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}

				
	&HEADER;
	$no = $in{'no'} + 1;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";



<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br /><br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 城の守備に就く 》<br /><br />遠くの城を守備します。米１５０００必要です。<br />一部の防衛地点は遠方守備することが出来ません。
<br />派遣対象が自国の都市、救援指定先、事大指定先ならコスト５分の１。<br />隣接都市なら更に半額で済みます。
<br /><br />どの都市を守備しますか？</span>
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
		if("$_" ne ""){
		print "<option value=\"$_\">$t_name[$_]</option>";
		}
	}

		print "<option value=\"999\">＝＝＝</option>";


$kyuukoku = 0;
		if($k_kouryaku_mokuhyou{$fk_id}[0] eq "4" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "11" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){
$kyuukoku = $k_kyuusai_aite{$fk_id}[0];
		}

	$xx=0;
			$zcl = "CCCCCC";
			if($k_kokusaku{$fk_id} eq "10"){
			$zcl = "FFF0FF";
			}
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			$bgcmap[$xx] = $zcl;
			if($t_kunino[$dt_id] eq $kyuukoku){
			$bgcmap[$xx] = "C8FFC8";
			}elsif($t_kunino[$dt_id] eq $p_kunino{$f_id}){
			$bgcmap[$xx] = "EFFFFF";
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[0] or $t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[1] or $t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[2] or $t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[3] or $t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[4]){
			$bgcmap[$xx] = "FFF0FF";
			}
		$xx++;
	}

			$bgcmap[$cd_op0z] = "FFFFCC";
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
			$move_list .= "$t_name[$_]・";
			if($bgcmap[$_] eq "CCCCCC"){
			$bgcmap[$_] = "FFCFCF";
			}elsif($bgcmap[$_] eq "EFFFFF" or $bgcmap[$_] eq "C8FFC8"){
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
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから遠方守備ボタンを押してください<br />（$cd_op0n2：金色／隣接都市：赤色／自国領：シアン色／救援先：緑色／交戦相手国：紫色）<br />（隣接自国or隣接救援先：青色）</span>
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

<br /><br />【$cd_op0n$t_name{$ft_id}の隣接都市】<br />$move_list
$no_list<br />
<input type=\"hidden\" name=\".m.\" value=\"enpous2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<select name=\".rtb.\">
<option value=\"0\">運を天に任せる</option>
<optgroup label=\"砦\">
<option value=\"11\">山岳砦</option>
<option value=\"12\">平地砦</option>
<option value=\"13\">森林砦</option>
</optgroup>
<optgroup label=\"城門\">
<option value=\"21\">西門</option>
<option value=\"22\">北門</option>
<option value=\"23\">東門</option>
<option value=\"24\">南門</option>
</optgroup>
</select>
<input type=\"submit\" value=\"遠方守備\" /></div></form>

<div class=\"clear_b\"></div>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form><br />
<object data=\"./w_db/map.html\" type=text/html width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>

PRI

	&FOOTER;

	exit;

}
1;