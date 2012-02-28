#!/usr/bin/perl

require "./men.pl";
require "$mpg_r/jcode.pl";
require "$mpg_r/spt.pl";
&CODE;
if($MENTE) { &ER2("メンテナンス中です。しばらくお待ちください。"); }


	open(IN,"./w_db/gazor.cgi");
	@charano = <IN>;
	close(IN);

	&HEADER;
	print <<"PRI";
<hr width=\"75%\">
<strong>画像イメージサンプル</strong>
<br /><br />- 現在登録されている画像イメージは以下のとおりです -<br />（空白画像No.0は画像非使用＆オリジナル画像の合計値）</small>
<hr width=\"75%\">

PRI

$j=();
foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}
foreach (@add_img){
$key=int($_);
	foreach (0..$KYARA_IMG_MAX{$key}){
$i=int($key*1000)+$_;
$p[$_]=$charano[$i] +1;
$p[0]=0;
$j[$p[$_]]+=$charano[$i];
$charano[$i] =$p[$_];
	}
}
$charano[0] =$j[0]+1;

@j=();
$i = 0;
	while ($i <= $#charano) {
$charakazu[$i] = int($charano[$i]);
$charanow1 = int($i / 1000);
$charanow2 = $i % 1000;
$charakazu2[$i] = int($charano[$i]-1);
	&IMG_SAKUSEI("$IMG{$charanow1}/$charanow2$p_img_kakutyou{$charanow1}","$img_wide_d","$img_height_d","$p_img_mime{$charanow1}","d$i");
$charakazuc[$charakazu[$i]] = "<td class=\"txth\">$img_sakusei_kekka $charanow2<br />使用数⇒$charakazu2[$i]</td>\n";
$charakazuc[0] = "";
$come[$charanow1] .="$charakazuc[$charakazu[$i]]";
$p[$charakazu[$i]] =1;
$p[0] =0;
$j[$charanow1] +=$p[$charakazu[$i]];
$x =$charanow2 % 5;
$n[0] ="</tr><tr>\n";
$n2[$charanow2] =$n[$x];
$n2[0] ="";
$n4[0] ="</tr><tr>\n";
$n2[0] =$n4[$charanow1];
$n3[$charakazu[$i]] =$n2[$charanow2];
$n3[0] ="";
$come[$charanow1] .="$n3[$charakazu[$i]]";
$i ++;
	}

foreach (@add_img){
$come_end .="<table border=\"1\"><tr class=\"bgcFFF0F5\"><td class=\"txtc\" colspan=\"5\">$IMG_SABA_NAME{$_}</td></tr><tr>$come[$_]</tr></table><br />";
}
	print <<"PRI";
$come_end
<form><div><input type=\"button\" value=\"閉じる\" onclick=\"top.close();\" /></div></form>
</div></body></html>
PRI

	exit;

