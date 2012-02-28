
sub MOVE {
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


require "$mpg_r/men_db/kts/$menck.pl";

							$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);


#	$nen_getu = sprintf("%02d\年%02d\月", $KAISI_NEN + $keika_nen, $tuki_genzai);


			$wmk = " 　";

				$add_p_jikan = $p_jikan{$f_id};
	$kousin_made_p = int(($p_jikan{$f_id} - $tt) / 60);
	$kousin_made_m = int(($m_tt - $tt) / 60);


	if(!$tuki_genzai){
$add_comkn="<option value=\"kenkoku\">遠方建国＆遠方仕官</option>";
	}elsif(!$t_kunino{$ft_id}){
$add_comkn="<option value=\"kenkoku\">建国</option>";
	}elsif(!$t_zokuno{$ft_id}){
$add_comkn="<option value=\"kenkoku\">賊旗揚げ</option>";
	}


							$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");

	if($gundan_no{$p_gundanno{$f_id}}){
$uhit=1;
$BUTAI_SC[0] = '集合指示に従う';
$BUTAI_SC[1] = '単独行動';
$BUTAI_SC[2] = '謀反密約';

	$e_id=$gundan_yakusyoku_id{$p_gundanno{$f_id}}[1];
	&P_READ("p","$e_id","$e_id");
			if($p_kunino{$e_id} eq $p_kunino{$f_id}){


			if($p_gunsirei{$e_id}[0] eq "1"){
require "./$mpg_r/sub_db/tw.pl";
			($qsec,$qmin,$qhour,$qday) = localtime($p_jikan{$e_id});
	$ndate = sprintf("%02d\/%02d\:%02d\ ", $qday, $qhour, $qmin);
				$bsirei1 = "$t_name[$p_taizai_iti{$p_id{$e_id}}]集合 $ndate";
#			}elsif($p_gunsirei{$e_id}[0] eq "2"){
#				$bsirei1 = "謀反";
			}else{
				$bsirei1 = "自由行動";
			}
			if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
$BUTAI_SC[0] = '軍団長';
$BUTAI_SC[1] = '軍団長';
$BUTAI_SC[2] = '軍団長';
			}

			}else{
	$uhit=0;
		$gundan_name{$p_gundanno{$f_id}}="無所属";
			}
	}else{ 
	$uhit=0;
		$gundan_name{$p_gundanno{$f_id}}="無所属";
	}

	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

$KOUSIN_S_K[0] = $p_kousin_s{$f_id};
$KOUSIN_S_K[1] = $p_b_kousin_s{$f_id};
$KOUSIN_S_K[2] = $p_h_kousin_s{$f_id};
$KOUSIN_S_K[10] = $KOUSIN_S_K[2];
$KOUSIN_S_K[20] = $KOUSIN_S_K[2]/2;
	if($in{'sensou_s'}){
$KOUSIN_S_K[10] = $KOUSIN_S_K[1];
$KOUSIN_S_K[20] = $KOUSIN_S_K[1];
		$sensou_sel = " selected=\"selected\"";
	}
 
	$wyear = int($keika_nen+$KAISI_NEN);

	if($m_tt > $add_p_jikan){
		$wmonth = $tuki_genzai;

	}else{
		$wmonth = $tuki_genzai+1;
				$m_tt += $kousin_kankaku;

	}

 

				if(!$in{'cdm'}){
$in{'cdm'} = 3;
					if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
$in{'cdm'} = 1;
					}elsif($k_kokka_keitai{$fk_id}){
$in{'cdm'} = 2;
					}elsif($k_kunino{$fk_id}){
$in{'cdm'} = 4;
					}
				}
	$del_out = $TOUKETU_T - $p_mikoudou_t{$f_id};

	$kousin_made_p += 5;
	$kousin_made_m += 5;


	$comecdl[3] = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"軍事\">
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"mittei1\">密偵(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";
	$comecdl[1] = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">街を巡察</option>
</optgroup>

<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"内政\">
<option value=\"kaikon\">農地開墾(金50)</option>
<option value=\"syougyou\">商業発展(金50)</option>
<option value=\"gijyutu\">技術開発(金50)</option>
<option value=\"bouei\">防衛力強化(金50)</option>
<option value=\"hosyuu\">城壁補修(金50)</option>
<option value=\"hodokosi\">施し(米50)</option>
<option value=\"khodokosi\">緊急施し(米5000)</option>
</optgroup>
<optgroup label=\"軍事\">
<option value=\"tyouhei1\">徴兵</option>
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"gsyousyuu\">義勇兵召集(金10000)</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
<option value=\"sensou1\">戦争</option>
<option value=\"sensou1z\">賊退治</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
<option value=\"ryuugen1\">流言工作(金100)</option>
<option value=\"yakiuti1\">焼き討ち(金100)</option>
<option value=\"kabeb1\">城壁破壊(金100)</option>
<option value=\"sendou1\">住民扇動(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";

	$comecdl[2] = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">便利屋家業（賊/巡察）</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"内政\">
