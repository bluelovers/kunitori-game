
sub MOVE {

	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");



	&MOJISUU($in{'hy'},40);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（野戦）。$mojisuu_re"); }
	&MOJISUU($in{'hc'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（クリティカル）。$mojisuu_re"); }
	&MOJISUU($in{'hi'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（一騎打ち）。$mojisuu_re"); }
	&MOJISUU($in{'h1'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（壱）。$mojisuu_re"); }
	&MOJISUU($in{'h2'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（弐）。$mojisuu_re"); }
	&MOJISUU($in{'h3'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（参）。$mojisuu_re"); }
	&MOJISUU($in{'hyj'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（妖術）。$mojisuu_re"); }
	&MOJISUU($in{'hsj'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（仙術）。$mojisuu_re"); }
	&MOJISUU($in{'hgj'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（幻術）。$mojisuu_re"); }
	&MOJISUU($in{'htr'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（治療）。$mojisuu_re"); }
	&MOJISUU($in{'hmg'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（召喚）。$mojisuu_re"); }
	&MOJISUU($in{'hsk'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（士気）。$mojisuu_re"); }
	&MOJISUU($in{'hsn1'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（馬）。$mojisuu_re"); }
	&MOJISUU($in{'hsn2'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（２）。$mojisuu_re"); }
	&MOJISUU($in{'hsn3'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（３）。$mojisuu_re"); }
	&MOJISUU($in{'hsn4'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（４）。$mojisuu_re"); }
	&MOJISUU($in{'hsnp'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（獣）。$mojisuu_re"); }
	&MOJISUU($in{'hk'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（開始）。$mojisuu_re"); }

		@F_LOG3=();

	open(IN,"./p_db/co/$f_id.cgi");
	@F_LOG2K = <IN>;
	close(IN);
	($kf12,$khsn1) = split(/<>/,$F_LOG2K[12]);
	($kf13,$khsn2) = split(/<>/,$F_LOG2K[13]);
	($kf14,$khsn3) = split(/<>/,$F_LOG2K[14]);
	($kf15,$khsn4) = split(/<>/,$F_LOG2K[15]);
	($kf16,$khsnp) = split(/<>/,$F_LOG2K[16]);
		push(@F_LOG3,"1<>$in{'hy'}<>\n");
		push(@F_LOG3,"2<>$in{'hc'}<>\n");
		push(@F_LOG3,"3<>$in{'hi'}<>\n");
		push(@F_LOG3,"4<>$in{'h1'}<>\n");
		push(@F_LOG3,"5<>$in{'h2'}<>\n");
		push(@F_LOG3,"6<>$in{'h3'}<>\n");
		push(@F_LOG3,"7<>$in{'hyj'}<>\n");
		push(@F_LOG3,"8<>$in{'hsj'}<>\n");
		push(@F_LOG3,"9<>$in{'hgj'}<>\n");
		push(@F_LOG3,"10<>$in{'htr'}<>\n");
		push(@F_LOG3,"11<>$in{'hmg'}<>\n");
		push(@F_LOG3,"12<>$in{'hsk'}<>\n");
		push(@F_LOG3,"$kf12<>$in{'hsn1'}<>\n");
		push(@F_LOG3,"$kf13<>$in{'hsn2'}<>\n");
		push(@F_LOG3,"$kf14<>$in{'hsn3'}<>\n");
		push(@F_LOG3,"$kf15<>$in{'hsn4'}<>\n");
		push(@F_LOG3,"$kf16<>$in{'hsnp'}<>\n");
		push(@F_LOG3,"17<>$in{'hk'}<>\n");

		open(OUT,">./p_db/co/$f_id.cgi");
		print OUT @F_LOG3;
		close(OUT);


	&CD_END("コメントを再編集しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"come\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}




1;