
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

	open(IN,"./pr/b/$f_id.cgi");
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

	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
$khsn4 =~ s/<br $TAG_s0>/\n/g;
$khsnp =~ s/<br $TAG_s0>/\n/g;
$hsk =~ s/<br $TAG_s0>/\n/g;
	print <<"PRI";
$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 自己PR編集 》
<br /><br />
<br /><br />
ここではプロフィール画面で表示\される自己PR文を編集できます。</span>
</td></tr></table>
PRI


print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"130\"></td><td width=\"560\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />自己PR編集<input type=\"hidden\" name=\".m.\" value=\"bcome2\" utn=\"utn\"></td></tr>
<tr class=\"bgcF8F0E0\"><td>ホームページアドレス</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hk.\" size=\"60\" value=\"$hk\" /><br />・自分のホームページの宣伝。商用サイトや他人のサイトの宣伝は×。<br />（規約違反の場合ID削除します）[半角小文字で６０文字以内]
</td></tr>
<tr class=\"bgcF8F0E0\"><td>公開用メールアドレス</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hy.\" size=\"60\" value=\"$hy\" /><br />・公開用メールアドレス欄。嫌がらせが無きにしも非ずなのでフリーのメルアドの使用を推薦。<br /> [半角小文字で４０文字以内]

</td></tr>

<tr class=\"bgcF8F0E0\"><td>ICQ番号</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hc.\" size=\"60\" value=\"$hc\" /><br />・ICQ番号を記入できます。[半角小文字で２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>所属IRCチャンネル</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hi.\" size=\"60\" value=\"$hi\" /><br />・常駐しているお気に入りIRCチャンネルがあればここに。[全角大文字で２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>職業</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h1.\" size=\"30\" value=\"$h1\" /><br />・リアルの職業記入欄。真面目に書かずに面白おかしく書くのもOK。[全角大文字で１～１０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>住所</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h2.\" size=\"30\" value=\"$h2\" /><br />・都道府県単位でお願いします。[全角大文字で１０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>年齢</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".h3.\" size=\"4\" value=\"$h3\" /><br />・貴方のリアル年齢の記入欄。[全角大文字で２文字以内]</td></tr>


<tr class=\"bgcF8F0E0\"><td>性別</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hyj.\" size=\"4\" value=\"$hyj\" /><br />・貴方のリアル性別記入欄。男か女かで。[全角大文字で２文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>趣味</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsj.\" size=\"60\" value=\"$hsj\" /><br />・趣味の記入欄。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>特技</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hgj.\" size=\"60\" value=\"$hgj\" /><br />・特技の記入欄。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>好きな物</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".htr.\" size=\"60\" value=\"$htr\" /><br />・好きな物。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>嫌いな物</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hmg.\" size=\"60\" value=\"$hmg\" /><br />・嫌いな物。[全角大文字で１～２０文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>自己PR文</td>
<td class=\"bgcFFF8F0\"><textarea rows=\"5\" cols=\"70\" name=\".insjikopr.\">$hsk</textarea><br />・自己PR文。[全角大文字で５００文字以内]</td></tr>

<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">キャラPR編集</td></tr>
<tr class=\"bgcF8F0E0\"><td>キャラ年齢</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsn1.\" size=\"3\" value=\"$khsn1\" /><br />・キャラクターの年齢。[半角小文字で3文字以内]</td></tr>

<tr class=\"bgcF8F0E0\"><td>キャラ性別</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsn2.\" size=\"2\" value=\"$khsn2\" /><br />・キャラクターの性別。[全角大文字で１文字以内]</td></tr>
<tr class=\"bgcF8F0E0\"><td>キャラ特技</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".hsn3.\" size=\"60\" value=\"$khsn3\" /><br />・キャラクターの特技。[全角大文字で１～３０文字以内]</td></tr>
<tr class=\"bgcF8F0E0\"><td>キャラ背景</td>
<td class=\"bgcFFF8F0\"><textarea rows=\"5\" cols=\"70\" name=\".inshaikei.\" />$khsn4</textarea><br />・キャラクターの背景。[全角大文字で１～５００文字以内]</td></tr>
<tr class=\"bgcF8F0E0\"><td>キャラ紹介文</td>
<td class=\"bgcFFF8F0\"><textarea rows=\"5\" cols=\"70\" name=\".inskyarapr.\" />$khsnp</textarea><br />・キャラクターの紹介文。[全角大文字で１～５００文字以内]</td></tr>


</table>
<input type=\"submit\" value=\"設定\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;