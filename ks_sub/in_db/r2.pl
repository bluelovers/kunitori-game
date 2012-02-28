
sub MOVE {
}
sub NONE {

	$chit = @no;
	if($chit > 1){&ER1("ループ開始No:の複数入力は受け付けられません。");}
		$in{'no'} = abs(int($in{'no'}));
		$in{'rclno'} = abs(int($in{'rclno'}));
	&P_OPEN;


####
	if($in{'cmno'} eq "1"){

			$com = "月単位ループ";
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "$mpg_r/men_db/kts/$menck.pl";
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);
	$new_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

				$add_p_jikan = $p_jikan{$f_id};

			$wmk = "0";

	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
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
		$wmonth = $tuki_genzai-1;

	}else{
		$wmonth = $tuki_genzai;
				$m_tt += $kousin_kankaku;

	}


	open(IN,"./p_db/cd/rc-$f_id\.$in{'rclno'}.cgi");
	@CD_DB2 = <IN>;
	close(IN);

	$mes_num = @CD_DB2;
	if($mes_num < 1){&ER1("ループが未完成です。コマンド入力画面からループ作成を実行してください。");}

		$kaisino2 = $in{'no'};
		$kaisino = $in{'no'}+1;

	@NEW_CD_DB=();$i=0;$i2=0;
		foreach(@CD_DB){
	$wxyear = int(($wmonth+11)/12-1 +$wyear);
	$wxmonth = sprintf("%02d", ($wmonth-1)%12+1);
		($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3,$cd_op4,$cdw_type1,$cdw_type2,$cdw_type3,$cdw_optts) = split(/<>/,$CD_DB[$i]);
	$cdw_optts = int($cdw_optts);


				$add_p_jikan += $KOUSIN_S_K[$cdw_optts];
			($qsec,$qmin,$qhour,$qday) = localtime($p_jikan{$f_id});
				&KTS2;
			$wmk = 1;
		if($add_p_jikan >= $m_tt){
			$wmk = 0;
		$wmonth++;$m_tt += $kousin_kankaku;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
			if($i >= $kaisino2){
			push(@NEW_CD_DB,"$CD_DB2[$i2]");
				if($wmk ne "1"){
			$i2++;
				if($i2 >= $mes_num){$i2=0;
				}
				}
			}else{
				push(@NEW_CD_DB,"$_");
			}

			$i++;
		}


####
	}else{
####
			$com = "ターン単位ループ";

	open(IN,"./p_db/cd/rc-$f_id\.$in{'rclno'}.cgi");
	@CD_DB2 = <IN>;
	close(IN);

	$mes_num = @CD_DB2;
	if($mes_num < 1){&ER1("ループが未完成です。コマンド入力画面からループ作成を実行してください。");}

		$kaisino2 = $in{'no'};
		$kaisino = $in{'no'}+1;
	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

	@NEW_CD_DB=();$i=0;$i2=0;
		foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

			if($i >= $kaisino2){
			push(@NEW_CD_DB,"$CD_DB2[$i2]");
			$i2++;
				if($i2 >= $mes_num){$i2=0;
				}
			}else{
				push(@NEW_CD_DB,"$_");
			}
			$i++;
		}

####
	}

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;


	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);


	&CD_END("コマンドNo:$kaisino以降にループ用コマンド$in{'rclno'}を転写しました。（$com）","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}
1;