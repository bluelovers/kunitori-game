
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	&IMG_SAKUSEI("$IMG{0}/sansyou3$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/tw.pl";
		$ft_id = $k_outo{$fk_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
require "./$mpg_r/sub_db/mapw.pl";
$cd_op0z = $k_outo{$fk_id};

				&KANBU_NAME;
require "./p_db/tt/kcs4$f_id.pl";
		if(!$k_kunino{$fk_id}){
&ER1("無所属は使用できません。");
		}
	if($k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("上公か三孤でなければ実行できません。");}

	if($in{'num'} eq "") {

	&HEADER;

##################
	if($k_kokka_keitai{$fk_id}){
##################
	print <<"PRI";

<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">
《 賊砦移転 》<br /><br />賊砦の拠点を隣接都市へ移転します。
<br />移転を行うには大量の発言力を消費します。<br />（このコマンドを実行すると当分の間各種進言を行えません）

<br /><br />
何処へ移転しますか？
</td></tr></table>

<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"s_map_div\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

PRI

	print <<"PRI";

<div class=\"s_map_block1\">
<select name=\".num.\" size=\"10\">
PRI


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

	$xx=0;
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
			$bgcmap[$xx] = "CCCCCC";
			if($t_zokuno[$dt_id] eq $p_kunino{$f_id}){
			$bgcmap[$xx] = "EFFFFF";
			}
		$xx++;
	}

	$hit=0;
			$bgcmap[$cd_op0z] = "FFFFCC";
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_zokuno[$dt_id]){
			$bgcmap[$_] = "FFCFCF";
			}elsif(!$t_zokuno[$dt_id]){
		print "<option value=\"$_\">$t_name[$_]</option>";
			$move_list .= "$t_name[$_]・";
			$bgcmap[$_] = "CFEFFF";
	$hit=1;
			}
		}
	}
			if(!$hit){
		print "<option value=\"\">移転不能 </option>";
			$move_list .= "<span class=\"cFF0000\">周囲に賊砦空白地域がありません。</span>";
			}
require "./w_db/trmap.pl";
print <<"PRI";
</select>
</div>
PRI
						if($in{'i'} ne "i"){
	print <<"PRI";
<div class=\"s_map_block2\">
	<table class=\"bgc60AF60\" width=\"660\" border=\"0\">

<tr><td width=\"30\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td></tr>

	<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"11\">
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから移動先決定ボタンを押してください<br />（現在地：金色／隣接都市賊砦在り：赤色／隣接都市賊砦無し：青色）</span>
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
<br /><br />【現在の本拠:$t_name{$ft_id}から移転\可\能な街】<br />$move_list<br />
<input type=\"hidden\" name=\".m.\" value=\"iten\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"移転先決定\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"中書省へ戻る\" /></div></form>

<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object> 
PRI
##################
	}else{
##################
	print <<"PRI";

<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">
《 首都移転 》<br /><br />王都を別な都市へ移転します。
<br />移転を行うには国庫の金200000と大量の発言力を消費します。<br />（このコマンドを実行すると当分の間各種進言を行えません）
<br /><br />
何処へ移転しますか？
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"s_map_div\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

PRI

	print <<"PRI";

<div class=\"s_map_block1\">
<select name=\".num.\" size=\"10\">
PRI


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
	$hit=0;
	$xx=0;
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
			$bgcmap[$xx] = "CCCCCC";
			if($t_kunino[$dt_id] eq $p_kunino{$f_id}){
		print "<option value=\"$xx\">$t_name[$xx]</option>";
	$hit=1;
			$move_list .= "$t_name[$xx]・";
			$bgcmap[$xx] = "EFFFFF";
			}
		$xx++;
	}

			$bgcmap[$cd_op0z] = "FFFFCC";
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
			if($bgcmap[$_] eq "EFFFFF"){
			$bgcmap[$_] = "CFEFFF";
			}
		}
	}
			if(!$hit){
		print "<option value=\"\">移転不能 </option>";
			$move_list .= "<span class=\"cFF0000\">我が国の支配領域は１都市です。移転先が在りません。</span>";
			}
require "./w_db/trmap.pl";
print <<"PRI";
</select>
</div>
<div class=\"s_map_block2\">
	<table class=\"bgc60AF60\" width=\"660\" border=\"0\">

