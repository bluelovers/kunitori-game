
sub MOVE {

	if($in{'mes'} eq ""){&ER1("本文が入力されていません。");}
	&MOJISUU($in{'mes'},100);
	if($mojisuu_o) { &ER1("全角50文字以下で入力して下さい。$mojisuu_re"); }
require "./$mpg_r/sub_db/ingo2.pl";
$cnksw = $in{'mes'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("その勧誘文は使用できません。$_『隠語・淫語フィルター』");}
	}
	
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


require "./p_db/tt/kcs4$f_id.pl";
require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;
	if($k_yakusyoku_id{$fk_id}[25] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("${$zokukanbuptn}[25]か上公か三孤でなければ実行できません。");}

		$add = $rank_mes;

    &F_LOCK("en");

	open(IN,"./w_db/kanyuu_bun.cgi");
	@C_MES = <IN>;
	close(IN);

	@NEW_C_MES=();
	foreach(@C_MES){
		($mes,$cd_no)=split(/<>/);
		if($cd_no eq $p_kunino{$f_id}){
			$chit=1;
			push(@NEW_C_MES,"$in{'mes'}($add$p_name{$f_id}より)<>$p_kunino{$f_id}<>\n");
		}else{
			push(@NEW_C_MES,"$_");
		}
	}

	if(!$chit){
		unshift(@NEW_C_MES,"$in{'mes'}($add$p_name{$f_id}より)<>$p_kunino{$f_id}<>\n");
	}

	open(OUT,">./w_db/kanyuu_bun.cgi");
	print OUT @NEW_C_MES;
	close(OUT);

	&UNLOCK_FILE("en"); 

	&CD_END("勧誘文を入力しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END



	exit;

}
1;