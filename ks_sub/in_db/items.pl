
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;

											$sinakazu=@no;
			if($sinakazu > 10 or !$sinakazu){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">10個を超えて同時入札は出来ません。又は品物未選択です。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;
	exit;
			}
	open(IN,"./p_db/it/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	foreach(@no){
											$i=$_;
			if(!$itn[$i]){
		($itn[$i],$itnw[$i],$itent[$i])=split(/<>/,$F_LOG2[$i]);

		$itn[$i] = int($itn[$i]);
		$itent[$i] = int($itent[$i]);

			if(!$itn[$i]){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$gitem[$itn[$i]]は、存在しないようです。画面を更新してお確かめ下さい。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;
	exit;
			}else{
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />";
		$no_l .= "$_,";
		$add_i_name .= "$gitem[$itn[$i]]（+$itent[$i]）<br />";
			}
			}
	}

		$m_ttfl = (stat("./p_db/it/$f_id.cgi"))[9];

			if($in{'tt'} < $m_ttfl){
&ER1("アイテムが更新されているようです。前の画面に戻って画面更新をしてください。");
			}

			if($in{'kaku'} eq ""){
	&HEADER;


	print <<"PRI";
<hr /><span class=\"fs4\">$add_i_nameをオークションに出品しますがよろしいですか？</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"items\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".kaku.\" value=\"ok\" />$no_list 
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"submit\" value=\"出品します\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"出品しません\" /></div></form>
PRI
			}else{


    &F_LOCK("item");

################

		$in{'tuika'} = abs(int($in{'tuika'}));
$a_a_d="syuppin<>0<>オークションに出品（$sinakazu） <><>$f_id<><>$no_l<>$in{'tuika'}<><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$add_i_nameをオークションに出品 を<br />アクティブコマンドとして予約しました。";

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


	&UNLOCK_FILE("item");

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


			}
	&FOOTER;

	exit;

}
1;