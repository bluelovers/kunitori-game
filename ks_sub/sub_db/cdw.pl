
	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

	$mes_num = @CD_DB;

	if($mes_num > $MAX_CD) { pop(@CD_DB); }

	@NEW_CD_DB=();$i=0;
	if($in{'no'} eq "all"){
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"$cdw_id<>$cdw_no<>$cdw_name<>$cdw_op0<>$cdw_op1<>$cdw_op2<>$cdw_op3<>$cdw_op4<>$cdw_type1<>$cdw_type2<>$cdw_type3<>$cdw_optts<>$cdw_opttw<>$cdw_ai<>$cdw_r_f<>$cdw_r_endno<>$cdw_r_type<>$cdw_r_ai<>\n");
			$i++;
		}
		$no = $in{'no'};
	}else{
			foreach(@no){
					$i = abs(int($_));
					splice(@CD_DB,$i,1,"$cdw_id<>$cdw_no<>$cdw_name<>$cdw_op0<>$cdw_op1<>$cdw_op2<>$cdw_op3<>$cdw_op4<>$cdw_type1<>$cdw_type2<>$cdw_type3<>$cdw_optts<>$cdw_opttw<>$cdw_ai<>$cdw_r_f<>$cdw_r_endno<>$cdw_r_type<>$cdw_r_ai<>\n");
					$lno = $_ + 1;
					$no .= "$lno,";
			}
@NEW_CD_DB = @CD_DB;
	}

	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);


1;