
sub MOVE {
	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);


$datev2.="<script language=javascript><!--

heimax = new Array();
	heimax[0] = $get_sol[0];
	heimax[1] = $get_sol[1];
	heimax[2] = $get_sol[2];

heisc = new Array();
	heisc[0] = \"解雇○\";
	heisc[1] = \"徴兵○\";
	heisc[2] = \"徴兵×\";
	heisuu = $p_heisisuu{$f_id};


function hmaxc(heiid,heitype,formsno,heiscno){

document.forms[formsno].elements[2].value = heisc[heiscno];
			document.forms[formsno].elements[0].value = heimax[heitype];
if (document.forms[formsno].elements[1].value == \"husoku\"){
document.forms[formsno].elements[0].value = heimax[heitype] - heisuu;
}
if (document.forms[formsno].elements[1].value == \"full\"){
document.forms[formsno].elements[0].value = 'full';
}
if (document.forms[formsno].elements[1].value == \"tyouhei\"){
document.forms[formsno].elements[0].value = '';
}
if (document.forms[formsno].elements[1].value == \"kaiko\"){
document.forms[formsno].elements[0].value = heisuu;
document.forms[formsno].elements[2].value = heisc[0];
}

if (document.forms[formsno].elements[1].value == \"max\"){
document.forms[formsno].elements[0].value = heimax[heitype] - heisuu;
}
}
function koyou(heiid,heitype,formsno){

if (document.forms[formsno].elements[1].selectedIndex != 4){
document.forms[formsno].elements[1].options[3].selected=\"selected\"= true;
}

}
function hmaxd(heiid,heitype,formsno){

document.forms[formsno].elements[0].value = '';

}

// --></script>
";


		$tyouheicon=$t_kunino{$ft_id};
					if($k_kokka_keitai{$fk_id}){
		$tyouheicon=$t_zokuno{$ft_id};
					}
require "./$mpg_r/sub_db/tw.pl";
require "./$mpg_r/sub_db/hei.pl";

	$no = $in{'no'} + 1;
	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />";
	}

		if($in{'num'} eq ""){
	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

		$cd_op0z="";
		$cd_op0o=0;
		$cd_op0n="";
	foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

		if($cd_id eq "idou2" and $in{'no'} > $cd_op0o){
		$cd_op0z=$cd_op2;
		}
		$cd_op0o++;
	}
		}else{
		$no_list .= "<input type=\"hidden\" name=\".pos.\" value=\"$in{'num'}\" />";
		$cd_op0z=$in{'num'};
		}
		if($cd_op0z ne ""){

		$ft_id = $cd_op0z;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$cd_op0n="最終移動\予約先の都市・";
		$cd_op0n2="最終移動予約先";
		$tyouheicon=$t_kunino{$ft_id};
					if($k_kokka_keitai{$fk_id}){
		$tyouheicon=$t_zokuno{$ft_id};
					}
			if($tyouheicon ne $p_kunino{$f_id}){
&ER1("他国の都市では徴兵できません。");

			}
		}else{
		$cd_op0n2="現在地";
$cd_op0z = $p_taizai_iti{$f_id};
		}


	

