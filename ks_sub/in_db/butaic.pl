
sub MOVE {


require "$mpg_r/sub_db/butai_kanbu.pl";
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");

	if($k_kunino{$fk_id} eq "0"){&ER1("国家無所属武将は実行できません。");}
	if(!$fbutai_id){&ER1("部隊未所属です。");}


			if($in{'mode2'} eq "8"){

	&MOJISUU($in{'mes'},40);
	if($mojisuu_o) { &ER1("指令文は、２０文字以下で入力して下さい。。$mojisuu_re"); }
	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
		&ER1("解雇権限を使用できるのは部隊の幹部のみです。");
	}
				$lscmess = "$butai_name{$fbutai_id}部隊の指令文を変更";
				$lsmess = "$butai_name{$fbutai_id}部隊の指令文を「$in{'mes'}」に";
			}elsif($in{'mode2'} eq "9"){

	&MOJISUU($in{'mes'},40);
	if($mojisuu_o) { &ER1("勧誘文は、２０文字以下で入力して下さい。。$mojisuu_re"); }
	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
		&ER1("解雇権限を使用できるのは部隊の幹部のみです。");
	}
				$lscmess = "$butai_name{$fbutai_id}部隊の勧誘文を変更";
				$lsmess = "$butai_name{$fbutai_id}部隊の勧誘文を「$in{'mes'}」に";

			}elsif($in{'mode2'} eq "6"){

	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
	$d_id=$butai_yakusyoku_id{$p_butaino{$f_id}}[1];
	&P_READ("p","$d_id","$d_id");
	if($p_butai_yakusyoku{$d_id} eq "1"){
		&ER1("部隊長以外実行できません。");
	}
	}else{
	if($in{'did'} eq $f_id){&ER1("自分に委譲できません。");}
	}
	if($p_butaino{$f_id} ne $p_butaino{$e_id}){
		&ER1("部隊が異なります。");
	}
				$lscmess = "$butai_name{$fbutai_id}部隊の指揮権を$p_name{$e_id}に委譲";
				$lsmess = "$butai_name{$fbutai_id}部隊の指揮権を$p_name{$e_id}に委譲";

			}elsif($in{'mode2'} eq "7"){

#$hit =0;
#$add_no =2;
#	while($add_no < 7){
#	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]){
#$hit =$add_no;
#	}
#$add_no ++;
#	}
#	if(!$hit){&ER1("役職に空きがありません。誰かを解任してください。");}
$hit =2;
	if($in{'did'} eq $f_id){&ER1("自分に委譲できません。");}
	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
		&ER1("部隊長以外実行できません。");
	}
	if($p_butaino{$f_id} ne $p_butaino{$e_id}){
		&ER1("部隊が異なります。");
	}
				$lscmess = "$p_name{$e_id}を$butai_name{$fbutai_id}部隊の$BUTAI_KANBU[$hit]に任命";
				$lsmess = "$p_name{$e_id}を$butai_name{$fbutai_id}部隊の$BUTAI_KANBU[$hit]に任命";

			}elsif($in{'mode2'} eq "5"){

	if($in{'did'} eq $f_id){&ER1("自分を対象にできません。");}
	if($in{'did'} < 2){&ER1("相手が選択されていません");}
	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$in{'did'}]){
		&ER1("その役職は既に空席です。");
	}
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
		&ER1("部隊長以外実行できません。");
	}
	$e_id=$butai_yakusyoku_id{$p_butaino{$f_id}}[$in{'did'}];
	&P_READ("p","$e_id","$e_id");
				$lscmess = "$p_name{$e_id}を$butai_name{$fbutai_id}部隊の$BUTAI_KANBU[$in{'did'}]から解任";
				$lsmess = "$p_name{$e_id}を$butai_name{$fbutai_id}部隊の$BUTAI_KANBU[$in{'did'}]から解任";

			}else{

	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
		&ER1("解雇権限を使用できるのは部隊の幹部のみです。");
	}

			if($butai_sinki_f{$fbutai_id}){
				$butai_sinki_f{$fbutai_id} = 0;
				$mess = "可\ ";
			}else{
				$butai_sinki_f{$fbutai_id} = 1;
				$mess = "拒否";
			}
				$lscmess = "$butai_name{$fbutai_id}部隊を入隊$messに";
				$lsmess = "$butai_name{$fbutai_id}部隊を入隊$messに";
			}

################

$a_a_d="butai<>0<>$lscmess <><>$f_id<><>c<>$in{'mode2'}<>$in{'did'}<>$in{'mes'}<>$in{'rty'}<>$in{'rts'}<><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
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