
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

		$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");

#	if($k_kunino{$fk_id} eq "0"){&ER1("国家無所属武将は実行できません。");}


#	if(!$fbutai_id){&ER1("部隊未所属です。");}



		if($in{'mode2'} eq "1"){
			if($in{'bsirei1'} eq "1"){
				$bzc = 1;
				$bsirei1 = "残り兵士数30%以上＆";
			}elsif($in{'bsirei1'} eq "2"){
				$bzc = 2;
				$bsirei1 = "残り兵士数45%以上＆";
			}elsif($in{'bsirei1'} eq "3"){
				$bzc = 3;
				$bsirei1 = "残り兵士数60%以上＆";
			}elsif($in{'bsirei1'} eq "4"){
				$bzc = 4;
				$bsirei1 = "残り兵士数75%以上＆";
			}elsif($in{'bsirei1'} eq "5"){
				$bzc = 5;
				$bsirei1 = "残り兵士数90%以上＆";
			}elsif($in{'bsirei1'} eq "99"){
				$bzc = 99;
				$bsirei1 = "残り兵士数1%以上＆";
			}else{
				$bzc = 0;
				$bsirei1 = "一斉攻撃に参加しない";
			}
			
			if($bsirei1 eq "一斉攻撃に参加しない"){
				$bzc3 .= 0;
			}elsif($in{'bsirei3'} eq "1"){
				$bzc3 .= 1;
				$bsirei1 .= "訓練度が30%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "2"){
				$bzc3 .= 2;
				$bsirei1 .= "訓練度が45%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "3"){
				$bzc3 .= 3;
				$bsirei1 .= "訓練度が60%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "4"){
				$bzc3 .= 4;
				$bsirei1 .= "訓練度が75%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "5"){
				$bzc3 .= 5;
				$bsirei1 .= "訓練度が90%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "98"){
				$bzc3 .= 98;
				$bsirei1 .= "訓練度が0%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "101"){
				$bzc3 .= 101;
				$bsirei1 .= "訓練度が総合力の30%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "102"){
				$bzc3 .= 102;
				$bsirei1 .= "訓練度が総合力の45%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "103"){
				$bzc3 .= 103;
				$bsirei1 .= "訓練度が総合力の60%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "104"){
				$bzc3 .= 104;
				$bsirei1 .= "訓練度が総合力の75%以上の時に出撃";
			}elsif($in{'bsirei3'} eq "105"){
				$bzc3 .= 105;
				$bsirei1 .= "訓練度が総合力の90%以上の時に出撃";
			}else{
				$bzc3 .= 0;
				$bsirei1 = "一斉攻撃に参加しない";
			}

$p_butaisirei{$f_id}[0] = $bzc;
$p_butaisirei{$f_id}[2] = $bzc3;


				$lsmess = "$p_name{$f_id}の部隊出陣判定を変更";
				$lsmess2 = "$p_name{$f_id}の一斉攻撃出陣判断基準を<br />$bsirei1に";

		}else{
			if($in{'bsirei1'} eq "1"){
				$bzc = 1;
				$bsirei1 = "かばう";
			}elsif($in{'bsirei1'} eq "2"){
				$bzc = 2;
				$bsirei1 = "一点集中";
			}elsif($in{'bsirei1'} eq "3"){
				$bzc = 3;
				$bsirei1 = "挑発";
			}else{
				$bzc = 0;
				$bsirei1 = "個々撃破";
			}

$p_butaisirei{$f_id}[1] = $bzc;



				$lsmess = "$p_name{$f_id}の部隊スキル設定を$bsirei1に変更";
				$lsmess2 = "$p_name{$f_id}の部隊スキル設定を$bsirei1に変更";

		}

################

$a_a_d="butai<>0<>$lsmess <><>$f_id<><>c2<>$in{'mode2'}<>$bzc<>$bzc2<>$bzc3<><>$lsmess2<>$p_butai_yakusyoku{$f_id}<>$p_butaino{$f_id}<>\n";
		$xyz = "$lsmess を<br />アクティブコマンドとして予約しました。";

	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);
$a_a_hit=0;
	foreach (@no) {
$a_a_no=int($_);
		($acd_id{$facd_id}[$a_a_no],$acd_no{$facd_id}[$a_a_no],$acd_name{$facd_id}[$a_a_no],$acd_tt{$facd_id}[$a_a_no],$acd_p_id{$facd_id}[$a_a_no],$acd_e_id{$facd_id}[$a_a_no],$acd_sub1{$facd_id}[$a_a_no],$acd_sub2{$facd_id}[$a_a_no],$acd_sub3{$facd_id}[$a_a_no],$acd_sub4{$facd_id}[$a_a_no],$acd_sub5{$facd_id}[$a_a_no],$acd_sub6{$facd_id}[$a_a_no],$acd_sub7{$facd_id}[$a_a_no],$acd_sub8{$facd_id}[$a_a_no],$acd_sub9{$facd_id}[$a_a_no]) = split(/<>/,$CD_DB[$a_a_no]);
		if($acd_id{$facd_id}[$a_a_no] eq "sounyuu" and !$a_a_hit){
splice(@CD_DB , $add_no, 0, "$a_a_d");
$a_a_hit++;
		}
	}
		if(!$a_a_hit){
push(@CD_DB, "$a_a_d");
		}
	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
################

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"butai\" /><input type=\"submit\" value=\"部隊編成画面に戻る\" />","");#CD_END


	exit;
}
1;