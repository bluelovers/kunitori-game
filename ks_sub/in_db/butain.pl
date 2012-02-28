
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");
		$dbutai_id = $in{'unit_id'};
	&BUTAI_READ("butai_db","$dbutai_id","$dbutai_id");


	if($dbutai_id eq $fbutai_id) { &ER1("既にその部隊に所属しています。"); }
	if($k_kunino{$fk_id} eq "0"){&ER1("国家無所属武将は実行できません。");}

	if($butai_sinki_f{$dbutai_id}){
		&ER1("入隊拒否になっています。");
	}

	if($butai_kunino{$dbutai_id} ne $p_kunino{$f_id}){
		&ER1("異なる国の部隊です。");
	}


################

$a_a_d="butai<>0<>$butai_name{$dbutai_id}部隊に入隊 <><>$f_id<><>n<>$in{'unit_id'}<><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$butai_name{$dbutai_id}部隊に入隊 を<br />アクティブコマンドとして予約しました。";

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