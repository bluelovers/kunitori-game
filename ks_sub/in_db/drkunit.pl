
sub MOVE {
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";

$p_p_b_a_uri{$f_id} = "<a href=\"$URI/?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"kcb$p_k_iro_d{$f_id}\">$p_name{$f_id}</span></a>";
$k_p_k_a_uri{$fk_id} = "<a href=\"$URI/?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_name_d{$fk_id}</span></a>";
	print "Content-type: text/html\n\n";
	print <<"PRI";
$p_id{$f_id}<>$in{'id'}<>$in{'pass'}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$GAME_TITLE$MEN_TITLE<>$URI<>$p_p_b_a_uri{$f_id}<>$k_p_k_a_uri{$fk_id}$rank_mes<>$h_p_h_a_uri{$fh_id}<>$p_img_m{$f_id}<>$ad_settei_1<>$ad_settei_1<>102<><>
PRI
			
if($in{'wt'}) {
			
	
	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);

	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);

if($in{'wt_ad'}) {
	
$in{'ad_w_cm_6'} =~ s/&#47;/\//g;
$in{'ad_w_cm_6'} =~ s/&#44;/\,/g;
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

}
		push(@F_LOG3,"$ad_w_cm_0<>$ad_w_cm_1<>$ad_w_cm_2<>$ad_w_cm_3<>$ad_w_cm_4<>$ad_w_cm_5<>$ad_w_cm_6<>$ad_w_cm_7<>$ad_w_cm_8<>$ad_w_cm_9<>$in{'ad_w_op_0'}<>$in{'ad_w_op_1'}<>$in{'ad_w_op_2'}<>$in{'ad_w_op_3'}<>$in{'ad_w_op_4'}<>$in{'ad_w_op_5'}<>$in{'ad_w_op_6'}<>$in{'ad_w_op_7'}<>$in{'ad_w_op_8'}<>$in{'ad_w_op_9'}<>$in{'ad_w_op_10'}<>$in{'ad_w_op_11'}<>$in{'ad_w_op_12'}<>$in{'ad_w_op_13'}<>$in{'ad_w_op_14'}<>$in{'ad_w_op_15'}<>$in{'ad_w_op_16'}<>$in{'ad_w_op_17'}<>$in{'ad_w_op_18'}<>$in{'ad_w_op_19'}<>\n");
	

		open(OUT,">./pr/ad/$f_id.txt");
		print OUT @F_LOG3;
		close(OUT);
}
	exit;

}
1;