
sub MOVE {

	if($in{'sel'} eq "") { &ER1("選択されていません"); }


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;

	$e_id=$in{'sel'};
	&P_READ("p","$e_id","$e_id");

	if(!$p_name{$e_id}){
&ER1("相手先のIDが稼動していません。");
	}
	if($k_kokka_keitai{$fk_id}){
&ER1("賊は部下を解雇することができません。");
	}
	if($k_yakusyoku_id{$fk_id}[15] eq $e_id or $k_yakusyoku_id{$fk_id}[1] eq $e_id or $k_yakusyoku_id{$fk_id}[2] eq $e_id or $k_yakusyoku_id{$fk_id}[3] eq $e_id or $k_yakusyoku_id{$fk_id}[16] eq $e_id or $k_yakusyoku_id{$fk_id}[17] eq $e_id or $k_yakusyoku_id{$fk_id}[18] eq $e_id){
&ER1("${$zokukanbuptn}[15]・上公・三孤を解雇することはできません。");
	}

require "./p_db/tt/kcs4$f_id.pl";
	if($k_yakusyoku_id{$fk_id}[23] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("${$zokukanbuptn}[23]か上公か三孤でなければ実行できません。");}


		$ttadd = 0;
	if($p_kuni_yakusyoku{$e_id}){
		if($k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id){
&ER1("${$zokukanbuptn}[23]・三孤は幹部を解雇する権限がありません。");
		}else{
		$ttadd = 86400;
		}
	}

	if($p_kunino{$f_id} ne $p_kunino{$e_id}) { &ER1("他国に干渉は出来ません。"); }
	if($f_id eq $p_id{$e_id}) { &ER1("自分を解雇できません。"); }
$e2os = $p_kuni_sikan_nensuu{$e_id} - 15;
	if($e2os < 0){
$e2os = 0;
	}


$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);


	if($ntt5[$i] >$tt){
$wtt = $ntt5[$i] - $tt;
&ER1("残り$wtt秒間、天子への進言を実行できません。");
	}

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";

		$ttadd += int($e2os * $kousin_kankaku * 0.4);

		$ntt5[$i] = $tt + $ttadd;
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$nnamae6[$i]<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

################

$a_a_d="kaiko_kuni<>0<>$p_name{$e_id}を解雇 <><>$f_id<><><>$e_id<><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$p_name{$e_id}を解雇 を<br />アクティブコマンドとして予約しました。";

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

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END



	exit;

}
1;