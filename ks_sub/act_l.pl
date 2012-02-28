
sub ACT_L {

opendir(DFR,"./p_db/act_cd");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;
	open(IN,"./p_db/act_cd/$f_id.cgi");
	@ACD_DB = <IN>;
	close(IN);
###############
@CD_DB=();
	&BAG_LOG("$p_id{$f_id}\n");
		if($p_id{$f_id}){
&ACT_CDW;
		}
###############
			if(@CD_DB){
	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
			}else{
unlink("./p_db/act_cd/$f_id.cgi");
			}
		}
	}
closedir(DFR);



opendir(DFR,"./p_db/kotei_cd");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;
	open(IN,"./p_db/kotei_cd/$f_id.cgi");
	@ACD_DB = <IN>;
	close(IN);
###############
@CD_DB=();
	&BAG_LOG("$p_id{$f_id}\n");
		if($p_id{$f_id}){
&ACT_CDW;
		}
###############
unlink("./p_db/kotei_cd/$f_id.cgi");
		}
	}
closedir(DFR);

}



sub ACT_CDW {

###############
$a_a_no =0;
$a_a_hit =0;
			for(@ACD_DB){
	($acd_id{$f_id}[$a_a_no],$acd_no{$f_id}[$a_a_no],$acd_name{$f_id}[$a_a_no],$acd_tt{$f_id}[$a_a_no],$acd_p_id{$f_id}[$a_a_no],$acd_e_id{$f_id}[$a_a_no],$acd_sub1{$f_id}[$a_a_no],$acd_sub2{$f_id}[$a_a_no],$acd_sub3{$f_id}[$a_a_no],$acd_sub4{$f_id}[$a_a_no],$acd_sub5{$f_id}[$a_a_no],$acd_sub6{$f_id}[$a_a_no],$acd_sub7{$f_id}[$a_a_no],$acd_sub8{$f_id}[$a_a_no],$acd_sub9{$f_id}[$a_a_no]) =split(/<>/,$ACD_DB[$a_a_no]);

	&BAG_LOG("$p_id{$f_id}ー$a_a_noー$acd_id{$f_id}[$a_a_no],$acd_no{$f_id}[$a_a_no],$acd_name{$f_id}[$a_a_no],$acd_tt{$f_id}[$a_a_no],$acd_p_id{$f_id}[$a_a_no],$acd_e_id{$f_id}[$a_a_no],$acd_sub1{$f_id}[$a_a_no],$acd_sub2{$f_id}[$a_a_no],$acd_sub3{$f_id}[$a_a_no],$acd_sub4{$f_id}[$a_a_no],$acd_sub5{$f_id}[$a_a_no],$acd_sub6{$f_id}[$a_a_no],$acd_sub7{$f_id}[$a_a_no],$acd_sub8{$f_id}[$a_a_no],$acd_sub9{$f_id}[$a_a_no]\n");
			if($a_a_hit){
push(@CD_DB , "$acd_id{$f_id}[$a_a_no]<>$acd_no{$f_id}[$a_a_no]<>$acd_name{$f_id}[$a_a_no]<>$acd_tt{$f_id}[$a_a_no]<>$acd_p_id{$f_id}[$a_a_no]<>$acd_e_id{$f_id}[$a_a_no]<>$acd_sub1{$f_id}[$a_a_no]<>$acd_sub2{$f_id}[$a_a_no]<>$acd_sub3{$f_id}[$a_a_no]<>$acd_sub4{$f_id}[$a_a_no]<>$acd_sub5{$f_id}[$a_a_no]<>$acd_sub6{$f_id}[$a_a_no]<>$acd_sub7{$f_id}[$a_a_no]<>$acd_sub8{$f_id}[$a_a_no]<>$acd_sub9{$f_id}[$a_a_no]<>\n");
$a_a_no ++;
next;
			}
	if(!$acd_no{$f_id}[$a_a_no]){
		$fk_id = $p_kunino{$f_id};
		$fbutai_id = $p_butaino{$f_id};
		$fgundan_id = $p_gundanno{$f_id};
		$ft_id = $p_taizai_iti{$f_id};
		$fhabatu_id = $p_habatuno{$f_id};
		$fpt_id = $p_ptno{$f_id};

						&{"ACD_ID$acd_id{$f_id}[$a_a_no]"}();
	}else{
			if($acd_no{$f_id}[$a_a_no] eq "1"){
$a_a_hit++;
$acd_no{$f_id}[$a_a_no]-=1;
push(@CD_DB , "$acd_id{$f_id}[$a_a_no]<>$acd_no{$f_id}[$a_a_no]<>$acd_name{$f_id}[$a_a_no]<>$acd_tt{$f_id}[$a_a_no]<>$acd_p_id{$f_id}[$a_a_no]<>$acd_e_id{$f_id}[$a_a_no]<>$acd_sub1{$f_id}[$a_a_no]<>$acd_sub2{$f_id}[$a_a_no]<>$acd_sub3{$f_id}[$a_a_no]<>$acd_sub4{$f_id}[$a_a_no]<>$acd_sub5{$f_id}[$a_a_no]<>$acd_sub6{$f_id}[$a_a_no]<>$acd_sub7{$f_id}[$a_a_no]<>$acd_sub8{$f_id}[$a_a_no]<>$acd_sub9{$f_id}[$a_a_no]<>\n");
			}elsif($acd_no{$f_id}[$a_a_no] eq "2"){
$a_a_hit++;
			}
	}
$a_a_no ++;
			}
###############

}



#######################
sub ACD_IDtkyoka {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}


$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1{$fk_id}[$i],$nhyou2{$fk_id}[$i],$nsaku3{$fk_id}[$i],$nkyou4{$fk_id}[$i],$ntt5{$fk_id}[$i],$nnamae6{$fk_id}[$i],$nkout7{$fk_id}[$i],$nkatuk8{$fk_id}[$i],$nkatut9{$fk_id}[$i],$nteik10{$fk_id}[$i],$nkyuuk11{$fk_id}[$i],$nzei12{$fk_id}[$i],$ndb13{$fk_id}[$i],$ndb14{$fk_id}[$i],$ndb15{$fk_id}[$i],$ndb16{$fk_id}[$i],$ndb17{$fk_id}[$i],$nseikou18{$fk_id}[$i],$ntuu19{$fk_id}[$i],$nhit{$fk_id}[$i]) = split(/<>/,$NPCOP1[0]);


	if($ntt5{$fk_id}[$i] >$tt){
$wtt = $ntt5{$fk_id}[$i] - $tt;
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：残り$wtt秒間、天子への進言を実行できません。");
next;
	}

		$ntt5{$fk_id}[$i] = $tt + 86400;
@new_charak=();
	unshift(@new_charak,"$nten1{$fk_id}[$i]<>$nhyou2{$fk_id}[$i]<>$nsaku3{$fk_id}[$i]<>$nkyou4{$fk_id}[$i]<>$ntt5{$fk_id}[$i]<>$nnamae6{$fk_id}[$i]<>$nkout7{$fk_id}[$i]<>$nkatuk8{$fk_id}[$i]<>$nkatut9{$fk_id}[$i]<>$nteik10{$fk_id}[$i]<>$nkyuuk11{$fk_id}[$i]<>$nzei12{$fk_id}[$i]<>$ndb13{$fk_id}[$i]<>$ndb14{$fk_id}[$i]<>$ndb15{$fk_id}[$i]<>$ndb16{$fk_id}[$i]<>$ndb17{$fk_id}[$i]<>$nseikou18{$fk_id}[$i]<>$ntuu19{$fk_id}[$i]<>$nhit{$fk_id}[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

	if($acd_sub2{$f_id}[$a_a_no] eq ""){
		if("" ne $k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]] and $t_name[$k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]]]){
									$ttid = "klog/$fk_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}の意向により、$t_name[$k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]]]に対する徴兵許可が取り消されました。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name[$k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]]]に対する徴兵許可が取り消されました。");
		}
	}else{
							$dt_id = $in{'sel'};

		if($fk_id eq $t_kunino{$acd_sub2{$f_id}[$a_a_no]} and $acd_sub2{$f_id}[$a_a_no] ne $k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]]){
									$ttid = "klog/$fk_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}の意向により、$t_name[$acd_sub2{$f_id}[$a_a_no]]での徴兵許可が下されました。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:後方都市$t_name[$acd_sub2{$f_id}[$a_a_no]]に対する徴兵を許可\しました。");
		}
	}

		$k_kouhou_tyouhei{$fk_id}[$acd_sub1{$f_id}[$a_a_no]] = $acd_sub2{$f_id}[$a_a_no];

		$ctyochit = 0;
		$k_kouhou_tyouhei_name{$fk_id} = "";
		foreach (@{$k_kouhou_tyouhei{$fk_id}}) {
	if($_ ne ""){
		$k_kouhou_tyouhei_name{$fk_id} .= "$t_name[$_] ";
		$ctyochit = 1;
	}
		}
	if($ctyochit == 0){
		$cntyo3 = "無し";
	}


		unlink("./w_db/mati/tyouheihit$acd_sub2{$f_id}[$a_a_no].cgi");

}

