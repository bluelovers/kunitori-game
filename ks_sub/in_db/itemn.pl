
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;

	open(IN,"./w_db/okusyon.cgi");
	@OCD = <IN>;
	close(IN);

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

	foreach(@no){
											$i=$_;
		($ocno[$i],$ocino[$i],$ocgaku[$i],$octt[$i],$ocnid[$i],$ocnname[$i],$ocnkuni[$i],$ocsid[$i],$ocsname[$i],$ocskuni[$i])=split(/<>/,$OCD[$i]);

		$fk_id = $p_kunino{$f_id};
			if($ocsid[$i] eq $f_id){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$gitem[$ocino[$i]]は貴方が出品した商品です！ヽ(｀Д´)ノ<br />オークションが終わるまで暫くお待ちください。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;
	exit;
			}
			if($ocnid[$i] eq $f_id){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$gitem[$ocino[$i]]は貴方が最高額で入札中です。<br />オークションが終わるまで暫くお待ちください。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=itemo><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\"></div></form>
PRI

	&FOOTER;
	exit;
			}
			if(!$ocino[$i]){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$gitem[$ocino[$i]]は、存在しないようです。画面を更新してお確かめ下さい。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\"></div></form>
PRI

	&FOOTER;
	exit;
			}
			if($octt[$i] + 172800 < $tt){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$gitem[$ocino[$i]]は、$ocnnameさんが既に落札済みです。<br />商品が発送されるまでしばらくお待ちください。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.mode. value=itemo>
<input type=\"submit\" value=\"ＯＫ\"></div></form>
PRI

	&FOOTER;
	exit;
			}
		$ocgaku2[$i] = int($ocgaku[$i] * 1.2) + abs(int($in{'tuika'}));

		$p_syoji_kin{$f_id} -= $ocgaku2[$i];

			if(0 > $p_syoji_kin{$f_id}){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">お金がたりませんよ！ヽ(｀Д´)ノ</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;
	exit;
			}
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />";
		$no_l .= "$_,";
		$no_l2 .= "$ocgaku2[$i],";
		$add_i_name .= "$ocsname[$i]さんが出品している$gitem[$ocino[$i]]に金$ocgaku2[$i]<br />";
	}


		$m_ttfl = (stat("./w_db/okusyon.cgi"))[9];

			if($in{'tt'} < $m_ttfl){
&ER1("アイテムが更新されているようです。前の画面に戻って画面更新をしてください。");
			}

			if($in{'kaku'} eq ""){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$add_i_nameで入札しますがよろしいですか？（残金$p_syoji_kin{$f_id}）</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemn\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".kaku.\" value=\"ok\" /><input type=\"hidden\" name=\".tuika.\" value=\"$in{'tuika'}\" />
$no_list
<input type=\"submit\" value=\"入札します\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"入札しません\" /></div></form>
PRI
			}else{

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

    &F_LOCK("item");

################

		$in{'tuika'} = abs(int($in{'tuika'}));
$a_a_d="nyuusatu<>0<>入札（$sinakazu） <><>$f_id<><>$no_l<>$in{'tuika'}<>$no_l2<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$add_i_nameで入札 を<br />アクティブコマンドとして予約しました。";

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