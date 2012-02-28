
sub MOVE {

	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");


			$in{'hsk'} =~ s/\r\n/<br $TAG_s0>/g;
			$in{'hsk'} =~ s/\r/<br $TAG_s0>/g;
			$in{'hsk'} =~ s/\n/<br $TAG_s0>/g;

			$in{'hsn4'} =~ s/\r\n/<br $TAG_s0>/g;
			$in{'hsn4'} =~ s/\r/<br $TAG_s0>/g;
			$in{'hsn4'} =~ s/\n/<br $TAG_s0>/g;

			$in{'hsnp'} =~ s/\r\n/<br $TAG_s0>/g;
			$in{'hsnp'} =~ s/\r/<br $TAG_s0>/g;
			$in{'hsnp'} =~ s/\n/<br $TAG_s0>/g;

	&MOJISUU($in{'hy'},40);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（メルアド）。$mojisuu_re"); }
	&MOJISUU($in{'hc'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（ICQ）。$mojisuu_re"); }
	&MOJISUU($in{'hi'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（IRC）。$mojisuu_re"); }
	&MOJISUU($in{'h1'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（職業）。$mojisuu_re"); }
	&MOJISUU($in{'h2'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（住所）。$mojisuu_re"); }
	&MOJISUU($in{'h3'},4);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（年齢）。$mojisuu_re"); }
	&MOJISUU($in{'hyj'},4);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（性別）。$mojisuu_re"); }
	&MOJISUU($in{'hsj'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（趣味）。$mojisuu_re"); }
	&MOJISUU($in{'hgj'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（特技）。$mojisuu_re"); }
	&MOJISUU($in{'htr'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（好き）。$mojisuu_re"); }
	&MOJISUU($in{'hmg'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（嫌い）。$mojisuu_re"); }
	&MOJISUU($in{'insjikopr'},2000);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（PR）。$mojisuu_re"); }
	&MOJISUU($in{'hsn1'},3);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（C年齢）。$mojisuu_re"); }
	&MOJISUU($in{'hsn2'},2);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（C性別）。$mojisuu_re"); }
	&MOJISUU($in{'hsn3'},60);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（C特技）。$mojisuu_re"); }
	&MOJISUU($in{'inshaikei'},2000);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（C背景）。$mojisuu_re"); }
	&MOJISUU($in{'inskyarapr'},2000);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（CPR）。$mojisuu_re"); }
	&MOJISUU($in{'hk'},60);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（HP）。$mojisuu_re"); }

	if(!$in{'hsn2'}){
$seibetu_t[0] = "♀";
$seibetu_t[1] = "♂";
$khsn2 = "$seibetu_t[$p_sex{$f_id}]";
	}

		@F_LOG3=();

	open(IN,"./pr/b/$f_id.cgi");
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
		push(@F_LOG3,"12<>$in{'insjikopr'}<>\n");
		push(@F_LOG3,"$kf12<>$in{'hsn1'}<>\n");
		push(@F_LOG3,"$kf13<>$in{'hsn2'}<>\n");
		push(@F_LOG3,"$kf14<>$in{'hsn3'}<>\n");
		push(@F_LOG3,"$kf15<>$in{'inshaikei'}<>\n");
		push(@F_LOG3,"$kf16<>$in{'inskyarapr'}<>\n");
		push(@F_LOG3,"17<>$in{'hk'}<>\n");

		open(OUT,">./pr/b/$f_id.cgi");
		print OUT @F_LOG3;
		close(OUT);

	&CD_END("コメントを再編集しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"bcome\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}
1;