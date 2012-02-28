
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

#	if($k_kunino{$fk_id} eq "0"){&ER1("国家無所属武将は実行できません。");}


#	if(!$fgundan_id){&ER1("軍団未所属です。");}

	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
		&ER1("軍団長は実行できません。");
	}

			if($in{'bsirei1'} eq "1"){
				$bzc = 1;
				$bsirei1 = "単独行動";
			}elsif($in{'bsirei1'} eq "2"){
				$bzc = 2;
				$bsirei1 = "謀反密約";
			}else{
				$bzc = 0;
				$bsirei1 = "集合指示に従う";
			}
$p_gunsirei{$f_id}[0] = $bzc;


				$lsmess = "$gundan_name{$p_gundanno{$f_id}}軍団の指令を$bsirei1に";
				$lsmess2 = "$gundan_name{$p_gundanno{$f_id}}軍団の指令を$bsirei1に";

################

$a_a_d="gundan<>0<>$lsmess <><>$f_id<><>c2<>$in{'mode2'}<>$bzc<>$bzc2<>$bzc3<><>$lsmess2<>$p_gundan_yakusyoku{$f_id}<>$p_gundanno{$f_id}<>\n";
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

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"gundan\" /><input type=\"submit\" value=\"軍団編成画面に戻る\" />","");#CD_END

	exit;
}
1;