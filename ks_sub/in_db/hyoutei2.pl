
sub MOVE {



	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";
	if($rank_mes eq ""){&ER1("幹部でなければ実行できません。");}

	if($k_kokka_keitai{$fk_id}){
&ER1("賊は皇位禅定を行えません。");
	}
require "$mpg_r/sub_db/tw.pl";

$i = 0;
$hiti = 0;
	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
$hiti = 1;
$i = 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc1.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
$hiti = 2;
$i = 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc2.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
$hiti = 3;
$i = 3;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc3.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}

	if($i < 1){&ER1("権限がありません。");}


						if($in{'cno'} ne ""){
	&MOJISUU($in{'cno'},16);
	if ($mojisuu_h_all < 2 or $mojisuu_o) {&ER1("全角大文字換算で１～８字以内でお願いします。"); }


@new_charak=();
	unshift(@new_charak,"$in{'cno'} <>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);


						}

								if($nten1[$i] eq ""){
$nten1[$i] = "$k_tensi_name{$fk_id}";
								}

	&HEADER;
	print <<"PRI";

<span class=\"fs4\">皇位禅譲</span>
<hr /><br />$k_name{$fk_id} / 現在の天子⇒「$k_tensi_name{$fk_id}」<br />貴方が推薦する来期の天子⇒「$nten1[$i]」
<br /><hr /><br /><strong>現在の天子を廃し、新たな天子を擁立したい場合は、来期に推薦する天子の名前を入力してください。</strong>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"hyoutei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"text\" name=\".cno.\" size=\"20\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"この天子を推薦\" /></div></form>（全角大文字２～８字）

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"中書省へ戻る\" /></div></form>
PRI

	&FOOTER;
	exit;


}
1;