#######################
sub ACD_IDninmei {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}

				&KANBU_NAME;
		$add = "";
	$e_id=$acd_sub2{$f_id}[$a_a_no];
	if(!$p_name{$e_id}){
$w_id=$f_id;&P_LOG_W("国/任命：相手先のIDが稼動していません。");
next;
	}
	if($acd_sub1{$f_id}[$a_a_no] eq "15"){
	if($k_yakusyoku_id{$fk_id}[15] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/任命：${$zokukanbuptn}[15]か${$zokukanbuptn}[1]でなければ実行できません。");
next;
	}
		$add = ${$zokukanbuptn}[15];
	}

	if($acd_sub1{$f_id}[$a_a_no] eq "16"){
	if($k_yakusyoku_id{$fk_id}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/任命：${$zokukanbuptn}[1]でなければ実行できません。");
next;
	}

	$sel = $acd_sub2{$f_id}[$a_a_no];
	if($k_yakusyoku_id{$fk_id}[1] eq $sel or $k_yakusyoku_id{$fk_id}[2] eq $sel or $k_yakusyoku_id{$fk_id}[3] eq $sel or $k_yakusyoku_id{$fk_id}[16] eq $sel or $k_yakusyoku_id{$fk_id}[17] eq $sel or $k_yakusyoku_id{$fk_id}[18] eq $sel){

$w_id=$f_id;&P_LOG_W("国/任命：対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
next;
	}
		$add = ${$zokukanbuptn}[16];
	}


	if($acd_sub1{$f_id}[$a_a_no] eq "17"){
	if($k_yakusyoku_id{$fk_id}[2] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/任命：${$zokukanbuptn}[2]でなければ実行できません。");
next;
	}

	$sel = $acd_sub2{$f_id}[$a_a_no];
	if($k_yakusyoku_id{$fk_id}[1] eq $sel or $k_yakusyoku_id{$fk_id}[2] eq $sel or $k_yakusyoku_id{$fk_id}[3] eq $sel or $k_yakusyoku_id{$fk_id}[16] eq $sel or $k_yakusyoku_id{$fk_id}[17] eq $sel or $k_yakusyoku_id{$fk_id}[18] eq $sel){
$w_id=$f_id;&P_LOG_W("国/任命：対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
next;
	}
		$add = ${$zokukanbuptn}[17];
	}
	if($acd_sub1{$f_id}[$a_a_no] eq "18"){
	if($k_yakusyoku_id{$fk_id}[3] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/任命：${$zokukanbuptn}[3]でなければ実行できません。");
next;
	}

	$sel = $acd_sub2{$f_id}[$a_a_no];
	if($k_yakusyoku_id{$fk_id}[1] eq $sel or $k_yakusyoku_id{$fk_id}[2] eq $sel or $k_yakusyoku_id{$fk_id}[3] eq $sel or $k_yakusyoku_id{$fk_id}[16] eq $sel or $k_yakusyoku_id{$fk_id}[17] eq $sel or $k_yakusyoku_id{$fk_id}[18] eq $sel){
$w_id=$f_id;&P_LOG_W("国/任命：対象キャラは既に上公・三孤の任にあたっています。役職の重複は出来ません。");
next;
	}
		$add = ${$zokukanbuptn}[18];
	}

	if(!$add){
$w_id=$f_id;&P_LOG_W("国/任命：任命対象が選択されていません。");
next;
	}
	if($p_kunino{$e_id} ne $p_kunino{$f_id}){
$w_id=$f_id;&P_LOG_W("国/任命：国が違います。");
next;
	}

	if($acd_sub1{$f_id}[$a_a_no] eq "15"){

		$i = 15;
		open(IN,"./w_db/kuni/ctop$p_kunino{$f_id} npc$i$sainpcid.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1{$fk_id}[$i],$nhyou2{$fk_id}[$i],$nsaku3{$fk_id}[$i],$nkyou4{$fk_id}[$i],$ntt5{$fk_id}[$i],$nnamae6{$fk_id}[$i],$nkout7{$fk_id}[$i],$nkatuk8{$fk_id}[$i],$nkatut9{$fk_id}[$i],$nteik10{$fk_id}[$i],$nkyuuk11{$fk_id}[$i],$nzei12{$fk_id}[$i],$ndb13{$fk_id}[$i],$ndb14{$fk_id}[$i],$ndb15{$fk_id}[$i],$ndb16{$fk_id}[$i],$ndb17{$fk_id}[$i],$nseikou18{$fk_id}[$i],$ntuu19{$fk_id}[$i],$nhit{$fk_id}[$i]) = split(/<>/,$NPCOP1[0]);
@new_charak=();
	unshift(@new_charak,"<>0<>61<>61<>$ntt5{$fk_id}[$i]<>$p_name{$e_id}<><>0<><>0<>0<>$nzei12{$fk_id}[$i]<>$p_id{$e_id}<>$ndb14{$fk_id}[$i]<>$ndb15{$fk_id}[$i]<>$ndb16{$fk_id}[$i]<>$ndb17{$fk_id}[$i]<>0<>0<>$nhit{$fk_id}[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$p_kunino{$f_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		$tname = "${$zokukanbuptn}[15]";
			if($k_yakusyoku_id{$fk_id}[15] eq ""){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}から$tnameに任命され、$k_p_k_a{$p_kunino{$f_id}}の御庭番衆を束ねる。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$k_p_k_a{$p_kunino{$f_id}}の御庭番衆を束ねる。");
			}elsif($k_yakusyoku_id{$fk_id}[15] eq $f_id){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$tnameの座を引き継ぎ、$k_p_k_a{$p_kunino{$f_id}}の御庭番衆を束ねる。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}に$tnameの座を譲り渡す。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$p_p_b_a{$p_id{$e_id}}に$tnameの座が継承される。");

		$d_id = $f_id;
		$k_yakusyoku_id{$fk_id}[15] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}else{
									$ttid = "blog/$k_yakusyoku_id{$fk_id}[15]";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の意向により、$k_p_k_a{$p_kunino{$f_id}}$tnameの任を解かれる。後任として$p_p_b_a{$p_id{$e_id}}が新たな$tnameに任命される。");
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}から$tnameに任命され、$k_p_k_a{$p_kunino{$f_id}}の御庭番衆を束ねる。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$k_p_k_a{$p_kunino{$f_id}}の御庭番衆を束ねる。");

		$d_id = $k_yakusyoku_id{$fk_id}[15];
		$k_yakusyoku_id{$fk_id}[15] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}
		$k_yakusyoku_id{$fk_id}[15] = $p_id{$e_id};
	&KUNI_KAKUDUKE("$e_id","$fk_id","");
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "16"){

		$i = 16;
		open(IN,"./w_db/kuni/ctop$p_kunino{$f_id} npc$i$sainpcid.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1{$fk_id}[$i],$nhyou2{$fk_id}[$i],$nsaku3{$fk_id}[$i],$nkyou4{$fk_id}[$i],$ntt5{$fk_id}[$i],$nnamae6{$fk_id}[$i],$nkout7{$fk_id}[$i],$nkatuk8{$fk_id}[$i],$nkatut9{$fk_id}[$i],$nteik10{$fk_id}[$i],$nkyuuk11{$fk_id}[$i],$nzei12{$fk_id}[$i],$ndb13{$fk_id}[$i],$ndb14{$fk_id}[$i],$ndb15{$fk_id}[$i],$ndb16{$fk_id}[$i],$ndb17{$fk_id}[$i],$nseikou18{$fk_id}[$i],$ntuu19{$fk_id}[$i],$nhit{$fk_id}[$i]) = split(/<>/,$NPCOP1[0]);
@new_charak=();
	unshift(@new_charak,"<>0<>61<>61<>$ntt5{$fk_id}[$i]<>$p_name{$e_id}<><>0<><>0<>0<>$nzei12{$fk_id}[$i]<>$p_id{$e_id}<>$ndb14{$fk_id}[$i]<>$ndb15{$fk_id}[$i]<>$ndb16{$fk_id}[$i]<>$ndb17{$fk_id}[$i]<>0<>0<>$nhit{$fk_id}[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$p_kunino{$f_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		$tname = "${$zokukanbuptn}[16]";
			if($k_yakusyoku_id{$fk_id}[16] eq ""){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の推薦により、$k_p_k_a{$p_kunino{$f_id}}の$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");
			}elsif($k_yakusyoku_id{$fk_id}[16] eq $f_id){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameの座を引き継ぐ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}に$tnameの座を譲り渡す。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$p_p_b_a{$p_id{$e_id}}に$tnameの座が継承される。");

		$d_id = $f_id;
		$k_yakusyoku_id{$fk_id}[16] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}else{
									$ttid = "blog/$k_yakusyoku_id{$fk_id}[16]";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の意向により、$k_p_k_a{$p_kunino{$f_id}}$tnameの任を解かれる。後任として$p_p_b_a{$p_id{$e_id}}が新たな$tnameに任命される。");
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");

		$d_id = $k_yakusyoku_id{$fk_id}[16];
		$k_yakusyoku_id{$fk_id}[16] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}
		$k_yakusyoku_id{$fk_id}[16] = $p_id{$e_id};
	&KUNI_KAKUDUKE("$e_id","$fk_id","");
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "17"){

		$i = 17;
		open(IN,"./w_db/kuni/ctop$p_kunino{$f_id} npc$i$sainpcid.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1{$fk_id}[$i],$nhyou2{$fk_id}[$i],$nsaku3{$fk_id}[$i],$nkyou4{$fk_id}[$i],$ntt5{$fk_id}[$i],$nnamae6{$fk_id}[$i],$nkout7{$fk_id}[$i],$nkatuk8{$fk_id}[$i],$nkatut9{$fk_id}[$i],$nteik10{$fk_id}[$i],$nkyuuk11{$fk_id}[$i],$nzei12{$fk_id}[$i],$ndb13{$fk_id}[$i],$ndb14{$fk_id}[$i],$ndb15{$fk_id}[$i],$ndb16{$fk_id}[$i],$ndb17{$fk_id}[$i],$nseikou18{$fk_id}[$i],$ntuu19{$fk_id}[$i],$nhit{$fk_id}[$i]) = split(/<>/,$NPCOP1[0]);
@new_charak=();
	unshift(@new_charak,"<>0<>61<>61<>$ntt5{$fk_id}[$i]<>$p_name{$e_id}<><>0<><>0<>0<>$nzei12{$fk_id}[$i]<>$p_id{$e_id}<>$ndb14{$fk_id}[$i]<>$ndb15{$fk_id}[$i]<>$ndb16{$fk_id}[$i]<>$ndb17{$fk_id}[$i]<>0<>0<>$nhit{$fk_id}[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$p_kunino{$f_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		$tname = "${$zokukanbuptn}[17]";
			if($k_yakusyoku_id{$fk_id}[17] eq ""){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の推薦により、$k_p_k_a{$p_kunino{$f_id}}の$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");
			}elsif($k_yakusyoku_id{$fk_id}[17] eq $f_id){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameの座を引き継ぐ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}に$tnameの座を譲り渡す。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$p_p_b_a{$p_id{$e_id}}に$tnameの座が継承される。");

		$d_id = $f_id;
		$k_yakusyoku_id{$fk_id}[17] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}else{
									$ttid = "blog/$k_yakusyoku_id{$fk_id}[17]";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の意向により、$k_p_k_a{$p_kunino{$f_id}}$tnameの任を解かれる。後任として$p_p_b_a{$p_id{$e_id}}が新たな$tnameに任命される。");
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");

		$d_id = $k_yakusyoku_id{$fk_id}[17];
		$k_yakusyoku_id{$fk_id}[17] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}
		$k_yakusyoku_id{$fk_id}[17] = $p_id{$e_id};
	&KUNI_KAKUDUKE("$e_id","$fk_id","");
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "18"){

		$i = 18;
		open(IN,"./w_db/kuni/ctop$p_kunino{$f_id} npc$i$sainpcid.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1{$fk_id}[$i],$nhyou2{$fk_id}[$i],$nsaku3{$fk_id}[$i],$nkyou4{$fk_id}[$i],$ntt5{$fk_id}[$i],$nnamae6{$fk_id}[$i],$nkout7{$fk_id}[$i],$nkatuk8{$fk_id}[$i],$nkatut9{$fk_id}[$i],$nteik10{$fk_id}[$i],$nkyuuk11{$fk_id}[$i],$nzei12{$fk_id}[$i],$ndb13{$fk_id}[$i],$ndb14{$fk_id}[$i],$ndb15{$fk_id}[$i],$ndb16{$fk_id}[$i],$ndb17{$fk_id}[$i],$nseikou18{$fk_id}[$i],$ntuu19{$fk_id}[$i],$nhit{$fk_id}[$i]) = split(/<>/,$NPCOP1[0]);
@new_charak=();
	unshift(@new_charak,"<>0<>61<>61<>$ntt5{$fk_id}[$i]<>$p_name{$e_id}<><>0<><>0<>0<>$nzei12{$fk_id}[$i]<>$p_id{$e_id}<>$ndb14{$fk_id}[$i]<>$ndb15{$fk_id}[$i]<>$ndb16{$fk_id}[$i]<>$ndb17{$fk_id}[$i]<>0<>0<>$nhit{$fk_id}[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$p_kunino{$f_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		$tname = "${$zokukanbuptn}[18]";
			if($k_yakusyoku_id{$fk_id}[18] eq ""){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の推薦により、$k_p_k_a{$p_kunino{$f_id}}の$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");
			}elsif($k_yakusyoku_id{$fk_id}[18] eq $f_id){
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameの座を引き継ぐ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}に$tnameの座を譲り渡す。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}から$p_p_b_a{$p_id{$e_id}}に$tnameの座が継承される。");

		$d_id = $f_id;
		$k_yakusyoku_id{$fk_id}[18] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}else{
									$ttid = "blog/$k_yakusyoku_id{$fk_id}[18]";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}の意向により、$k_p_k_a{$p_kunino{$f_id}}$tnameの任を解かれる。後任として$p_p_b_a{$p_id{$e_id}}が新たな$tnameに任命される。");
									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}] $p_p_b_a{$f_id}から$k_p_k_a{$p_kunino{$f_id}}$tnameに任命される。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}を$tnameに任命する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}が$tnameの任に就く。");

		$d_id = $k_yakusyoku_id{$fk_id}[18];
		$k_yakusyoku_id{$fk_id}[18] = $p_id{$e_id};

	&KUNI_KAKUDUKE("$d_id","$fk_id","");
			}
		$k_yakusyoku_id{$fk_id}[18] = $p_id{$e_id};
	&KUNI_KAKUDUKE("$e_id","$fk_id","");
	}

$w_id=$f_id;&P_LOG_W("任命：$acd_name{$f_id}[$a_a_no]しました。");

}

#######################
sub ACD_IDsirei_kuni {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
	$k_sirei_bun{$fk_id} = $acd_sub1{$f_id}[$a_a_no];
$w_id=$f_id;&P_LOG_W("国/指令変更：$k_sirei_bun{$fk_id}");

}

#######################
sub ACD_IDkaiko_kuni {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
	$e_id=$acd_sub2{$f_id}[$a_a_no];
	if(!$p_name{$e_id}){
$w_id=$f_id;&P_LOG_W("国/解雇：相手先のIDが稼動していません。");
next;
	}
	if($k_kokka_keitai{$fk_id}){
$w_id=$f_id;&P_LOG_W("国/解雇：賊は部下を解雇することができません。");
next;
	}
	if($k_yakusyoku_id{$fk_id}[15] eq $e_id or $k_yakusyoku_id{$fk_id}[1] eq $e_id or $k_yakusyoku_id{$fk_id}[2] eq $e_id or $k_yakusyoku_id{$fk_id}[3] eq $e_id or $k_yakusyoku_id{$fk_id}[16] eq $e_id or $k_yakusyoku_id{$fk_id}[17] eq $e_id or $k_yakusyoku_id{$fk_id}[18] eq $e_id){
$w_id=$f_id;&P_LOG_W("国/解雇：${$zokukanbuptn}[15]・上公・三孤を解雇することはできません。");
next;
	}

	if($k_yakusyoku_id{$fk_id}[23] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/解雇：${$zokukanbuptn}[23]か上公か三孤でなければ実行できません。");
next;
	}


	if($p_kuni_yakusyoku{$e_id}){
		if($k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/解雇：${$zokukanbuptn}[23]・三孤は幹部を解雇する権限がありません。");
next;
		}
	}

	if($p_kunino{$f_id} ne $p_kunino{$e_id}) {
$w_id=$f_id;&P_LOG_W("国/解雇：他国に干渉は出来ません。");
next;
	}
	if($f_id eq $p_id{$e_id}) {
$w_id=$f_id;&P_LOG_W("国/解雇：自分を解雇できません。");
next;
	}
$w_id=$f_id;&P_LOG_W("国/解雇：$p_name{$f_id}の進言をうけ、$k_name{$fk_id}の天子$k_tensi_name{$fk_id}は$acd_name{$f_id}[$a_a_no]しました。");

									$ttid = "blog/$e_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}$addの進言をうけ、$p_name{$e_id}は$k_p_k_a{$fk_id}から解雇される。");
		&M2AP_LOG("<span class=\"c880088\">【解雇】</span>$p_p_b_a{$e_id}は$p_p_b_a{$f_id}$addの指示により$k_p_k_a{$fk_id}から解雇されました。");

	&KUNI_KAKUDUKE("$e_id","$fk_id","$fk_id");
		$p_kuni_yakusyoku{$e_id} = 0;
		$p_kunino{$e_id} = 0;


	open(IN,"./w_db/k_sikan_kyozetu.cgi");
	@B_LIST = <IN>;
	close(IN);

	$hit=0;
	$i=0;
	while($i - $hit <= $#B_LIST){
	$ii=$i - $hit;
		($kyozetu_id,$kyozetu_kunino,$kyozetu_name,$kyozetu_tt) = split(/<>/,$B_LIST[$ii]);
		if(($kyozetu_id eq $p_id{$e_id} and $kyozetu_kunino eq $fk_id) or $kyozetu_tt + 7776000 < $tt){
splice( @B_LIST, $ii, 1);
			$hit++;
		}
	$i++;
	}

		unshift(@B_LIST,"$p_id{$e_id}<>$fk_id<>$p_name{$e_id}<>$tt<>\n");

	open(OUT,">./w_db/k_sikan_kyozetu.cgi");
	print OUT @B_LIST;
	close(OUT);

}

