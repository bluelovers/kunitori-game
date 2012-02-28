
sub MOVE {

require "./$mpg_r/sub_db/tw.pl";
	$in{'id'} = abs(int($in{'id'}));
	&HEADER;

	open(IN,"./p_db/slogid/t_z$in{'id'}.cgi");
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

<a href=\"./map3.cgi\">勢力図へ</a>
<table width=\"750\">
<tr><td class=\"txth\" width=\"88\"></td><td width=\"68\"></td><td class=\"txth\" width=\"165\"></td><td class=\"txth\" width=\"420\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"4\"><span class=\"cFFFFFF\">$t_name[$in{'id'}] 賊砦 戦争log（一覧表示）</span></tr>
$addc
</table>

PRI
	&FOOTER;

	exit;

}
1;

