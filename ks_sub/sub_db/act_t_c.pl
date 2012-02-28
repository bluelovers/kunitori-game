
sub ACT_CD {



	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

	$mes_num = @CD_DB;

	if($mes_num > 10) { &ER1("アクティブコマンドはこれ以上ストックできません。"); }

			unshift(@CD_DB,"$in{'act'}<>$in{'act_name'}<>$in{'act_p_id'}<>$in{'act_sub1'}<>$in{'act_sub2'}<>$in{'act_sub3'}<>$in{'act_sub4'}<>$in{'act_sub5'}<>$in{'act_sub6'}<>$in{'act_sub7'}<>$tt<>\n");

	$mes_num += 2;

	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;

					$act_no = 0;
					$act_come = "<pre>";
			foreach(@CD_DB){
	($add_act_id,$add_act_come) =split(/<>/);
					$act_come .= "$act_no:$add_act_come<br />";
					$act_no ++;
			}

					$act_come .= "</pre>";

}
1;