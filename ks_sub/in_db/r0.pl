
sub MOVE {
}
sub NONE1 {$rclno = 1;
	&P_OPEN;
	if(-e "./p_db/cd/rc-$f_id\.\.cgi"){
rename ("./p_db/cd/rc-$f_id\.\.cgi", "./p_db/cd/rc-$f_id\.1.cgi");

unlink ("./p_db/cd/rc-$f_id\.\.cgi");
	}
}
sub NONE2 {$rclno = 2;
}
sub NONE3 {$rclno = 3;
}
sub NONE4 {$rclno = 4;
}
sub NONE5 {$rclno = 5;
}
sub NONE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "$mpg_r/men_db/kts/$menck.pl";
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);
	$new_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);


			$wmk = " 　";
				$add_p_jikan = $p_jikan{$f_id};

	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

	open(IN,"./p_db/cd/rc-$f_id\.$rclno.cgi");
	@CD_DB2 = <IN>;
	close(IN);

$KOUSIN_S_K[0] = $p_kousin_s{$f_id};
$KOUSIN_S_K[1] = $p_b_kousin_s{$f_id};
$KOUSIN_S_K[2] = $p_h_kousin_s{$f_id};
$KOUSIN_S_K[10] = $KOUSIN_S_K[2];
$KOUSIN_S_K[20] = $KOUSIN_S_K[2]/2;
	if($in{'sensou_s'}){
$KOUSIN_S_K[10] = $KOUSIN_S_K[1];
$KOUSIN_S_K[20] = $KOUSIN_S_K[1];
		$sensou_sel = " selected=\"selected\"";
	}
 

	$wyear = int($keika_nen+$KAISI_NEN);

	if($m_tt > $add_p_jikan){
		$wmonth = $tuki_genzai;

	}else{
		$wmonth = $tuki_genzai+1;
				$m_tt += $kousin_kankaku;

	}



	&HEADER;
print <<"PRI";


<table class=\"kbgcb$k_iro_d{$fk_id} tlauto\" cellspacing=\"1\">
<tr><td class=\"txth\" class=\"kbgcb$k_iro_d{$fk_id}\"><span class=\"kcc$k_iro_d{$fk_id}\">ループ転写作業$rclno</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".rclno.\" value=\"$rclno\" /><input type=\"hidden\" name=\".m.\" value=\"9992\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".no.\" size=\"24\">
PRI
$i=0;
	while($i < $MAX_CD){
		$no = $i+1;
	$wxyear = int(($wmonth+11)/12-1 +$wyear);
	$wxmonth = sprintf("%02d", ($wmonth-1)%12+1);
		($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3,$cd_op4,$cdw_type1,$cdw_type2,$cdw_type3,$cdw_optts) = split(/<>/,$CD_DB[$i]);
	$cdw_optts = int($cdw_optts);
	$no = sprintf("%03d", $no);
			($qsec,$qmin,$qhour,$qday) = localtime($add_p_jikan);
	$ndate = sprintf("%02d\日%02d\：%02d\ ", $qday, $qhour, $qmin);

		print "<option value=\"$i\">$no [$wxyear年$wxmonth月]$wmk\ $ndate\ $cd_name </option>";

				$add_p_jikan += $KOUSIN_S_K[$cdw_optts];
			($qsec,$qmin,$qhour,$qday) = localtime($add_p_jikan);
				&KTS2;
			$wmk = "☆";
		if($add_p_jikan >= $m_tt){
			$wmk = " 　";
		$wmonth++;
$m_tt += $kousin_kankaku;
#			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
#				&KTS1;
		}

$i++;
	}

print <<"PRI";
</select><select name=\".bb.\" size=\"24\">
<option value=\"0\">ループ用コマンド$rclno</option>
<option value=\"0\">ーーー</option>
PRI
$i=0;
			foreach(@CD_DB2){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);
		$no = $i+1;
		print "<option value=\"$i\">$no・$cd_name </option>";

$i++;
			}
print <<"PRI";
</select><br /><br />
<select name=\".cmno.\">
<option value=\"0\">ターン単位ループ</option>
<option value=\"1\">月単位ループ</option></select>
<select name=\".sensou_s.\">
<option value=\"0\">侵攻時に勝利するとして時間計算</option>
<option value=\"1\"$sensou_sel>侵攻時に敗北するとして時間計算</option>
</select>
<br /><br /><input type=\"submit\" value=\"指定No以降にループ用コマンドを転写\" />
<div class=\"txtl\">
<br />※、左のリストボックスでループ開始時期を選んでください。
<br />※、右のリストボックスは入力予定のループ用コマンドです。
<br /><br />※、ループ用コマンドの作り方。
<br />１、コマンド入力画面の左枠でループさせたい行動を複数選択。
<br />２、コマンド入力画面の右枠で『ループ作成』を選択。
<br />３、『コマンド入力』ボタンを押す。
<br />
<br />ターン単位ループ ⇒ ゲーム内のターンを基準にループを組みます。
<br />月単位ループ ⇒ ゲーム内の月を基準にループを組みます。
<br />※、月単位ループを組んでも体力値の変動により乱れる可\能性有り。
</div>
</div></form>
</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txtc\"><form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$in{'m'}\" />
<select name=\".sensou_s.\">
<option value=\"0\">侵攻時に勝利するとして時間計算</option>
<option value=\"1\"$sensou_sel>侵攻時に敗北するとして時間計算</option>
</select>
<input type=\"submit\" value=\"コマンド更新\" /></div></form></td>
</tr>
</table>

PRI
	&FOOTER;

	exit;

}
1;