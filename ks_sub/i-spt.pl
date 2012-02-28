
require "$mpg_r/sub_db/i-index.pl";
require "$mpg_r/vs-spt.pl";

sub HOST_NAME {

	$host = $ENV{'HTTP_X_FORWARDED_FOR'};
 $host_name = $ENV{'HTTP_X_FORWARDED_FOR'};
 if (!$ENV{'HTTP_X_FORWARDED_FOR'}) {
	$host = $ENV{'REMOTE_ADDR'};
 $host_name = $ENV{'REMOTE_ADDR'};
 }
	$hosta = "$ENV{'HTTP_USER_AGENT'}$ENV{'HTTP_X_UP_SUBNO'}";

	$host_ual[0] = "J-PHONE";
	$host_ual[1] = "PDXGW";
	$host_ual[2] = "KDDI";
	$host_ual[3] = "DoCoMo";
	$host_ual[4] = "ASTEL";
	$host_ual[5] = "L-mode";
	$host_ual[6] = "DDIPOCKET";
	$host_ual[7] = "odafone";
	$host_ual[8] = "MOT-";
	$host_ual[9] = "KYOCERA";
	$host_ual[10] = "UP\.Browser";
	$host_ual[11] = "WILLCOM";
	$host_ual[12] = "SoftBank";
	$host_ual[13] = "Google";

	$host_i[0] = "i";
	$host_i[1] = "i";
	$host_i[2] = "i";
	$host_i[3] = "ii";
	$host_i[4] = "i";
	$host_i[5] = "i";
	$host_i[6] = "i";
	$host_i[7] = "i";
	$host_i[8] = "i";
	$host_i[9] = "i";
	$host_i[10] = "i";
	$host_i[11] = "i";
	$host_i[12] = "i";
	$host_i[13] = "i";

	$add_no = 0;
	foreach (@host_ual) {
 if ($hosta=~ /\Q$_\E/) {
$doc_mode = $host_i[$add_no];
 $host = $hosta;
 $hfip = 1;
$doc_mode = "x$ims{$in{'i'}}";
	$add_no ++;
 }
	}
	$value = $hosta;
#$value =~ s/&/&#38;/g;

$value =~ s/</&lt;/g;
$value =~ s/>/&gt;/g;
$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\//&#47;/g;
$value =~ s/,/&#44;/g;
$value =~ s/\'/&#39;/g;
$value =~ s/\\$/\\ /g;

$value =~ s/%/&#37;/g;
$value =~ s/=/&#61;/g;
#$value =~ s/@/&#64;/g;
#$value =~ s/`/&#96;/g;
#$value =~ s/}/&#125;/g;
#$value =~ s/{/&#123;/g;
$value =~ s/eval/&#101;val/g;
$value =~ s/\r//g;
$value =~ s/\n//g;
$hosta =$value;

$host =~ s/,/。/g;
$host_name =~ s/,/。/g;

}

############

sub ER1 {

	&P_OPEN;
	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"button\" value=\"前のページに戻る\" onclick=\"window.history.back()\" /></div></form><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"ステータス画面へ\" /></div></form>";

	&FOOTER;
	exit;
}

############

sub ER2 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><a href=\"./i/\" target=\"_top\">ログイン画面に戻る</a><br />\n</div></body></html>\n";
	exit;
}

############

sub ER3 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><a href=\"./i/\" target=\"_top\">ログイン画面に戻る</a><br />\n</div></body></html>\n";
	exit;
}

############
sub KOUSIN_LOCK {

	local($retry)=10;

	if (-e $lockfile2) {
	$m_ttfl="";
		$m_ttfl = (stat($lockfile2))[9];
		if ($m_ttfl and $m_ttfl < time - 3000) { &KOUSIN_UNLOCK; }
	}

		if (!mkdir($lockfile2, 0755)) { 
	print <<"PRI";
Content-type: $mime_t; charset=UTF-8\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<title>$MEN_TITLE</title></head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\">ロックえらー !</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><br /><br /><hr /><a href=\"./i/\" target=\"_top\">ログイン画面に戻る</a>\n</div></body></html>\n";
	exit;

		}
mkdir("$lockfile2/$$", 0755);

		sleep(0.3);
opendir(CF,$lockfile2);
@cfs = (readdir(CF));
closedir(CF);
		if ($#cfs ne "2") { 
	print <<"PRI";
Content-type: $mime_t; charset=UTF-8\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<title>$MEN_TITLE</title></head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\">ロックえらー !</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><br /><br /><hr /><a href=\"./i/\" target=\"_top\">ログイン画面に戻る</a>\n</div></body></html>\n";
rmdir("$lockfile2/$$");
rmdir("$lockfile2");
	exit;
		}

		sleep(0.3);
mkdir("$lockfile2", 0755);
rmdir("$lockfile2/$$");

	while (-e $lockfile) {
		sleep(6);
		if (--$retry <= 0) { 
rmdir("$lockfile");
		}
	}

}

