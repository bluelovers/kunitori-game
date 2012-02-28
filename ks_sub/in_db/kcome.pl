
sub MOVE {

	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	

require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;
	if($k_yakusyoku_id{$fk_id}[25] ne $f_id and $k_yakusyoku_id{$fk_id}[1] ne $f_id and $k_yakusyoku_id{$fk_id}[2] ne $f_id and $k_yakusyoku_id{$fk_id}[3] ne $f_id and $k_yakusyoku_id{$fk_id}[16] ne $f_id and $k_yakusyoku_id{$fk_id}[17] ne $f_id and $k_yakusyoku_id{$fk_id}[18] ne $f_id){&ER1("${$zokukanbuptn}[25]か上公か三孤でなければ実行できません。");}


	$no1 = "11111";
	$no2 = "11112";
	$no3 = "11113";
	$no4 = "11114";

	open(IN,"./pr/k/$p_kunino{$f_id}.cgi");
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
	if($kf16 eq "1") { $nopc = "（白虎）";}elsif($kf16 eq "2"){ $nopc = "（玄武）";}elsif($kf16 eq "3"){ $nopc = "（青龍）";}elsif($kf16 eq "4"){ $nopc = "（朱雀）";}else{ $nopc = "（不在）";}

	&HEADER;

$hmg =~ s/<br $TAG_s0>/\n/g;
$hsk =~ s/<br $TAG_s0>/\n/g;
	&IMG_SAKUSEI("$IMG{0}/sansyou3$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";


<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">
《 国PR 》<br /><br />
<br /><br />
国のPR文を編集できます。
</td></tr></table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
PRI


print <<"PRI";
<input type=\"hidden\" name=\".m.\" value=\"kcome2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"130\"></td><td width=\"560\"></td></tr>
<tr><td class=\"txth\" class=\"bgcFFF8F0\" colspan=\"2\">国PR編集</td></tr>
<tr class=\"bgcF8F0E0\"><td>関連URL</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hgj.\" size=\"60\" value=\"$hgj\" /><br />・関連ホームページアドレス。[半角小文字で６０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>IRC</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".htr.\" size=\"60\" value=\"$htr\" /><br />・専用IRCチャンネル。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>特典</td>
<td class=\"bgcFFF8F0\"><textarea rows="5" cols="70" name=".instokuten.">$hmg</textarea><br />・仕官時の特典。[全角大文字で５００文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>PR</td>
<td class=\"bgcFFF8F0\"><textarea rows="5" cols="70" name=".inskunipr.">$hsk</textarea><br />・宣伝PR文。[全角大文字で５００文字以内]</td></tr>

<tr><td class=\"txth\" class=\"bgcFFF8F0\" colspan=\"2\">登用文編集</td></tr>
<tr class=\"bgcF8F0E0\"><td>天子よりの登用文</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsj.\" size=\"60\" value=\"$hsj\" /><br />・敵国を滅ぼした時に自動的に送付されます。[全角１００文字以内]<br />（送付したくない場合は空欄にしてください）</td></tr>


</table>
<input type=\"submit\" value=\"設定\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"中書省へ戻る\" />
</div></form>

PRI

	&FOOTER;

	exit;

}
1;