################

			$thadd = 0;
	if(!$k_kokka_keitai{$fk_id} and $k_kunino{$fk_id}){

	if($p_kunino{$f_id} eq $t_kunino{$ft_id}){
		if(!-e "./w_db/mati/tyouheihit$cd_op0z.cgi"){

################


	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[0]","$k_kousen_aite_k{$fk_id}[0]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[1]","$k_kousen_aite_k{$fk_id}[1]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[2]","$k_kousen_aite_k{$fk_id}[2]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[3]","$k_kousen_aite_k{$fk_id}[3]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[4]","$k_kousen_aite_k{$fk_id}[4]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[5]","$k_kousen_aite_k{$fk_id}[5]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[6]","$k_kousen_aite_k{$fk_id}[6]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[7]","$k_kousen_aite_k{$fk_id}[7]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[8]","$k_kousen_aite_k{$fk_id}[8]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[9]","$k_kousen_aite_k{$fk_id}[9]");

		$tyohit3=0;
		&KOUSEN_AITE_KOKUSAKU_HIT("$toyhit3","10","$fk_id");
		$toyhit3=$kousen_aite_hit;

		if(!$tyohit3 and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[0] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[1] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[2] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[3] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[4]){


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

		$tyohit1=0;
		$tyohit2=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($p_kunino{$f_id} eq $t_kunino[$dt_id]){
		$tyohit1=1;
			}else{
		&KOUSEN_AITE_HIT("$tyohit2","$t_kunino[$dt_id]","$fk_id");
		$tyohit2=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$tyohit2;
		$tyohit_add{10}=1;
		$tyohit2=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
			}
		}
	}
			if($tyohit2 == 0){
			if($tyohit1 == 1){
			$thadd = 1;
		open(OUT,">./w_db/mati/tyouheihit$cd_op0z.cgi");
		print OUT $thadd;
		close(OUT);
			}
			}
		}

			if(!$thadd){
			$thadd = 0;
		open(OUT,">./w_db/mati/tyouheihit$cd_op0z.cgi");
		print OUT $thadd;
		close(OUT);
			}
################

		}else{
	open(IN,"./w_db/mati/tyouheihit$cd_op0z.cgi");
	$thadd = <IN>;
	close(IN);
		}

	}else{
			$thadd = 2;
	}
