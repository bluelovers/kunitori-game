
sub MOVE {


	&P_OPEN;
		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

	if($in{'did'} eq $f_id){&ER1("自分は解雇できません。");}
	if($in{'did'} eq ""){&ER1("相手が選択されていません");}


	if(!$fgundan_id){&ER1("軍団未所属です。");}
	if(!$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$p_gundan_yakusyoku{$f_id}]){
		&ER1("解雇権限を使用できるのは軍団幹部のみです。");
	}

	$e_id=$in{'did'};
	&P_READ("p","$e_id","$e_id");
	if(!$p_id{$e_id}){
		&ER1("IDが確認できません。");
	}
	if($p_gundan_yakusyoku{$e_id} and $gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] ne $f_id){
		&ER1("幹部を解雇可能なのは軍団長のみです。");
	}

################

$a_a_d="gundan<>0<>$gundan_name{$p_gundanno{$f_id}}軍団から$p_name{$e_id}を解雇 <><>$f_id<><>j<>$e_id<><><><><><>$p_gundan_yakusyoku{$f_id}<>$p_gundanno{$f_id}<>\n";
		$xyz = "$gundan_name{$p_gundanno{$f_id}}軍団から$p_name{$e_id}を解雇 を<br />アクティブコマンドとして予約しました。";

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

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"gundan\" /><input type=\"submit\" value=\"軍団編成画面に戻る\" />","");#CD_END
	exit;
}
1;