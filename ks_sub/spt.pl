
require "$mpg_r/vs-spt.pl";
sub HOST_NAME {

	$host = $ENV{'HTTP_X_FORWARDED_FOR'};
 $host_name = $ENV{'HTTP_X_FORWARDED_FOR'};
 if (!$ENV{'HTTP_X_FORWARDED_FOR'}) {
	$host = $ENV{'REMOTE_ADDR'};
 $host_name = $ENV{'REMOTE_ADDR'};
 }
	$value = "$ENV{'HTTP_USER_AGENT'}$ENV{'HTTP_X_UP_SUBNO'}";

#$value =~ s/\&/&#38;/g;

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


	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"button\" value=\"前のページに戻る\" onclick=\"window.history.back()\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"コマンド入力画面へ戻る\" /></div></form>";
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</body></html>\n";
	exit;
}

sub ER3 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"button\" value=\"前のページに戻る\" onclick=\"window.history.back()\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" /><input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" /><input type=\"submit\" value=\"コマンド入力画面へ戻る\" /></div></form>";
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</body></html>\n";
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
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</body></html>\n";
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
<title></title></head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\">ロックえらー !</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a>\n</body></html>\n";
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
<title></title></head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\">ロックえらー !</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a>\n</body></html>\n";
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

$value =~ s/%/&#37;/g;
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
#	$gmt = sprintf("%s, %02d-%s-%04d %02d:%02d:%02d GMT",
#			$week[$wday],$mday,$month[$mon],$year+1900,$hour,$min,$sec);
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

<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
$datev2
<title>$GAME_TITLE$MEN_TITLE</title>
</head><body $datev3 onload=\"javascript:domain='$DOMAIN';fcheck('$ENV{'HTTP_REFERER'}');$datev4\">$TAG_div_s{$doc_mode}

PRI
}
############インラインフレーム内ヘッダー（変更するとレイアウトが乱れる危険性あり）
sub HEADER_IF {
	print "Content-type: $mime_t; charset=UTF-8\n";
print "$cookh\n";
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}

<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
$datev2
<title>$GAME_TITLE$MEN_TITLE</title>
</head><body $datev3 onload=\"javascript:domain='$DOMAIN';fcheck('$ENV{'HTTP_REFERER'}');$datev4\">$TAG_div_s{$doc_mode}

PRI


}
############


##############################
sub FOOTER {
require "$mpg_r/ver.pl";
#	if (-e "./aplinkon.txt") {
			$aplinkon = " <a href=\"./?.m.=aplinkon\">国取り リンク</a>";
#	}
	print <<"PRI";
<hr /><a href=\"$URI_SP_D_T\" target=\"_top\">$kunitori_ver</a> (C) 2004 <a href=\"$URI_C_T\" target=\"_top\">$URI_C_N</a> All Rights Reserved.$aplinkon PR: <a href=\"$URI/domain.cgi\" target=\"_top\">Domain ranking</a>
<hr /><a href=\"$URI/\" target=\"_top\">《 ログイン画面に戻る 》</a><a href=\"$HOME_URL_U\" target=\"_top\">《 $HOME_NAME_Uへ移動 》</a><br />
</div></body></html>
PRI
}
##############################


1;

