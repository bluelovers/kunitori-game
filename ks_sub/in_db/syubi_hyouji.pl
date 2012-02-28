
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";
	if($f_id ne $k_yakusyoku_id{$fk_id}[$p_kuni_yakusyoku{$f_id}]){
&ER1("当権限を使用できるのは幹部だけです。");
	}

require "$mpg_r/sub_db/tw.pl";

		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("tosi_db","$ft_id","$ft_id");
		}
	}
closedir(DFR);

			$listdfkazu[1] = 0;
			$listdfkazu[2] = 0;
			$listdfkazu[3] = 0;
			$listdfkazu[4] = 0;
			$listdfkazu[5] = 0;
			$listdfkazu[6] = 0;
			$listdfkazu[11] = 0;
			$listdfkazu[12] = 0;
			$listdfkazu[13] = 0;
			$listdfkazu[20] = 0;
			$listdfkazu[21] = 0;
			$listdfkazu[22] = 0;
			$listdfkazu[23] = 0;
			$listdfkazu[24] = 0;
						if($in{'num'} ne ""){
							$ft_id = $in{'num'};
							if($p_kunino{$f_id} eq $t_kunino{$ft_id}){$com = "$t_name{$ft_id}の守備状態は以下の通りです。";

			$dfihn = "dfi$in{'num'}";
			$dfihnno = "dfino$in{'num'}";
require "./w_db/guest/stv$in{'num'}.pl";

			$t_list = "
<tr class=\"bgcFFFFFF\"><td class=\"txth\" width=\"30\">山林</td><td class=\"txth\" width=\"147\">${$dfihnno}[1]人⇒${$dfihn}[1]</td><td class=\"txth\" width=\"45\">-</td><td class=\"txth\" width=\"147\">-</td><td class=\"txth\" width=\"60\">-</td><td class=\"txth\" width=\"147\">-</td><td class=\"txth\" width=\"30\">-</td><td class=\"txth\" width=\"147\">-</td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">山道</td><td class=\"txth\">${$dfihnno}[2]人⇒${$dfihn}[2]</td><td class=\"txth\">山岳砦</td><td class=\"txth\">${$dfihnno}[11]人⇒${$dfihn}[11]</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">西門</td><td class=\"txth\">${$dfihnno}[21]人⇒${$dfihn}[21]</td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">川原</td><td class=\"txth\">${$dfihnno}[3]人⇒${$dfihn}[3]</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">北門</td><td class=\"txth\">${$dfihnno}[22]人⇒${$dfihn}[22]</td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">草原</td><td class=\"txth\">${$dfihnno}[4]人⇒${$dfihn}[4]</td><td class=\"txth\">平地砦</td><td class=\"txth\">${$dfihnno}[12]人⇒${$dfihn}[12]</td><td class=\"txth\">防衛拠点</td><td class=\"txth\">${$dfihnno}[20]人⇒${$dfihn}[20]${$dfihn}[0]</td><td class=\"txth\">東門</td><td class=\"txth\">${$dfihnno}[23]人⇒${$dfihn}[23]</td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">林道</td><td class=\"txth\">${$dfihnno}[5]人⇒${$dfihn}[5]</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">南門</td><td class=\"txth\">${$dfihnno}[24]人⇒${$dfihn}[24]</td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">森林</td><td class=\"txth\">${$dfihnno}[6]人⇒${$dfihn}[6]</td><td class=\"txth\">森林砦</td><td class=\"txth\">${$dfihnno}[13]人⇒${$dfihn}[13]</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td><td class=\"txth\">-</td></tr>
";

							}elsif($p_kunino{$f_id} eq $t_zokuno{$ft_id}){$com = "$t_name{$ft_id}賊砦の守備状態は以下の通りです。";
			$dfihn = "dfi$in{'num'}";
			$dfihnno = "dfino$in{'num'}";
require "./w_db/guest/stv$in{'num'}.pl";

			$t_list = "
<tr class=\"bgcFFFFFF\"><td class=\"txth\">賊砦防衛拠点</td><td class=\"txth\">${$dfihnno}[999]人⇒${$dfihn}[999]</td></tr>
";
							}else{$com = "$t_name{$ft_id}は自都市ではありません。都市を選択してください。";
							}

						}else{$com = "都市を選択してください。";
						}
	if($k_kokka_keitai{$fk_id}){
	$xx=0;
		$cnl = "";
	while ($xx<$tosi_kazu) {
							$ft_id = $xx;

			$bgcmap[$xx] = "CCCCCC";
						if($p_kunino{$f_id} eq $t_zokuno{$ft_id}){
		$cnl .= "<option value=\"$xx\">$t_name[$xx]の賊砦</option>";
			$bgcmap[$xx] = "CFEFFF";
						}
		$xx++;
	}

	}else{
	$xx=0;
		$cnl = "";
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
			$bgcmap[$xx] = "CCCCCC";
						if($p_kunino{$f_id} eq $t_kunino{$dt_id}){
		$cnl .= "<option value=\"$xx\">$t_name[$xx]</option>";
			$bgcmap[$xx] = "CFEFFF";
						}
		$xx++;
	}

	}

require "./w_db/trmap.pl";
	&IMG_SAKUSEI("$IMG{0}/sansyou3$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	&HEADER;
	print <<"PRI";


<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">《 守備位置確認 》<br /><br />この画面では自都市の守備状態を確認できます。
</td></tr></table>
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"s_map_div\">
<input type=\"hidden\" name=\".m.\" value=\"syubi_hyouji\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<div class=\"s_map_block1\">

<select name=\".num.\" size=\"10\">$cnl
</select>

</div>
PRI
						if($in{'i'} ne "i"){
	print <<"PRI";
<div class=\"s_map_block2\">

<table bgcolor="#60AF60" width=\"660\" border=\"0\">

<tr><td width=\"30\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td></tr>

	<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"11\">
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから調査するボタンを押してください<br />（$cd_op0n2：金色／自国領：青色）</span>
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

PRI
						}
	print <<"PRI";
<div class=\"clear_b\"></div>
<input type=\"submit\" value=\"守備状態を調査する\"></div></form>$com<br />
<div class=\"clear_b\"></div>

<table class=\"bgc884422\" width=\"760\">
$t_list
</table>
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=sirei><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=中書省へ戻る></div></form>

<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>
PRI

	&FOOTER;
	exit;

}
1;

