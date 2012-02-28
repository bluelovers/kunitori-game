
sub MOVE {


$in{'icon'} =~ s/&#47;/\//g;

$in{'icon'} =~ s/&#46;/\./g;
$in{'icon'} =~ s/http:\/\///g;
$add = "http://$in{'icon'}";
$add_icon = $add;
$add_icon_d1 = "192.168.";
$add_icon_d2 = "127.0.0.";
$add_icon_d3 = "127.0.0.";
	if (length($add_icon) >100) {
&ER1("URLが長過ぎます。$add_icon");
	}
	if ($add_icon =~ /$add_icon_d1/i or $add_icon =~ /$add_icon_d2/i or $add_icon =~ /$add_icon_d3/i) {
&ER1("そのURLは使用できません。$add_icon");
	}
	if ($add_icon !~ /gif/i and $add_icon !~ /png/i and $add_icon !~ /jpg/i and $add_icon !~ /jpeg/i and $add_icon !~ /http/i) {
&ER1("gif、png、jpeg、jpg以外の拡張子が使用されています。$add_icon");
	}
($width,$height,$size,$format,$mimet,$gname)=&IMGMOVE("$add_icon");

	@gnamel = split(/\./,$gname);

	if ($width ne "96" and $height ne "96") {
&ER1("96×96の画像のみ使用できます。$add_icon");
	}

	if ($size>200000) {
&ER1("サイズ200k以下の画像のみ使用できます。$add_icon");
	}

$add_icon_saba =$gnamel[$#gnamel];
$add_icon_saba =~ tr/A-Z/a-z/;
	if ($format !~ /gif/i and $format !~ /png/i and $format !~ /jpg/i and $format !~ /jpeg/i and $format !~ /http/i) {
&ER1("gif、png、jpeg、jpg以外の画像フォーマットが使用されています。$add_icon。$format");
	}
	if ($mimet !~ /image\//i ) {
&ER1("Mimeタイプがimage以外になっています。$add_icon。$mimet");
	}
	if ($add_icon !~ m/gif/i and $add_icon !~ m/png/i and $add_icon !~ m/jpg/i and $add_icon !~ m/jpeg/i) {
&ER1("gif、png、jpeg、jpg以外の拡張子が使用されています。$add_icon");
	}
	if ($add_icon =~ m/\?/) {
&ER1("URL内に?が使用されています。CGI経由のアドレスは許可できません。");
	}

$add_icon =~ s/\.$add_icon_saba//g;
$in{'icon'} =$add_icon;
$in{'icon_saba'} =$add_icon_saba;

$i =0;
	while ($i<10) {
	if ($in{"icon_$i"}) {
$in{"icon_$i"} =~ s/&#47;/\//g;

$in{"icon_$i"} =~ s/&#46;/\./g;
$in{"icon_$i"} =~ s/http:\/\///g;
$add = $in{"icon_$i"};
$add_icon = $add;
$add_icon_d1 = "?";
$add_icon_d2 = ".";
$add_icon_d3 = "/";
	if (length($add_icon) >100) {
&ER1("URLが長過ぎます。$add_icon");
	}
	if ($add_icon =~ /$add_icon_d1/i or $add_icon =~ /$add_icon_d2/i or $add_icon =~ /$add_icon_d3/i) {
&ER1("そのURLは使用できません。$add_icon");
	}
$add_icon = "$in{'icon'}$add_icon.$in{'icon_saba'}";
($width,$height,$size,$format,$mimet,$gname)=&IMGMOVE("$add_icon");


	if ($width ne "96" and $height ne "96") {
&ER1("96×96の画像のみ使用できます。$add_icon");
	}

	if ($size>200000) {
&ER1("サイズ200k以下の画像のみ使用できます。$add_icon");
	}

	if ($format !~ /gif/i and $format !~ /png/i and $format !~ /jpg/i and $format !~ /jpeg/i and $format !~ /http/i) {
&ER1("gif、png、jpeg、jpg以外の画像フォーマットが使用されています。$add_icon。$format");
	}
	if ($mimet !~ /image\//i ) {
&ER1("Mimeタイプがimage以外になっています。$add_icon。$mimet");
	}

	}
$i ++;
	}

use LWP::Simple;
$in{'ref_uri_d'} =~ s/&#46;/\./g;
$in{'ref_uri_d'} =~ s/&#47;/\//g;

$bbsurl =$in{'ref_uri_d'};
$URI ="$bbsurl/$in{'bbsurl'}";
$buffer ="";
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.t.=1");

	if($buffer !~ /<><>/) { &ER1("IDパスワードが一致しません。$bbsurl/$in{'bbsurl'}/?.m."); }

	($p0name,$cgimg,$rank_mes,$ttadd,$p0f_id) = split(/<>/,$buffer);
	if("$in{'bbsurl'}-$p0f_id" ne $in{'ita'} and $in{'id'} ne "-$mpass") { &ER1("面＆IDパスワードが一致しません。"); }




	($ita_men,$ita_id) = split(/\-/,$in{'ita'});
if($in{'id'} eq $mpass) {
$in{'pass'} =$ita_id;
}
	&HEADER;
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$ita_id&amp;.t.=item");
	($add_p0name,$add_cgimg,$add_rank_mes,$add_ttadd,$add_p0f_id) = split(/<>/,$buffer);
$buffer ="";
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=gazouh&amp;.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.ref_uri_d.=$in{'ref_uri_d'}&amp;.bbsurl.=$in{'bbsurl'}&amp;.ita.=$in{'ita'}&amp;.icon.=$in{'icon'}&amp;.icon_saba.=$in{'icon_saba'}&amp;.icon_0.=$in{'icon_0'}&amp;.icon_1.=$in{'icon_1'}&amp;.icon_2.=$in{'icon_2'}&amp;.icon_3.=$in{'icon_3'}&amp;.icon_4.=$in{'icon_4'}&amp;.icon_5.=$in{'icon_5'}&amp;.icon_6.=$in{'icon_6'}&amp;.icon_7.=$in{'icon_7'}&amp;.icon_8.=$in{'icon_8'}&amp;.icon_9.=$in{'icon_9'}");


	print <<"PRI";
$buffer
PRI
	&FOOTER;

	exit;

}

sub IMGMOVE {

my $file2 = $add_icon;
use strict;
use Image::Magick;

my $file = $file2;

my $image = Image::Magick->new;

$image->Read($file);

my ($width,$height,$size,$format,$mimet,$gname) = $image->Get('width', 'height', 'filesize', 'magick', 'MIME','base-filename');

return ($width,$height,$size,$format,$mimet,$gname);
undef $image;

}
1;