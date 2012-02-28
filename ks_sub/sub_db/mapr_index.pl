
$script_name = $ENV{'HTTP_REFERER'};
$script_name =~ s|.*/||;
if($script_name eq 'map2.html') {

print "Location: $URI/?.m.=$in{'m'}&amp;.id.=$in{'id'}&amp;.k.=$in{'k'}\n\n";
}else{

	($tm11,$tm12) = split(/\-/,$script_name);

	open(IN,"$idurl./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);

	$tenkakaisuu = int($tenkakaisuu);
	$yytm = sprintf("%05d", $tenkakaisuu);

if($tm11 and $tm12 and $tm11 ne $yytm) {
	if($in{'m'} ne "blist") {
print "Location: $URI/mapr/db/$tm11-$in{'id'}.html\n\n";
	}else{
print "Location: $URI/mapr/$tm11-b_itiran.html\n\n";
	}
print "Location: $URI/mapr/db/$tm11-$in{'id'}.html\n\n";
}else{
print "Location: $URI/?.m.=$in{'m'}&amp;.id.=$in{'id'}&amp;.k.=$in{'k'}\n\n";
}

}

1;