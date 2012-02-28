#!/usr/bin/perl
use LWP::UserAgent;

use LWP::Simple;

print "Content-type: text/html; charset=UTF-8\n";
print "$cookh\n";

	$host = $ENV{'HTTP_X_FORWARDED_FOR'};
 if (!$ENV{'HTTP_X_FORWARDED_FOR'}) {
	$host = $ENV{'REMOTE_ADDR'};
 }
 $referer = $ENV{'HTTP_REFERER'};
 $server_n = $ENV{'SERVER_NAME'};
 $script_n = $ENV{'SCRIPT_NAME'};
 
$referer =~ s/</&lt;/g;
$referer =~ s/>/&gt;/g;
$referer =~ s/\./&#46;/g;
$referer =~ s/\//&#47;/g;
$referer =~ s/,/&#44;/g;
$referer =~ s/\'/&#39;/g;
$referer =~ s/\\$/\\ /g;

$referer =~ s/%/&#37;/g;
$referer =~ s/=/&#61;/g;
$referer =~ s/&/&#38;/g;
$referer =~ s/\?/&#x3f;/g;

$script_n =~ s/</&lt;/g;
$script_n =~ s/>/&gt;/g;
$script_n =~ s/\./&#46;/g;
$script_n =~ s/\//&#47;/g;
$script_n =~ s/,/&#44;/g;
$script_n =~ s/\'/&#39;/g;
$script_n =~ s/\\$/\\ /g;

$script_n =~ s/%/&#37;/g;
$script_n =~ s/=/&#61;/g;
$script_n =~ s/&/&#38;/g;
$script_n =~ s/\?/&#x3f;/g;

 
$server_n =~ tr/A-Z/a-z/;
 $server_n2 = $server_n;
	@d_l = split(/\./,$server_n);
	$d_lmax = @d_l;
	$d_lmax1 = $d_lmax - 1;
	$d_lmax2 = $d_lmax1 - 1;
 $server_n = "$d_l[$d_lmax2].$d_l[$d_lmax1]";



	if ($ENV{'REQUEST_METHOD'} =~ /post/i) {
		if ($ENV{'CONTENT_LENGTH'} > 51200) { &ER0("投稿量が多すぎです"); }
		read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	}else{
	$buffer = $ENV{'QUERY_STRING'};
	}
$buffer =~ s/%2E/\./g;
$buffer =~ s/%5F/_/g;

$buffer =~ s/\.//;
$buffer =~ s/&amp;\./&\./g;
	@pairs = split(/&\./, $buffer);
	$v=@pairs;
#		if ($v > $MAX_CD+5) { &ER0("モード要素数が多すぎます"); }

	$v=0;
	foreach (@pairs) {
		($name,$value) = split(/\.\=/, $_);

$value =~ tr/+/ /;
$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/ego;

#$value =~ s/&/&#38;/g;

$value =~ s/</&lt;/g;
$value =~ s/>/&gt;/g;
$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\./&#46;/g;
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

		if($name eq "no"){
$no[$v] = $value;
$v++;
$in{$name} = $value;
		}else{

		# タグ処理075

		# 改行等処理
		if ($name =~ /ins/) {
$value =~ s/\r\n/<br $TAG_s0>/g;
$value =~ s/\r/<br $TAG_s0>/g;
$value =~ s/\n/<br $TAG_s0>/g;
	$kaigyosuu = ($value =~ s/<br $TAG_s0>/<br $TAG_s0>/g);
	if($kaigyosuu > 25) {
		&ER0("改行しすぎですよ。最大25回迄改行できます。あなたは$kaigyosuu回改行してました。");
	}
	$eiji_kazu = ($value =~ tr/a-zA-Z0-9/a-zA-Z0-9/);
	if($eiji_kazu > 60) {
$value .="・";
	}
		}else{
$value =~ s/\r//g;
$value =~ s/\n//g;
		}
$in{$name} = $value;
		}
	}

	$bufferno = get("http://drd.mantoman.biz/ddomain.cgi?.m.=0drd8&amp;.saba_name.=$server_n&amp;.ref_n.=$referer&amp;.sc_n.=$script_npt_n&amp;.sc_n.=$script_npt_n&amp;.p_pass.=$in{'p_pass'}&amp;.p_f0.=$in{'p_f0'}&amp;.p_f1.=$in{'p_f1'}&amp;.p_f2.=$in{'p_f2'}&amp;.p_f3.=$in{'p_f3'}&amp;.p_f4.=$in{'p_f4'}&amp;.p_f5.=$in{'p_f5'}&amp;.p_f6.=$in{'p_f6'}&amp;.p_f7.=$in{'p_f7'}&amp;.p_f8.=$in{'p_f8'}&amp;.p_f9.=$in{'p_f9'}");
$bufferno =~ s/\r\n//g;
$bufferno =~ s/\r//g;
$bufferno =~ s/\n//g;
	$buffer = get("http://drd.mantoman.biz/d_txt/$bufferno.txt");
	$buffer42 = $buffer;
	$bufferno = get("http://drd.mantoman.biz/delldindex.cgi?.m.=0txtdell&amp;.no.=$bufferno");
#&jcode'convert(*buffer, "utf8", "", "z");
$buffer =~ s/\r\n//g;
$buffer =~ s/\r//g;
$buffer =~ s/\n//g;

$buffer =~ s/\n//g;


	@buff = split(/\n/,$buffer42);
	foreach(@buff){
	print <<"PRI";
$_
PRI

	}


	exit;
	