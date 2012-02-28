
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	&TT_GET;


require "./p_db/tt/kcs4$f_id.pl";
	if($rank_mes eq ""){&ER1("幹部でなければ実行できません。");}
	if(!$in{'type'}){&ER1("番号を選択してください。");}

$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);


#	if($ntt5[$i] >$tt){
#$wtt = $ntt5[$i] - $tt;
#&ER1("残り$wtt秒間、天子への進言を実行できません。");
#	}


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

##################
							$in{'type'} = abs(int($in{'type'})-1);
							$tyouhei_no = $in{'type'}+1;
	if($in{'sel'} eq ""){
$a_a_d="tkyoka<>0<>No$tyouhei_noの$t_name[$k_kouhou_tyouhei{$fk_id}[$in{'type'}]]の徴兵許可\を取消 <><>$f_id<><>$in{'type'}<>$in{'sel'}<>$tyouhei_no<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "No$tyouhei_noの$t_name[$k_kouhou_tyouhei{$fk_id}[$in{'type'}]]の徴兵許可\を取消 を<br />アクティブコマンドとして予約しました。";
	}else{
							$in{'sel'} = int($in{'sel'});
$a_a_d="tkyoka<>0<>No$tyouhei_noに$t_name[$in{'sel'}]の後方徴兵許可\ <><>$f_id<><>$in{'type'}<>$in{'sel'}<>$tyouhei_no<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "No$tyouhei_noに$t_name[$in{'sel'}]の後方徴兵許可\ を<br />アクティブコマンドとして予約しました。";
	}
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
###################

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END



	exit;

}



1;