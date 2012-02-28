
sub MOVE {

	open(IN,"./p_db/slogid/logl_$in{'l'}.cgi");
	@SLOG_LOGL = <IN>;
	close(IN);

$i = 0;
	foreach(@SLOG_LOGL){
	($loglno,$loglke,$logli,$loglname,$loglmax)=split(/<>/);
$loglno =~ s/logf_//g;
	$logfmax{$loglno} = int($loglmax);
	if($loglke){
	$kaddnamec .= "<a href=\"./?.m.=logf&amp;.l.=$in{'l'}&amp;.id.=$loglno\">$loglname</a>◆";
	}else{
	$eaddnamec .= "<a href=\"./?.m.=logf&amp;.l.=$in{'l'}&amp;.id.=$loglno\">$loglname</a>◆";
$p_name{$loglno}=$loglname;
	}
$i ++;
	}


	$fid = "./slog/$in{'l'}.html#lf-$in{'id'}-$in{'n'}";

	if($in{'n'} ne ""){

$in{'n'} = int(abs($in{'n'}));

	$datev2 = "<script type=\"text/javascript\" src=\"$CSS_URI/logf.js\"></script>";

	&HEADER_IF;
	$addc = "<a href=\"./slog/$in{'l'}.html#t\" target=\"lf\">00</a> ";
	if($in{'n'} < 1){
	$adduec = "↑×";
$fidue = "./";
	}else{
$i = $in{'n'}-1;
	$adduc = "lf-$in{'id'}-$i";
	if($i < 1){
	$i = "t";
	$adduc = $i;
	}
	$add = sprintf("%02d", $i);
	$adduec = "<a href=\"./slog/$in{'l'}.html#$adduc\" onclick=\"javascript:kssend()\" target=\"lf\">↑$add</a>";
	$ueid = $add;
	}
	if($in{'n'} < $logfmax{$in{'id'}}){
	$i = $in{'n'}+1;
	$add = sprintf("%02d", $i);
	$addsitac = "<a href=\"./slog/$in{'l'}.html#lf-$in{'id'}-$i\" onclick=\"javascript:kssend3()\" target=\"lf\">↓$add</a>";
	$sitaid = $add;
	}else{
	$addsitac = "↓×";
$fidsita = "./";
	}

	$i = $in{'n'};
	$adduc = "lf-$in{'id'}-$i";
	if($i < 1){
	$i = "t";
	$adduc = $i;
	}
	$add = sprintf("%02d", $i);
	$addnakac = "<a href=\"./slog/$in{'l'}.html#$adduc\" onclick=\"javascript:kssend2()\" target=\"lf\">・$add</a>";
	$nakaid = $add;
print <<"PRI";
$adduec<br /><br />$addnakac<br /><br />$addsitac
<form name=\"wsset\" method=\"post\" action=\"$fidue\" target=\"yf\"><div>
<input type=\"hidden\" name=\".l.\" value=\"$in{'l'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".n.\" value=\"$ueid\" />
<input type=\"hidden\" name=\".m.\" value=\"logf\" />
</div></form>
<form name=\"wsset2\" method=\"post\" action=\"$fidnaka\" target=\"yf\"><div>
<input type=\"hidden\" name=\".l.\" value=\"$in{'l'}\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".n.\" value=\"$nakaid\" />
<input type=\"hidden\" name=\".m.\" value=\"logf\" />
</div></form>
<form name=\"wsset3\" method=\"post\" action=\"$fidsita\" target=\"yf\"><div>
<input type=\"hidden\" name=\".l.\" value=\"$in{'l'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".n.\" value=\"$sitaid\" />
<input type=\"hidden\" name=\".m.\" value=\"logf\" />
</div></form>

</div></body></html>
PRI

	exit;
	}

	&HEADER;

	$addc = "<a href=\"./slog/$in{'l'}.html#t\" target=\"lf\">00</a> ";
$i = 1;
	while ($i <= $logfmax{$in{'id'}}) {
	$add = sprintf("%02d", $i);

	$addc .= "<a href=\"./?.m.=logf&amp;.l.=$in{'l'}&amp;.id.=$in{'id'}&amp;.n.=$i\" target=\"yf\">$add</a> ";
$i ++;
	}

$datev2.="<script language=javascript><!--
timerID = 0;
ftt = 0;
flag = false;
function sld(){
	ftt = 0;
clearTimer();
}

function clearTimer(){
	if (flag){
	clearInterval(timerID);
	flag = false;
	}
}
function slm(msec){
	ftt = ftt + msec;
	if(ftt > 0){
clearTimer();
	add = Math.round(100 / ftt);
	timerID = window.setInterval('scrollBy(0,4)',add);
	flag = true;
	}
	if(ftt < 0){
clearTimer();
	add = -ftt;
	add = Math.round(100 / add);
	timerID = window.setInterval('scrollBy(0,-4)',add);
	flag = true;
	}
	if(ftt == 0){
clearTimer();
	}
}

// --></script>
";

#$doc_mode = "x";

$f_id = $in{'id'};
	$p_kunino{$f_id} = 0;
	if(-e "./p_db/p/$f_id.cgi"){
&P_READ("p","$f_id","$f_id");
	}elsif(-e "./p_db/touketu/$f_id.cgi"){
&P_READ("touketu","$f_id","$f_id");
	}else{
$f_id = "siro_eihei";
$p_img{$f_id} = "$IMG{0}/siro_eihei";
	($add_1,$add_2,$add_3)=split(/\_/,$in{'id'});
$p_img_f{$f_id} = $p_img_kakutyou{0};
$p_img_m{$f_id} = $p_img_mime{0};
$p_name{$f_id} = "城壁衛兵$add_3";
		if($f_id =~ /d_z/){
$f_id = "zoku_eihei";
$p_img{$f_id} = "$IMG{0}/zoku_eihei";
$p_img_f{$f_id} = $p_img_kakutyou{0};
$p_img_m{$f_id} = $p_img_mime{0};
$p_name{$f_id} = "賊砦防衛隊$add_3";
		}
	}


print <<"PRI";


<iframe title=\"\" src=\"$fid\" name=\"lf\" width=\"780\" height=\"400\" frameborder=\"0\">インラインフレームに対応していないブラウザを使用の方は<a href=\"$fid\">こちら</a>
</iframe>
PRI
	if($in{'id'} eq ""){
	$fid = "./slog/$in{'l'}.html";
	}else{
####################
	open(IN,"./p_db/slogid/$f_id.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
	while ($i < 4) {
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$tt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$slogtl[$i] = "<a href=./?.m.=logf&amp;.l.=$addl[$i]&amp;.id.=$in{'id'}><span class=\"c000000\">$slogtl[$i]</span></a>";
	}else{
	$tt_datel[$i] = "N/A";
	}
$i ++;
	}
####################
#<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\">キャラ情報へ</a>

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b_logf_$f_id","$f_id","","","","","","","");
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");
print <<"PRI";
<div class=\"logf_div\">
<div class=\"logf_block1\">$img_sakusei_kekka</div>
<div class=\"logf_block2\">
<table width=\"240\">
<tr><td width=\"68\"></td><td class=\"txth\" width=\"167\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"2\"><span class=\"cFFFFFF\"><a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\"><span class=\"cFFFFFF\">$p_name{$f_id}</span></a>の戦歴（<a href=\"./?.m.=slog_b&amp;.id.=$in{'id'}\"><span class=\"cFFFFFF\">一覧表示</span></a>）</span></td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[0]</td><td class=\"txtr\">$slogtl[0]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[1]</td><td class=\"txtr\">$slogtl[1]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[2]</td><td class=\"txtr\">$slogtl[2]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[3]</td><td class=\"txtr\">$slogtl[3]</td></tr>
</table>
</div>
<div class=\"logf_block3\">$addc</div>
<div class=\"logf_block4\">
<iframe title=\"\" src=\"./?.m.=logf&amp;.l.=$in{'l'}&amp;.id.=$in{'id'}&amp;.n.=0\" name=\"yf\" width=\"50\" height=\"96\" frameborder=\"0\">/
</iframe>
</div>
PRI
	}
print <<"PRI";
<div class=\"logf_block0 txtl\">$kaddnamec</div>
<div class=\"logf_block0 txth\">《 Vs 》</div>
<div class=\"logf_block0 txtr\">$eaddnamec</div>

</div>

PRI
	&FOOTER;

	exit;

}

1;