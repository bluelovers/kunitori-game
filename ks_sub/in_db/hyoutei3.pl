
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";
	if($rank_mes eq ""){&ER1("幹部でなければ実行できません。");}

	if($k_kokka_keitai{$fk_id}){
&ER1("賊は再評定を行えません。");
	}
require "$mpg_r/sub_db/tw.pl";

		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("tosi_db","$ft_id","$ft_id");
		}
	}
closedir(DFR);

	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

$mwyear = int($keika_nen/10 +1)*10;
$mwyear += $KAISI_NEN;
$mthit = 0;
		if($keika_nen % 10 < 3){
$mtno = 2;
$mwyear2 = $mwyear - 8;
$mtcome = "<br />注：次の再評定で目標を変更した場合、採決の日から次期評定までの期間（７年間）で目標を達成させなければなりません。";
		}elsif($keika_nen % 10 < 6){
$mtno = 3;
$mwyear2 = $mwyear - 5;
$mtcome = "<br />注：次の再評定で目標を変更した場合、採決の日から次期評定までの期間（４年間）で目標を達成させなければなりません。";
		}else{
$mwyear2 = $mwyear;
$mtno = 3;
$mthit = 1;
&ER1("末尾が『6』～『9』の年は、再評定が開けません。");
		}

$sousyuu = int($k_zenki_sou_syuunyuu{$fk_id} *1.5);

$add_busyou_kazei = "$k_busyou_kazei{$fk_id}％";
								if($k_kouryaku_mokuhyou{$fk_id}[0] eq "1"){
$comk = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "2"){
$comk = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。
目標都市を落とし、現領土を維持した暁には、都市$t_name[$k_katujyou_tosi{$fk_id}[0]]を、盟友$k_name_d[$k_katujyou_aite{$fk_id}[0]]に差し出す。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "3"){
$comk = "国の総収入を$sousyuu以上にする。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "4"){
$comk = "大国：$k_name_d[$k_kyuusai_aite{$fk_id}[0]]に付き従い、領土拡張を図る。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "11"){
$comk = "大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "12"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "13"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
国の総収入を$sousyuu以上にする。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。税率：$add_busyou_kazei";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] < 1){
$comk = "天子が即位したばかりで評定はまだ開かれていません。";
								}


$i = 0;
$hiti = 0;
$comlv = 0;
	if($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
$i = 7;
$comlv += 3;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc7 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
$i = 10;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc10 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
$i = 8;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc8 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
$i = 9;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc9 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
$i = 11;
$comlv += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc11 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
$i = 4;
$comlv += 4;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc4 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
$i = 5;
$comlv += 4;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc5 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
$i = 6;
$comlv += 4;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc6 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
$i = 12;
$comlv += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc12 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
$i = 13;
$comlv += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc13 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
$i = 14;
$comlv += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc14 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
$i = 19;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc19 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
$i = 20;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc20 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
$i = 21;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc21 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
$i = 22;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc22 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
$i = 23;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc23 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
$i = 24;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc24 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
$i = 25;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc25 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
$i = 26;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc26 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
$i = 27;
$comlv += 2;
$comlv2 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc27 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}


	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
