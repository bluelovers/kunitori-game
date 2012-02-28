
sub MOVE {
use List::Util qw(shuffle);

require "$mpg_r/k-spt.pl";
require "$mpg_r/k-ini.pl";
	print "Content-type: text/html\n\n";

&HOST_NAME;
	$hostr2 = "0.0.1";
	$hostr3 = "192.168.";
if($host !~ /\Q$hostr2\E/ and $host !~ /\Q$hostr3\E/ and $host ne "") { &ER2("外部からのアクセスは禁じられているのら！侵入者の名前は覚えておくのら～。"); }

if($in{"id"} ne "$mpass") { &ER2("【猫々娘々】。oO（・・あなたはマスターじゃないのら！　・・侵入者のIPは覚えておくのら～！）"); }


if($KOUSIN_MENTE) { &ER2("メンテナンス中です。しばらくお待ちください。"); }
if(-e "./w_db/rise0.txt") {
&ER2("オートパイロット用の初期化ファイル（/w_db/rise0.txt）が置かれている為更新を見合わせます。");
}

require "$mpg_r/sub_db/it.pl";
require "$mpg_r/sub_db/kanbu.pl";
require "$mpg_r/men_db/kts/$menck.pl";
require "$mpg_r/sub_db/minzoku.pl";
require "$mpg_r/sub_db/hei.pl";
require "$mpg_r/sub_db/cd.pl";
require "$mpg_r/bl-0.pl";
require "$mpg_r/sub_db/mapw.pl";
require "$mpg_r/sub_db/citem.pl";
require "$mpg_r/sub_db/kakuduke.pl";
require "$mpg_r/sub_db/kanbu.pl";

	$nekonyanst = 1;
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<title></title></head><body>$TAG_div_s{$doc_mode}
PRI

	&TT_GET;
	open(OUT,">./tt.txt");
	print OUT $tt;
	close(OUT);
	print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=:pass: value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"submit\" value=\"（更新処理催促）\" /></div></form>


PRI
	

########Ver1.01-1.06からVer1.07以降への移行用（ここから）
if (-e "./w_db/jikan_jiku_ma") {
rename ("./w_db/jikan_jiku_main.cgi", "./w_db/jikan_jiku_main_bk.cgi");
rename ("./w_db/jikan_jiku_ma", "./w_db/jikan_jiku_main.cgi");
}
########Ver1.01-1.06からVer1.07以降への移行用（ここまで）

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	$hit = 0;

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);

			if($m_tt < $tt / 10){
	open(IN,"./w_db/jikan_jiku_main_bk.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);

			if($m_tt < $tt / 10){
				$m_tt = $tt - $kousin_kankaku * 2 - int(rand($kousin_kankaku-1)+1);
			}
			}

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$nen_genzai=$keika_nen+$KAISI_NEN;
		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$pmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear, $pmmonth);
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ryymaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ypmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear-1);

	$pold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";

	$next_time2 = $m_tt - $tt - $kousin_kankaku;
	if($next_time2 < 0){
		$next_timef = 1;
	}
	if($kousin_kankaku*2 + $tt < $m_tt){
		$m_tt = $tt;
		$next_timef = 0;
	}
	if($next_timef < 1){

	open(IN,"./w_db/tm.cgi");
	@TMTM = <IN>;
	close(IN);
	($tmtm,$tmtm2) = split(/<>/,$TMTM[0]);

	if($tmtm2+7200 < $tt){
require "$mpg_r/bl-1.pl";
	&KOUSIN_LOCK;
	&RANK12;
	&RANKD2;
	@TMTM=();
	unshift(@TMTM,"$tmtm<>$tt<>\n");
	open(OUT,">./w_db/tm.cgi");
	print OUT @TMTM;
	close(OUT);
	&KOUSIN_UNLOCK;
	
########・ks_Ver1.590より
			
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

	&APLINK;
########・ks_Ver1.590
	}
	exit;
	}


	if($tmtm+240 > $tt){$next_time = $tmtm+180-$tt;
	print "Content-type: text/html\n\n";
	print <<"PRI";
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<title></title></head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\"><span class=\"cFF0000\">処理制限中・$next_time秒後に押してください。</span></span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
	}
	@TMTM=();
	unshift(@TMTM,"$tt<>$tt<>\n");
	open(OUT,">./w_db/tm.cgi");
	print OUT @TMTM;
	close(OUT);
			if($tmtm + 240 + int(rand(120)) < $tt){$w_klf=1;&KOUSIN_UNLOCK;
			}

require "$mpg_r/bl.pl";
require "$mpg_r/sub_db/senpou.pl";
require "$mpg_r/wl.pl";


    print "フェイズ１(･д･) \n";
	&BLPL;
    print "フェイズ２(･д･) \n";
	&WLPL;


if(-e "./$mpg_r/cgrise.txt"){

opendir(DFR,"./$mpg_r/sub_db/d_cg");
	while($fi_id = readdir(DFR)){
		if(length($fi_id)>3){
	($add_fid,$add_mime) = split(/\./,$fi_id);
$w_id=$add_fid;
$p_cg_sabano{$w_id}=0;
$p_img{$w_id}="$IMG{0}/$add_fid";
$p_img_f{$w_id}="$p_img_kakutyou{$add_mime}";
$p_img_m{$w_id}="$p_img_mime{$add_mime}";
&IMG_CSS_SEISEI();

		}
	}
closedir(DFR);
unlink("./$mpg_r/cgrise.txt");
}

    print "OK(･д･) \n";
    print "</div></body></html>\n";
	exit;
}
1;