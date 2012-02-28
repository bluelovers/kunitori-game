
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

	if($fgundan_id){&ER1("軍団に所属している場合は軍団を作成できません。軍団から脱退してください。");}

	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
		&ER1("軍団長は軍団を作成できません。<br />1度軍団を解散させて下さい。");
	}


	if(!$k_kunino{$fk_id}){&ER1("無所属武将は実行できません。");}
	if($in{'name'} eq "無所属" or $in{'name'} eq ""){&ER1("その名前は付けられません。");}
	&MOJISUU($in{'name'},16);
	if($in{'name'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("軍団名は、全角換算１文字以上、８文字以下で入力して下さい。$mojisuu_re"); }
	&MOJISUU($in{'mes'},40);
	if($mojisuu_o) { &ER1("団員募集コメントは、全角換算２０文字以下で入力して下さい。$mojisuu_re"); }
	if($p_kuni_kouken{$f_id} < 500){&ER1("国に対しての貢献値が足りません。500必要です。現在$p_kuni_kouken{$f_id}。");}

$in{'name'}="$in{'name'} ";
	foreach (@gundan_name){
		if($in{'name'} eq $_){&ER1("その軍団名は既に存在します。");}
	}

################

$a_a_d="gundan<>0<>$in{'name'}軍団を作成 <><>$f_id<><>s<>$in{'name'}<>$in{'mes'}<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$in{'name'}軍団を作成 を<br />アクティブコマンドとして予約しました。";

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