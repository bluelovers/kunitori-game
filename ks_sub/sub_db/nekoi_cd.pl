
require "$mpg_r/sub_db/nekos.pl";
############

sub TAJYUU_HANTEI2 {

		if($in{'id'} eq "-$mpass"){
			$hfip = 1;
		}

	open(IN,"./w_db/guest/$p_kunino{$f_id}.cgi");
	@GUEST_IN=<IN>;
	close(IN);

	@m_list = ();$hit=0;$hit2=0;

			$i = 0;
			$p = 0;
	while($i - $p <= $#GUEST_IN){
			$add = $i - $p;
($guest_time,$guest_name,$guest_kuni,$guest_taizai,$guest_id) = split(/<>/,$GUEST_IN[$add]);
		if($tt - 1800 > $guest_time and $p_id{$f_id} eq $guest_id){
			$hit2=1;
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}elsif($p_id{$f_id} eq $guest_id){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}elsif($tt - 1800 > $guest_time){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}else{
				$m_list .= "<a href=./?.m.=p_b&amp;.id.=$guest_id target=\"_blank\"><span class=\"c000000\">$guest_name</span></a>〔$t_name[$guest_taizai]〕 ";
		}
			$i ++;
	}
		push(@GUEST_IN,"$tt<>$p_name{$f_id}<>$p_kunino{$f_id}<>$p_taizai_iti{$f_id}<>$f_id<>\n");
		$m_list .= "<a href=./?.m.=p_b&amp;.id.=$p_id{$f_id} target=\"_blank\"><span class=\"c000000\">$p_name{$f_id}</span></a>〔$t_name[$p_taizai_iti{$f_id}]〕 ";
	if(!$hit){$hit2=1;
	}
			if($hit2 == 1){ 
	open(OUT,">./w_db/guest/$p_kunino{$f_id}.cgi");
	print OUT @GUEST_IN;
	close(OUT);

&HOST_NAME;
	&TT_GET;
&GET_COOKIE;



	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

		if($hfip < 1 and $apontm eq ""){
			$apontm = $tt - 200000;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk < 20 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontmk += 1;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk >= 20 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontm = $tt;$apontmk += 1;

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

		if($hfip < 1 and $apontm + 86400 > $tt){
			$apontmj = $apontm + 86400 - $tt;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
	 	&ER1("クッキー消失により行動不\能です。行動設定再許可まであと$apontmj秒<br /><br />クッキーを消したり改変しないで下さい。<br />クッキーを故意に何度も消した場合、新規クッキーを発行してから24時間のあいだ行動設定不\能となります。<br />（携帯からのアクセスはOK）");
		}
			if($kasouhit and $kasou1ip ne $host_name){ 
&TT_GET;
	@KTM=();
	unshift(@KTM,"$kasouid<>$kasoupass<>$f_id<>$host_name<>$tt_date<>$kasou1ip<>$kasou1tt<>$kasou2ip<>$kasou2tt<>\n");
	open(OUT,">./p_db/id/$kasouid.cgi");
	print OUT @KTM;
	close(OUT);
			}
require "./$mpg_r/sub_db/jyuu.pl";
&TAJYUU_HANTEI0;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;

				if($jhit){ 
$apontmk += 1;

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	 	&ER1("多重登録？・・クッキー発行回数が1増えました。現在$apontm回。<br /><br />確証はありませんが貴方の携帯から別のIDを操作している痕跡があります。<br />端末識別未対応な旧式の携帯を使用している場合もこのコメントが出ます。");
				}
			}


if($nekonyantyekku) {
&NKONYANS;
}

}

############

sub TAJYUU_HANTEI {

&HOST_NAME;
&TT_GET;
&GET_COOKIE;

		if($in{'id'} eq "-$mpass"){
			$hfip = 1;
		}
		if($hfip < 1){
	 	&ER1("（携帯以外アクセス不\能です）");
		}

	open(IN,"./w_db/guest/$p_kunino{$f_id}.cgi");
	@GUEST_IN=<IN>;
	close(IN);

	@m_list = ();$hit=0;$hit2=0;@NEW_G_LIST=();

	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

		if($hfip < 1 and $apontm eq ""){
			$apontm = $tt - 200000;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk < 20 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontmk += 1;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk >= 20 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontm = $tt;$apontmk += 1;

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

		if($hfip < 1 and $apontm + 86400 > $tt){
			$apontmj = $apontm + 86400 - $tt;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
	 	&ER1("クッキー消失により行動不\能です。行動設定再許可まであと$apontmj秒<br /><br />クッキーを消したり改変しないで下さい。<br />クッキーを故意に何度も消した場合、新規クッキーを発行してから24時間のあいだ行動設定不\能となります。<br />（携帯からのアクセスはOK）");
		}

			$i = 0;
			$p = 0;
	while($i - $p <= $#GUEST_IN){
			$add = $i - $p;
($guest_time,$guest_name,$guest_kuni,$guest_taizai,$guest_id) = split(/<>/,$GUEST_IN[$add]);
		if($tt - 1800 > $guest_time and $p_id{$f_id} eq $guest_id){
			$hit2=1;$hit=1;
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}elsif($p_id{$f_id} eq $guest_id){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;$hit=1;
		}elsif($tt - 1800 > $guest_time){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}else{
				$m_list .= "<a href=./?.m.=p_b&amp;.id.=$guest_id target=\"_blank\"><span class=\"c000000\">$guest_name</span></a>〔$t_name[$guest_taizai]〕 ";
		}
			$i ++;
	}

		push(@GUEST_IN,"$tt<>$p_name{$f_id}<>$p_kunino{$f_id}<>$p_taizai_iti{$f_id}<>$f_id<>\n");
	if(!$hit){$hit2=1;
	}
			if($hit2 == 1){ 
	open(OUT,">./w_db/guest/$p_kunino{$f_id}.cgi");
	print OUT @GUEST_IN;
	close(OUT);

			if($kasouhit and $kasou1ip ne $host_name){ 
&TT_GET;
	@KTM=();
	unshift(@KTM,"$kasouid<>$kasoupass<>$f_id<>$host_name<>$tt_date<>$kasou1ip<>$kasou1tt<>$kasou2ip<>$kasou2tt<>\n");
	open(OUT,">./p_db/id/$kasouid.cgi");
	print OUT @KTM;
	close(OUT);
			}
require "./$mpg_r/sub_db/jyuu.pl";
&TAJYUU_HANTEI0;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
				if($jhit){ 
$apontmk += 1;

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	 	&ER1("多重登録？・・クッキー発行回数が1増えました。現在$apontm回。<br /><br />確証はありませんが貴方の携帯から別のIDを操作している痕跡があります。<br />端末識別未対応な旧式の携帯を使用している場合もこのコメントが出ます。");
				}
			}


if($nekonyantyekku) {
&NKONYANS;
}

}


1;
