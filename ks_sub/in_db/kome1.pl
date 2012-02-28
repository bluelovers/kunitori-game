
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	&HEADER;
	$no = $in{'no'} + 1;


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
		$cd_op0n="最終移動\予約先の都市・";
		}

	$get_sol11 = int($p_syoji_kin{$f_id} * 0.95);
	$get_sol12 = int($p_syoji_kome{$f_id} / 1.05);
								$jfl = int($p_tousotu{$f_id} * 300 / ($p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}));
								$jfs = int($p_buryoku{$f_id} * 300 / ($p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}));
								$jfi = int($p_tiryoku{$f_id} * 300 / ($p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}));
			if(!$t_kome_souba{$ft_id}){
	$t_kome_souba{$ft_id} =1;
			}
			if($jfi>159 or ($jfl>129 and $jfi>129)){
	$get_sol11 = int($p_syoji_kin{$f_id} * 1);
	$get_sol12 = int($p_syoji_kome{$f_id} / 1);
			}


	$get_sol1 = int($p_syoji_kin{$f_id} * $t_kome_souba{$ft_id});
	$get_sol2 = int($p_syoji_kome{$f_id} / $t_kome_souba{$ft_id});
	if($get_sol1 > 30000){
		$get_sol1 = 30000;
	}
	if($get_sol2 > 30000){
		$get_sol2 = 30000;
	}
	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}

	&IMG_SAKUSEI("$IMG{0}/komeya0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";


<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />
<br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 米 屋 》<br /><br />売り子A：いらっしゃいませ。ここは金と米を交換する場所です。<br />$cd_op0n$t_name{$ft_id}の現在の米相場は「金<span class=\"cFFFFCC\">1</span>」に対して「米<span class=\"cFFFFCC\">$t_kome_souba{$ft_id}</span>」。<br />一度の取引で売り買いできる数は最大で３万まで。<br />いかほど交換致しましょうか？
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
米買い：米を<input type=\"text\" name=\".num.\" value=\"$get_sol1\" size=\"5\">買う
$no_list
<input type=\"hidden\" name=\".m.\" value=\"kome2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".type.\" value=\"1\" />
<input type=\"hidden\" name=\".type2.\" value=\"1\" />
<input type=\"submit\" value=\"米を買う\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
米売り：米を売って金<input type=\"text\" name=\".num.\" value=\"$get_sol2\" size=\"5\" />を得る
$no_list
<input type=\"hidden\" name=\".m.\" value=\"kome2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".type.\" value=\"0\" />
<input type=\"hidden\" name=\".type2.\" value=\"1\" />
<input type=\"submit\" value=\"金を入手\" /></div></form>

PRI

	&IMG_SAKUSEI("$IMG{0}/komeya1$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 米 屋 》<br /><br />売り子B：一度に３万以上の取引を希望される方はこちらをどうぞ。<br />交換レートは、米買い時0.95、米売り時1.05（固定）となっております。<br />文官の方には、どちらも交換レート1.00でサービス中です。<br />いかほど交換致しましょうか？
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
米買い：米を<input type=\"text\" name=\".num.\" value=\"$get_sol11\" size=\"10\" />買う
$no_list
<input type=\"hidden\" name=\".m.\" value=\"kome2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".type.\" value=\"1\" />
<input type=\"hidden\" name=\".type2.\" value=\"2\" />
<input type=\"submit\" value=\"米を買う\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
米売り：米を売って金<input type=\"text\" name=\".num.\" value=\"$get_sol12\" size=\"10\" />を得る
$no_list
<input type=\"hidden\" name=\".m.\" value=\"kome2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".type.\" value=\"0\" />
<input type=\"hidden\" name=\".type2.\" value=\"2\" />
<input type=\"submit\" value=\"金を入手\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;