################
			if($thadd){
	&HEADER;

			if($thadd > 1){
	print <<"PRI";
【$cd_op0n$t_name{$ft_id}では徴兵出来ません】<br />他国の都市です。徴兵可\能な都市に移動してください。<br />この後方都市での徴兵は許可されていません。どうしても徴兵を行いたい場合は国の幹部に許可をもらってください。<br /><br />
<hr /><br />
PRI
			}elsif($thadd == 1){
	print <<"PRI";
【$cd_op0n$t_name{$ft_id}では徴兵出来ません】<br />交戦相手国に隣接していません。隣接自都市が存在します。徴兵可\能な都市に移動してください。<br />この後方都市での徴兵は許可されていません。どうしても徴兵を行いたい場合は国の幹部に許可をもらってください。<br /><br />
<hr /><br />
PRI
			}
	&ETYOUHEI;
	&FOOTER;

	exit;
			}
	}

			if($in{'etyou'}){
	&HEADER;

	&ETYOUHEI;
	&FOOTER;

	exit;
			}

	&TT_GET;

	&HEADER;



		if($k_kokka_keitai{$fk_id}){
$t_gijyutu_ti{$ft_id} = 500;
$t_nameop = '賊砦';
		}elsif($k_kokkyou{$fk_id} eq "9"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
$t_gijyutu_ti{$ft_id} = 999;
	}
		}
	


	&HOST_NAME;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
		$come1 = "";
	if(!$ichit){ 
		$come1 .= "
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 徴 兵 》<br /><br />
「$cd_op0n$t_name{$ft_id}」で徴兵を行います。
<br />種類の異なる兵を雇用すると以前まで雇っていた兵は解雇されます。
<br />フル徴兵を選択するとパラメータが上昇した際でも常時MAX徴兵を行います。
<br /><br />どの兵種を何名徴兵しますか？</span>
</td></tr></table>
<br />
<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"750\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"10%\">兵種</td><td class=\"txth\" width=\"10%\">$SOL_TYPE[$p_heisyu{$f_id}]</td><td width=\"10%\">兵士数</td><td class=\"txth\" width=\"10%\">$p_heisisuu{$f_id}/$p_heisisuu_max{$f_id}</td><td width=\"10%\">負傷兵数</td><td class=\"txth\" width=\"10%\">$p_heisisuu_husyou{$f_id}</td><td width=\"10%\">訓練</td><td class=\"txth\" width=\"10%\">$p_kunren{$f_id}/$p_kunren_max{$f_id}</td><td width=\"10%\">士気</td><td class=\"txth\" width=\"10%\">$p_hei_siki{$f_id}</td></tr>

</table>

<br />
「$cd_op0n$t_name{$ft_id}$t_nameop」技術：$t_gijyutu_ti{$ft_id}/$t_gijyutu_max{$ft_id}<br />
<br />
<table width=\"760\" class=\"bgc884422\">
<tr class=\"bgcFFF8F0\"><td width=\"75\" class=\"txth\">兵種名</td><td width=\"320\" class=\"txth\">特性</td><td width=\"60\" class=\"txth\">系列</td><td width=\"45\" class=\"txth\">雇用金</td><td width=\"260\" class=\"txth\">雇用数</td></tr>
";
	}else{
		$come1 .= "
<span class=\"fs4\">《 徴 兵 》</span>
$p_name{$f_id}/$t_name{$ft_id}<br />
技術値:$t_gijyutu_ti{$ft_id}<br />
金:$p_syoji_kin{$f_id}<br />
米:$p_syoji_kome{$f_id}<br />
兵数:$p_heisisuu{$f_id}<br />
訓練:$p_kunren{$f_id}<br />
<br /><br />
何名雇いますか？<br /><br />
種類:雇用単価:雇用数<br /><br />";
	}

	$heisyuno_id=0;
	$p=0;
	while($p<21){
	if($SOL_TYPE[$p] and $t_gijyutu_ti{$ft_id} >= $SOL_TEC[$p]){ 
		if(!$hfip){ 
		$come1 .= "
<tr class=\"bgcFFF8F0\"><td class=\"txth\">$SOL_TYPE[$p]</td><td class=\"txth\">$SOL_TOKUSEI[$p]</td><td class=\"txth\">$SOL_ZOKUSEIC[$SOL_ZOKUSEIT[$p]]</td><td class=\"txth\">金 $SOL_PRICE[$p]</td>
<td>
<form action=\"$COMMAND\" method=\"post\" name=heisyuid$p utn=\"utn\"><div>
<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>

<input type=\"submit\" value=\"徴兵○\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /></div></form></td></tr>";
		}else{
		$come1 .= "
$SOL_TYPE[$p]:金 $SOL_PRICE[$p]:<form action=\"$COMMAND\" method=\"post\" name=\"heisyuid$p\" utn=\"utn\"><div>

<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select><input type=\"submit\" value=\"徴兵○\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /></div></form>";
		}
	$heisyuno_id++;
	}elsif($SOL_TYPE[$p]){ 
		if(!$hfip){ 
		$come1 .= "
<tr class=\"bgcFFF8F0\"><td class=\"txth\">$SOL_TYPE[$p]<br /><span class=\"cFF0000\">技術不足</span></td><td class=\"txth\">$SOL_TOKUSEI[$p]</td><td class=\"txth\">$SOL_ZOKUSEIC[$SOL_ZOKUSEIT[$p]]</td><td class=\"txth\">金 $SOL_PRICE[$p]</td>
<td>
<form action=\"$COMMAND\" method=\"post\" name=\"heisyuid$p\" utn=\"utn\"><div>
<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵×\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /></div></form></td></tr>";
		}else{
		$come1 .= "
$SOL_TYPE[$p]:金 $SOL_PRICE[$p]:<form action=\"$COMMAND\" method=\"post\" name=heisyuid$p utn=\"utn\"><div>

<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵×\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /></div></form>";
		}
	$heisyuno_id++;
	}
		$p++;
	}

	$t_tiiki_hei_syu{$ft_id}[10]=$SOL_MINZOKU[$p_minzoku{$f_id}];
if($k_kokkyou{$fk_id} eq "1"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=48;
	}
}elsif($k_kokkyou{$fk_id} eq "4"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=25;
	}
}elsif($k_kokkyou{$fk_id} eq "7"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=83;
	}
}elsif($k_kokkyou{$fk_id} eq "9"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=96;
	}
}elsif($k_kokkyou{$fk_id} eq "10"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=82;
	}
}elsif($k_kokkyou{$fk_id} eq "11"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=81;
	}
}elsif($k_kokkyou{$fk_id} eq "12"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=49;
	}
}elsif($k_kokkyou{$fk_id} eq "13"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=33;
	}
}