<tr><td width=\"30\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td><td width=\"63\"></td></tr>

	<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"11\">
	<span class=\"cFFFFFF\">&nbsp;選択リスト or 地図 のどちらかにチェックをつけてから移動先決定ボタンを押してください<br />（現在地：金色／隣接自国領：青色／自国領：シアン色）</span>
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
<br /><br />【現在の王都:$t_name{$ft_id}から移転\可\能な街】<br />$move_list<br />
<input type=\"hidden\" name=\".m.\" value=\"iten\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"移転先決定\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" />
<input type=\"submit\" value=\"中書省へ戻る\" /></div></form>
<div class=\"clear_b\"></div>
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object> 
PRI
##################
	}
##################

	&FOOTER;
	exit;

	}else{
		$add = $rank_mes;

if(!-e "./w_db/tosi_db/$in{'num'}.cgi") { &ER1("都市の入力が不正です。"); }
##########
	

#########
		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

							$dt_id = abs(int($in{'num'}));

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";

		if($kousinjyoutai eq "999"){
&ER1("天下統一が起こりました。繰越処理が行われるまでしばらくお待ち下さい。");
		}
		$ttadd = 0;


		if($dt_id eq $k_outo{$fk_id}){
&ER1("移転先が現本拠地と同じです。");
		}
	if($k_kokka_keitai{$fk_id}){
		if($t_zokuno[$dt_id]){
&ER1("その都市には他の賊が居るようです。");
		}
		$ft_id = $k_outo{$fk_id};
			$hit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if($_ eq $dt_id){
			$hit ++;
		}
	}
		if(!$hit){
&ER1("現在の本拠に隣接していません。");
		}

		$ek_id = $t_kunino[$dt_id];
		if(!$k_id{$ek_id}){
	&K_READ("kuni_db","$ek_id","$ek_id");
		}
		if($k_kokusaku{$ek_id} eq "9"){
&ER1("$t_name[$dt_id]を支配下に置く国が国策：鎖国を敷いています。移転できません。");
		}
$itenmes = '賊砦移転';
	}else{
	if($k_kokko_sougaku{$fk_id} < 200000){
&ER1("国庫が不足しています。王都移転には金200000が必要です。");
	}
		if($t_kunino[$dt_id] ne $k_kunino{$fk_id}){
&ER1("移転先が自国ではありません。");
		}
$itenmes = '首都移転';
	}


$i = $p_kuni_yakusyoku{$f_id};
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);

	if($ntt5[$i] >$tt){
$wtt = $ntt5[$i] - $tt;
&ER1("残り$wtt秒間、天子への進言を実行できません。");
	}



##########
$a_a_d="iten_kuni<>0<>本拠を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転 <><>$f_id<><>$dt_id<><><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "本拠を$t_name[$k_outo{$fk_id}]から$t_name[$dt_id]に移転 を<br />アクティブコマンドとして予約しました。";

	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);
$a_a_hit=0;
	foreach (@no) {
$a_a_no=int($_);
		($acd_id{$facd_id}[$a_a_no],$acd_no{$facd_id}[$a_a_no],$acd_name{$facd_id}[$a_a_no],$acd_tt{$facd_id}[$a_a_no],$acd_p_id{$facd_id}[$a_a_no],$acd_e_id{$facd_id}[$a_a_no],$acd_sub1{$facd_id}[$a_a_no],$acd_sub2{$facd_id}[$a_a_no],$acd_sub3{$facd_id}[$a_a_no],$acd_sub4{$facd_id}[$a_a_no],$acd_sub5{$facd_id}[$a_a_no],$acd_sub6{$facd_id}[$a_a_no],$acd_sub7{$facd_id}[$a_a_no],$acd_sub8{$facd_id}[$a_a_no],$acd_sub9{$facd_id}[$a_a_no]) = split(/<>/,$CD_DB[$a_a_no]);
		if($acd_id{$facd_id}[$a_a_no] eq "sounyuu" and !$a_a_hit){
splice(@CD_DB , $add_no, 0, "$a_a_d");
$a_a_hit++;
		}
	}
		if(!$a_a_hit){
push(@CD_DB, "$a_a_d");
		}
	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
##########

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

	}
}
1;