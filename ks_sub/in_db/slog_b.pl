
sub MOVE {

	&HEADER;

$p_name{$f_id} = "該当者が見当たりません/";

$f_id = $in{'id'};
	$p_kunino{$f_id} = 0;
	if(-e "./p_db/p/$f_id.cgi"){
&P_READ("p","$f_id","$f_id");
	}elsif(-e "./p_db/touketu/$f_id.cgi"){
&P_READ("touketu","$f_id","$f_id");
	}else{
$f_id = "";
	}
	open(IN,"./p_db/slogid/$in{'id'}.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
$i_max = $#S_MOVEPR;
	if($i_max > 50){
$i_max = 50;
	}
	while ($i < $i_max) {
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i],$sdbname[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$tt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$slogtl[$i] = "<a href=\"./?.m.=logf&amp;.l.=$addl[$i]&amp;.id.=$f_id\"><span class=\"c000000\">$slogtl[$i]</span></a>";
	$addc .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\">$old_datel[$i]</td><td>$tt_datel[$i]</td><td class=\"txtr\">$slogtl[$i]</td><td class=\"txtr\">$sdbname[$i]</td></tr>";
	}else{
	$tt_datel[$i] = "N/A";
	$addc .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\">$old_datel[$i]</td><td>$tt_datel[$i]</td><td class=\"txtr\">$slogtl[$i]</td><td class=\"txtr\">$sdbname[$i]</td></tr>";
	}
$i ++;
	}
print <<"PRI";

<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\">キャラ情報へ</a>
<table width=\"750\">
<tr><td class=\"txth\" width=\"88\"></td><td width=\"68\"></td><td class=\"txth\" width=\"165\"></td><td class=\"txth\" width=\"420\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"4\"><span class=\"cFFFFFF\">$p_name{$f_id}戦争log（一覧表示）</span></tr>
$addc
</table>

PRI
	&FOOTER;

	exit;

}
1;