$hiti = $i;
$i = 1;
$comlv += 5;
$comlv3 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc1 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
$hiti = $i;
$i = 2;
$comlv += 5;
$comlv3 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc2 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
$hiti = $i;
$i = 3;
$comlv += 5;
$comlv3 += 1;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc3 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[16] eq "$f_id"){
$hiti = $i;
$i = 16;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc16 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[17] eq "$f_id"){
$hiti = $i;
$i = 17;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc17 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}elsif($k_yakusyoku_id{$fk_id}[18] eq "$f_id"){
$hiti = $i;
$i = 18;
$comlv += 2;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc18 $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	}

	if($i < 1){&ER1("権限がありません。");}

	open(IN,"./w_db/k_db_l_kuni_db.cgi");
	@COU_DATA = <IN>;
	close(IN);

	foreach(@k_no_all_l){
		$add_cno_c[$_]=int($_);
	}
						if($in{'cno'} ne "" and $mthit < 1){
	if ($in{'cno'} =~ m/[^0-9]/) {&ER1("通報しますた！"); }
	if ($in{'cnot'} =~ m/[^0-9]/) {&ER1("通報しますた！"); }
	if ($in{'cnotk'} =~ m/[^0-9]/) {&ER1("通報しますた！"); }
	if ($in{'cnokk'} =~ m/[^0-9]/) {&ER1("通報しますた！"); }
	if ($in{'cnokk2'} =~ m/[^0-9]/) {&ER1("通報しますた！"); }
	if ($in{'cno'} > $tosi_kazu) {&ER1("通報しますた！"); }


					if($hiti > 0){
$hiti2 = $i;
$i = $hiti;
								if($in{'sakusen'} eq "1" and $in{'cnot'} < $tosi_kazu){
$ft_id = $in{'cnot'};
	if ($t_kunino{$ft_id} eq $p_kunino{$f_id}) {&ER1("自国の都市を対称にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>1<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "2" and $in{'cnot'} < $tosi_kazu and $in{'cnotk'} < $tosi_kazu and $add_cno_c[$in{'cnokk'}]){

$ft_id = $in{'cnot'};
	if ($t_kunino{$ft_id} eq $p_kunino{$f_id}) {&ER1("自国の都市を対称にすることは出来ません。"); }
	if ($t_kunino{$ft_id} eq $in{'cnokk'} or $p_kunino{$f_id} eq $in{'cnokk'}) {&ER1("自国や敵国に領地を差し出すことは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>2<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>$in{'cnokk'}<>$in{'cnotk'}<>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "3"){
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>3<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "4" and $add_cno_c[$in{'cnokk'}]){
	if ($p_kunino{$f_id} eq $in{'cnokk'}) {&ER1("自国や敵国に事大することは出来ません。"); }


	if ($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 3 > $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}]) {&ER1("事大先は自国の３倍以上の国力（武将数×都市数）でなければなりません。"); }

@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>4<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "11" and $add_cno_c[$in{'cnokk'}]){

		$fk_id = $in{'cnokk'};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if (!$k_kunino{$fk_id}) {&ER1("その国は滅んでいます。"); }
	if ($k_kokka_keitai{$fk_id}) {&ER1("賊は救援対象に出来ません。"); }


	if (($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]]) or 
($town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]])) {
&ER1("救援先は自国の２倍以上＆救援先の国の２倍以上の国力（武将数×都市数）を誇る大国から交戦指定されていなければなりません。"); }

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if ($in{'cnokk'} eq $p_kunino{$f_id}) {&ER1("自国を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>11<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "12" and $in{'cnot'} < $tosi_kazu and $add_cno_c[$in{'cnokk'}]){

		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }
$ft_id = $in{'cnot'};
	if ($t_kunino{$ft_id} eq $p_kunino{$f_id}) {&ER1("自国の都市を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>12<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>0<><>$in{'cnokk'}<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "13" and $add_cno_c[$in{'cnokk'}]){
		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>13<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>$in{'cnokk'}<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "14" and $add_cno_c[$in{'cnokk'}] and $add_cno_c[$in{'cnokk2'}]){

		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk2'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }

		$fk_id = $in{'cnokk'};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if (!$k_kunino{$fk_id}) {&ER1("その国は滅んでいます。"); }
	if ($k_kokka_keitai{$fk_id}) {&ER1("賊は救援対象に出来ません。"); }


	if (($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]]) or 
($town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]])) {
&ER1("救援先は自国の２倍以上＆救援先の国の２倍以上の国力（武将数×都市数）を誇る大国から交戦指定されていなければなりません。"); }

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if ($in{'cnokk'} eq $p_kunino{$f_id}) {&ER1("自国を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>14<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>$in{'cnokk2'}<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "61"){
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>0<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);
$i = $hiti2;

					}


								if($in{'sakusen'} eq "1" and $in{'cnot'} < $tosi_kazu){
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>1<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "2" and $in{'cnot'} < $tosi_kazu and $in{'cnotk'} < $tosi_kazu and $add_cno_c[$in{'cnokk'}]){

$ft_id = $in{'cnot'};

	if ($t_kunino{$ft_id} eq $in{'cnokk'}) {&ER1("敵国に領地を差し出すことは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>2<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>$in{'cnokk'}<>$in{'cnotk'}<>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "3"){
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>3<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "4" and $add_cno_c[$in{'cnokk'}]){
	if ($p_kunino{$f_id} eq $in{'cnokk'}) {&ER1("自国や敵国に事大することは出来ません。"); }


	if ($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 3 > $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}]) {&ER1("事大先は自国の３倍以上の国力（武将数×都市数）でなければなりません。"); }

@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>4<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "11" and $add_cno_c[$in{'cnokk'}]){

		$fk_id = $in{'cnokk'};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if (!$k_kunino{$fk_id}) {&ER1("その国は滅んでいます。"); }
	if ($k_kokka_keitai{$fk_id}) {&ER1("賊は救援対象に出来ません。"); }


	if (($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]]) or 
