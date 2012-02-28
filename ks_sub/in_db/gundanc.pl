
sub MOVE {


require "$mpg_r/sub_db/gundan_kanbu.pl";
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

	if($k_kunino{$fk_id} eq "0"){&ER1("国家無所属武将は実行できません。");}
	if(!$fgundan_id){&ER1("軍団未所属です。");}



			if($in{'mode2'} eq "1"){
$senpc[0]="通常";
$senpc[1]="城攻め";
$senpc[2]="野戦";
$senpc[3]="国境戦";
$senpc[4]="城包囲";
$senpc[5]="城壁戦";
require "./$mpg_r/sub_db/tw.pl";
	if($in{'rty'} eq "1"){
		$come = "（山林⇒山砦⇒拠点⇒";
		$rty2 = 11;
	}elsif($in{'rty'} eq "2"){
		$come = "（山道⇒山砦⇒拠点⇒";
		$rty2 = 11;
	}elsif($in{'rty'} eq "3"){
		$come = "（川原⇒平砦⇒拠点⇒";
		$rty2 = 12;
	}elsif($in{'rty'} eq "4"){
		$come = "（草原⇒平砦⇒拠点⇒";
		$rty2 = 12;
	}elsif($in{'rty'} eq "5"){
		$come = "（林道⇒森砦⇒拠点⇒";
		$rty2 = 13;
	}elsif($in{'rty'} eq "6"){
		$come = "（森林⇒森砦⇒拠点⇒";
		$rty2 = 13;
	}else{
&ER1("ルート設定が不完全です。");

	}

	if($in{'rts'} eq "21"){
		$come .= "西門";
		$rts1 = 24;
		$rts2 = 22;
	}elsif($in{'rts'} eq "22"){
		$come .= "北門";
		$rts1 = 21;
		$rts2 = 23;
	}elsif($in{'rts'} eq "23"){
		$come .= "東門";
		$rts1 = 22;
		$rts2 = 24;
	}elsif($in{'rts'} eq "24"){
		$come .= "南門";
		$rts1 = 23;
		$rts2 = 21;
	}else{
&ER1("ルート設定が不完全です。");
	}
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("権限を使用できるのは軍団幹部のみです。");
	}


	open(IN,"./w_db/gundan_l/l$fgundan_id.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);
							foreach(@GUNDAN_DB){
								($uni_id,$uni_name)=split(/<>/);
	$e_id=$uni_id;
	&P_READ("p","$e_id","$e_id");
									if($p_id{$e_id} ne ""){
								if($p_kunino{$e_id} eq $p_kunino{$f_id}){

	open(IN,"./p_db/cd/$p_id{$e_id}.cgi");
	@CD_DB = <IN>;
	close(IN);


	@NEW_CD_DB=();$i=0;
		foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

			$ahit=0;
				if($cd_id eq "sensou2" and $cd_op3 eq "0"){
					$ahit=1;
					push(@NEW_CD_DB,"sensou2<>$in{'rty'},$rty2,20,$in{'rts'},$rts1,$rts2<>$t_name[$cd_op2]へ出兵$come＠$senpc[$cd_op1]/軍団指令）<>$tt<>$cd_op1<>$cd_op2<>0<>\n");

				}
			if(!$ahit){
				push(@NEW_CD_DB,"$_");
			}

			$i++;
		}

	open(OUT,">./p_db/cd/$p_id{$e_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);

								}
									}
							}

				$lscmess = "$gundan_name{$fgundan_id}軍団の進軍ルート設定を$come）に";
				$lsmess = "$gundan_name{$fgundan_id}軍団の進軍ルート設定を$come）に";
		$xyz = "$lsmess しました。";
		$akuthibu_c = 1;
			}elsif($in{'mode2'} eq "2"){
require "./$mpg_r/sub_db/tw.pl";

	if($in{'rty'} eq "11"){
		$come = "（山砦）";
	}elsif($in{'rty'} eq "12"){
		$come = "（平砦）";
	}elsif($in{'rty'} eq "13"){
		$come = "（森砦）";
	}elsif($in{'rty'} eq "21"){
		$come = "（西門）";
	}elsif($in{'rty'} eq "22"){
		$come = "（北門）";
	}elsif($in{'rty'} eq "23"){
		$come = "（東門）";
	}elsif($in{'rty'} eq "24"){
		$come = "（南門）";
	}elsif($in{'rty'} eq "20"){
		$come = "（拠点）";
	}elsif($in{'rty'} eq "1"){
		$come = "（山林）";
	}elsif($in{'rty'} eq "2"){
		$come = "（山道）";
	}elsif($in{'rty'} eq "3"){
		$come = "（川原）";
	}elsif($in{'rty'} eq "4"){
		$come = "（草原）";
	}elsif($in{'rty'} eq "5"){
		$come = "（林道）";
	}elsif($in{'rty'} eq "6"){
		$come = "（森林）";
	}else{
&ER1("位置設定が不完全です。");

	}
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("権限を使用できるのは軍団幹部のみです。");
	}


	open(IN,"./w_db/gundan_l/l$fgundan_id.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);
							foreach(@GUNDAN_DB){
								($uni_id,$uni_name)=split(/<>/);
	$e_id=$uni_id;
	&P_READ("p","$e_id","$e_id");
									if($p_id{$e_id} ne ""){
								if($p_kunino{$e_id} eq $p_kunino{$f_id}){
									if($p_taizai_iti{$f_id} eq $p_taizai_iti{$p_id{$e_id}}){
	open(IN,"./p_db/cd/$p_id{$e_id}.cgi");
	@CD_DB = <IN>;
	close(IN);


	@NEW_CD_DB=();$i=0;
		foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

			$ahit=0;
				if($cd_id eq "syubi" and $cd_op3 eq "0"){
					$ahit=1;
			push(@NEW_CD_DB,"syubi<><>滞在都市$comeを守備/軍団指令<>$tt<>$in{'rty'}<>$cd_op2<>0<>\n");

				$lsmess2 .= "$p_name{$e_id}、";
				}
			if(!$ahit){
				push(@NEW_CD_DB,"$_");
			}

			$i++;
		}

	open(OUT,">./p_db/cd/$p_id{$e_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);

									}
								}
									}
							}
				$lscmess = "$gundan_name{$fgundan_id}軍団の守備位置予約を$comeに";
				$lsmess = "$gundan_name{$fgundan_id}軍団の守備位置予約を$comeに";
		$xyz = "$lsmess しました。";
		$akuthibu_c = 1;
			}elsif($in{'mode2'} eq "3"){

			if($in{'rty'} eq "1"){
				$bzc = 1;
				$bsirei1 = "現地集合";
			}elsif($in{'rty'} eq "2"){
				$bzc = 2;
				$bsirei1 = "謀反";
			}else{
				$bzc = 0;
				$bsirei1 = "自由行動";
			}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
		&ER1("軍団長以外実行できません。");
	}
				$lscmess = "軍団指令を$bsirei1に";
				$lsmess = "$gundan_name{$fgundan_id}軍団の指令を$bsirei1に";
			}elsif($in{'mode2'} eq "8"){

	&MOJISUU($in{'mes'},40);
	if($mojisuu_o) { &ER1("指令文は、２０文字以下で入力して下さい。$mojisuu_re"); }
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("権限を使用できるのは軍団幹部のみです。");
	}
				$lscmess = "$gundan_name{$fgundan_id}軍団の指令文変更";
				$lsmess = "$gundan_name{$fgundan_id}軍団の指令文を「$in{'mes'}」に";
			}elsif($in{'mode2'} eq "9"){

	&MOJISUU($in{'mes'},40);
	if($mojisuu_o) { &ER1("勧誘文は、２０文字以下で入力して下さい。$mojisuu_re"); }
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("権限を使用できるのは軍団幹部のみです。");
	}
				$lscmess = "$gundan_name{$fgundan_id}軍団の勧誘文変更";
				$lsmess = "$gundan_name{$fgundan_id}軍団の勧誘文を「$in{'mes'}」に";
			}elsif($in{'mode2'} eq "6"){

	if($in{'did'} eq ""){&ER1("相手が選択されていません");}
	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
	$d_id=$gundan_yakusyoku_id{$p_gundanno{$f_id}}[1];
	&P_READ("p","$d_id","$d_id");
	if($p_gundan_yakusyoku{$d_id} eq "1"){
		&ER1("軍団長以外実行できません。");
	}
	}else{
	if($in{'did'} eq $f_id){&ER1("自分に委譲できません。");}
	}
	if($p_gundanno{$f_id} ne $p_gundanno{$e_id}){
		&ER1("軍団が異なります。");
	}

				$lscmess = "$gundan_name{$fgundan_id}軍団の指揮権を$p_name{$e_id}に委譲";
				$lsmess = "$gundan_name{$fgundan_id}軍団の指揮権を$p_name{$e_id}に委譲";
			}elsif($in{'mode2'} eq "7"){

#$hit =0;
#$add_no =2;
#	while($add_no < 7){
#	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]){
#$hit =$add_no;
#	}
#$add_no ++;
#	}
#	if(!$hit){&ER1("役職に空きがありません。誰かを解任してください。");}
$hit =2;
	if($in{'did'} eq $f_id){&ER1("自分に任命できません。");}
	if($in{'did'} eq ""){&ER1("相手が選択されていません");}

	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
		&ER1("軍団長以外実行できません。");
	}
	if($p_gundanno{$f_id} ne $p_gundanno{$e_id}){
		&ER1("軍団が異なります。");
	}
				$lscmess = "$p_name{$e_id}を$gundan_name{$fgundan_id}軍団の$GUNDAN_KANBU[$hit]に任命";
				$lsmess = "$p_name{$e_id}を$gundan_name{$fgundan_id}軍団の$GUNDAN_KANBU[$hit]に任命";

			}elsif($in{'mode2'} eq "5"){

	if($in{'did'} eq $f_id){&ER1("自分を対象にできません。");}
	if($in{'did'} < 2){&ER1("相手が選択されていません");}
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$in{'did'}]){
		&ER1("その役職は既に空席です。");
	}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
		&ER1("部隊長以外実行できません。");
	}
	$e_id=$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$in{'did'}];
	&P_READ("p","$e_id","$e_id");
				$lscmess = "$p_name{$e_id}を$gundan_name{$fgundan_id}部隊の$GUNDAN_KANBU[$in{'did'}]から解任";
				$lsmess = "$p_name{$e_id}を$gundan_name{$fgundan_id}部隊の$GUNDAN_KANBU[$in{'did'}]から解任";

			}else{

	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("権限を使用できるのは軍団幹部のみです。");
	}

			if($gundan_sinki_f{$fgundan_id}){
				$gundan_sinki_f{$fgundan_id} = 0;
				$mess = "可\ ";
			}else{
				$gundan_sinki_f{$fgundan_id} = 1;
				$mess = "拒否";
			}
				$lscmess = "$gundan_name{$fgundan_id}軍団を入団$messに";
				$lsmess = "$gundan_name{$fgundan_id}軍団を入団$messに";
			}

			if(!$akuthibu_c){
################

$a_a_d="gundan<>0<>$lscmess <><>$f_id<><>c<>$in{'mode2'}<>$in{'did'}<>$in{'mes'}<>$in{'rty'}<>$in{'rts'}<><>$p_gundan_yakusyoku{$f_id}<>$p_gundanno{$f_id}<>\n";
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
			}

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"gundan\" /><input type=\"submit\" value=\"軍団編成画面に戻る\" />","");#CD_END
	exit;
}
1;