
sub MOVE {


	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/ingo2.pl";

	open(IN,"./pr/k/$p_kunino{$f_id}.cgi");
	@F_LOG2 = <IN>;
	close(IN);
	($hnof,$hy) = split(/<>/,$F_LOG2[0]);
	($hnof,$hc) = split(/<>/,$F_LOG2[1]);
	($hnof,$hi) = split(/<>/,$F_LOG2[2]);
	($hnof,$h1) = split(/<>/,$F_LOG2[3]);
	($hnof,$h2) = split(/<>/,$F_LOG2[4]);
	($hnof,$h3) = split(/<>/,$F_LOG2[5]);
	($hnof,$hyj) = split(/<>/,$F_LOG2[6]);
	($hnof,$hsj) = split(/<>/,$F_LOG2[7]);
	($hnof,$hgj) = split(/<>/,$F_LOG2[8]);
	($hnof,$htr) = split(/<>/,$F_LOG2[9]);
	($hnof,$hmg) = split(/<>/,$F_LOG2[10]);
	($hnof,$hsk) = split(/<>/,$F_LOG2[11]);
	($kf12,$khsn1) = split(/<>/,$F_LOG2[12]);
	($kf13,$khsn2) = split(/<>/,$F_LOG2[13]);
	($kf14,$khsn3) = split(/<>/,$F_LOG2[14]);
	($kf15,$khsn4) = split(/<>/,$F_LOG2[15]);
	($kf16,$khsnp) = split(/<>/,$F_LOG2[16]);
	($hnof,$hk) = split(/<>/,$F_LOG2[17]);
				&KANBU_NAME;
			$in{'hmg'} =~ s/\r\n/<br $TAG_s0>/g;
			$in{'hmg'} =~ s/\r/<br $TAG_s0>/g;
			$in{'hmg'} =~ s/\n/<br $TAG_s0>/g;

			$in{'hsk'} =~ s/\r\n/<br $TAG_s0>/g;
			$in{'hsk'} =~ s/\r/<br $TAG_s0>/g;
			$in{'hsk'} =~ s/\n/<br $TAG_s0>/g;

	if($k_yakusyoku_id{$fk_id}[25] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("${$zokukanbuptn}[25]か上公か三孤でなければ実行できません。");}


	&MOJISUU($in{'hy'},40);
	if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hc'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hi'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'h1'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'h2'},20);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'h3'},3);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hyj'},2);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hsj'},200);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（登用文）。$mojisuu_re"); }

if($hyj ne $in{'hsj'}) {
$in{'hsj'} = "$in{'hsj'} （この登用文は$p_name{$f_id}の進言により設定されました）";
}
$cnksw = $in{'hsj'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("その登用文は使用できません。$_『隠語・淫語フィルター』");}
	}
	&MOJISUU($in{'hgj'},60);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（URL）。$mojisuu_re"); }
if($hgj ne $in{'hgj'}) {
$in{'hgj'} = "$in{'hgj'} $p_name{$f_id}より";
}
$cnksw = $in{'hgj'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("そのURLは使用できません。$_『隠語・淫語フィルター』");}
	}
	&MOJISUU($in{'htr'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（IRC）。$mojisuu_re"); }
if($htr ne $in{'htr'}) {
$in{'htr'} = "$in{'htr'} $p_name{$f_id}より";
}
$cnksw = $in{'htr'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("そのIRCは使用できません。$_『隠語・淫語フィルター』");}
	}
	&MOJISUU($in{'instokuten'},2000);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（特典）。$mojisuu_re"); }
if($hmg ne $in{'instokuten'}) {
$in{'instokuten'} = "$in{'instokuten'} $p_name{$f_id}より";
}
$cnksw = $in{'instokuten'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("その特典は使用できません。$_『隠語・淫語フィルター』");}
	}
	&MOJISUU($in{'inskunipr'},2000);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（PR）。$mojisuu_re"); }
if($hsk ne $in{'inskunipr'}) {
$in{'inskunipr'} = "$in{'inskunipr'} $p_name{$f_id}より";
}
$cnksw = $in{'inskunipr'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("そのPR文は使用できません。$_『隠語・淫語フィルター』");}
	}
	&MOJISUU($in{'hsn1'},3);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hsn2'},2);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hsn3'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hsn4'},400);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hsnp'},400);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }
	&MOJISUU($in{'hk'},40);
if($mojisuu_o) { &ER1("文字数がオーバーしています。（）。$mojisuu_re"); }

		@F_LOG3=();

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
		push(@F_LOG3,"11<>$in{'instokuten'}<>\n");
		push(@F_LOG3,"12<>$in{'inskunipr'}<>\n");
		push(@F_LOG3,"$kf12<>$in{'hsn1'}<>\n");
		push(@F_LOG3,"$kf13<>$in{'hsn2'}<>\n");
		push(@F_LOG3,"$kf14<>$in{'hsn3'}<>\n");
		push(@F_LOG3,"$kf15<>$in{'hsn4'}<>\n");
		push(@F_LOG3,"$kf16<>$in{'hsnp'}<>\n");
		push(@F_LOG3,"17<>$in{'hk'}<>\n");

		open(OUT,">./pr/k/$p_kunino{$f_id}.cgi");
		print OUT @F_LOG3;
		close(OUT);

	&CD_END("コメントを再編集しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"kcome\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


	exit;

}
1;