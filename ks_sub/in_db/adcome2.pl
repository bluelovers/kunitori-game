
sub MOVE {

	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");


$in{'ad_w_cm_0'} = abs(int($in{'ad_w_cm_0'}));
$in{'ad_w_cm_2'} = abs(int($in{'ad_w_cm_2'}));
$in{'ad_w_cm_5'} = abs(int($in{'ad_w_cm_5'}));

	&MOJISUU($in{'ad_w_cm_1'},40);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告ID）。$mojisuu_re"); }
	&MOJISUU($in{'ad_w_cm_3'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告キーワード）。$mojisuu_re"); }
	&MOJISUU($in{'ad_w_cm_4'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告コード）。$mojisuu_re"); }
	&MOJISUU($in{'ad_w_cm_0'},20);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告媒体）。$mojisuu_re"); }
	&MOJISUU($in{'ad_w_cm_2'},20);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告カテゴリ）。$mojisuu_re"); }

	&MOJISUU($in{'ad_w_cm_5'},20);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（広告スロット）。$mojisuu_re"); }
$in{'ad_w_cm_6'} =~ s/&#47;/\//g;
$in{'ad_w_cm_6'} =~ s/&#44;/\,/g;
	&MOJISUU($in{'ad_w_cm_6'},60);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（作成日）。$mojisuu_re"); }


	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);

	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);

	$ad_w_cm_0 = $in{'ad_w_cm_0'};
	$ad_w_cm_1 = $in{'ad_w_cm_1'};
	$ad_w_cm_2 = $in{'ad_w_cm_2'};
	$ad_w_cm_3 = $in{'ad_w_cm_3'};
	$ad_w_cm_4 = $in{'ad_w_cm_4'};
	$ad_w_cm_5 = $in{'ad_w_cm_5'};
	$ad_w_cm_6 = $in{'ad_w_cm_6'};
	$ad_w_cm_7 = $in{'ad_w_cm_7'};
	$ad_w_cm_8 = $in{'ad_w_cm_8'};
	$ad_w_cm_9 = $in{'ad_w_cm_9'};

		push(@F_LOG3,"$ad_w_cm_0<>$ad_w_cm_1<>$ad_w_cm_2<>$ad_w_cm_3<>$ad_w_cm_4<>$ad_w_cm_5<>$ad_w_cm_6<>$ad_w_cm_7<>$ad_w_cm_8<>$ad_w_cm_9<>$ad_w_op_0<>$ad_w_op_1<>$ad_w_op_2<>$ad_w_op_3<>$ad_w_op_4<>$ad_w_op_5<>$ad_w_op_6<>$ad_w_op_7<>$ad_w_op_8<>$ad_w_op_9<>$ad_w_op_10<>$ad_w_op_11<>$ad_w_op_12<>$ad_w_op_13<>$ad_w_op_14<>$ad_w_op_15<>$ad_w_op_16<>$ad_w_op_17<>$ad_w_op_18<>$ad_w_op_19<>\n");
	

		open(OUT,">./pr/ad/$f_id.txt");
		print OUT @F_LOG3;
		close(OUT);

	&CD_END("広告/OPT設定を再編集しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"adcome\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}
1;