#######################
sub ACD_IDiro_kuni {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
				&KANBU_NAME;
	if($k_yakusyoku_id{$fk_id}[25] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){
$w_id=$f_id;&P_LOG_W("国/旗色変更：${$zokukanbuptn}[25]か上公か三孤でなければ実行できません。");
next;
	}
	$k_iro_d{$fk_id} = $acd_sub1{$f_id}[$a_a_no];
$w_id=$f_id;&P_LOG_W("国/旗色変更：旗色を<span class=\"kcb$p_k_iro_d{$fk_id}\">■</span>に変更しました。");
									$ttid = "klog/$fk_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}の意向により、旗色を<span class=\"kcb$p_k_iro_d{$fk_id}\">■</span>に変更しました。");

}

#######################
sub ACD_IDiten_kuni {
	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}


							$dt_id = $acd_sub1{$f_id}[$a_a_no];


		if($kousinjyoutai eq "999"){
$w_id=$f_id;&P_LOG_W("国/拠点移転：天下統一が起こりました。繰越処理が行われるまでしばらくお待ち下さい。");
next;
		}


		if($dt_id eq $k_outo{$fk_id}){
$w_id=$f_id;&P_LOG_W("国/拠点移転：移転先が現本拠地と同じです。");
next;
		}
	if($k_kokka_keitai{$fk_id}){
		if($t_zokuno{$dt_id}){
$w_id=$f_id;&P_LOG_W("国/拠点移転：その都市には他の賊が居るようです。");
next;
		}
		$ft_id = $k_outo{$fk_id};
			$hit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if($_ eq $dt_id){
			$hit ++;
		}
	}
		if(!$hit){
$w_id=$f_id;&P_LOG_W("国/拠点移転：現在の本拠に隣接していません。");
next;
		}

		$ek_id = $t_kunino{$dt_id};
		if($k_kokusaku{$ek_id} eq "9"){
$w_id=$f_id;&P_LOG_W("国/拠点移転：$t_name{$dt_id}を支配下に置く国が国策：鎖国を敷いています。移転できません。");
next;
		}
$itenmes = '賊砦移転';
	}else{
	if($k_kokko_sougaku{$fk_id} < 200000){
$w_id=$f_id;&P_LOG_W("国/拠点移転：国庫が不足しています。王都移転には金200000が必要です。");
next;
	}
		if($t_kunino{$dt_id} ne $k_kunino{$fk_id}){
$w_id=$f_id;&P_LOG_W("国/拠点移転：移転先が自国ではありません。");
next;
		}
$itenmes = '首都移転';
	}

$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

		$ttadd += 144 * $kousin_kankaku;

		$ntt5[$i] = $tt + $ttadd;
@new_charak=();
	unshift(@new_charak,"$nten1[$i]<>$nhyou2[$i]<>$nsaku3[$i]<>$nkyou4[$i]<>$ntt5[$i]<>$nnamae6[$i]<>$nkout7[$i]<>$nkatuk8[$i]<>$nkatut9[$i]<>$nteik10[$i]<>$nkyuuk11[$i]<>$nzei12[$i]<>$ndb13[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);
		if($k_kokka_keitai{$fk_id}){
			
		$res_mes = "$p_p_b_a{$f_id}$addの進言をうけ、$k_p_k_a{$fk_id}は、賊砦の本拠を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転しました。";

									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}$addの進言をうけ、賊砦の本拠を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転。");
		&MAP_LOG2("<span class=\"c000088\">【$itenmes】</span>\[$old_date\]$res_mes");
		&M2AP_LOG("<span class=\"c000088\">【$itenmes】</span>$res_mes");

							$ft_id = $k_outo{$fk_id};
$t_zokuno{$ft_id}=0;

$t_zokuno{$dt_id}=$p_kunino{$f_id};

	foreach(@p_db_all_l){
			$e_id = $_;

			if($p_kunino{$f_id} eq $p_kunino{$e_id} and $p_id{$e_id}){
$p_taizai_iti{$p_id{$e_id}}=$dt_id;

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_p_k_a{$fk_id}の賊砦移転命令により、新たなる本拠 $t_name[$dt_id]の賊砦に強制移動しました。");
			}

												if($p_kunino{$e_id} eq $p_kunino{$f_id} and -e "./p_db/p/$p_id{$e_id}.cgi"){


		if($p_heisisuu{$e_id} and $p_syubi_eria{$e_id} eq "999"){
						$defaddpos = "$p_syubi_eria{$e_id}";
						$defadditi = "$dt_id";
						$defaddid = "$p_id{$e_id}";
						$defaddname = "$p_name{$e_id}";
						$defaddcon = "$p_kunino{$e_id}";
						$defaddhei = "$p_heisyu{$e_id}";
						$defadddbdb8 = "$p_syubi_eria{$e_id}";
						$defadddbdb9 = "$p_syubi_tosi{$e_id}";
						&DEF_M;
$ddbdb1 = "$t_name[$dt_id] $senno[$p_syubi_eria{$e_id}] ";
$p_syubi_tosi{$e_id} = $dt_id;
$p_syubi_eria{$e_id} = $p_syubi_eria{$e_id};
		}

$p_taizai_iti{$e_id} = $dt_id;


												}
	}
####################

####################
		}else{

		$res_mes = "$p_p_b_a{$f_id}$addの進言をうけ、$k_p_k_a{$fk_id}の時の天子 $k_tensi_name{$fk_id}は、王都を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転しました。";

									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}$addの進言をうけ、王都を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転。");
		&MAP_LOG2("<span class=\"c000088\">【$itenmes】</span>\[$old_date\]$res_mes");
		&M2AP_LOG("<span class=\"c000088\">【$itenmes】</span>$res_mes");

		$k_kokko_sougaku{$fk_id} -= 200000;

		}

		$k_outo{$fk_id} = $dt_id;
$w_id=$f_id;&P_LOG_W("国/拠点移転：$acd_name{$f_id}[$a_a_no]しました。");

}

#######################
sub ACD_IDsenpou {
$in{'bk'} = $acd_sub1{$f_id}[$a_a_no];
$in{'hk'} = $acd_sub2{$f_id}[$a_a_no];
$in{'sk'} = $acd_sub3{$f_id}[$a_a_no];
$in{'bh'} = $acd_sub4{$f_id}[$a_a_no];
$comew = "";
$p_jintousiki{$f_id} = $in{'sk'};
$p_jyoujihousin1{$f_id} = $in{'bh'};

				if($in{'bk'} eq "0"){
#通常移動(将疲1)
$p_b_idou_sokudo{$f_id} = 20 - 0 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "1"){
#早駆け(将疲3)
$p_b_idou_sokudo{$f_id} = 20 + 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "2"){
#強行(将疲6)
$p_b_idou_sokudo{$f_id} = 20 + 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "3"){
#警戒（罠・伏兵回避率UP・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "4"){
#隠密（負傷・一騎うち回避・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}
$p_b_kougun{$f_id} = $in{'bk'};

	if($p_jintousiki{$f_id} eq "2"){
		if($p_jyoujihousin1{$f_id} ne "0" and $p_jyoujihousin1{$f_id} ne "4"){
$comew .= "<span class=\"cFF0000\">指揮形態で「遠隔指令」を選択した場合、「将：方針」で「静観」又は「指令重視」以外選べません。</span><br />";
$p_jyoujihousin1{$f_id} = 0;
		}
		if($p_b_kougun{$f_id} eq "3"){
$comew .= "<span class=\"cFF0000\">指揮形態で「遠隔指令」を選択した場合、「将：行軍」で「警戒移動」は選択できません。</span><br />";
$p_b_kougun{$f_id} = 0;
#通常移動(将疲1)
$p_b_idou_sokudo{$f_id} = 20 - 0 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
		}
	}
	if($p_jintousiki{$f_id} eq "1"){
		if($p_jyoujihousin1{$f_id} eq "1" or $p_jyoujihousin1{$f_id} eq "2"){
$comew .= "<span class=\"cFF0000\">指揮形態で「後方采配」を選択した場合、「将：方針」で「単騎駆け」「獅子奮迅」は選べません。</span><br />";
$p_jyoujihousin1{$f_id} = 0;
		}
	}
				if($in{'hk'} eq "0"){
#通常移動(兵疲3)
$p_h_idou_sokudo{$f_id} = 20 - 0;
				}elsif($in{'hk'} eq "1"){
#早駆け(兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($in{'hk'} eq "2"){
#強行軍(兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 10;
				}elsif($in{'hk'} eq "3"){
#警戒体制（罠・伏兵回避率UP・兵疲4）
$p_h_idou_sokudo{$f_id} = 20 - 10;
				}elsif($in{'hk'} eq "4"){
#突撃体制(突撃率3割増加・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 0;
				}elsif($in{'hk'} eq "5"){
#一点突破(2発目以降は防御１ポイントずつ通過・兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($in{'hk'} eq "6"){
#散開包囲(同一地点３連突・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 - 5;
				}
$p_h_kougun{$f_id} = $in{'hk'};


	if($p_jintousiki{$f_id} ne "2" and $p_b_idou_sokudo{$f_id} < $p_h_idou_sokudo{$f_id}){
$comew .= "<span class=\"cFF0000\">「将：速度」が「兵：速度」を下回っているため、「兵：速度」が$p_h_idou_sokudo{$f_id}から$p_b_idou_sokudo{$f_id}に低下します。</span><br />";
$p_h_idou_sokudo{$f_id} = $p_b_idou_sokudo{$f_id};
	}

		$xyz = "戦法を将：行軍 $BUKOUGUN[$in{'bk'}]、兵：行軍 $HEIKOUGUN[$in{'hk'}]、指揮形態 $SIKIKEITAI[$in{'sk'}]、将：方針 $BUHOUSIN[$in{'bh'}]に変更";
$w_id=$f_id;&P_LOG_W("戦法設定：$xyzしました。$comew");

}

#######################
sub ACD_IDtyuusei {
	$p_tyuusei{$f_id} = $acd_sub1{$f_id}[$a_a_no];
$w_id=$f_id;&P_LOG_W("忠誠度変更：$acd_name{$f_id}[$a_a_no]しました。");

}

#######################
sub ACD_IDyakuba {
$add =($keika_nen+100)*5000;

		if($p_syoji_kin{$f_id} < $add){
$w_id=$f_id;&P_LOG_W("国取役場：残金が足りません。");
next;
		}

	if ($acd_sub1{$f_id}[$a_a_no] eq $p_minzoku{$f_id} and $acd_sub2{$f_id}[$a_a_no] eq $p_name{$f_id}){
$w_id=$f_id;&P_LOG_W("国取役場：以前と全く同じで変更点が見当たりません。");
next;
	}

	$res_mes2 = "";
	$res_mes3 = "";
	$res_mes4 = "";
	if($p_minzoku{$f_id} ne $acd_sub1{$f_id}[$a_a_no]) {
	$res_mes2 = "$MINZOKUSAN[$p_minzoku{$f_id}]から$MINZOKUSAN[$acd_sub1{$f_id}[$a_a_no]]に国籍を移し";

	if($p_minzoku{$f_id} eq "0"){
$p_exgiri{$f_id} -= 5;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "1"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} -= 1;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} -= 1;
	}elsif($p_minzoku{$f_id} eq "2"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} -= 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} -= 1;
	}elsif($p_minzoku{$f_id} eq "6"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} -= 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 1;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "7"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 7;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} -= 2;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "8"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 0;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} -= 3;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "9"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "10"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 5;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "11"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} -= 3;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 10;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 2;
