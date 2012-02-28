
sub MOVE {

	if($in{'sel'} eq ""){&ER1("任命相手が入力されていません。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	&TT_GET;

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


				&KANBU_NAME;


$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);


	if($ntt5[$i] >$tt){
$wtt = $ntt5[$i] - $tt;
&ER1("残り$wtt秒間、天子への進言を実行できません。");
	}




	$e_id=$in{'sel'};
	&P_READ("p","$e_id","$e_id");

	if(!$p_name{$e_id}){
&ER1("相手先のIDが稼動していません。");
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

	if($in{'type'} eq "15"){
	if($k_yakusyoku_id{$fk_id}[15] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id){&ER1("${$zokukanbuptn}[15]か${$zokukanbuptn}[1]でなければ実行できません。");}

		$add = ${$zokukanbuptn}[15];
	}

	if($in{'type'} eq "16"){
	if($k_yakusyoku_id{$fk_id}[1] ne $f_id){&ER1("${$zokukanbuptn}[1]でなければ実行できません。");}

	if($k_yakusyoku_id{$fk_id}[1] eq $e_id or $k_yakusyoku_id{$fk_id}[2] eq $e_id or $k_yakusyoku_id{$fk_id}[3] eq $e_id or $k_yakusyoku_id{$fk_id}[16] eq $e_id or $k_yakusyoku_id{$fk_id}[17] eq $e_id or $k_yakusyoku_id{$fk_id}[18] eq $e_id){
&ER1("対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
	}
		$add = ${$zokukanbuptn}[16];
	}


	if($in{'type'} eq "17"){
	if($k_yakusyoku_id{$fk_id}[2] ne $f_id){&ER1("${$zokukanbuptn}[2]でなければ実行できません。");}
	if($k_yakusyoku_id{$fk_id}[1] eq $e_id or $k_yakusyoku_id{$fk_id}[2] eq $e_id or $k_yakusyoku_id{$fk_id}[3] eq $e_id or $k_yakusyoku_id{$fk_id}[16] eq $e_id or $k_yakusyoku_id{$fk_id}[17] eq $e_id or $k_yakusyoku_id{$fk_id}[18] eq $e_id){
&ER1("対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
	}
		$add = ${$zokukanbuptn}[17];
	}
	if($in{'type'} eq "18"){
	if($k_yakusyoku_id{$fk_id}[3] ne $f_id){&ER1("${$zokukanbuptn}[3]でなければ実行できません。");}
	if($k_yakusyoku_id{$fk_id}[1] eq $e_id or $k_yakusyoku_id{$fk_id}[2] eq $e_id or $k_yakusyoku_id{$fk_id}[3] eq $e_id or $k_yakusyoku_id{$fk_id}[16] eq $e_id or $k_yakusyoku_id{$fk_id}[17] eq $e_id or $k_yakusyoku_id{$fk_id}[18] eq $e_id){
&ER1("対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
	}
		$add = ${$zokukanbuptn}[18];
	}

	if(!$add){
&ER1("任命対象が選択されていません。");
	}
	if($p_kunino{$e_id} ne $p_kunino{$f_id}){
		&ER1("国が違います。");
	}

		$ntt5[$i] = $tt + int(24 * $kousin_kankaku);
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$nnamae6[$i]<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);


################

							$in{'type'} = abs(int($in{'type'}));
$a_a_d="ninmei<>0<>$p_name{$e_id}を${$zokukanbuptn}[$in{'type'}]に任命 <><>$f_id<><>$in{'type'}<>$e_id<><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$p_name{$e_id}を${$zokukanbuptn}[$in{'type'}]に任命 を<br />アクティブコマンドとして予約しました。";

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