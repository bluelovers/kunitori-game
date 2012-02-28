
sub ARASI {
	open(IN,"../ip/$host.cgi");
	@TASIROH = <IN>;
	close(IN);

	($tasiro,$tasiroc,$tasirol,$t2asiro,$t2asiroc) = split(/<>/,$TASIROH[0]);

	if ($tasiroc > 100) {
			$tasirohit = 600;
		if ($tasiro < $tt) {
			if ($tasiro + $tasirohit > $tt) {
				$tasirol ++;
			}else{
				$tasirol -= 3;
			}
				if ($tasirol < 1) {
					$tasirol = 0;
				}
				$tasiroc = $tasirol * 10;
				$tasiro = $tt + $tasirohit;
				if ($tasirol > 5) {
			$sname=$ENV{'script_NAME'};
					$dellip = "ホスト<>$host<>時間<>$tt<>危険ランク（短時間連打＆滞在時間から割り出し）<>$tasirol<>$sname<>\n";
	open(OUT,">>../dbip.cgi");
	print OUT $dellip;
	close(OUT);
				}
		}else{
	print "Content-type: text/html\n\n";
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" $TAG_s0>
<title></title></head><body>$TAG_div_s{$doc_mode}

PRI
    print "連打禁止ヽ(｀Д´)ノ<br /><br />貴方の『制限Lv』⇒$tasirol<br />20分くらい放置していると『制限Lv』がリセットされます<br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a></div></body></html>\n";
	exit;

	$host2 = $host;
$host2 =~ tr/0-9//cd;
$kaunto[$host2] .= 1;
		}
	}
	if ($t2asiroc > 10) {
			$t2asirohit = 6;
		if ($t2asiro < $tt) {
				$t2asiro = $tt + $t2asirohit;
				$t2asiroc = 0;
		}else{
$tasiroc += 100;
		}
	}
				$tasiroc ++;
				$t2asiroc ++;
	@TASIROH = ();
	unshift(@TASIROH,"$tasiro<>$tasiroc<>$tasirol<>$t2asiro<>$t2asiroc<>\n");
	open(OUT,">../ip/$host.cgi");
	print OUT @TASIROH;
	close(OUT);

}