$p_exbrave{$f_id} -= 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "12"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} -= 1;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "13"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($p_minzoku{$f_id} eq "14"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 10;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} -= 1;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} -= 1;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}



	if($acd_sub1{$f_id}[$a_a_no] eq "0"){
$p_exgiri{$f_id} += 5;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} -= 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "1"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 1;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "2"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 1;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "6"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "7"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 7;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} += 2;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "8"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 0;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 3;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "9"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "10"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 5;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "11"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 2;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "12"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "13"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($acd_sub1{$f_id}[$a_a_no] eq "14"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 10;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}

	$p_minzoku{$f_id} = $acd_sub1{$f_id}[$a_a_no];
	}


	if($p_name{$f_id} ne $acd_sub2{$f_id}[$a_a_no]) {
	if($p_minzoku{$f_id} ne $acd_sub1{$f_id}[$a_a_no]) {
	$res_mes3 = "、";
	}
	$res_mes4 = "$acd_sub2{$f_id}[$a_a_no]と改名し";
	}
	$res_mes = "$p_name{$f_id}は$res_mes2$res_mes3$res_mes4ました。";
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$res_mes");
	$p_syoji_kin{$f_id} -= $add;
	$p_name{$f_id} = $acd_sub2{$f_id}[$a_a_no];
$w_id=$f_id;&P_LOG_W("国取役場：$res_mes");


}

#######################
sub ACD_IDkunikae {
		$e_id = $acd_sub2{$f_id}[$a_a_no];
		$add_knok = $acd_sub3{$f_id}[$a_a_no];
		$fk_id = $messe_f_kuni;

	if($p_kunino{$f_id} ne $acd_sub9{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("$acd_name{$f_id}[$a_a_no]：所属国に変更がありました。このコマンドは破棄されます。");
next;
	}
	if(!$p_id{$e_id}){
$w_id=$f_id;&P_LOG_W("$acd_name{$f_id}[$a_a_no]：登用もとの武将が非稼動です。このコマンドは破棄されます。");
next;
	}
	if(!$k_kunino{$p_kunino{$e_id}}){
$w_id=$f_id;&P_LOG_W("$acd_name{$f_id}[$a_a_no]：登用もとの国が滅んでいます。このコマンドは破棄されます。");
next;
	}

		$p_syoji_kin{$f_id} += 100;
		$p_taizai_iti{$f_id} = $p_taizai_iti{$p_id{$e_id}};
		$p_taizai_iti{$f_id} = int($p_taizai_iti{$f_id});
				$add_k1 = $p_kunino{$f_id};
		$p_kunino{$f_id} = int($p_kunino{$e_id});
				$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;
	if($add_knok){
$p_exgiri{$f_id} -= 5;
$p_ex_karumalc{$f_id} -= 50;
$p_tyuusei{$f_id} = 100;
		$p_kuni_yakusyoku{$f_id} = 0;

		$fk_id = $p_kunino{$f_id};
	&KUNI_KAKUDUKE("$f_id","$fk_id","$add_k1");

									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}を寝返らせることに成功。");

									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}からの誘いを承諾し、$k_p_k_a{$p_kunino{$f_id}}に寝返る。");
		$res_mes2 = "$p_name{$f_id}は$p_name{$e_id}からの誘いを承諾し、$k_name_d[$p_kunino{$f_id}]に寝返りました。";
		$res_mes = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a>は<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$k_name_d[$p_kunino{$f_id}]</span></a>に寝返りました。";
		&MAP_LOG("<span class=\"c0088CC\">【登用】</span>$p_p_b_a{$f_id}は$k_p_k_a{$p_kunino{$f_id}}に寝返りました。");
	}else{
$p_ex_karumalc{$f_id} += 10;
$p_tyuusei{$f_id} = 100;
		$p_kuni_yakusyoku{$f_id} = 0;

		$fk_id = $p_kunino{$f_id};
	&KUNI_KAKUDUKE("$f_id","$fk_id","$add_k1");

									$ttid = "blog/$p_id{$e_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}を登用する。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}からの誘いを承諾し、$k_p_k_a{$p_kunino{$f_id}}に仕官する。");
		$res_mes2 = "$p_name{$f_id}は$p_name{$e_id}からの誘いを承諾し、$k_name_d[$p_kunino{$f_id}]に仕官しました。";
		$res_mes = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a>は<a href=\"./?.m.=p_b&amp;.id.=$p_id{$p_id{$e_id}}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$e_id}</span></a>からの誘いを承諾し、<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$k_name_d[$p_kunino{$f_id}]</span></a>に仕官しました。";
		&MAP_LOG("<span class=\"c0088CC\">【登用】</span>$p_p_b_a{$f_id}は$p_p_b_a{$p_id{$e_id}}からの誘いを承諾し、$k_p_k_a{$p_kunino{$f_id}}に仕官しました。");
	}
	open(IN,"./w_db/jyusin/m_$f_id.cgi");
	@MES = <IN>;
	close(IN);
	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES2 = <IN>;
	close(IN);
	open(IN,"./w_db/jyusin/$e_id.cgi");
	@MES3 = <IN>;
	close(IN);
	unshift(@MES3,"$p_id{$e_id}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$res_mes<>$p_name{$e_id}<>$tt_date<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>$messe_f<>$messe_tt<>\n");
	unshift(@MES2,"$p_id{$e_id}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}$rank_mes<>$res_mes<>$p_name{$e_id}<>$tt_date<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>$messe_f<>$messe_tt<>\n");

splice(@MES3 , 10);
splice(@MES2 , 5);

		$mes_kuni_missyo_del{$f_id} = int($mes_kuni_missyo_del{$f_id});
splice(@MES , $acd_sub4{$f_id}[$a_a_no] - $mes_kuni_missyo_del{$f_id}, 1);
		$mes_kuni_missyo_del{$f_id} ++;

	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES2;
	close(OUT);
	open(OUT,">./w_db/jyusin/$e_id.cgi");
	print OUT @MES3;
	close(OUT);
	open(OUT,">./w_db/jyusin/m_$f_id.cgi");
	print OUT @MES;
	close(OUT);
$w_id=$f_id;&P_LOG_W("$res_mes2");

}

#######################
sub ACD_IDnyuusatu {
		@no=split(/,/,$acd_sub1{$f_id}[$a_a_no]);
		@ocgaku3=split(/,/,$acd_sub3{$f_id}[$a_a_no]);

		$add_i_name = "";
$add_gaku = 0;
	foreach(@no){
											$i=$_;
		($ocno[$i],$ocino[$i],$ocgaku[$i],$octt[$i],$ocnid[$i],$ocnname[$i],$ocnkuni[$i],$ocsid[$i],$ocsname[$i],$ocskuni[$i],$ocent[$i])=split(/<>/,$OCD[$i]);

											$ocent[$i]=int($ocent[$i]);

			if($ocgaku3[$add_gaku] > $p_syoji_kin{$f_id}){
		$add_i_name .= "$ocsname[$i]さんが出品している$gitem[$ocino[$i]]に金$ocgaku3[$add_gaku]で入札しようとしましたが、残金が足りません。<br />";
			}elsif($octt[$i] + 172800 < $tt){
		$add_i_name .= "$ocsname[$i]さんが出品している$gitem[$ocino[$i]]に金$ocgaku3[$add_gaku]で入札しようとしましたが、入札期限を超過していたため入札できませんでした。<br />";
			}elsif($ocgaku3[$add_gaku] > $ocgaku[$i]){
splice( @OCD, $i, 1, "$ocno[$i]<>$ocino[$i]<>$ocgaku3[$add_gaku]<>$tt<>$f_id<>$p_p_b_a{$f_id}<><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c000000\">$k_name{$fk_id}</span></a><>$ocsid[$i]<>$ocsname[$i]<>$ocskuni[$i]<>$ocent[$i]<>\n");

		$p_syoji_kin{$f_id} -= $ocgaku3[$add_gaku];
$p_houbif{$f_id}[0] += int($ocgaku3[$add_gaku] / 5000);

		if ($ocnid[$i] ne $ocsid[$i]) {
	$e_id=$ocnid[$i];
			if ($p_id{$e_id}) {
		$p_syoji_kin{$e_id} = $p_syoji_kin{$e_id} + $ocgaku[$i];
$w_id=$e_id;&P_LOG_W("貴方が金$ocgaku[$i]で入札していた$gitem[$ocino[$i]]に$p_p_b_a{$f_id}さんが金$ocgaku3[$add_gaku]で入札しました。");
			}

		$add_i_name .= "$ocsname[$i]さんが出品している$gitem[$ocino[$i]]に金$ocgaku3[$add_gaku]で入札しました。<br />";
		}
			}else{
		$add_i_name .= "$ocsname[$i]さんが出品している$gitem[$ocino[$i]]に金$ocgaku3[$add_gaku]で入札しようとしましたが、$ocnname[$i]が金$ocgaku[$i]で先に入札していたため入札に失敗しました。<br />";
			}
$add_gaku ++;
	}

		if($p_houbif{$f_id}[0] > 2400){
$p_houbif{$f_id}[0] = 2400;
		}
$ochit++;
$w_id=$f_id;&P_LOG_W("$add_i_name");

}

#######################
sub ACD_IDsyuppin {
		if(!$add_item_open{$f_id}){
	open(IN,"./p_db/it/$f_id.cgi");
	@{"add_item_list$f_id"} = <IN>;
	close(IN);
		$add_item_open{$f_id} = 1;
		}

		@no=split(/,/,$acd_sub1{$f_id}[$a_a_no]);

@no = sort {$a <=> $b} @no;


		$add_i_name = "";
	foreach(@no){
											$i=$_;
		if(!$add_item_ldelid_lsousa{$f_id}[$i]){
		($itn[$i],$itnw[$i],$itent[$i])=split(/<>/,${"add_item_list$f_id"}[$i]);

		($gitname[$itn[$i]],$gitsyu[$itn[$i]],$gi[$itn[$i]][1],$gi[$itn[$i]][2],$gi[$itn[$i]][3],$gi[$itn[$i]][4],$gi[$itn[$i]][5],$gi[$itn[$i]][6],$gi[$itn[$i]][7],$gi[$itn[$i]][8],$gi[$itn[$i]][9],$gi[$itn[$i]][10],$gi[$itn[$i]][11],$gi[$itn[$i]][11],$gix1[$itn[$i]],$gix2[$itn[$i]],$gix3[$itn[$i]])=split(/<>/,$Gitem[$itn[$i]]);
		$itn[$i] = int($itn[$i]);
		$itent[$i] = int($itent[$i]);
	push(@OCD,"$f_id$tt$itnw[$i]<>$itn[$i]<>10000<>$tt<>$f_id<>なし<>N/A<>$f_id<>$p_p_b_a{$f_id}<><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c000000\">$k_name{$fk_id}</span></a><>$itent[$i]<>\n");

		$add_i_name .= "$gitem[$itn[$i]]（+$itent[$i]）をオークションに出品しました。<br />";

	push(@{"add_item_ldelid$f_id"},"$i");
		$add_item_ldelid_lsousa{$f_id}[$i] = 1;
		$add_item_lsousa{$f_id} = 1;
		}
	}


$ochit++;
$w_id=$f_id;&P_LOG_W("$add_i_name");

}

