
sub MOVE{

	&P_OPEN;
	&TT_GET;
	&HOST_NAME;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./$mpg_r/sub_db/kanbu.pl";


				&KANBU_NAME;
	if($k_kunino{$fk_id} eq "0"){&ER1("無所属武将は実行できません。");}
	if($in{'del_id'} eq "") { &ER1("メッセージが選択されていません。"); }
	if($k_yakusyoku_id{$fk_id}[27] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("${$zokukanbuptn}[27]か上公か三孤でなければ実行できません。");}


$i = 0;
    &F_LOCK("kokuhou");

	if($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
$i = 7;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc7.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
$i = 10;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc10.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
$i = 8;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc8.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
$i = 9;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc9.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
$i = 11;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc11.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
$i = 4;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc4.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
$i = 5;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc5.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
$i = 6;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc6.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
$i = 12;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc12.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
$i = 13;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc13.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
$i = 14;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc14.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}


	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
$i = 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc1.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
$i = 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc2.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
$i = 3;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc3.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[16] eq "$f_id"){
$i = 16;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[17] eq "$f_id"){
$i = 17;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[18] eq "$f_id"){
$i = 18;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
$i = 27;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}

	if($ntt5[$i] >$tt){
$wtt = $ntt5[$i] - $tt;
&ER1("残り$wtt秒間、国法の削除を実行できません。");
	}

		$ntt5[$i] = $tt + 43200;
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$nnamae6[$i]<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

	open(IN,"./w_db/kuni/lr$p_kunino{$f_id}.cgi");
	@LOCAL_DATA = <IN>;
	close(IN);

	$hit=0;@NEW_LOCAL_DATA=();
	foreach(@LOCAL_DATA){
	($bbid,$bbval,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
		if($bbval eq $in{'del_id'}){
			$hit=1;
			$mes = "$bbmes";
		}else{
			push(@NEW_LOCAL_DATA,"$_");
		}
	}
	if(!$hit){&ER1("その国法は削除できません。");}

	open(OUT,">./w_db/kuni/lr$p_kunino{$f_id}.cgi");
	print OUT @NEW_LOCAL_DATA;
	close(OUT);

	&UNLOCK_FILE("kokuhou");

	&CD_END("$mesを削除しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;
	
}
1;