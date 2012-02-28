
sub P_B_AD {
	
	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);
	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);
	$kstool_w_3_ks{$ad_w_op_3} = int($ad_w_op_7/$URI_SP_D_TOOL_ks_max);
	$kstool_w_3_kbbs{$ad_w_op_3} = int($ad_w_op_5/$URI_SP_D_TOOL_kbbs_max);
	$kstool_w_3_dr{$ad_w_op_3} = int($ad_w_op_6/$URI_SP_D_TOOL_dr_max);
	$kstool_w_3_ks{$ad_w_op_3} = "http://ks$kstool_w_3_ks{$ad_w_op_3}\.$URI_SP_D_TOOL";
	$kstool_w_3_kbbs{$ad_w_op_3} = "http://kbbs$kstool_w_3_kbbs{$ad_w_op_3}\.$URI_SP_D_TOOL";
	$kstool_w_3_dr{$ad_w_op_3} = "http://multi-thread.net/bbs/?.i.=$in{'i'}&amp;.v_id.=$ad_w_op_0&amp;.id.=$ad_w_op_0";
	$kstool_w{$ad_w_op_0} = "国取ツール:<a href=\"http://$URI_SP_D_TOOL/tools/?.i.=$in{'i'}&amp;.m.=p_b&amp;.id.=$ad_w_op_0\">$ad_w_op_2</a>";
	$kstool_w{""} = "";
	$kstool_w_5{$ad_w_op_5} = "/<a href=\"$kstool_w_3_kbbs{$ad_w_op_3}/tools/?.i.=$in{'i'}&amp;.m.=kspbbs&amp;.id.=$ad_w_op_0\">BBS</a>";
	$kstool_w_5{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_5{$ad_w_op_5};
	$kstool_w_6{$ad_w_op_6} = "/<a href=\"$kstool_w_3_dr{$ad_w_op_3}\">マルチ BBS</a>";
	$kstool_w_6{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_6{$ad_w_op_6};
	$kstool_w_7{$ad_w_op_7} = "/<a href=\"$kstool_w_3ks{$ad_w_op_3}/tools/?.i.=$in{'i'}&amp;.m.=kspks&amp;.id.=$ad_w_op_0\">自動リンク集</a>";
	$kstool_w_7{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_7{$ad_w_op_7};
	
	$ad_w_cm_0 = int($ad_w_cm_0);
	
	$ad_w_cm_0_t = int($ad_w_cm_0/10)+1;
	$ad_w_cm_0_t_w{$ad_w_cm_0} = $ad_w_cm_0_t;
	$ad_w_cm_0_t_w{"0"} = 0;
	$ad_w_cm_0_t = $ad_w_cm_0_t_w{$ad_w_cm_0};
$ad_cm_gm_1 = "pub-4918484552856932";
$ad_cm_gm_1_w{"1"} = $ad_cm_1;
$ad_cm_gm_1_w{"2"} = $ad_cm_1;
$ad_cm_gm_1 = $ad_cm_gm_1_w{$ad_cm_0};
$ad_w_cm_gs_1 = $ad_cm_gm_1;


$ad_cm_gm_in_t{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_0_t;
$ad_cm_gm_in_0{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_0;
$ad_cm_gm_in_1{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_1;
$ad_cm_gm_in_2{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_2;
$ad_cm_gm_in_3{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_3;
$ad_cm_gm_in_4{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_4;
$ad_cm_gm_in_5{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_5;
$ad_cm_gm_in_6{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_6;
$ad_cm_gm_in_7{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_7;
$ad_cm_gm_in_8{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_8;
$ad_cm_gm_in_t{"2"}{"0"} = int($ad_cm_0/10)+1;
$ad_cm_gm_in_0{"2"}{"0"} = $ad_cm_0;
$ad_cm_gm_in_1{"2"}{"0"} = $ad_cm_1;
$ad_cm_gm_in_2{"2"}{"0"} = $ad_cm_2;
$ad_cm_gm_in_3{"2"}{"0"} = $ad_cm_3;
$ad_cm_gm_in_4{"2"}{"0"} = $ad_cm_4;
$ad_cm_gm_in_5{"2"}{"0"} = $ad_cm_5;
$ad_cm_gm_in_6{"2"}{"0"} = $ad_cm_6;
$ad_cm_gm_in_7{"2"}{"0"} = $ad_cm_7;
$ad_cm_gm_in_8{"2"}{"0"} = $ad_cm_8;
$ad_w_cm_0_t = $ad_cm_gm_in_t{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_1 = $ad_cm_gm_in_1{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_2 = $ad_cm_gm_in_2{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_3 = $ad_cm_gm_in_3{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_4 = $ad_cm_gm_in_4{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_5 = $ad_cm_gm_in_5{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_6 = $ad_cm_gm_in_6{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_7 = $ad_cm_gm_in_7{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_8 = $ad_cm_gm_in_8{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_0 = $ad_cm_gm_in_0{$ad_settei_1}{$ad_w_cm_0};


#AMAZONの広告を貼る際は下記の例を参考にしてみてください。
$ad_search_key =~ s/(\W)/'%'.unpack("H2", $1)/ego;
$ad_search_key =~ tr/ /+/;
$ad_c_mode_am{""} = "videogames-jp";
$ad_c_mode_am{"0"} = "videogames-jp";
$ad_c_mode_am{"1"} = "books-jp";
$ad_c_mode_am{"2"} = "classical-jp";
$ad_c_mode_am{"3"} = "electronics-jp";
$ad_c_mode_am{"4"} = "kitchen-jp";
$ad_c_mode_am{"5"} = "music-jp";
$ad_c_mode_am{"6"} = "dvd-jp";
$ad_c_mode_am{"7"} = "software-jp";
$ad_c_mode_am{"8"} = "toys-jp";
$ad_c_mode_am{"9"} = "sporting-goods-jp";
$ad_c_mode_am{"10"} = "hpc-jp";
$ad_c_mode_am{"11"} = "watches-jp";
$ad_c_mode_am{"12"} = "apparel-jp";
$add_ad_come{"2"} = <<"PRI";
<table class=\"tlauto\"><tr class=\"bgcFFFFFF\"><td>
<!-- SiteSearch Google -->
<form method="get" action="http://www.google.co.jp/custom" target=\"_top\"><div>
<table border="0" class="tlauto bgcFFFFFF" summary="Google">
<tr><td nowrap="nowrap" valign="top" align="left" height="32">
<a href="http://www.google.com/">
<img src="http://www.google.com/logos/Logo_25wht.gif"
border="0" alt="Google" /></a>
</td>
<td nowrap="nowrap">
<input type="hidden" name="domains" value="$URIHTTPNUKI2" />
<input type="text" name="q" size="25" maxlength="255" value="" />
<input type="submit" name="sa" value="検索" />
</td></tr>
<tr>
<td>&nbsp;</td>
<td nowrap="nowrap">
<table class=\"tlauto\">
<tr>
<td>
<input type="radio" name="sitesearch" value="" checked=\"checked\" />
<span class=\"c000000\">Web</span>
</td>
<td>
<input type="radio" name="sitesearch" value="$URIHTTPNUKI" />
<span class=\"c000000\">$URIHTTPNUKI</span>
</td>
</tr>
</table>
<input type="hidden" name="client" value="$ad_w_cm_gs_1" />
<input type="hidden" name="forid" value="1" />
<input type="hidden" name="ie" value="UTF-8" />
<input type="hidden" name="oe" value="UTF-8" />
<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:000000;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;LH:40;LW:200;L:http://kunitori.com/img/tmb/200_40_1.jpg;S:http://kunitori.com/;LP:1;FORID:1;" />
<input type="hidden" name="hl" value="ja" />

</td></tr></table>
</div></form>
<!-- SiteSearch Google -->

</td>
<td>
<iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=$ad_w_cm_1\&o=9&p=13&l=st1&mode=$ad_c_mode_am{$ad_w_cm_2}\&search=$ad_w_cm_3\&fc1=000000&lt1=&lc1=3366FF&bg1=FFFFFF&f=ifr" marginwidth="0" marginheight="0" width="468" height="60" border="0" frameborder="0" style="border:none;" scrolling="no"></iframe>
</td>
</tr>
</table>
<br />
PRI

#グーグルの広告を貼る際は下記の例を参考にしてみてください。（デフォルトはkunitori.com用）
#グーグル広告の貼り方はkunitori.comの「サイト運営用・便利リンク」で紹介しています。

$ad_c_mode_g{"0"} = '
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "000000";
google_color_url = "336699";
google_color_text = "333333";';
$ad_c_mode_g{"1"} = '
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "000000";
google_color_url = "336699";
google_color_text = "333333";';
$ad_c_mode_g{"2"} = "$ad_w_cm_6
google_ad_slot = \"$ad_w_cm_5\";
google_ad_width = 468;
google_ad_height = 60;
google_cpa_choice = \"$ad_w_cm_4\"; // on file";
$ad_c_mode_g{"3"} = "$ad_w_cm_6
google_ad_slot = \"$ad_w_cm_5\";
google_ad_width = 468;
google_ad_height = 60;";

$add_ad_come{"1"} = <<"PRI";
<table class=\"tlauto\"><tr class=\"bgcFFFFFF\"><td>
<!-- SiteSearch Google -->
<form method="get" action="http://www.google.co.jp/custom" target=\"_top\"><div>
<table border="0" class="tlauto bgcFFFFFF" summary="Google">
<tr><td nowrap="nowrap" valign="top" align="left" height="32">
<a href="http://www.google.com/">
<img src="http://www.google.com/logos/Logo_25wht.gif"
border="0" alt="Google" /></a>
</td>
<td nowrap="nowrap">
<input type="hidden" name="domains" value="$URIHTTPNUKI2" />
<input type="text" name="q" size="25" maxlength="255" value="" />
<input type="submit" name="sa" value="検索" />
</td></tr>
<tr>
<td>&nbsp;</td>
<td nowrap="nowrap">
<table class=\"tlauto\">
<tr>
<td>
<input type="radio" name="sitesearch" value="" checked=\"checked\" />
<span class=\"c000000\">Web</span>
</td>
<td>
<input type="radio" name="sitesearch" value="$URIHTTPNUKI" />
<span class=\"c000000\">$URIHTTPNUKI</span>
</td>
</tr>
</table>
<input type="hidden" name="client" value="$ad_w_cm_gs_1" />
<input type="hidden" name="forid" value="1" />
<input type="hidden" name="ie" value="UTF-8" />
<input type="hidden" name="oe" value="UTF-8" />
<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:000000;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;LH:40;LW:200;L:http://kunitori.com/img/tmb/200_40_1.jpg;S:http://gamesite.kunitori.com/;LP:1;FORID:1;" />
<input type="hidden" name="hl" value="ja" />

</td></tr></table>
</div></form>
<!-- SiteSearch Google -->

</td>
<td>

<script type="text/javascript"><!--
google_ad_client = "$ad_w_cm_1";
$ad_c_mode_g{$ad_w_cm_0}
//-->
</script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</td>
</tr>
<tr class="bgcFFFFFF"><td colspan="2">
<script type="text/javascript"><!--
google_ad_client = "$ad_w_cm_1";
google_ad_width = 728;
google_ad_height = 15;
google_ad_format = "728x15_0ads_al_s";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "A9501B";
google_color_text = "000000";
google_color_url = "008000";
//-->
</script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
</td></tr>
</table>
<br />
PRI
}

sub P_B_AD_I {
	
	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);

	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);
	$kstool_w_3_ks{$ad_w_op_3} = int($ad_w_op_7/$URI_SP_D_TOOL_ks_max);
	$kstool_w_3_kbbs{$ad_w_op_3} = int($ad_w_op_5/$URI_SP_D_TOOL_kbbs_max);
	$kstool_w_3_dr{$ad_w_op_3} = int($ad_w_op_6/$URI_SP_D_TOOL_dr_max);
	$kstool_w_3_ks{$ad_w_op_3} = "http://ks$kstool_w_3_ks{$ad_w_op_3}\.$URI_SP_D_TOOL";
	$kstool_w_3_kbbs{$ad_w_op_3} = "http://kbbs$kstool_w_3_kbbs{$ad_w_op_3}\.$URI_SP_D_TOOL";
	$kstool_w_3_dr{$ad_w_op_3} = "http://dr$kstool_w_3_dr{$ad_w_op_3}\.$URI_SP_D_TOOL";
	$kstool_w{$ad_w_op_0} = "国取ツール:<a href=\"http://$URI_SP_D_TOOL/tools/?.i.=$in{'i'}&amp;.m.=p_b&amp;.id.=$ad_w_op_0\">$ad_w_op_2</a>";
	$kstool_w{""} = "";
	$kstool_w_5{$ad_w_op_5} = "<br /><a href=\"$kstool_w_3_kbbs{$ad_w_op_3}/tools/?.i.=$in{'i'}&amp;.m.=kspbbs&amp;.id.=$ad_w_op_0\">BBS</a>";
	$kstool_w_5{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_5{$ad_w_op_5};
	$kstool_w_6{$ad_w_op_6} = "<br /><a href=\"$kstool_w_3_dr{$ad_w_op_3}/\">マルチ BBS</a>";
	$kstool_w_6{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_6{$ad_w_op_6};
	$kstool_w_7{$ad_w_op_7} = "<br /><a href=\"$kstool_w_3ks{$ad_w_op_3}/tools/?.i.=$in{'i'}&amp;.m.=kspks&amp;.id.=$ad_w_op_0\">自動リンク集</a>";
	$kstool_w_7{""} = "";
	$kstool_w{$ad_w_op_0} .= $kstool_w_7{$ad_w_op_7};
	$ad_w_cm_0 = int($ad_w_cm_0);
	
	$ad_w_cm_0_t = int($ad_w_cm_0/10)+1;
	$ad_w_cm_0_t_w{$ad_w_cm_0} = $ad_w_cm_0_t;
	$ad_w_cm_0_t_w{"0"} = 0;
	$ad_w_cm_0_t = $ad_w_cm_0_t_w{$ad_w_cm_0};
$ad_cm_gm_1 = "pub-4918484552856932";
$ad_cm_gm_1_w{"1"} = $ad_cm_1;
$ad_cm_gm_1_w{"2"} = $ad_cm_1;
$ad_cm_gm_1 = $ad_cm_gm_1_w{$ad_cm_0};
$ad_w_cm_gs_1 = $ad_cm_gm_1;


$ad_cm_gm_in_t{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_0_t;
$ad_cm_gm_in_0{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_0;
$ad_cm_gm_in_1{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_1;
$ad_cm_gm_in_2{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_2;
$ad_cm_gm_in_3{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_3;
$ad_cm_gm_in_4{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_4;
$ad_cm_gm_in_5{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_5;
$ad_cm_gm_in_6{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_6;
$ad_cm_gm_in_7{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_7;
$ad_cm_gm_in_8{$ad_settei_1}{$ad_w_cm_0} = $ad_w_cm_8;
$ad_cm_gm_in_t{"2"}{"0"} = int($ad_cm_0/10)+1;
$ad_cm_gm_in_0{"2"}{"0"} = $ad_cm_0;
$ad_cm_gm_in_1{"2"}{"0"} = $ad_cm_1;
$ad_cm_gm_in_2{"2"}{"0"} = $ad_cm_2;
$ad_cm_gm_in_3{"2"}{"0"} = $ad_cm_3;
$ad_cm_gm_in_4{"2"}{"0"} = $ad_cm_4;
$ad_cm_gm_in_5{"2"}{"0"} = $ad_cm_5;
$ad_cm_gm_in_6{"2"}{"0"} = $ad_cm_6;
$ad_cm_gm_in_7{"2"}{"0"} = $ad_cm_7;
$ad_cm_gm_in_8{"2"}{"0"} = $ad_cm_8;
$ad_w_cm_0_t = $ad_cm_gm_in_t{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_1 = $ad_cm_gm_in_1{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_2 = $ad_cm_gm_in_2{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_3 = $ad_cm_gm_in_3{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_4 = $ad_cm_gm_in_4{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_5 = $ad_cm_gm_in_5{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_6 = $ad_cm_gm_in_6{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_7 = $ad_cm_gm_in_7{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_8 = $ad_cm_gm_in_8{$ad_settei_1}{$ad_w_cm_0};
$ad_w_cm_0 = $ad_cm_gm_in_0{$ad_settei_1}{$ad_w_cm_0};


$ad_c_mode_g{"0"} = '
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "000000";
google_color_url = "336699";
google_color_text = "333333";';
$ad_c_mode_g{"2"} = "
google_cpa_choice = \"$ad_w_cm_4\";";


if ($ad_w_cm_0_t eq "1") {
use LWP::UserAgent;
use Time::HiRes qw(gettimeofday);
use URI::Escape;

sub google_append_color {
  @color_array = split(/,/, $_[0]);
  return $color_array[$_[1] % @color_array];
}

$google_dt = sprintf("%.0f", 1000 * gettimeofday());
$google_scheme = ($ENV{"HTTPS"} eq "on") ? "https://" : "http://";
$google_host = uri_escape($google_scheme . $ENV{"HTTP_HOST"});

$google_ad_url = "http://pagead2.googlesyndication.com/pagead/ads?" .
  "ad_type=text" .
  "&channel=" .
  "&client=ca-mb-$ad_w_cm_1" .
  "&dt=" . $google_dt .
  "&format=mobile_double" .
  "&host=" . $google_host .
  "&ip=" . uri_escape($ENV{"REMOTE_ADDR"}) .
  "&markup=xhtml" .
  "&oe=utf8" .
  "&output=xhtml" .
  "&ref=" . uri_escape($ENV{"HTTP_REFERER"}) .
  "&url=" . $google_host . uri_escape($ENV{"REQUEST_URI"}) .
  "&useragent=" . uri_escape($ENV{"HTTP_USER_AGENT"});

my $ua = LWP::UserAgent->new;
my $google_ad_output = $ua->get($google_ad_url);
if ($google_ad_output->is_success) {
  print $google_ad_output->content;
}
}
}

1;