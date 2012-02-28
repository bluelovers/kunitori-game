
sub MOVE {

	&TT_GET;


	if($in{'mes'} eq ""){&ER1("本文が入力されていません。");}
	&MOJISUU($in{'mes'},300);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。指令。$mojisuu_re"); }
	&P_OPEN;
	if(!$p_kuni_yakusyoku{$f_id}){&ER1("幹部でなければ実行できません。");}


################

	$sirei = "$in{'mes'}$rank_mes:$p_name{$f_id}より$tt_date";
$a_a_d="sirei_kuni<>0<>国/指令変更 <><>$f_id<><>$sirei<><><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "国指令：$sirei を<br />アクティブコマンドとして予約しました。";

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