#######################
sub ACD_IDitemu {
$in{'s1no'}=$acd_sub1{$f_id}[$a_a_no];
$in{'s2no'}=$acd_sub2{$f_id}[$a_a_no];
$in{'ino'}=$acd_sub3{$f_id}[$a_a_no];
$in{'um'}=$acd_sub4{$f_id}[$a_a_no];
$igcome2=$acd_sub5{$f_id}[$a_a_no];
$igcomeent=$acd_sub6{$f_id}[$a_a_no];
$igcome=$acd_sub7{$f_id}[$a_a_no];

		if($add_item_ldelid_lsousa{$f_id}[$in{'ino'}]){
next;
		}
		if(!$add_item_open{$f_id}){
	open(IN,"./p_db/it/$f_id.cgi");
	@{"add_item_list$f_id"} = <IN>;
	close(IN);
		$add_item_open{$f_id} = 1;
		}
		if($in{'um'} eq "ig"){

#_/_/_/_/_/_/_/合成_/_/_/_/_/_/_/#




$kitw = $in{'s1no'};
		($gitname[$kitw],$gitsyu[$kitw],$gi[$kitw][1],$gi[$kitw][2],$gi[$kitw][3],$gi[$kitw][4],$gi[$kitw][5],$gi[$kitw][6],$gi[$kitw][7],$gi[$kitw][8],$gi[$kitw][9],$gi[$kitw][10],$gi[$kitw][11],$gi[$kitw][11],$gix1[$kitw],$gix2[$kitw],$gix3[$kitw])=split(/<>/,$Gitem[$kitw]);


		@itgw=();
		$itgw[0] = 1;
		@itgw_i=();
		$i = 0;
	foreach(@{"add_item_list$f_id"}){
		($itn,$itnw,$itent)=split(/<>/);
			if(!$add_item_ldelid_lsousa{$f_id}[$i]){
		$itgw[$itn] ++;
		$itgw_i[$itn][$itgw[$itn]] = $i;
			}
		$i ++;
	}

			if($gitsyu[$kitw] and $itgw[$gi[$kitw][1]] and $itgw[$gi[$kitw][2]] and $itgw[$gi[$kitw][3]] and $itgw[$gi[$kitw][4]] and $itgw[$gi[$kitw][5]] and $itgw[$gi[$kitw][6]] and $itgw[$gi[$kitw][7]] and $itgw[$gi[$kitw][8]] and $itgw[$gi[$kitw][9]] and $itgw[$gi[$kitw][10]] and $itgw[$gi[$kitw][11]] and $itgw[$gi[$kitw][12]]){
			}else{
$w_id=$f_id;&P_LOG_W("アイテム合成をしようとしたものの、所持アイテムに変動があり材料不足に陥っている模様です。");
next;
			}
		$itentw = 0;
		@itgw_ino=();
		$itentwc = "";
	foreach(@{$gi[$kitw]}){
			if($_){
		$itgw_ino[$_] ++;
		$i = $itgw_i[$_][$itgw_ino[$_]];
		($itn,$itnw,$itent)=split(/<>/,${"add_item_list$f_id"}[$i]);
		$itentwc .= "$gitem[$itn]/";
		$itentw += $itent;
	push(@{"add_item_ldelid$f_id"},"$i");
		$add_item_ldelid_lsousa{$f_id}[$i] = 1;
			}
	}
		$add_item_lsousa{$f_id} = 1;

$ocent = 0;
		$gien = int(rand( (50 - $itentw) * 2));
		$gihit = "";
			if($gien < 10){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の合成に成功する。");
		$gicome = "$itentwcを使用し<span class=\"c0000FF\">$gitem[$kitw]の合成に成功しました！！！</span>";
	push(@{"add_item_list$f_id"},"$kitw<>$tt<>$ocent<>\n");

			}elsif($gien < 40){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の合成に成功する。");
		$gicome = "$itentwcを使用し<span class=\"c0000FF\">$gitem[$kitw]の合成に成功しました！！！</span>";
	push(@{"add_item_list$f_id"},"$kitw<>$tt<>$ocent<>\n");

			}else{
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の合成に失敗し、素材アイテムを消失する。。");
		$gicome = "$itentwcを使用し<span class=\"cFF0000\">$gitem[$kitw]の合成に失敗。。。<br />素材アイテムは全て消滅してしまいました。。。</span>";
			}


$w_id=$f_id;&P_LOG_W("アイテム合成結果：$gicome");

		}elsif($in{'um'} eq "ik"){

#_/_/_/_/_/_/_強化/_/_/_/_/_/_/#

			if($add_item_ldelid_lsousa{$f_id}[$in{'ino'}]){
$w_id=$f_id;&P_LOG_W("アイテム強化をしようとしたものの、所持アイテムに変動があり材料不足に陥っている模様です。");
next;
			}
			if($add_item_ldelid_lsousa{$f_id}[$in{'s1no'}]){
$w_id=$f_id;&P_LOG_W("アイテム強化をしようとしたものの、所持アイテムに変動があり材料不足に陥っている模様です。");
next;
			}
		$i = $in{'ino'};
		($itn[$i],$itnw[$i],$itent[$i])=split(/<>/,${"add_item_list$f_id"}[$i]);
		$itn[$i] = int($itn[$i]);

		($gitname[$itn[$i]],$gitsyu[$itn[$i]],$gi[$itn[$i]][1],$gi[$itn[$i]][2],$gi[$itn[$i]][3],$gi[$itn[$i]][4],$gi[$itn[$i]][5],$gi[$itn[$i]][6],$gi[$itn[$i]][7],$gi[$itn[$i]][8],$gi[$itn[$i]][9],$gi[$itn[$i]][10],$gi[$itn[$i]][11],$gi[$itn[$i]][11],$gix1[$itn[$i]],$gix2[$itn[$i]],$gix3[$itn[$i]])=split(/<>/,$Gitem[$itn[$i]]);
							$itn1 = $itn[$i];
							$itent1 = $itent[$i];
							$itentw1 = "$gitem[$itn[$i]]（+$itent[$i]）";
		$i = $in{'s1no'};
		($itn[$i],$itnw[$i],$itent[$i])=split(/<>/,${"add_item_list$f_id"}[$i]);
		$itn[$i] = int($itn[$i]);

		($gitname[$itn[$i]],$gitsyu[$itn[$i]],$gi[$itn[$i]][1],$gi[$itn[$i]][2],$gi[$itn[$i]][3],$gi[$itn[$i]][4],$gi[$itn[$i]][5],$gi[$itn[$i]][6],$gi[$itn[$i]][7],$gi[$itn[$i]][8],$gi[$itn[$i]][9],$gi[$itn[$i]][10],$gi[$itn[$i]][11],$gi[$itn[$i]][11],$gix1[$itn[$i]],$gix2[$itn[$i]],$gix3[$itn[$i]])=split(/<>/,$Gitem[$itn[$i]]);
							$itn2 = $itn[$i];
							$itent2 = $itent[$i];
							$itentw2 = "$gitem[$itn[$i]]（+$itent[$i]）";
							$itentw = $itent2 + $itent1;

			if($itn1 eq $itn2 and $gitsyu[$itn[$i]] < 100){
							$itent1 += $itent2;
			}elsif("9101" eq $itn2){
			}elsif("9102" eq $itn2 and $gitsyu[$itn[$i]] == 1){
							$itentw += 1;
			}elsif("9129" eq $itn2){
			}

		$i = $in{'ino'};
	push(@{"add_item_ldelid$f_id"},"$i");
		$add_item_ldelid_lsousa{$f_id}[$i] = 1;

		$i = $in{'s1no'};
	push(@{"add_item_ldelid$f_id"},"$i");
		$add_item_ldelid_lsousa{$f_id}[$i] = 1;

		$add_item_lsousa{$f_id} = 1;


$ocent = $itent1;
$kitw = $itn1;
		$gien = int(rand( (50 - $itentw) * 2));
		$gicome = "";
			if($gien < 10){
$ocent += 2;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の強化に成功する。「$itentw1」+「$itentw2」⇒「$gitem[$kitw]（+$ocent）」");
		$gicome = "<span class=\"c0000FF\">$gitem[$kitw]が蒼白く輝いています！！！</span><br />「$itentw1」+「$itentw2」⇒「$gitem[$kitw]（+$ocent）」";
	push(@{"add_item_list$f_id"},"$kitw<>$tt<>$ocent<>\n");

			}elsif($gien < 50){
$ocent += 1;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の強化に成功する。「$itentw1」+「$itentw2」⇒「$gitem[$kitw]（+$ocent）」");
		$gicome = "<span class=\"c0000FF\">$gitem[$kitw]の合成に成功しました！！！</span><br />「$itentw1」+「$itentw2」⇒「$gitem[$kitw]（+$ocent）」";
	push(@{"add_item_list$f_id"},"$kitw<>$tt<>$ocent<>\n");

			}else{
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$kitw]</span>の強化に失敗。。「$itentw1」+「$itentw2」⇒ × ");
		$gicome = "<span class=\"cFF0000\">$gitem[$kitw]の合成に失敗。<br />素材アイテムは全て消滅してしまいました。。。</span>";
			}

$w_id=$f_id;&P_LOG_W("アイテム強化合成結果：$gicome");

		}elsif($in{'um'} eq "iu"){

#_/_/_/_/_/_/_/装備_/_/_/_/_/_/_/#

			if($in{'s1no'} < 1){
		$e_id = $f_id;
			}elsif($in{'s1no'} < 5){
		$e_id = "$f_id-h$in{'s1no'}";
			}elsif($in{'s1no'} < 9){
		$e_id = "$f_id-p$in{'s1no'}";
			}
		$i = $in{'ino'};
		($itn[$i],$itnw[$i],$itent[$i])=split(/<>/,${"add_item_list$f_id"}[$i]);
		$itn[$i] = int($itn[$i]);

		($gitname[$itn[$i]],$gitsyu[$itn[$i]],$gi[$itn[$i]][1],$gi[$itn[$i]][2],$gi[$itn[$i]][3],$gi[$itn[$i]][4],$gi[$itn[$i]][5],$gi[$itn[$i]][6],$gi[$itn[$i]][7],$gi[$itn[$i]][8],$gi[$itn[$i]][9],$gi[$itn[$i]][10],$gi[$itn[$i]][11],$gi[$itn[$i]][11],$gix1[$itn[$i]],$gix2[$itn[$i]],$gix3[$itn[$i]])=split(/<>/,$Gitem[$itn[$i]]);

		$zc1 = $itn[$i];
		$zcent = int($itent[$i]);

			if($in{'ino'} eq "10000"){
				if(int($in{'s2no'}/10) eq "1"){
					if(int($in{'s2no'}%10) eq "1"){
					}elsif(int($in{'s2no'}%10)  eq "2"){
					}elsif(int($in{'s2no'}%10)  eq "0"){
					if($p_migite{$e_id}%1000){
							$zc1 = $p_migite{$e_id};
					}
					if($p_hidarite{$e_id}%1000){
							$zc1 = $p_hidarite{$e_id};
					}
					}

				}
			}else{
				if($add_item_ldelid_lsousa{$f_id}[$in{'ino'}]){
$w_id=$f_id;&P_LOG_W("所持アイテムに変動があり装備できません。");
next;
				}
		$i = $in{'ino'};
	push(@{"add_item_ldelid$f_id"},"$i");
		$add_item_ldelid_lsousa{$f_id}[$i] = 1;
			}

		$add_item_lsousa{$f_id} = 1;

$zc2 = $zc1;

		$igcome3 = "";
			if(int($in{'s2no'}/10) eq "1"){

						if(int($in{'s2no'}%10)  eq "1"){
					if($p_migite{$f_id}%1000){
				if($p_migite{$e_id}%1000 < 100){
		$igcome3 .= "$item_name{$p_migite{$e_id}}を$item_nedan{$p_migite{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_migite{$e_id}};
$p_migite{$e_id} = 1000;
				}else{
		$igcome3 .= "現在の右手装備$item_name{$p_migite{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_migite{$e_id}<>$tt<>$p_migite_lv{$e_id}<>\n");
$p_migite{$e_id} = 1000;
				}
					}
					if($p_hidarite{$f_id}%1000 and ($item_2hf{$zc2}+$item_2hf{$p_hidarite{$f_id}} > 2)){
				if($p_hidarite{$e_id}%1000 < 100){
		$igcome3 .= "$item_name{$p_hidarite{$e_id}}を$item_nedan{$p_hidarite{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_hidarite{$e_id}};
$p_hidarite{$e_id} = 1000;
				}else{
		$igcome3 .= "現在の左手装備$item_name{$p_hidarite{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_hidarite{$e_id}<>$tt<>$p_hidarite_lv{$e_id}<>\n");
$p_hidarite{$e_id} = 1000;
				}
					}
				if($p_migite{$f_id}%1000){
$p_hidarite{$e_id} = $zc2;
$p_hidarite_lv{$e_id} = int($zcent);
				}else{
$p_migite{$e_id} = $zc2;
$p_migite_lv{$e_id} = int($zcent);
				}
						}elsif(int($in{'s2no'}%10)  eq "2"){
					if($p_hidarite{$f_id}%1000){
				if($p_hidarite{$e_id}%1000 < 100){
		$igcome3 .= "$item_name{$p_hidarite{$e_id}}を$item_nedan{$p_hidarite{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_hidarite{$e_id}};
$p_hidarite{$e_id} = 1000;
				}else{
		$igcome3 .= "現在の左手装備$item_name{$p_hidarite{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_hidarite{$e_id}<>$tt<>$p_hidarite_lv{$e_id}<>\n");
$p_hidarite{$e_id} = 1000;
				}
					}
					if($p_migite{$f_id}%1000 and ($item_2hf{$zc2}+$item_2hf{$p_migite{$f_id}} > 2)){
				if($p_migite{$e_id}%1000 < 100){
		$igcome3 .= "$item_name{$p_migite{$e_id}}を$item_nedan{$p_migite{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_migite{$e_id}};
$p_migite{$e_id} = 1000;
				}else{
		$igcome3 .= "現在の右手装備$item_name{$p_migite{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_migite{$e_id}<>$tt<>$p_migite_lv{$e_id}<>\n");
$p_migite{$e_id} = 1000;
				}
					}
				if($p_hidarite{$f_id}%1000){
$p_migite{$e_id} = $zc2;
$p_migite_lv{$e_id} = int($zcent);
				}else{
$p_hidarite{$e_id} = $zc2;
$p_hidarite_lv{$e_id} = int($zcent);
				}
						}elsif(int($in{'s2no'}%10)  eq "0"){
$add_m1 = $p_migite{$e_id};
$add_m2 = $p_migite_lv{$e_id};
$p_migite{$e_id} = $p_hidarite{$e_id};
$p_migite_lv{$e_id} = $p_hidarite_lv{$e_id};
$p_hidarite{$e_id} = $add_m1;
$p_hidarite_lv{$e_id} = $add_m2;
						}
				if($p_hidarite{$e_id}%1000 + $p_migite{$e_id}%1000<1){
$p_migite{$e_id} = 1099;
$p_migite_lv{$e_id} = 0;
$p_hidarite{$e_id} = 1000;
$p_hidarite_lv{$e_id} = 0;
				}

			}elsif(int($in{'s2no'}/10) eq "2"){
				if($p_syomotu{$e_id}%1000 < 100){
		$igcome3 = "$item_name{$p_syomotu{$e_id}}を$item_nedan{$p_syomotu{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_syomotu{$e_id}};
				}else{
		$igcome3 = "現在の装備$item_name{$p_syomotu{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_syomotu{$e_id}<>$tt<>$p_syomotu_lv{$e_id}<>\n");
				}
