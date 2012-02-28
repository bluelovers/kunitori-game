
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
	
		$adcome_add{''} = "このサーバーはユーザーサイドアフィリエイトNGです。<br />広告の設定を行うことはできません。";
		$adcome_add{'0'} = "このサーバーはユーザーサイドアフィリエイトNGです。<br />広告の設定を行うことはできません。";
		$adcome_add{'1'} = "このサーバーはユーザーサイドアフィリエイトOKです。<br />アフリエイトIDがあれば、自己PRやOPT等で貴方専用の広告を掲載できます。";
		$adcome_add{'2'} = "このサーバーはユーザーサイドアフィリエイトOKです。<br />アフリエイトIDがあれば、自己PRやOPT等で貴方専用の広告を掲載できます。<br />当サーバーでは、ユーザー側の設定のない時は運営側の広告が出ます。";

	$no1 = "11111";
	$no2 = "11112";
	$no3 = "11113";
	$no4 = "11114";
	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);

	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);

	$kstool_w{$ad_w_op_0} = <<"PRI";
<tr class=\"bgcF8F0E0\"><td>ログイン</td>
<td class=\"bgcFFF8F0\">
<form action=\"http://$URI_SP_D_TOOL/tools/\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$ad_w_op_1\" />
PASS<input type=\"password\" size=\"8\" name=\".pass.\" /><br />
<input type=\"hidden\" name=\".saba_id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".saba_pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"submit\" value=\"ログイン\" /></div></form><br />・IDは<a href=\"http://$URI_SP_D_TOOL/tools/?.i.=$in{'i'}&amp;.m.=p_b&amp;.id.=$ad_w_op_0\">$ad_w_op_2</a>と関連付けられています。国取ツール専用のPassを入力して下さい。</td></tr>
PRI
	$kstool_w{""} = <<"PRI";
<tr class=\"bgcF8F0E0\"><td>新規登録</td>
<td class=\"bgcFFF8F0\">
<form action=\"http://$URI_SP_D_TOOL/tools/\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"kuni_entry\" />
<input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".saba_id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".saba_pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"submit\" value=\"新規登録\" /></div></form><br />・国取ツールの利用開始時はここから登録。初回のみでOK。<br />メールアドレスなどの個人情報不要＆利用料無料。<br />登録時に自動的に関連付け設定も行われます。</td></tr>

PRI
	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
$khsn4 =~ s/<br $TAG_s0>/\n/g;
$khsnp =~ s/<br $TAG_s0>/\n/g;
$hsk =~ s/<br $TAG_s0>/\n/g;
	print <<"PRI";
$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 広告/OPT編集 》
<br /><br />

ここではプロフィール画面で表示\される広告の設定や<br />オプションツールの設定を編集できます。<br />$adcome_add{$ad_settei_1}</span>
</td></tr></table>
PRI

$ad_w_cm_0 = int($ad_w_cm_0);
$ad_w_cm_2 = int($ad_w_cm_2);

${"adt$ad_w_cm_0"} = " selected=\"selected\"";
${"adc$ad_w_cm_2"} = " selected=\"selected\"";
print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"130\"></td><td width=\"560\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />広告設定編集（アフリエイト広告を張って稼ぎながらゲームを楽しめます）<input type=\"hidden\" name=\".m.\" value=\"adcome2\" utn=\"utn\"></td></tr>
<tr class=\"bgcF8F0E0\"><td>広告媒体</td>
<td class=\"bgcFFF8F0\">
<select name=\".ad_w_cm_0.\">
<option value=\"0\"${"adt0"}>広告設定なし</option>
<option value=\"1\"${"adt1"}>Google AdSense自動(-2007)</option>
<option value=\"2\"${"adt2"}>Google AdSense紹介スロット式(2008-)</option>
<option value=\"3\"${"adt3"}>Google AdSense自動スロット式(2008-)</option>
</select>
<br />・Google AdSense、に対応。<br />アフィリエイトIDを持ってない人は<a href="http://kunitori.com/html/ad.html" target=\"setumei\">こちら</a>の解説を参考にして登録して見てください。
</td></tr>
<tr class=\"bgcF8F0E0\"><td>アフリエイト用ID</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".ad_w_cm_1.\" size=\"60\" value=\"$ad_w_cm_1\" /><br />広告用のアカウントIDを入力してください。

</td></tr>

<tr class=\"bgcF8F0E0\"><td>広告コード</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".ad_w_cm_4.\" size=\"30\" value=\"$ad_w_cm_4\" /><br />・Google AdSense紹介プログラムコード。(google_cpa_choice)468×60限定。<br />（Google AdSense自動の時は設定不要）<br />※2008よりの新書式では、スロット入力の方はこの欄は空欄でもOKになっています。</td></tr>

<tr class=\"bgcF8F0E0\"><td>広告スロット</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".ad_w_cm_5.\" size=\"30\" value=\"$ad_w_cm_5\" /><br />・Google AdSense広告スロット。(google_ad_slot)<br />（Google AdSense自動の時は設定不要）<br />※チャンネルでの区分けなどを使う方はスロット式をご利用ください。</td></tr>

<tr class=\"bgcF8F0E0\"><td>広告作成日</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".ad_w_cm_6.\" size=\"30\" value=\"$ad_w_cm_6\" /><br />・Google AdSense作成日記述。(例→/* 468x60, 作成済み 08/03/01 */)<br />（Google AdSense自動の時は設定不要）</td></tr>

</table>
<input type=\"submit\" value=\"設定\" /></div></form>


<table width=\"700\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"130\"></td><td width=\"560\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">無料レンタルオプション/国取ツール（順次機能追加中）<br /><br />オプションツールは国取物語中央サーバーで管理しています。<br />国取ツール各種は利用料無料＆ユーザーサイドアフィリエイトに対応。<br />掲示板、動画投稿、ディレクトリリンク集など役立つ機能満載</td></tr>

$kstool_w{$ad_w_op_0}
<tr class=\"bgcF8F0E0\"><td>関連付け</td>
<td class=\"bgcFFF8F0\">
<form action=\"http://$URI_SP_D_TOOL/tools/\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"tl_e_t2\" />
<input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
ID<input type=\"text\" size=\"8\" name=\".id.\" value=\"\" /><br />
PASS<input type=\"password\" size=\"8\" name=\".pass.\" /><br />
<input type=\"hidden\" name=\".saba_id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".saba_pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"submit\" value=\"関連付け\" /></div></form><br />・国取ツールのIDを持ってる人限定。<br />プロフィール画面に国取ツールへのリンクを加えることができます。<br />また国取ツール内からワンタッチで各サーバーへログインできるようになります。</td></tr>

</table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;