($town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]])) {
&ER1("救援先は自国の２倍以上＆救援先の国の２倍以上の国力（武将数×都市数）を誇る大国から交戦指定されていなければなりません。"); }

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if ($in{'cnokk'} eq $p_kunino{$f_id}) {&ER1("自国を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>11<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "12" and $in{'cnot'} < $tosi_kazu and $add_cno_c[$in{'cnokk'}]){

		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }
$ft_id = $in{'cnot'};
	if ($t_kunino{$ft_id} eq $p_kunino{$f_id}) {&ER1("自国の都市を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>12<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<>$in{'cnot'}<>0<><>$in{'cnokk'}<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "13" and $add_cno_c[$in{'cnokk'}]){
		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>13<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>$in{'cnokk'}<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "14" and $add_cno_c[$in{'cnokk'}] and $add_cno_c[$in{'cnokk2'}]){

		$tyohit2=0;
		&KOUSEN_AITE_HIT("$tyohit2","$in{'cnokk2'}","$fk_id");
		$tyohit2=$kousen_aite_hit;
	if (!$tyohit2) {&ER1("その国に対しては交戦指定をしていません。"); }

		$fk_id = $in{'cnokk'};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if (!$k_kunino{$fk_id}) {&ER1("その国は滅んでいます。"); }
	if ($k_kokka_keitai{$fk_id}) {&ER1("賊は救援対象に出来ません。"); }


	if (($town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$p_kunino{$f_id}] * $k_busyou_suu[$p_kunino{$f_id}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]]) or 
($town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[0]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[0]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[1]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[1]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[2]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[2]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[3]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[3]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[4]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[4]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[5]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[5]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[6]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[6]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[7]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[7]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[8]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[8]] and $town_get[$in{'cnokk'}] * $k_busyou_suu[$in{'cnokk'}] * 2 > $town_get[$k_kousen_aite_k{$fk_id}[9]] * $k_busyou_suu[$k_kousen_aite_k{$fk_id}[9]])) {
&ER1("救援先は自国の２倍以上＆救援先の国の２倍以上の国力（武将数×都市数）を誇る大国から交戦指定されていなければなりません。"); }

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if ($in{'cnokk'} eq $p_kunino{$f_id}) {&ER1("自国を対象にすることは出来ません。"); }
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>14<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>$in{'cnokk2'}<>$in{'cnokk'}<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}elsif($in{'sakusen'} eq "61"){
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>0<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$p_name{$f_id}<><>0<><>0<>0<>$in{'cno'}<>$f_id<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
	print OUT @new_charak;
	close(OUT);
								}
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i $mtno.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

						}else{$comr = "提案内容が未設定です。現在の評定内容を支持します。";
						}
	$xx=0;
		$cnl = "";
	foreach(@t_name){
		$cnl .= "<option value=\"$xx\">$t_name[$xx]</option>";
		$xx++;
	}

	foreach(@k_seizon_l){
		$ek_id=$_;
			$dilect_mes .= "<option value=\"$k_kunino[$ek_id]\">$k_name[$ek_id]</option>";

	}

								if($nzei12[$i] eq "61"){
$nzei12[$i] = "現状維持";
								}else{
$nzei12[$i] = "$nzei12[$i]％";
								}


								if($nhyou2[$i] eq "1"){
$comr = "$t_name[$nkout7[$i]]の城を陥落させ、領土を増やす。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "2"){
$comr = "$t_name[$nkout7[$i]]の城を陥落させ、領土を増やす。
目標都市を落とし、現領土を維持した暁には、都市$t_name[$nkatut9[$i]]を、盟友$k_name_d[$nkatuk8[$i]]に差し出す。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "3"){
$comr = "国の総収入を$sousyuu以上にする。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "4"){
$comr = "大国：$k_name_d[$nkyuuk11[$i]]に付き従い、領土拡張を図る。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "11"){
$comr = "大国に脅かされ窮地に陥っている盟友$k_name_d[$nkyuuk11[$i]]を護りとおす。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "12"){
$comr = "$k_name_d[$nteik10[$i]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
$t_name[$nkout7[$i]]の城を陥落させ、領土を増やす。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "13"){
$comr = "$k_name_d[$nteik10[$i]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
国の総収入を$sousyuu以上にする。税率：$nzei12[$i]";
								}elsif($nhyou2[$i] eq "14"){
$comr = "$k_name_d[$nteik10[$i]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
大国に脅かされ窮地に陥っている盟友$k_name_d[$nkyuuk11[$i]]を護りとおす。税率：$nzei12[$i]";
								}else{
$comr = "提案内容が未設定です。現在の評定内容を支持します。";
								}
	&HEADER;
	print <<"PRI";