$p_syomotu{$e_id} = $zc2;
$p_syomotu_lv{$e_id} = $zcent;
				if($p_syomotu{$e_id}%1000<1){
$p_syomotu{$e_id} = 2000;
$p_syomotu_lv{$e_id} = 0;
				}
			}elsif(int($in{'s2no'}/10) eq "3"){
				if($p_norimono{$e_id}%1000 < 100){
		$igcome3 = "$item_name{$p_norimono{$e_id}}を$item_nedan{$p_norimono{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_norimono{$e_id}};
				}else{
		$igcome3 = "現在の装備$item_name{$p_norimono{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_norimono{$e_id}<>$tt<>$p_norimono_lv{$e_id}<>\n");
				}
$p_norimono{$e_id} = $zc2;
$p_norimono_lv{$e_id} = $zcent;

				if($p_norimono{$e_id}%1000<1){
$p_norimono{$e_id} = 3000;
$p_norimono_lv{$e_id} = 0;
				}
#####
				if($p_b_kougun{$f_id} eq "0"){
#通常移動(将疲1)
$p_b_idou_sokudo{$f_id} = 20 - 0 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($p_b_kougun{$f_id} eq "1"){
#早駆け(将疲3)
$p_b_idou_sokudo{$f_id} = 20 + 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($p_b_kougun{$f_id} eq "2"){
#強行(将疲6)
$p_b_idou_sokudo{$f_id} = 20 + 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($p_b_kougun{$f_id} eq "3"){
#警戒（罠・伏兵回避率UP・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($p_b_kougun{$f_id} eq "4"){
#隠密（負傷・一騎うち回避・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}

				if($p_h_kougun{$f_id} eq "0"){
#通常移動(兵疲3)
$p_h_idou_sokudo{$f_id} = 20 - 0;
				}elsif($p_h_kougun{$f_id} eq "1"){
#早駆け(兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($p_h_kougun{$f_id} eq "2"){
#強行軍(兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 10;
				}elsif($p_h_kougun{$f_id} eq "3"){
#警戒体制（罠・伏兵回避率UP・兵疲4）
$p_h_idou_sokudo{$f_id} = 20 - 10;
				}elsif($p_h_kougun{$f_id} eq "4"){
#突撃体制(突撃率3割増加・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 0;
				}elsif($p_h_kougun{$f_id} eq "5"){
#一点突破(2発目以降は防御１ポイントずつ通過・兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($p_h_kougun{$f_id} eq "6"){
#散開包囲(同一地点３連突・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 - 5;
				}

	if($p_jintousiki{$f_id} ne "2" and $p_b_idou_sokudo{$f_id} < $p_h_idou_sokudo{$f_id}){
$p_h_idou_sokudo{$f_id} = $p_b_idou_sokudo{$f_id};
	}
#####
			}elsif(int($in{'s2no'}/10) eq "4"){
				if($p_ihuku{$e_id}%1000 < 100){
		$igcome3 = "$item_name{$p_ihuku{$e_id}}を$item_nedan{$p_ihuku{$e_id}}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_ihuku{$e_id}};
				}else{
		$igcome3 = "現在の装備$item_name{$p_ihuku{$e_id}}を外し、";
	push(@{"add_item_list$f_id"},"$p_ihuku{$e_id}<>$tt<>$p_ihuku_lv{$e_id}<>\n");
				}
$p_ihuku{$e_id} = $zc2;
$p_ihuku_lv{$e_id} = $zcent;
				if($p_ihuku{$e_id}%1000<1){
$p_ihuku{$e_id} = 4000;
$p_ihuku_lv{$e_id} = 0;
				}
			}elsif(int($in{'s2no'}/10) eq "5"){
						if(int($in{'s2no'}%10)  eq "0"){
				if($p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_b{$e_id}[0]}を$item_nedan{$p_akusesari_b{$e_id}[0]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_b{$e_id}[0]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_b{$e_id}[0]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_b{$e_id}[0]<>$tt<>$p_akusesari_b_lv{$e_id}[0]<>\n");
				}
$p_akusesari_b{$e_id}[0] = $zc2;
$p_akusesari_b_lv{$e_id}[0] = $zcent;
				if($p_akusesari_b{$e_id}[0]%1000<1){
$p_akusesari_b{$e_id}[0] = 5000;
$p_akusesari_b_lv{$e_id}[0] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "1"){
				if($p_akusesari_b{$e_id}[1]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_b{$e_id}[1]}を$item_nedan{$p_akusesari_b{$e_id}[1]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_b{$e_id}[1]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_b{$e_id}[1]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_b{$e_id}[1]<>$tt<>$p_akusesari_b_lv{$e_id}[1]<>\n");
				}
$p_akusesari_b{$e_id}[1] = $zc2;
$p_akusesari_b_lv{$e_id}[1] = $zcent;
				if($p_akusesari_b{$e_id}[1]%1000<1){
$p_akusesari_b{$e_id}[1] = 5000;
$p_akusesari_b_lv{$e_id}[1] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "2"){
				if($p_akusesari_b{$e_id}[2]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_b{$e_id}[2]}を$item_nedan{$p_akusesari_b{$e_id}[2]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_b{$e_id}[2]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_b{$e_id}[2]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_b{$e_id}[2]<>$tt<>$p_akusesari_b_lv{$e_id}[2]<>\n");
				}
$p_akusesari_b{$e_id}[2] = $zc2;
$p_akusesari_b_lv{$e_id}[2] = $zcent;
				if($p_akusesari_b{$e_id}[2]%1000<1){
$p_akusesari_b{$e_id}[2] = 5000;
$p_akusesari_b_lv{$e_id}[2] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "3"){
				if($p_akusesari_b{$e_id}[3]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_b{$e_id}[3]}を$item_nedan{$p_akusesari_b{$e_id}[3]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_b{$e_id}[3]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_b{$e_id}[3]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_b{$e_id}[3]<>$tt<>$p_akusesari_b_lv{$e_id}[3]<>\n");
				}
$p_akusesari_b{$e_id}[3] = $zc2;
$p_akusesari_b_lv{$e_id}[3] = $zcent;
				if($p_akusesari_b{$e_id}[3]%1000<1){
$p_akusesari_b{$e_id}[3] = 5000;
$p_akusesari_b_lv{$e_id}[3] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "4"){
				if($p_akusesari_b{$e_id}[4]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_b{$e_id}[4]}を$item_nedan{$p_akusesari_b{$e_id}[4]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_b{$e_id}[4]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_b{$e_id}[4]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_b{$e_id}[4]<>$tt<>$p_akusesari_b_lv{$e_id}[4]<>\n");
				}
$p_akusesari_b{$e_id}[4] = $zc2;
$p_akusesari_b_lv{$e_id}[4] = $zcent;
				if($p_akusesari_b{$e_id}[4]%1000<1){
$p_akusesari_b{$e_id}[4] = 5000;
$p_akusesari_b_lv{$e_id}[4] = 0;
				}
						}
			}elsif(int($in{'s2no'}/10) eq "6"){
						if(int($in{'s2no'}%10)  eq "0"){
				if($p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_h{$e_id}[0]}を$item_nedan{$p_akusesari_h{$e_id}[0]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_h{$e_id}[0]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_h{$e_id}[0]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_h{$e_id}[0]<>$tt<>$p_akusesari_h_lv{$e_id}[0]<>\n");
				}
$p_akusesari_h{$e_id}[0] = $zc2;
$p_akusesari_h_lv{$e_id}[0] = $zcent;
				if($p_akusesari_h{$e_id}[0]%1000<1){
$p_akusesari_h{$e_id}[0] = 6000;
$p_akusesari_h_lv{$e_id}[0] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "1"){
				if($p_akusesari_h{$e_id}[1]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_h{$e_id}[1]}を$item_nedan{$p_akusesari_h{$e_id}[1]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_h{$e_id}[1]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_h{$e_id}[1]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_h{$e_id}[1]<>$tt<>$p_akusesari_h_lv{$e_id}[1]<>\n");
				}
$p_akusesari_h{$e_id}[1] = $zc2;
$p_akusesari_h_lv{$e_id}[1] = $zcent;
				if($p_akusesari_h{$e_id}[1]%1000<1){
$p_akusesari_h{$e_id}[1] = 6000;
$p_akusesari_h_lv{$e_id}[1] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "2"){
				if($p_akusesari_h{$e_id}[2]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_h{$e_id}[2]}を$item_nedan{$p_akusesari_h{$e_id}[2]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_h{$e_id}[2]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_h{$e_id}[2]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_h{$e_id}[2]<>$tt<>$p_akusesari_h_lv{$e_id}[2]<>\n");
				}
$p_akusesari_h{$e_id}[2] = $zc2;
$p_akusesari_h_lv{$e_id}[2] = $zcent;
				if($p_akusesari_h{$e_id}[2]%1000<1){
$p_akusesari_h{$e_id}[2] = 6000;
$p_akusesari_h_lv{$e_id}[2] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "3"){
				if($p_akusesari_h{$e_id}[3]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_h{$e_id}[3]}を$item_nedan{$p_akusesari_h{$e_id}[3]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_h{$e_id}[3]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_h{$e_id}[3]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_h{$e_id}[1]<>$tt<>$p_akusesari_h_lv{$e_id}[3]<>\n");
				}
$p_akusesari_h{$e_id}[3] = $zc2;
$p_akusesari_h_lv{$e_id}[3] = $zcent;
				if($p_akusesari_h{$e_id}[3]%1000<1){
$p_akusesari_h{$e_id}[3] = 6000;
$p_akusesari_h_lv{$e_id}[3] = 0;
				}
						}elsif(int($in{'s2no'}%10)  eq "4"){
				if($p_akusesari_h{$e_id}[4]%1000 < 100){
		$igcome3 = "$item_name{$p_akusesari_h{$e_id}[4]}を$item_nedan{$p_akusesari_h{$e_id}[4]}で売却し、";
							$p_syoji_kin{$e_id} += $item_nedan{$p_akusesari_h{$e_id}[4]};
				}else{
		$igcome3 = "現在の装備$item_name{$p_akusesari_h{$e_id}[4]}を外し、";
	push(@{"add_item_list$f_id"},"$p_akusesari_h{$e_id}[4]<>$tt<>$p_akusesari_h_lv{$e_id}[4]<>\n");
				}
$p_akusesari_h{$e_id}[4] = $zc2;
$p_akusesari_h_lv{$e_id}[4] = $zcent;
				if($p_akusesari_h{$e_id}[4]%1000<1){
$p_akusesari_h{$e_id}[4] = 6000;
$p_akusesari_h_lv{$e_id}[4] = 0;
				}
						}
			}

$w_id=$f_id;&P_LOG_W("アイテム装備：$igcome3$igcome2$gitem[$itn[$i]]$igcomeentを$igcomeしました");


		}

}

#######################
sub ACD_IDgundan {
		if($acd_sub1{$f_id}[$a_a_no] eq "s"){
	if($p_gundanno{$f_id}){
$w_id=$f_id;&P_LOG_W("軍団/$gundan_name{$fgundan_id}軍団に所属済みです。先に解散/離脱を行ってください。このコマンドは破棄されます。");
next;
	}
	foreach (@gundan_name){
		if($acd_sub2{$f_id}[$a_a_no] eq "$_" ){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]：その名称は既に使われてしまっているようです。");
next;
		}
	}
		$fgundan_id = $gundan_kazu_next;
	foreach(@k_no_all_l){
unlink ("./w_db/gundan_m/l$fgundan_id\_k$_.cgi");
	}
$gundan_yakusyoku_id{$fgundan_id}[1] = $f_id;
$gundan_id{$fgundan_id} =$fgundan_id;
$gundan_no{$fgundan_id} =$fgundan_id;
$gundan_kunino{$fgundan_id} =$k_kunino{$fk_id};
$gundan_kanyuu_bun{$fgundan_id} =$acd_sub3{$f_id}[$a_a_no];
$gundan_sirei_bun{$fgundan_id} ="";
$gundan_busyou_suu{$fgundan_id}=1;
$gundan_yomikaki{$fgundan_id} = 0;
$gundan_sinki_f{$fgundan_id} = 0;
$gundan_name{$fgundan_id} =$acd_sub2{$f_id}[$a_a_no];
	&GUNDAN_N_SAVE("gundan_db","$fgundan_id","$fgundan_id");
$p_gundan_yakusyoku{$f_id} =1;
$p_gundan_sikan_nensuu{$f_id} =0;
$p_gundanno{$f_id} = $fgundan_id;
	push(@{"gundan_l$p_gundanno{$f_id}"},"$f_id<>$p_name{$f_id}<>$p_kunino{$f_id}<>\n");
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]しました。");
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "n"){

		$dgundan_id = $acd_sub2{$f_id}[$a_a_no];
				$mess = "";
	if($fgundan_id){

	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
$p_gunsirei{$f_id}[0] = 0;
				$mess = "$gundan_name{$fgundan_id}軍団を解散し";
		$gundan_kunino{$fgundan_id} = 0;
		$gundan_no{$fgundan_id} = 0;
		$gundan_name{$fgundan_id} = "無所属";


	foreach(@{$gundan_l{$fgundan_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;
$p_gundan_yakusyoku{$e_id} = int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$fgundan_id}[$p_gundan_yakusyoku{$e_id}] = "";

$p_gundanno{$e_id} = 0;
$p_gundan_sikan_nensuu{$e_id} ="";
$p_gundan_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$gundan_name{$fgundan_id}軍団は解散しました。");
			}

	}
		@{"gundan_l{$fgundan_id}"}=();
delete $gundan_l{$fgundan_id};

	}else{
		$add_id="$f_id<";
@{"gundan_l$fgundan_id"} = grep( !/^$add_id/, @{"gundan_l$fgundan_id"} );
				$mess = "$gundan_name{$fgundan_id}軍団から離脱し";
	}

$p_gundan_yakusyoku{$f_id} = int($p_gundan_yakusyoku{$f_id});
$gundan_yakusyoku_id{$fgundan_id}[$p_gundan_yakusyoku{$f_id}] = "";

$p_gundan_sikan_nensuu{$f_id} ="";
$p_gundanno{$f_id} = 0;
$p_gundan_yakusyoku{$f_id} =0;

	}

$p_gundan_sikan_nensuu{$f_id} =0;
$p_gundanno{$f_id} = $dgundan_id;
	push(@{"gundan_l$p_gundanno{$f_id}"},"$f_id<>$p_name{$f_id}<>$p_kunino{$f_id}<>\n");

$w_id=$f_id;&P_LOG_W("軍団/$mess$acd_name{$f_id}[$a_a_no]しました。");
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "j"){
	if($p_gundanno{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_gundan_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]：所属軍団・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
		$e_id = $acd_sub2{$f_id}[$a_a_no];
	if($p_gundanno{$f_id} ne $p_gundanno{$e_id}){
$w_id=$f_id;&P_LOG_W("軍団/解雇対象が同じ軍団に存在しません。このコマンドは破棄されます。");
next;
	}
$p_gundan_yakusyoku{$e_id} = int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$fgundan_id}[$p_gundan_yakusyoku{$e_id}] = "";

$p_gundan_sikan_nensuu{$e_id} ="";
$p_gundanno{$e_id} = 0;
$p_gundan_yakusyoku{$e_id} =0;

		$add_id="$f_id<";
@{"gundan_l$fgundan_id"} = grep( !/^$add_id/, @{"gundan_l$fgundan_id"} );
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]しました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "d"){

	if($p_kunino{$f_id} ne $acd_sub7{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub6{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
	if($p_gundanno{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_gundan_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]：所属軍団・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
		$fgundan_id = $p_gundanno{$f_id};

		if($fgundan_id ne $acd_sub2{$f_id}[$a_a_no] and $k_yakusyoku_id{$fk_id}[1] eq $f_id){

		$dgundan_id = $acd_sub2{$f_id}[$a_a_no];
				$mess = "解雇権限により$gundan_name{$dgundan_id}軍団を解散いた";
		$gundan_kunino{$dgundan_id} = 0;
		$gundan_no{$dgundan_id} = 0;
		$gundan_name{$dgundan_id} = "無所属";


	foreach(@{$gundan_l{$dgundan_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;
#			if($e_id eq $gundan_yakusyoku_id{$dgundan_id}[1]){
$p_gundanno{$e_id} = 0;
#			}
$p_gundan_yakusyoku{$e_id} = int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$dgundan_id}[$p_gundan_yakusyoku{$e_id}] = "";

$p_gunsirei{$e_id}[0] = 0;
$p_gundan_sikan_nensuu{$e_id} ="";
$p_gundan_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$gundan_name{$dgundan_id}軍団は解散しました。");
			}

	}
		@{"gundan_l{$dgundan_id}"}=();
delete $gundan_l{$dgundan_id};
		}else{


	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
$p_gunsirei{$f_id}[0] = 0;
				$mess = "$gundan_name{$fgundan_id}軍団を解散いた";
		$gundan_kunino{$fgundan_id} = 0;
		$gundan_no{$fgundan_id} = 0;
		$gundan_name{$fgundan_id} = "無所属";

	foreach(@{$gundan_l{$fgundan_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;

$p_gundan_yakusyoku{$e_id} = int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$fgundan_id}[$p_gundan_yakusyoku{$e_id}] = "";

$p_gundanno{$e_id} = 0;
$p_gundan_sikan_nensuu{$e_id} ="";
$p_gundan_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$gundan_name{$fgundan_id}軍団は解散しました。");
			}

	}
		@{"gundan_l{$fgundan_id}"}=();
delete $gundan_l{$fgundan_id};

	}else{
		$add_id="$f_id<";
@{"gundan_l$fgundan_id"} = grep( !/^$add_id/, @{"gundan_l$fgundan_id"} );
				$mess = "$gundan_name{$fgundan_id}軍団から離脱";
	}
$p_gundan_yakusyoku{$f_id} = int($p_gundan_yakusyoku{$f_id});
$gundan_yakusyoku_id{$fgundan_id}[$p_gundan_yakusyoku{$f_id}] = "";

$p_gundan_sikan_nensuu{$f_id} ="";
$p_gundanno{$f_id} = 0;
$p_gundan_yakusyoku{$f_id} =0;
		}
$w_id=$f_id;&P_LOG_W("軍団/$messしました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "c"){


	if($k_kunino{$fk_id} eq "0"){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/国家無所属武将は実行できません。");
next;
	}
	if(!$fgundan_id){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団未所属です。");
next;
	}



			if($acd_sub2{$f_id}[$a_a_no] eq "3"){

			if($acd_sub5{$f_id}[$a_a_no] eq "1"){
				$bzc = 1;
				$bsirei1 = "現地集合";
			}elsif($acd_sub5{$f_id}[$a_a_no] eq "2"){
				$bzc = 2;
				$bsirei1 = "謀反";
			}else{
				$bzc = 0;
				$bsirei1 = "自由行動";
			}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団長以外実行できません。");
next;
	}
$p_gunsirei{$f_id}[0] = $bzc;
			}elsif($acd_sub2{$f_id}[$a_a_no] eq "8"){

	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/権限を使用できるのは軍団幹部のみです。");
next;
	}
		$gundan_sirei_bun{$fgundan_id} = $acd_sub4{$f_id}[$a_a_no];
			}elsif($acd_sub2{$f_id}[$a_a_no] eq "9"){

	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/権限を使用できるのは軍団幹部のみです。");
next;
	}
		$gundan_kanyuu_bun{$fgundan_id} = $acd_sub4{$f_id}[$a_a_no];
			}elsif($acd_sub2{$f_id}[$a_a_no] eq "6"){

	$e_id=$acd_sub3{$f_id}[$a_a_no];
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id and $p_gundan_yakusyoku{$gundan_yakusyoku_id{$p_gundanno{$f_id}}[1]} eq "1"){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団長以外実行できません。");
next;
	}
	if($p_gundanno{$f_id} ne $p_gundanno{$e_id}){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団が異なります。");
next;
	}
$p_gundan_yakusyoku{$e_id} =int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$e_id}] ="";
$p_gundan_yakusyoku{$f_id} = int($p_gundan_yakusyoku{$f_id});
$gundan_yakusyoku_id{$fgundan_id}[1] = $e_id;

$p_gundan_yakusyoku{$f_id} =0;
$p_gundan_yakusyoku{$e_id} =1;
$w_id=$e_id;&P_LOG_W("軍団/$p_p_b_a{$f_id}の命により、$gundan_name{$p_gundanno{$f_id}}の軍団長に任命されました。");
$gundan_yomikaki{$fgundan_id} = 0;
			}elsif($acd_sub2{$f_id}[$a_a_no] eq "7"){

$hit =0;
$add_no =2;
	while($add_no < 7){
	if(!$p_id{$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]} or $p_kunino{$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]} ne $fk_id or $p_gundanno{$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]} ne $p_gundanno{$f_id}){
$hit =$add_no;
	}
$add_no ++;
	}
	if(!$hit){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/役職に空きがありません。誰かを解任してください。");
next;
	}

	$e_id=$acd_sub3{$f_id}[$a_a_no];
	&P_READ("p","$e_id","$e_id");
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団長以外実行できません。");
next;
	}
	if($p_gundanno{$f_id} ne $p_gundanno{$e_id}){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団が異なります。");
next;
	}
$p_gundan_yakusyoku{$e_id} =int($p_gundan_yakusyoku{$e_id});
$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$e_id}] ="";
$p_gundan_yakusyoku{$e_id} =$hit;

