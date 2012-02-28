$mime_t = $ENV{'HTTP_ACCEPT'} =~ m/application\/xhtml\+xml/ ? 'application/xhtml+xml' : 'text/html';
$mime_t = 'text/html';
############

sub ER0 {

print "Content-type: $mime_t; charset=UTF-8\n\n";
print "$_[0]<form><div><input type=\"hidden\"name=\".id.\"value=\"$in{'id'}\" /><input type=\"button\"value=\"前のページに戻る\"onclick=\"window.history.back();\" /></div></form>";
	exit;
}

############

sub MOJISUU {

use Encode;

$mojisuu_w = "$_[0]";
$mojisuu_we = "$_[0]";
	$eiji_kazu = ($mojisuu_we =~ tr/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!\//a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!\//);
$mojisuu_all = length(decode('utf-8', $mojisuu_w));
$mojisuu_h_all = ($mojisuu_all - $eiji_kazu)*2 + $eiji_kazu;
$mojisuu_re = "入力は$mojisuu_all文字。半角換算$mojisuu_h_all文字です。\n";

$mojisuu_o = 0;
 if ($_[1] and ($_[1]-$mojisuu_h_all) < 0) {
$mojisuu_o = abs($_[1] - $mojisuu_h_all);
$mojisuu_re .= "入力枠は半角換算$_[1]文字。半角換算で$mojisuu_o文字オーバーです。\n";
 }
}

############

sub CODE {

	$host = $ENV{'HTTP_X_FORWARDED_FOR'};
 if (!$ENV{'HTTP_X_FORWARDED_FOR'}) {
	$host = $ENV{'REMOTE_ADDR'};
 }
require "$mpg_r/men_db/sp/$menck.pl";
require "$mpg_r/sub_db/index.pl";

	$tt = time();
		$lockfiledtenka = $lockfiled;
		$lockfiledtenka .= "tenka";
	if (-e "$lockfiledtenka") {
		$m_tttenka = (stat("$lockfiledtenka"))[9];
		if ($m_tttenka and $m_tttenka < $tt - 3600) { rmdir("$lockfiledtenka"); }
&ER0("繰越処理中です。しばらくお待ち下さい。");
	}

	if ($ENV{'REQUEST_METHOD'} =~ /post/i) {
		if ($ENV{'CONTENT_LENGTH'} > 51200) { &ER0("投稿量が多すぎです"); }
		read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	}else{
	$buffer = $ENV{'QUERY_STRING'};
	}
	$w_buffer_m = $buffer;

$in{'m'} ="index";
		# 半角カナ＞全角カナ
#&jcode'h2z_sjis(*buffer);
		# 文字コード変換
#&jcode'convert(*buffer, "sjis", "", "z");
&jcode'convert(*buffer, "utf8", "", "z");

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
$in{'m_aad'} = $in{'m'};

$ims{'i'} = "i-";
$ims{'ii'} = "i-";
require "$mpg_r/$ims{$in{'i'}}spt.pl";
$ims{'i'} = "i";
$ims{'ii'} = "ii";
$ims{'b'} = "b";
$doc_mode = "x$ims{$in{'i'}}";
}

############


1;