########

sub KOUSIN_UNLOCK
{
  rmdir("$lockfile2");
}

############

sub GET_COOKIE {


	@pairs = split(/;/, $ENV{'HTTP_COOKIE'});
	$v=@pairs;
	foreach (@pairs) {
		local($key,$val) = split(/=/);
		$key =~ s/\s//g;
		$GET{$key} = $val;
	}
	@pairs = split(/,/, $GET{"KS$menck"});
	foreach (@pairs) {
		local($key,$value) = split(/<>/);
$value =~ s/&/&#38;/g;

$value =~ s/</&lt;/g;
$value =~ s/>/&gt;/g;
$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\//&#47;/g;
$value =~ s/,/&#44;/g;
$value =~ s/\'/&#39;/g;
$value =~ s/\\$/\\ /g;

$value =~ s/=/&#61;/g;
$value =~ s/@/&#64;/g;
$value =~ s/%/&#37;/g;
$value =~ s/`/&#96;/g;
$value =~ s/}/&#125;/g;
$value =~ s/{/&#123;/g;
$value =~ s/eval/&#101;val/g;
$value =~ s/\r//g;
$value =~ s/\n//g;
		$COOK{$key} = $value;
	}
	$cktime = $COOK{'time'};
	$ckhost = $COOK{'host'};
	$ckid = $COOK{'id'};
	$cniti = $COOK{'niti'};
	$ckwid = $COOK{'ckwid'};
	$ckwpass = $COOK{'ckwpass'};
	$ckal = $COOK{'ckal'};
	
	$kukki = $COOK{'kukki'};
	if($in{'ckal'}){
		if(!$in{'pass'}){
	$in{'id'} = $COOK{'ckwid'};
	$in{'pass'} = $COOK{'ckwpass'};
	$w_buffer_m .= "\&amp;.id.=$in{'id'}\&amp;.pass.=$in{'pass'}";
		}else{
	if(!$in{'ckalm'}){
	$ckwpass = $in{'pass'};
	$ckwid = $in{'id'};
	$ckal = 1;
&SET_COOKIE;
	}
		}
	}else{
	if($in{'ckalw'}){
	$ckal = 0;
	$ckwpass = "";
	$ckwid = "";
&SET_COOKIE;
	}
	}

}

############
sub SET_COOKIE {

	local($sec,$min,$hour,$mday,$mon,$year,$wday) = gmtime(time+24*60*60*60);
	@month=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
	$gmt = sprintf("%s, %02d-%s-%04d %02d:%02d:%02d GMT",
			$week[$wday],$mday,$month[$mon],$year+1900,$hour,$min,$sec);
	$cook="time<>$cktime,host<>$ckhost,id<>$ckid,niti<>$cniti,kukki<>$kukki,ckal<>$ckal,ckwpass<>$ckwpass,ckwid<>$ckwid";
	$i = $year+1910;
	$cookh="Set-Cookie: KS$menck=$cook; expires=Thu, 1-Jan-$i 00:00:00 GMT\n";
}


############メインフレームヘッダー（広告をつける場合はこちらに）

sub HEADER {

print "Content-type: $mime_t; charset=UTF-8\n";
print "$cookh\n";
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_I_URI/i_main.css\" />
<title>$GAME_TITLE$MEN_TITLE</title>
</head><body>$TAG_div_s{$doc_mode}
PRI

}
############インラインフレーム内ヘッダー（変更するとレイアウトが乱れる危険性あり）
sub HEADER_IF {

print "Content-type: $mime_t; charset=UTF-8\n";
print "$cookh\n";
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_I_URI/i_main.css\" />
<title>$GAME_TITLE$MEN_TITLE</title>
</head><body>$TAG_div_s{$doc_mode}
PRI

}

############

sub FOOTER {
#	if (-e "./aplinkon.txt") {
			$aplinkon = "<br /><a href=\"./?.m.=aplinkon\&amp;.i.=i\">国取り リンク</a>";
#	}
	$w_burlw{$in{'m'}} = "<hr /><a href=\"$URI/?$w_buffer_m\">ブックマークURL</a>";
	$w_burlw{'i'} = "";
	$w_burlw{''} = "";
	print "<hr />\n";
	print "<a href=\"$URI/?.m.=i\&amp;.i.=i\">携帯版入口へ</a><br /><a href=\"http://multi-thread.net/bbs/?.i.=i\">マルチ BBS</a>$aplinkon<br /><a href=\"http://gjp.mobi/ks/\">gjp.mobi</a>$w_burlw{$in{'m'}}\n";
    print "</div></body></html>\n";
}

1;

