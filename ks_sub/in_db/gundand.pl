
sub MOVE {


	&P_OPEN;

		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		if(!$in{'unit_id'} or $k_yakusyoku_id{$fk_id}[1] ne $f_id){
		$in{'unit_id'} = $p_gundanno{$f_id};
		}

	&GUNDAN_OPEN("gundan_db","$in{'unit_id'}","$in{'unit_id'}");

	if(!$gundan_id{$in{'unit_id'}}){&ER1("未所属＆未選択です。");}


################

$a_a_d="gundan<>0<>$gundan_name{$in{'unit_id'}}軍団 離脱/解散 <><>$f_id<><>d<>$in{'unit_id'}<><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>$p_gundan_yakusyoku{$f_id}<>$p_gundanno{$f_id}<>\n";
		$xyz = "$gundan_name{$in{'unit_id'}}軍団 離脱/解散 を<br />アクティブコマンドとして予約しました。";

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