if(($p_heisyu{$f_id} eq "14" and $p_heisisuu{$f_id} < 1) or $p_heisyu{$f_id} eq "95"){
	$t_tiiki_hei_syu{$ft_id}[12]=95;
}
	foreach(@{$t_tiiki_hei_syu{$ft_id}}){

	$p=$_;
if($p and !$tyouheijc[$p]){ 
if($SOL_TYPE[$p] and $t_gijyutu_ti{$ft_id} >= $SOL_TEC[$p]){ 

	$tyouheijc[$p]++;
		if(!$hfip){ 
		$come1 .= "
<tr class=\"bgcFFF8F0\"><td class=\"txth\">$SOL_TYPE[$p]</td><td class=\"txth\">$SOL_TOKUSEI[$p]</td><td class=\"txth\">$SOL_ZOKUSEIC[$SOL_ZOKUSEIT[$p]]</td><td class=\"txth\">金 $SOL_PRICE[$p]</td>
<td>
<form action=\"$COMMAND\" method=\"post\" name=heisyuid$p utn=\"utn\"><div>
<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵○\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /></div></form></td></tr>";
		}else{
		$come1 .= "
$SOL_TYPE[$p]:金 $SOL_PRICE[$p]:<form action=\"$COMMAND\" method=\"post\" name=\"heisyuid$p\" utn=\"utn\"><div>

<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,1);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵○\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /></div></form>";
		}
	$heisyuno_id++;
}elsif($SOL_TYPE[$p]){ 
	$tyouheijc[$p]++;
		if(!$hfip){ 
		$come1 .= "
<tr class=\"bgcFFF8F0\"><td class=\"txth\">$SOL_TYPE[$p]<br /><span class=\"cFF0000\">技術不足</span></td><td class=\"txth\">$SOL_TOKUSEI[$p]</td><td class=\"txth\">$SOL_ZOKUSEIC[$SOL_ZOKUSEIT[$p]]</td><td class=\"txth\">金 $SOL_PRICE[$p]</td>
<td>
<form action=\"$COMMAND\" method=\"post\" name=\"heisyuid$p\" utn=\"utn\"><div>
<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<option value=\"max\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵×\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /></div></form></td></tr>";
		}else{
		$come1 .= "
$SOL_TYPE[$p]:金 $SOL_PRICE[$p]:<form action=\"$COMMAND\" method=\"post\" name=\"heisyuid$p\" utn=\"utn\"><div>

<input type=\"text\" name=\".num.\" value=\"$get_sol[$SOL_MAXT[$p]]\" size=\"4\" onclick=\"hmaxd($p,$SOL_MAXT[$p],$heisyuno_id);\" onChange=\"koyou($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<select name=\".cmaxf.\" onChange=\"hmaxc($p,$SOL_MAXT[$p],$heisyuno_id,2);\">
<option value=\"max\" selected=\"selected\">max兵数</option>
<option value=\"full\">フル徴兵</option>
<option value=\"husoku\">不足兵数</option>
<option value=\"tyouhei\" selected=\"selected\">徴兵兵数を指定入力</option>
<option value=\"kaiko\">解雇兵数を指定入力</option></select>
<input type=\"submit\" value=\"徴兵×\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
$no_list
<input type=\"hidden\" name=\".type.\" value=\"$p\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /></div></form>";
		}
	$heisyuno_id++;
}
}
	}



	print <<"PRI";
