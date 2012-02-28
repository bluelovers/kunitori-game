
sub MOVE {


	&P_OPEN;
		$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");

	if($in{'did'} eq $f_id){&ER1("自分は解雇できません。");}
	if($in{'did'} eq ""){&ER1("相手が選択されていません");}

    

	if(!$fbutai_id){&ER1("部隊未所属です。");}
	if(!$butai_yakusyoku_id{$p_butaino{$f_id}}[$p_butai_yakusyoku{$f_id}]){
		&ER1("解雇権限を使用できるのは部隊の幹部のみです。");
	}

	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($p_butai_yakusyoku{$e_id} and $butai_yakusyoku_id{$p_butaino{$f_id}}[1] ne $f_id){
		&ER1("幹部を解雇可能なのは隊長のみです。");
	}


################

$a_a_d="butai<>0<>$butai_name{$p_butaino{$f_id}}部隊から$p_name{$e_id}を解雇 <><>$f_id<><>j<>$e_id<><><><><><>$p_butai_yakusyoku{$f_id}<>$p_butaino{$f_id}<>\n";
		$xyz = "$butai_name{$p_butaino{$f_id}}部隊から$p_name{$e_id}を解雇 を<br />アクティブコマンドとして予約しました。";

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