
sub NONE1 {$rclno = 1;
}
sub NONE2 {$rclno = 2;
}
sub NONE3 {$rclno = 3;
}
sub NONE4 {$rclno = 4;
}
sub NONE5 {$rclno = 5;
}
sub MOVE {
}
sub NONE {

	if($in{'no'} eq ""){&ER1("NO:が入力されていません。");}
	&P_OPEN;

	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

	@NEW_CD_DB=();$i=0;
	if($in{'no'} eq "all"){
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"$CD_DB[$i]");
			$i++;
		}
		$no = $in{'no'};
	}else{
			foreach(@no){
			push(@NEW_CD_DB,"$CD_DB[$_]");
					$lno = $_ + 1;
					$no .= "$lno,";
			}
	}

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;



	open(OUT,">./p_db/cd/rc-$f_id\.$rclno.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);


	&CD_END("NO:$noをループ用コマンド$rclnoとしてストックしました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"9990$rclno\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


	exit;

}
1;