$come1$come2
PRI


	if(!$hfip){

print <<"PRI";
</table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei1\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".etyou.\" value=\"1\" />$no_list
<input type=\"submit\" value=\"部隊の集合を利用して他都市で徴兵\" /></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\">

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI
	}else{

print <<"PRI";

<br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei1\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".etyou.\" value=\"1\" />$no_list
<input type=\"submit\" value=\"部隊の集合を利用して他都市で徴兵\" /></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI
	}
	&FOOTER;

	exit;

}
#########
sub ETYOUHEI {

	print <<"PRI";
※部隊の集合を利用して他都市での徴兵予約をしたい場合は下記コマンドを入力してください。
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"s_map_div\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
PRI
		if(!$ichit){
	print <<"PRI";

<div class=\"s_map_block1\">
PRI
		}
	print <<"PRI";
<select name=\".num.\" size=\"10\">
PRI

		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
opendir(DFR,"./w_db/tosi_db");
	while($et_id = readdir(DFR)){
		if($et_id =~ /\.cgi/i){
$et_id =~ s/\.cgi//;
	&T_READ("tosi_db","$et_id","$et_id");
		}
	}
closedir(DFR);

	$xx=0;
	while ($xx<$tosi_kazu) {
							$et_id = $xx;

		if($p_kunino{$f_id} eq $t_kunino{$et_id}){
	if($xx eq $k_kouhou_tyouhei{$fk_id}[0] or $xx eq $k_kouhou_tyouhei{$fk_id}[1] or $xx eq $k_kouhou_tyouhei{$fk_id}[2] or $xx eq $k_kouhou_tyouhei{$fk_id}[3] or $xx eq $k_kouhou_tyouhei{$fk_id}[4]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
	}else{
	foreach(@{$t_setuzoku_saki{$et_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[0]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[1]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[2]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[3]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[4]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[5]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[6]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[7]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[8]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}elsif($t_kunino[$dt_id] eq $k_kousen_aite_k{$fk_id}[9]){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			push(@add_l2,"$xx\n");
last;
			}
		}
	}
	}
		}
		$xx++;
	}

		print "<option value=\"999\">＝＝＝</option>";

	$xx=0;
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
			$bgcmap[$xx] = "CCCCCC";
			if($t_kunino[$dt_id] eq $p_kunino{$f_id}){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
			$bgcmap[$xx] = "EFFFFF";
			}
		$xx++;
	}

			$bgcmap[$cd_op0z] = "FFFFCC";
	foreach(@add_l2){
		if("$_" ne ""){
			$move_list .= "$t_name[$_]・";
			if($bgcmap[$_] eq "EFFFFF"){
			$bgcmap[$_] = "CFEFFF";
			}
		}
	}
print <<"PRI";
</select>
PRI
		if(!$ichit){
require "./w_db/trmap.pl";
print <<"PRI";
</div>
<div class=\"s_map_block2\">
	<table class=\"bgc60AF60\" width=\"660\" border=\"0\">


	<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"11\">
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから徴兵先決定ボタンを押してください<br />（$cd_op0n2：金色／徴兵可\能都市：青色／自国領：シアン色）</span>
	</td>	</tr>



		<tr>
            <td width=\"20\" class=\"bgcF8F0E8\">-</td>
			<td width=\"70\" class=\"bgcF8F0E0\">1</td>
			<td width=\"70\" class=\"bgcF8F0E0\">2</td>
			<td width=\"70\" class=\"bgcF8F0E0\">3</td>
			<td width=\"70\" class=\"bgcF8F0E0\">4</td>
			<td width=\"70\" class=\"bgcF8F0E0\">5</td>
			<td width=\"70\" class=\"bgcF8F0E0\">6</td>
			<td width=\"70\" class=\"bgcF8F0E0\">7</td>
			<td width=\"70\" class=\"bgcF8F0E0\">8</td>
			<td width=\"70\" class=\"bgcF8F0E0\">9</td>
			<td width=\"70\" class=\"bgcF8F0E0\">10</td>
		</tr>

$trmap

	</table>



</div>

<div class=\"clear_b\"></div>
PRI
		}
print <<"PRI";
<br /><br />【徴兵可\能都市】<br />$move_list<br />
$no_list<br />
<input type=\"hidden\" name=\".m.\" value=\"tyouhei1\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"徴兵先決定\" />（徴兵コマンドが実行される前に部隊の集合を利用して現地に移動するようお願いします）</div></form>
<div class=\"clear_b\"></div>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form><br />
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object> 

PRI


}
1;