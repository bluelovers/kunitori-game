
sub MOVE {

	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	
	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}


	$no1 = "11111";
	$no2 = "11112";
	$no3 = "11113";
	$no4 = "11114";

	open(IN,"./p_db/co/$f_id.cgi");
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

	if($kf12 ne "$f_id$no1") { $no1c = "（不在）"; }
	if($kf13 ne "$f_id$no2") { $no2c = "（不在）"; }
	if($kf14 ne "$f_id$no3") { $no3c = "（不在）"; }
	if($kf15 ne "$f_id$no4") { $no4c = "（不在）"; }
$jyuu[0] = '（不在）';
$jyuu[1] = '白虎';
$jyuu[2] = '玄武';
$jyuu[3] = '青龍';
$jyuu[4] = '朱雀';
	if($p_pet_type{$f_id}[0] eq "") { $p_pet_type{$f_id}[0] = int($kf16); }
$nopc = $jyuu[$p_pet_type{$f_id}[0]];

	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 コメント 》
<br /><br />
<br /><br />
ここでは戦争時の各種コメントを編集できます。</span>
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
PRI


print <<"PRI";
<input type=\"hidden\" name=\".m.\" value=\"come2\" />

<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"130\"></td><td width=\"560\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">コメント編集</td></tr>
<tr class=\"bgcF8F0E0\"><td>開戦時台詞（野戦）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hk.\" size=\"60\" value=\"$hk\" /><br />・敵部隊とまみえた時に言う台詞です。[全角大文字で１～２０文字以内]</td></tr>
<tr class=\"bgcF8F0E0\"><td>勝利コメント（野戦）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hy.\" size=\"60\" value=\"$hy\" /><br />・敵部隊を蹴散らした時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>クリティカル</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hc.\" size=\"60\" value=\"$hc\" /><br />・クリティカル発生時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>勝利コメント（一騎）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hi.\" size=\"60\" value=\"$hi\" /><br />・一騎打ち勝利時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>必殺技（壱合目）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h1.\" size=\"60\" value=\"$h1\" /><br />・必殺技時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>必殺技（弐合目）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h2.\" size=\"60\" value=\"$h2\" /><br />・必殺技時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>必殺技（参合目）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h3.\" size=\"60\" value=\"$h3\" /><br />・必殺技時のコメントです。[全角大文字で１～２０文字以内]</td></tr>


<tr class=\"bgcF8F0E0\"><td>妖術</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hyj.\" size=\"60\" value=\"$hyj\" /><br />・妖術使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>仙術</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsj.\" size=\"60\" value=\"$hsj\" /><br />・仙術使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>幻術</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hgj.\" size=\"60\" value=\"$hgj\" /><br />・幻術使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>治療</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".htr.\" size=\"60\" value=\"$htr\" /><br />・治療使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>召喚</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hmg.\" size=\"60\" value=\"$hmg\" /><br />・召喚使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>士気上昇</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsk.\" size=\"60\" value=\"$hsk\" /><br />・士気上昇使用時のコメントです。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>愛馬（又は乗物）</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsn1.\" size=\"30\" value=\"$khsn1\" /><br />・愛馬（又は乗物）の名前。[全角大文字で１～１０文字以内]</td></tr>


<tr class=\"bgcF8F0E0\"><td>神獣$nopc</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsnp.\" size=\"30\" value=\"$khsnp\" /><br />・神獣の名前。[全角大文字で１～１０文字以内]</td></tr>


</table>
<input type=\"submit\" value=\"設定\" /></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></form>

PRI

	&FOOTER;

	exit;

}
1;