$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$hit] =$e_id;

			}elsif($acd_sub2{$f_id}[$a_a_no] eq "5"){

	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$acd_sub3{$f_id}[$a_a_no]]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/その役職は既に空席です。");
next;
	}
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/軍団長以外実行できません。");
next;
	}
	$e_id=$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$acd_sub3{$f_id}[$a_a_no]];
$p_gundan_yakusyoku{$e_id} =0;
$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$acd_sub3{$f_id}[$a_a_no]] ="";

			}else{

	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]/権限を使用できるのは軍団幹部のみです。");
next;
	}

			if($gundan_sinki_f{$fgundan_id}){
				$gundan_sinki_f{$fgundan_id} = 0;
				$mess = "可\ ";
			}else{
				$gundan_sinki_f{$fgundan_id} = 1;
				$mess = "拒否";
			}
				$acd_name{$f_id}[$a_a_no] = "$gundan_name{$fgundan_id}軍団を入団$messに";
			}

$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]しました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "c2"){

#	if($p_gundanno{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_gundan_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
#$w_id=$f_id;&P_LOG_W("軍団/$acd_name{$f_id}[$a_a_no]：所属軍団・役職に変更がありました。このコマンドは破棄されます。");
#next;
#	}

#		if($acd_sub2{$f_id}[$a_a_no] eq "1"){
$p_gunsirei{$f_id}[0] = $acd_sub3{$f_id}[$a_a_no];
#		}else{
#		}

$w_id=$f_id;&P_LOG_W("軍団/$acd_sub7{$f_id}[$a_a_no]しました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "iu"){
		}

}

#######################
sub ACD_IDbutai {
		if($acd_sub1{$f_id}[$a_a_no] eq "s"){
	if($p_butaino{$f_id}){
$w_id=$f_id;&P_LOG_W("部隊/$butai_name{$fbutai_id}部隊に所属済みです。先に解散/離脱を行ってください。このコマンドは破棄されます。");
next;
	}
	foreach (@butai_name){
		if($acd_sub2{$f_id}[$a_a_no] eq "$_" ){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]：その名称は既に使われてしまっているようです。");
next;
		}
	}
		$fbutai_id = $butai_kazu_next;
	foreach(@k_no_all_l){
unlink ("./w_db/butai_m/l$fbutai_id\_k$_.cgi");
	}
$butai_yakusyoku_id{$fbutai_id}[1] = $f_id;
$butai_id{$fbutai_id} =$fbutai_id;
$butai_no{$fbutai_id} =$fbutai_id;
$butai_kunino{$fbutai_id} =$k_kunino{$fk_id};
$butai_kanyuu_bun{$fbutai_id} =$acd_sub3{$f_id}[$a_a_no];
$butai_sirei_bun{$fbutai_id} ="";
$butai_busyou_suu{$fbutai_id}=1;
$butai_yomikaki{$fbutai_id} = 0;
$butai_sinki_f{$fbutai_id} = 0;
$butai_name{$fbutai_id} =$acd_sub2{$f_id}[$a_a_no];
	&BUTAI_N_SAVE("butai_db","$fbutai_id","$fbutai_id");
$p_butai_yakusyoku{$f_id} =1;
$p_butai_sikan_nensuu{$f_id} =0;
$p_butaino{$f_id} = $fbutai_id;
	push(@{"butai_l$p_butaino{$f_id}"},"$f_id<>$p_name{$f_id}<>$p_kunino{$f_id}<>\n");
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]しました。");
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "n"){

		$dbutai_id = $acd_sub2{$f_id}[$a_a_no];
				$mess = "";
	if($fbutai_id){

	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] eq $f_id){
$p_butaisirei{$f_id}[0] = 0;
				$mess = "$butai_name{$fbutai_id}部隊を解散し";
		$butai_kunino{$fbutai_id} = 0;
		$butai_no{$fbutai_id} = 0;
		$butai_name{$fbutai_id} = "無所属";


	foreach(@{$butai_l{$fbutai_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;
$p_butai_yakusyoku{$e_id} = int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$fbutai_id}[$p_butai_yakusyoku{$e_id}] = "";

$p_butaino{$e_id} = 0;
$p_butai_sikan_nensuu{$e_id} ="";
$p_butai_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$butai_name{$fgundan_id}部隊は解散しました。");
			}

	}
		@{"butai_l{$fbutai_id}"}=();
delete $butai_l{$fbutai_id};

	}else{
		$add_id="$f_id<";
@{"butai_l$fbutai_id"} = grep( !/^$add_id/, @{"butai_l$fbutai_id"} );
				$mess = "$butai_name{$fbutai_id}部隊から離脱し";
	}