############
sub TAJYUU_HANTEI0 {

				open(IN,"./w_db/comip0.cgi");
				@add_list0 = <IN>;
				close(IN);

				@add_listc = @add_list0;

$comhost = "";
	foreach(@add_listc){
		($mdsid0,$dcomhost0) = split(/<>/);
 					if($mdsid0 eq $f_id){$comhost = $dcomhost0;last;
					}
	}

$host =~ s/\r//g;
$host =~ s/\n//g;
$comhost =~ s/\r//g;
$comhost =~ s/\n//g;
 if ($host and $comhost =~ /\Q$host\E/) {
 $host = "$comhost";
 }

 if ($comhost and $host =~ /\Q$comhost\E/) {
 $comhost = $host;
 }

 if ($host and $ckhost =~ /\Q$host\E/) {
 $host = $ckhost;
 }
 if ($ckhost and $host =~ /\Q$ckhost\E/) {
 $ckhost = $host;
 }
 					if($host and $host ne $comhost){
$nekonyantyekku=1;

opendir(CF,'./p_db/p');
@cfs = (readdir(CF));
	closedir(CF);
$sousu1 = $#cfs -2;
	unshift(@add_list0,"$f_id<>$host<><>\n");
	$taikai_max3 = @add_list0;
	if($taikai_max3 > $sousu1 * 3) { pop(@add_list0);pop(@add_list0); }

	open(OUT,">./w_db/comip0.cgi");
	print OUT @add_list0;
	close(OUT);

					}

 					if($host ne $ckhost and "" ne $ckhost){
opendir(CF,'./p_db/p');
@cfs = (readdir(CF));
	closedir(CF);
$sousu1 = $#cfs -2;
	unshift(@add_list0,"$f_id<>$ckhost<><>\n");
	$taikai_max3 = @add_list0;
	if($taikai_max3 > $sousu1 * 3) { pop(@add_list0);pop(@add_list0); }

	open(OUT,">./w_db/comip0.cgi");
	print OUT @add_list0;
	close(OUT);
					}

				open(IN,"./w_db/comip0.cgi");
				@add_list0 = <IN>;
				close(IN);
				@New_add_list = ();
	foreach(@add_list0){
		($mdsid0,$dcomhost0) = split(/<>/);
$aponhnt = 0;
 						if($host ne $ckhost and "" ne $ckhost and $mdsid0 ne $f_id and $dcomhost0 eq $ckhost and $p_syokihost{$f_id} ne $dcomhost0 and "" ne $mdsid0 and "127.0.0.1" ne $dcomhost0){
	@NEW_COMJ=();
	unshift(@NEW_COMJ,"1<>\n");
	open(OUT,">./ip_db/jyuu/$f_id.cgi");
	print OUT @NEW_COMJ;
	close(OUT);
$aponhnt = 1;
$host_name = "$host_name@";
						}elsif($mdsid0 ne $f_id and $dcomhost0 eq $host and $p_syokihost{$f_id} ne $dcomhost0 and "" ne $mdsid0 and "127.0.0.1" ne $dcomhost0){

	@NEW_COMJ=();
	unshift(@NEW_COMJ,"1<>\n");
	open(OUT,">./ip_db/jyuu/$f_id.cgi");
	print OUT @NEW_COMJ;
	close(OUT);
$aponhnt = 1;
						}else{
			push (@New_add_list,"$mdsid0<>$dcomhost0<><>\n");
						}

 					if($aponhnt == 1){
&P_READ("p","$mdsid0","$mdsid0");
$aponjf = "⇒は保護IP";
 				if($p_syokihost{$mdsid0} ne $dcomhost0){
$aponjf = "相互重複";
 				}


				open(IN,"./w_db/apon.cgi");
				@NEW_DATA3 = <IN>;
				close(IN);

@NEW_DATAk3 = @NEW_DATA3;
$kapon = 1;
	foreach(@NEW_DATAk3){
		($kmdsid,$kdcomhost,$ekmdsid) = split(/<>/);
	if($kmdsid eq $f_id and $kdcomhost eq $dcomhost0 and $ekmdsid eq $mdsid0) { $kapon = 0;last; }
	}
if($kapon == 1) { 

opendir(CF,'./p_db/p');
@cfs = (readdir(CF));
closedir(CF);
$sousu1 = $#cfs -2;

	unshift(@NEW_DATA3,"$f_id<>$dcomhost0<>$mdsid0<>$p_name{$f_id}<>$p_keyword{$f_id}<>$ekname<>$ekmail<>$aponjf<>$host_name<>\n");
	$taikai_max3 = @NEW_DATA3;
	if($taikai_max3 > $sousu1 * 2) { pop(@NEW_DATA3); }

	open(OUT,">./w_db/apon.cgi");
	print OUT @NEW_DATA3;
	close(OUT);
}

$jhit = 1;
					}
	}


	$taikai_max3 = @New_add_list;
	if($taikai_max3 > $sousu1 * 3) { pop(@New_add_list);pop(@New_add_list); }
	open(OUT,">./w_db/comip0.cgi");
	print OUT @New_add_list;
	close(OUT);

	open(IN,"./ip_db/jyuu/$f_id.cgi");
	@CN_DATAJ = <IN>;
	close(IN);
	($apon2) = split(/<>/,$CN_DATAJ[0]);

 					if($jhit < 1 and $apon2 eq "1"){

	@NEW_COMJ=();
	unshift(@NEW_COMJ,"0<>\n");
	open(OUT,">./ip_db/jyuu/$f_id.cgi");
	print OUT @NEW_COMJ;
	close(OUT);
					}


 					if($jhit < 1 and $apon2 eq ""){
	@NEW_COMJ=();
	unshift(@NEW_COMJ,"0<>\n");
	open(OUT,">./ip_db/jyuu/$f_id.cgi");
	print OUT @NEW_COMJ;
	close(OUT);
					}
}

1;
