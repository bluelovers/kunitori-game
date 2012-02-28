
sub MOVE{

	&P_OPEN;
	&TT_GET;
	&HOST_NAME;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if($in{'ins'} =~ m/entrance/){&ER1("不正入力です。"); }

	if($k_kunino{$fk_id} eq "0"){&ER1("無所属武将は実行できません。");}
	&MOJISUU($in{'title'},20);
	if($mojisuu_o) { &ER1("手短に国法を伝えてください。題名。$mojisuu_re"); }
	&MOJISUU($in{'ins'},2000);
	if($mojisuu_o) { &ER1("手短に国法を伝えてください。本文。$mojisuu_re"); }
	if($in{'ins'} eq "") { &ER1("国法が記入されていません。"); }

require "./p_db/tt/kcs4$f_id.pl";
	if($rank_mes eq ""){&ER1("幹部でなければ実行できません。");}


	$hit = 0;
	@insl = split(/<br $TAG_s0>/,$in{'ins'});
	foreach(@insl){
		if(length($_) > 110){
	$hit = 1;
	$add_eiji = $_;
	$eiji_kazu = ($add_eiji =~ tr/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/);
	if($eiji_kazu > 110) {
&ER1("英数字＆記号文字列が多すぎます。せめて改行してください。");
	}
		}
	}
	if($in{'t'} eq "pre"){
		if(!$hit){
	$mes_ins = "<pre>";
	$mes_ins .= "$in{'ins'}";
	$mes_ins .= "</pre>";
	$in{'ins'} = $mes_ins;
		}
	}
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

	}elsif($k_yakusyoku_id{$fk_id}[15] eq "$f_id"){
$i = 15;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc15.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}

	if($ntt5[$i] >$tt){
$wtt = $ntt5[$i] - $tt;
&ER1("残り$wtt秒間、国法の設定を実行できません。");
	}

		$ntt5[$i] = $tt + 60;
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$nnamae6[$i]<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

	open(IN,"./w_db/kuni/lr$p_kunino{$f_id}.cgi");
	@LOCAL_DATA = <IN>;
	close(IN);

	$bbs_num = @LOCAL_DATA;
	if($bbs_num > 29) { 
&ER1("国法が３０件に達しています。いらない物を消してから書き込んでください。"); }

	($bbid,$bbno)=split(/<>/,$LOCAL_DATA[0]);
	$bbval=$bbno+1;

	if($in{"type"} eq "all"){$bbtype = 1;}else{$bbtype = 0;}
	unshift(@LOCAL_DATA,"$f_id<>$bbval<>$in{'ins'}<>$p_img{$f_id}$p_img_f{$f_id}<>$p_name{$f_id}より$tt_date<>$host<>$tt_date<>$kele<>$p_kunino{$f_id}<>$bbtype<>$bno<>$b_threadno<>$p_cg_sabano{$f_id}<>$URI_kosaba<>\n");

	open(OUT,">./w_db/kuni/lr$p_kunino{$f_id}.cgi");
	print OUT @LOCAL_DATA;
	close(OUT);

	&UNLOCK_FILE("kokuhou");

	&CD_END("新たな国法を発令しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;
	
}
1;