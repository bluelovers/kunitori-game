
sub MOVE {

require "./$mpg_r/sub_db/1.pl";
require "./$mpg_r/sub_db/minzoku.pl";
require "./$mpg_r/sub_db/ad_file.pl";

require "$mpg_r/sub_db/p_k.pl";

	$fk_id = abs(int($in{'id'}));
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if($kuni_tenka_kaisuu eq $in{'tk'} or !$in{'tk'}){
	open(IN,"./pr/k/$fk_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	($hnof,$hy) = split(/<>/,$F_LOG2[0]);
	($hnof,$hc) = split(/<>/,$F_LOG2[1]);
	($hnof,$hi) = split(/<>/,$F_LOG2[2]);
	($hnof,$h1) = split(/<>/,$F_LOG2[3]);
	($hnof,$h2) = split(/<>/,$F_LOG2[4]);
	($hnof,$h3) = split(/<>/,$F_LOG2[5]);
	($hnof,$hyj) = split(/<>/,$F_LOG2[6]);
	($hnof,$hsj) = split(/<>/,$F_LOG2[7]);
	($hnof,$hgj) = split(/<>/,$F_LOG2[8]);
	($hnof,$htr) = split(/<>/,$F_LOG2[9]);
	($hnof,$hmg) = split(/<>/,$F_LOG2[10]);
	($hnof,$hsk) = split(/<>/,$F_LOG2[11]);
	($kf12,$khsn1) = split(/<>/,$F_LOG2[12]);
	($kf13,$khsn2) = split(/<>/,$F_LOG2[13]);
	($kf14,$khsn3) = split(/<>/,$F_LOG2[14]);
	($kf15,$khsn4) = split(/<>/,$F_LOG2[15]);
	($kf16,$khsnp) = split(/<>/,$F_LOG2[16]);
	($hnof,$hk) = split(/<>/,$F_LOG2[17]);




	&HEADER;

	open(IN,"./p_db/slogid/k_$fk_id.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
	while ($i < 4) {
$slogtl[$i] = "N/A";
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$tt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$slogtl[$i] = "<a href=\"./?.m.=logf&amp;.l.=$addl[$i]\"><span class=\"c000000\">$slogtl[$i]</span></a>";
	}else{
	$tt_datel[$i] = "N/A";
	}
$i ++;
	}
   		$add_p_k_come = "（<a href=\"./?.m.=blist&amp;.k.=$fk_id\" target=\"_blank\">武将一覧</a>）";
	if($in{'i'} ne "i"){
$S_MES = "";
	open(IN,"./pr/klog/$fk_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
	$p=0;
		foreach(@MES_REG1){
			($bb2) = split(/<>/);
$S_MES .= "<span class=\"c228B22\">●</span>$bb2<br />";
		}
	&P_K_1;
print <<"PRI";
$add_p_come
PRI
print <<"PRI";

<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txth\" width=\"167\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"2\"><span class=\"cFFFFFF\">戦争log（<a href=\"./?.m.=slog_k&amp;.id.=$fk_id\"><span class=\"cFFFFFF\">一覧表示</span></a>）</span></td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[0]</td><td class=\"txtr\">$slogtl[0]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[1]</td><td class=\"txtr\">$slogtl[1]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[2]</td><td class=\"txtr\">$slogtl[2]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[3]</td><td class=\"txtr\">$slogtl[3]</td></tr>

</table>

PRI
	&P_K_2;
print <<"PRI";
$add_p_come
PRI
	}else{
$S_MES = "";
	open(IN,"./pr/klog/$fk_id.cgi");
	@LOG_DATA = <IN>;
	close(IN);

	$i_max = @LOG_DATA;
	$i=0;
	while($i<20){
	$bb2="";
			($bb2) = split(/<>/,$LOG_DATA[$i]);
$S_MES .= "$bb2<br />";
		$i++;
	}
	&P_B_AD_I;
$slogtl[0] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[1] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[2] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[3] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$S_MES =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
print <<"PRI";

<table class=\"bgc884422\" width=\"240\">
<tr class=\"bgc884422\"><td width=\"60\"></td><td width=\"175\"></td></tr>
<tr class=\"bgcF8F0E0\"><td class=\"txth\" colspan=\"2\">$k_name_d[$fk_id]$add_p_k_come</td></tr>

<tr class=\"bgcF8F0E0\"><td>関連URL</td><td class=\"txtc\">$hgj</td></tr>
<tr class=\"bgcF8F0E0\"><td>IRC</td><td class=\"txtc\">$htr</td></tr>
<tr class=\"bgcF8F0E0\"><td>仕官時の特典</td><td class=\"txtc\">
<div class=\"msp\">
$hmg
</div>
</td></tr>
<tr class=\"bgcF8F0E0\"><td>宣伝PR</td><td class=\"txtc\">
<div class=\"msp\">
$hsk
</div>
</td></tr>
</table>
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txth\" width=\"167\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"2\"><span class=\"cFFFFFF\">戦争log（<a href=\"./?.m.=slog_k&amp;.id.=$fk_id\"><span class=\"cFFFFFF\">一覧表示</span></a>）</span></td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[0]</td><td class=\"txtr\">$slogtl[0]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[1]</td><td class=\"txtr\">$slogtl[1]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[2]</td><td class=\"txtr\">$slogtl[2]</td></tr>
<tr class=\"kbgcc0\"><td>$tt_datel[3]</td><td class=\"txtr\">$slogtl[3]</td></tr>

</table>


<br /><br />
<table cellspacing=\"1\" width=\"240\">
<tr class=\"bgcF8F0E0\"><td class=\"bgcF8F0E0\">$k_name_d[$fk_id]の歴史</td></tr>
<tr class=\"bgcF8F0E0\"><td class=\"bgcF8F0E0\">$S_MES</td></tr>
</table>

PRI
	}
	&FOOTER;

	}else{
	$yytm = sprintf("%05d", $in{'tk'});
print "Location: $URI/mapr/db/$yytm\-$in{'id'}.html\n\n";
	}
	exit;


}

1;