<option value=\"bouei\">防衛力強化(金50)</option>
<option value=\"hosyuu\">城壁補修(金50)</option>
</optgroup>
<optgroup label=\"軍事\">
<option value=\"komedoro\">米泥棒</option>
<option value=\"goudatu\">金強奪</option>
<option value=\"tyouhei1\">徴兵</option>
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"gsyousyuu\">義勇兵召集(金10000)</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">賊砦の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
<option value=\"sensou1s\">城を強襲</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
<option value=\"ryuugen1\">流言工作(金100)</option>
<option value=\"yakiuti1\">焼き討ち(金100)</option>
<option value=\"kabeb1\">城壁破壊(金100)</option>
<option value=\"sendou1\">住民扇動(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";
	$comecdl[4] = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">街を巡察</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"軍事\">
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";


	$comecdlid[1] = '国家';
	$comecdlid[2] = '賊砦';
	$comecdlid[3] = '放浪';
	$comecdlid[4] = '潜入';
	&HEADER;
print <<"PRI";


<table class=\"kbgcb$k_iro_d{$fk_id} tlauto\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\">
<td class=\"txth\" width=25%></td><td class=\"txth\" width=25%></td><td class=\"txth\" width=25%></td><td class=\"txth\" width=25%></td></tr>
<tr><td class=\"txth\" class=\"kbgcb$k_iro_d{$fk_id}\" colspan=\"4\"><span class=\"kcc$k_iro_d{$fk_id}\">コマンド（$comecdlid[$in{'cdm'}]）</span></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\">

<td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".cdm.\" value=\"1\" />
<input type=\"submit\" value=\"国家\" /></div></form>
</td>


<td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".cdm.\" value=\"2\" />
<input type=\"submit\" value=\"賊砦\" /></div></form>
</td>

<td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".cdm.\" value=\"3\" />
<input type=\"submit\" value=\"放浪\" /></div></form>
</td>
<td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".cdm.\" value=\"4\" />
<input type=\"submit\" value=\"潜入\" /></div></form>
</td>
</form>
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"4\">軍団 ⇒ $gundan_name{$fgundan_id}（$BUTAI_SC[$p_gunsirei{$f_id}[0]]/$bsirei1）</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\">
<td class=\"txtc\" colspan=\"4\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".no.\" size=\"24\" multiple=\"multiple\">
<option value=\"all\" selected=\"selected\">ALL</option>
PRI
#			$MAX_CD = 60;
		if($#CD_DB < $MAX_CD-1){
			pop(@CD_DB);
			$i = $#CD_DB;
			while($i < $MAX_CD){
			push(@CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
			}
	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
		}
$i=0;
	while($i < $MAX_CD){
		$no = $i+1;
	$wxyear = int(($wmonth+11)/12-1 +$wyear);
	$wxmonth = sprintf("%02d", ($wmonth-1)%12+1);
		($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3,$cd_op4,$cdw_type1,$cdw_type2,$cdw_type3,$cdw_optts) = split(/<>/,$CD_DB[$i]);
	$cdw_optts = int($cdw_optts);
	$no = sprintf("%03d", $no);
			($qsec,$qmin,$qhour,$qday) = localtime($add_p_jikan);
	$ndate = sprintf("%02d\日%02d\：%02d\ ", $qday, $qhour, $qmin);

		print "<option value=\"$i\">$no \[$wxyear年$wxmonth月\]$wmk\ $ndate\ $cd_name </option>";

				$add_p_jikan += $KOUSIN_S_K[$cdw_optts];
			($qsec,$qmin,$qhour,$qday) = localtime($add_p_jikan);
				&KTS2;
			$wmk = "☆";
		if($add_p_jikan >= $m_tt){
			$wmk = " 　";
		$wmonth++;
$m_tt += $kousin_kankaku;
#			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
#				&KTS1;
		}
$i++;
	}




print <<"PRI";
</select>

<select name=\".m.\" size=\"24\">
$comecdl[$in{'cdm'}]
<optgroup label=\"その他\">
$add_comkn
<option value=\"99911\">ループ作成1</option>
<option value=\"99912\">ループ作成2</option>
<option value=\"99913\">ループ作成3</option>
<option value=\"99914\">ループ作成4</option>
<option value=\"99915\">ループ作成5</option>
<option value=\"jyounou\">国庫に金を納付</option>
<option value=\"sokui\">自己推薦</option>
<option value=\"sakujyo\">※ID凍結\申請\</option>
</optgroup>
</select><br /><br /><input type=\"submit\" value=\"コマンド入力\" />
<div class=\"txtl\">※期間と行動内容を選択し『コマンド入力』を押して下さい
<br />※Ctrlキーを押しながら連続Clickで実施期間の複数選択可\
<br />※国威/体力/行動等に変動があった場合、時刻にズレが生じる可\能性があります</div>
</div></form></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txtc\" colspan=\"4\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"cd\" />
<select name=\".sensou_s.\">
<option value=\"0\">侵攻時に勝利するとして時間計算</option>
<option value=\"1\"$sensou_sel>侵攻時に敗北するとして時間計算</option>
</select>
<input type=\"submit\" value=\"コマンド更新\" /></div></form></td>
</tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"4\">次のターンまで$kousin_made_p分・次の月まで$kousin_made_m分</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"4\">凍結処理まで残り<span class=\"cFF0000\">$del_out</span>ターン</td></tr>
</table>

PRI
	&FOOTER;
	exit;

}
1;