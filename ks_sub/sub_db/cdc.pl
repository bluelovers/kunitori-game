
sub K_DB_NW {
	open(IN,"./w_db/country.cgi");
	@COU_DATA = <IN>;
	close(IN);
	$country_no=0;$hit=0;
	$country_no2=0;
	foreach(@COU_DATA){
		($x2cid,$x2name,$x2ele,$x2mark)=split(/<>/);
		$k_name_d[$x2cid] = $x2name;
		$cou_ele[$x2cid] = $x2ele;
		$cou_mark[$x2cid] = $x2mark;
		if($coudno eq $x2cid){
		($xcid,$xname,$xele,$xmark,$xking,$xmes,$xsub,$xpri)=split(/<>/);
		$country_no = $country_no2;
$hit=1;}
		$country_no2++;
	}

	if(!$hit){
		$xcid=0;
		$xname="無所属";
		$xele=0;
		$xmark=0;
		$xking=0;
		$xmes="";
		$xsub="";
		$xpri="";
	}
	($xgunshi,$xdai,$xuma,$xgoei,$xyumi,$xhei,$xxsub1,$xxsub2,$xx8,$xx9,$xx10,$xx11,$xx12,$xx13,$xx14,$xx15,$xvv16,$xvv17,$xvv18,$xvv19,$xvv20,$xvv21,$xvv22,$xvv23,$xvv24,$xvv25,$xx16,$xx17,$xx18,$xx19,$xx20,$xx21,$xx22,$xx23,$xx24,$xx25,$xx26,$xx27,$xx28,$xx29,$xx30)= split(/,/,$xsub);
#削除不可↓
$xflag1 = 0;
	($xseiname,$xtoorina,$xzokumei,$xkokugou,$xkouto,$xflag1,$xflag2,$xflag3,$xflag4,$xflag5,$xtatemono[0],$xtatemono[1],$xtatemono[2],$xtatemono[3],$xtatemono[4],$xtatemono[5],$xtatemono[6],$xtatemono[7],$xtatemono[8],$xtatemono[9],$xdbdb1,$xdbdb2,$xdbdb3,$xdbdb4,$xdbdb5,$xdbdb6,$xdbdb7,$xdbdb8,$xdbdb9,$xdbdb10)= split(/,/,$xpri);
&K_DB_C;
}
###########

sub K_DB_C {
$coudatai = '';
$coudataiall = '$k_name_d[' . '0' . '] = \'' . '' . '\';' . '$cou_ele[' . '0' . '] = \'' . '0' . '\';' . '$cou_mark[' . '0' . '] = \'' . '0' . '\';';

	$hit=0;
	foreach(@COU_DATA){
		$x2pri="";
		($x2cid,$x2name,$x2ele,$x2mark,$x2king,$x2mes,$x2sub,$x2pri)=split(/<>/);

$x2cid = int($x2cid);
$coudataiall .= '$k_name_d[' . $x2cid . '] = \'' . $x2name . '\';' . '$cou_ele[' . $x2cid . '] = \'' . $x2ele . '\';' . '$cou_mark[' . $x2cid . '] = \'' . $x2mark . '\';';

		if($coudno eq $x2cid and !$hit){
$coudatai .= "\$xdcid\[$coudno\] = \'" . $x2cid . '\';' . "\$xdname\[$coudno\] = \'" . $x2name . '\';' . "\$xdele\[$coudno\] = \'" . $x2ele . '\';';
$coudatai .= "\$xdmark\[$coudno\] = \'" . $x2mark . '\';' . "\$xdking\[$coudno\] = \'" . $x2king . '\';' . "\$xdmes\[$coudno\] = \'" . $x2mes . '\';';
$coudatai .= "\$xdsub\[$coudno\] = \'" . $x2sub . '\';' . "\$xdpri\[$coudno\] = \'" . $x2pri . '\';';

		$xdcid[$coudno]=$x2cid;
		$xdname[$coudno]=$x2name;
		$xdele[$coudno]=$x2ele;
		$xdmark[$coudno]=$x2mark;
		$xdking[$coudno]=$x2king;
		$xdmes[$coudno]=$x2mes;
		$xdsub[$coudno]=$x2sub;
		$xdpri[$coudno]=$x2pri;
$hit=1;
		}
	}
		if(!$hit){
$coudatai .= "\$xdcid\[$coudno\] = \'" . '\';' . "\$xdname\[$coudno\] = \'" . '\';' . "\$xdele\[$coudno\] = \'" . '\';';
$coudatai .= "\$xdmark\[$coudno\] = \'" . '\';' . "\$xdking\[$coudno\] = \'" . '\';' . "\$xdmes\[$coudno\] = \'" . '\';';
$coudatai .= "\$xdsub\[$coudno\] = \'" . '\';' . "\$xdpri\[$coudno\] = \'" . '\';';
		}


	$coudatai .= '1;';
	$coudataiall .= '1;';

		open(OUT,">./w_db/kuni/coudata$coudno\.pl");
		print OUT $coudatai;
		close(OUT);
		open(OUT,">./w_db/kuni/coudataall.pl");
		print OUT $coudataiall;
		close(OUT);
}

1;