$p_butai_yakusyoku{$f_id} = int($p_butai_yakusyoku{$f_id});
$butai_yakusyoku_id{$fbutai_id}[$p_butai_yakusyoku{$f_id}] = "";

$p_butai_sikan_nensuu{$f_id} ="";
$p_butaino{$f_id} = 0;
$p_butai_yakusyoku{$f_id} =0;

	}

$p_butai_sikan_nensuu{$f_id} =0;
$p_butaino{$f_id} = $dbutai_id;

	push(@{"butai_l$p_butaino{$f_id}"},"$f_id<>$p_name{$f_id}<>$p_kunino{$f_id}<>\n");

$w_id=$f_id;&P_LOG_W("部隊/$mess$acd_name{$f_id}[$a_a_no]しました。");
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "j"){
	if($p_butaino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_butai_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]：所属部隊・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
		$e_id = $acd_sub2{$f_id}[$a_a_no];
	if($p_butaino{$f_id} ne $p_butaino{$e_id}){
$w_id=$f_id;&P_LOG_W("部隊/解雇対象が同じ部隊に存在しません。このコマンドは破棄されます。");
next;
	}

$p_butai_yakusyoku{$e_id} = int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$fbutai_id}[$p_butai_yakusyoku{$e_id}] = "";

$p_butai_sikan_nensuu{$e_id} ="";
$p_butaino{$e_id} = 0;
$p_butai_yakusyoku{$e_id} =0;

		$add_id="$f_id<";
@{"butai_l$fbutai_id"} = grep( !/^$add_id/, @{"butai_l$fbutai_id"} );
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]しました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "d"){

	if($p_kunino{$f_id} ne $acd_sub7{$f_id}[$a_a_no] or $p_kuni_yakusyoku{$f_id} ne $acd_sub6{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("国/$acd_name{$f_id}[$a_a_no]：所属国・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
	if($p_butaino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_butai_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]：所属部隊・役職に変更がありました。このコマンドは破棄されます。");
next;
	}
		$fbutai_id = $p_butaino{$f_id};

		if($fbutai_id ne $acd_sub2{$f_id}[$a_a_no] and $k_yakusyoku_id{$fk_id}[1] eq $f_id){

		$dbutai_id = $acd_sub2{$f_id}[$a_a_no];
				$mess = "解雇権限により$butai_name{$dbutai_id}部隊を解散いた";
		$butai_kunino{$dbutai_id} = 0;
		$butai_no{$dbutai_id} = 0;
		$butai_name{$dbutai_id} = "無所属";


	foreach(@{$butai_l{$dbutai_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;
#			if($e_id eq $butai_yakusyoku_id{$dbutai_id}[1]){
$p_butaino{$e_id} = 0;
#			}
$p_butai_yakusyoku{$e_id} = int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$dbutai_id}[$p_butai_yakusyoku{$e_id}] = "";

$p_gunsirei{$e_id}[0] = 0;
$p_butai_sikan_nensuu{$e_id} ="";
$p_butai_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$butai_name{$dgundan_id}部隊は解散しました。");
			}

	}
		@{"butai_l{$dbutai_id}"}=();
delete $butai_l{$dbutai_id};
		}else{


	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] eq $f_id){
$p_gunsirei{$f_id}[0] = 0;
				$mess = "$butai_name{$fbutai_id}部隊を解散いた";
		$butai_kunino{$fbutai_id} = 0;
		$butai_no{$fbutai_id} = 0;
		$butai_name{$fbutai_id} = "無所属";

	foreach(@{$butai_l{$fbutai_id}}){
		($uni_id,$uni_name)=split(/<>/);
			if($f_id ne $uni_id){
	$e_id=$uni_id;

$p_butai_yakusyoku{$e_id} = int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$fbutai_id}[$p_butai_yakusyoku{$e_id}] = "";

$p_butaino{$e_id} = 0;
$p_butai_sikan_nensuu{$e_id} ="";
$p_butai_yakusyoku{$e_id} =0;
$w_id=$uni_id;&P_LOG_W("$p_name{$f_id}の命により$butai_name{$fgundan_id}部隊は解散しました。");
			}

	}
		@{"butai_l{$fbutai_id}"}=();
delete $butai_l{$fbutai_id};

	}else{
		$add_id="$f_id<";
@{"butai_l$fbutai_id"} = grep( !/^$add_id/, @{"butai_l$fbutai_id"} );
				$mess = "$butai_name{$fbutai_id}部隊から離脱";
	}
$p_butai_yakusyoku{$f_id} = int($p_butai_yakusyoku{$f_id});
$butai_yakusyoku_id{$fbutai_id}[$p_butai_yakusyoku{$f_id}] = "";

$p_butai_sikan_nensuu{$f_id} ="";
$p_butaino{$f_id} = 0;
$p_butai_yakusyoku{$f_id} =0;
		}
$w_id=$f_id;&P_LOG_W("部隊/$messしました。");


		}elsif($acd_sub1{$f_id}[$a_a_no] eq "c"){

	if($k_kunino{$fk_id} eq "0"){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/国家無所属武将は実行できません。");
next;
	}
	if(!$fbutai_id){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊未所属です。");
next;
	}
			if($acd_sub2{$f_id}[$a_a_no] eq "8"){

	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/解雇権限を使用できるのは部隊の幹部のみです。");
next;
	}
		$butai_sirei_bun{$fbutai_id} = $acd_sub4{$f_id}[$a_a_no];
			}elsif($acd_sub2{$f_id}[$a_a_no] eq "9"){

	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/解雇権限を使用できるのは部隊の幹部のみです。");
next;
	}
		$butai_kanyuu_bun{$fbutai_id} = $acd_sub4{$f_id}[$a_a_no];

			}elsif($acd_sub2{$f_id}[$a_a_no] eq "6"){
	$e_id=$acd_sub3{$f_id}[$a_a_no];
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id and $p_butai_yakusyoku{$butai_yakusyoku_id{$p_butaino{$f_id}}[1]} eq "1"){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊長以外実行できません。");
next;
	}
	if($p_butaino{$f_id} ne $p_butaino{$e_id}){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊が異なります。");
next;
	}
$p_butai_yakusyoku{$e_id} =int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$e_id}] ="";
$p_butai_yakusyoku{$f_id} = int($p_butai_yakusyoku{$f_id});
$butai_yakusyoku_id{$fbutai_id}[1] = $e_id;

$p_butai_yakusyoku{$f_id} =0;
$p_butai_yakusyoku{$e_id} =1;
$w_id=$e_id;&P_LOG_W("部隊/$p_p_b_a{$f_id}の命により、$butai_name{$p_butaino{$f_id}}の部隊長に任命されました。");

			}elsif($acd_sub2{$f_id}[$a_a_no] eq "7"){

$hit =0;
$add_no =2;
	while($add_no < 7){
	if(!$p_id{$butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]} or $p_kunino{$butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]} ne $fk_id or $p_butaino{$butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]} ne $p_butaino{$f_id}){
$hit =$add_no;
	}
$add_no ++;
	}
	if(!$hit){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/役職に空きがありません。誰かを解任してください。");
next;
	}
	$e_id=$acd_sub3{$f_id}[$a_a_no];
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊長以外実行できません。");
next;
	}
	if($p_butaino{$f_id} ne $p_butaino{$e_id}){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊が異なります。");
next;
	}
$p_butai_yakusyoku{$e_id} =int($p_butai_yakusyoku{$e_id});
$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$e_id}] ="";
$p_butai_yakusyoku{$e_id} =$hit;
$butai_yakusyoku_id{$p_butaino{$f_id}}[$hit] =$e_id;

			}elsif($acd_sub2{$f_id}[$a_a_no] eq "5"){

	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$acd_sub3{$f_id}[$a_a_no]]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/その役職は既に空席です。");
next;
	}
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/部隊長以外実行できません。");
next;
	}
	$e_id=$butai_yakusyoku_id{$p_butaino{$f_id}}[$acd_sub3{$f_id}[$a_a_no]];
$p_butai_yakusyoku{$e_id} =0;
$butai_yakusyoku_id{$p_butaino{$f_id}}[$acd_sub3{$f_id}[$a_a_no]] ="";

			}else{

	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]/解雇権限を使用できるのは部隊の幹部のみです。");
next;
	}

			if($butai_sinki_f{$fbutai_id}){
				$butai_sinki_f{$fbutai_id} = 0;
				$mess = "可\ ";
			}else{
				$butai_sinki_f{$fbutai_id} = 1;
				$mess = "拒否";
			}
				$acd_name{$f_id}[$a_a_no] = "$butai_name{$fbutai_id}部隊を入隊$messに";
			}
$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]しました。");
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "c2"){

#	if($p_butaino{$f_id} ne $acd_sub9{$f_id}[$a_a_no] or $p_butai_yakusyoku{$f_id} ne $acd_sub8{$f_id}[$a_a_no]){
#$w_id=$f_id;&P_LOG_W("部隊/$acd_name{$f_id}[$a_a_no]：所属部隊・役職に変更がありました。このコマンドは破棄されます。");
#next;
#	}

		if($acd_sub2{$f_id}[$a_a_no] eq "1"){
$p_butaisirei{$f_id}[0] = $acd_sub3{$f_id}[$a_a_no];
$p_butaisirei{$f_id}[2] = $acd_sub5{$f_id}[$a_a_no];
		}else{
$p_butaisirei{$f_id}[1] = $acd_sub3{$f_id}[$a_a_no];
		}

$w_id=$f_id;&P_LOG_W("部隊/$acd_sub7{$f_id}[$a_a_no]しました。");

		}elsif($acd_sub1{$f_id}[$a_a_no] eq "iu"){
		}elsif($acd_sub1{$f_id}[$a_a_no] eq "iu"){
		}

}

#######################
sub ACD_IDitemp {
		if(!$add_item_open{$f_id}){
	open(IN,"./p_db/it/$f_id.cgi");
	@{"add_item_list$f_id"} = <IN>;
	close(IN);
		$add_item_open{$f_id} = 1;
		}
		$add_item_lsousa{$f_id} = 1;
	push(@{"add_item_list$f_id"},"$acd_sub1{$f_id}[$a_a_no]<>$tt<>0<>\n");
$w_id=$f_id;&P_LOG_W("アイテムプレゼント/バグ報告の謝礼として、猫々娘々から<span class=\"cFF0000\">$gitem[$acd_sub1{$f_id}[$a_a_no]]</span>を貰いました。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]バグ報告の謝礼として、猫々娘々から<span class=\"cFF0000\">$gitem[$acd_sub1{$f_id}[$a_a_no]]</span>を貰い受ける。");

}

#######################
sub ACD_IDgazou {
$p_cgno_d{$f_id} = $acd_sub1{$f_id}[$a_a_no];
$p_cg_sabano{$f_id} = $acd_sub2{$f_id}[$a_a_no];

@{$p_cgno{$f_id}} =();
@{$p_cgno{$f_id}} =split(/,/,$acd_sub3{$f_id}[$a_a_no]);

$w_id=$f_id;&P_LOG_W("画像変更：$acd_name{$f_id}[$a_a_no]しました。");
$w_id=$f_id;&IMG_CSS_SEISEI();


}

#######################
sub ACD_IDmotikosi {
}
#######################
sub ACD_IDsounyuu {
}
#######################
sub ACD_IDhoryuu {
}
#######################
sub ACD_IDue {
}
#######################
sub ACD_IDsita {
}
#######################
sub ACD_IDtop {
}
#######################
sub ACD_IDbottom {
}
#######################
sub ACD_IDdel {
}
#######################
sub ACD_ID {
}







1;