<span class=\"fs4\">$k_name{$fk_id}：再評定会議</span>
<hr /><br />次期再評定・提案期限⇒$mwyear2年12月。<br />今期の攻略目標⇒$comk。<br />貴方が提案する再評定目標⇒$comr。<br />貴方の発言力⇒発言Lv$comlv。<br /><hr /><br /><strong>次期再評定会議における貴方の提案を入力してください。$mtcome</strong>
<table border=\"1\" width=\"760\"><tr>
<td width=140>
『現状維持』</td><td width=\"610\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"61\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".cno.\" value=\"61\" />
新たな提案を行わず、現在の評定内容を支持します。
<input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『敵城攻略』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"1\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><select name=\".cnot.\">$cnl
</select><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />の城を陥落させ、領土を増やす。
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％<option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『敵城攻略＆領地割譲』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"2\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><select name=\".cnot.\">$cnl
</select><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />の城を陥落させ、領土を増やす。
目標都市を落とし、現領土を維持した暁には、<br />都市<select name=\".cnotk.\">$cnl</select>を、盟友<select name=\".cnokk.\">$dilect_mes</select>に差し出す。
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％<option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『収入アップ』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"3\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
内政を重視し、自国の総収入を$mwyear年までに$sousyuu以上にする。<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『事大政策』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"4\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
大国<select name=\".cnokk.\">$dilect_mes</select>に付き従い、領土拡張を図る。<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『盟友救援』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"11\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
大国に脅かされ窮地に陥っている盟友<select name=\".cnokk.\">$dilect_mes</select>を護りとおす。<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『停戦＆敵城攻略』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"12\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<select name=\".cnokk.\">$dilect_mes</select>に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
<select name=\".cnot.\">$cnl
</select><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />の城を陥落させ、領土を増やす。
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『停戦＆税収アップ』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"13\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<select name=\".cnokk.\">$dilect_mes</select>に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
内政を重視し、自国の総収入を$mwyear年までに$sousyuu以上にする。
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr><tr>

<td>
『停戦＆盟友救援』</td><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".sakusen.\" value=\"14\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei3\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<select name=\".cnokk2.\">$dilect_mes</select>に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
大国に脅かされ窮地に陥っている盟友<select name=\".cnokk.\">$dilect_mes</select>を護りとおす。<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<br />武将に対する所得税率：<select name=\".cno.\"><option value=\"61\">現状維持</option><option value=\"1\">1％</option><option value=\"5\">5％</option><option value=\"10\">10％</option><option value=\"15\">15％</option><option value=\"20\">20％</option>
</select><input type=\"submit\" value=\"この案を選択\" /></div></form></td></tr>
</table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=sirei><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"中書省へ戻る\" /></div></form>
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>
PRI

	&FOOTER;
	exit;

}

1;