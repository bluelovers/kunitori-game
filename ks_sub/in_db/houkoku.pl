
sub MOVE {

	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

#	if ($menck !~ /kts/) {
#	&ER1("メンテ中です。");
#	}



	&TT_GET;
	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";

<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"fs4\"><span class=\"kcc0\">　　　＜＜<strong> * $p_name{$f_id}専用・バグ報告フォーム * </strong>＞＞</span></span>
</td>
</tr>
</table>

<table width=\"500\"><tr>
<td class=\"txth\" width=\"25%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"houkoku\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"バグ報告フォーム\" />
</div></form></td>
<td class=\"txth\" width=\"25%\">
<form action=\"$URI_SP_D/support/$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".m.\" value=\"houkoku_bbs\" />
<input type=\"hidden\" name=\".ita.\" value=\"$menck-$f_id\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"submit\" value=\"バグ報告掲示板\" /></div></form>
</td>

</tr></table>


<table width=\"500\" class=\"bgc414141\"><tr><td width=\"96\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\">
<span class=\"cFFFFFF\">受付：ここでは専用フォームを使用し、バグ報告行うことができます。<br />利用規約をよく読んだ後、ご利用ください。
</td></tr></table>
<br />


<form action=\"$URI_SP_D/support/\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
PRI


print <<"PRI";
<input type=\"hidden\" name=\".m.\" value=\"houkoku2\" />

<table width=740 class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=190></td><td width=540></td></tr>
<tr><td class=\"txth\" class=\"bgcFFF8F0\" colspan=\"2\">報告内容（空欄可の項目を除き全て埋めてください）</td></tr>
<tr class=\"bgcF8F0E0\"><td>題名</td>
<td class=\"bgcFFF8F0\">
<input type=\"text\" name=\".houkokutaitoru.\" size=\"60\" value=\"バグ報告\" />
</td></tr>
<tr class=\"bgcF8F0E0\"><td>今プレイしている面</td>
<td class=\"bgcFFF8F0\"><input type=\"hidden\" name=\".houkokumen.\" value=\"$MEN_title\" />$MEN_TITLE</td></tr>

<tr class=\"bgcF8F0E0\"><td>所属国</td>
<td class=\"bgcFFF8F0\">

<input type=\"hidden\" name=\".houkokusyozoku.\" value=\"デフォNo$p_kunino{$f_id}・仮想No$k_kunino{$fk_id}・$k_name{$fk_id}\" />$k_name{$fk_id}
</td></tr>

<tr class=\"bgcF8F0E0\"><td>貴方のID/キャラネーム</td>
<td class=\"bgcFFF8F0\">
<input type=\"hidden\" name=\".houkokuid.\" value=\"$f_id・$kasouid・$p_name{$f_id}\" />デフォルト$f_id/仮想$kasouid/$p_name{$f_id}</td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作発生頻度</td>
<td class=\"bgcFFF8F0\">

<input type=\"radio\" name=\".houkokuhindo.\" value=\"常時\" />常時発生
<input type=\"radio\" name=\".houkokuhindo.\" value=\"頻繁\" />頻繁に発生
<input type=\"radio\" name=\".houkokuhindo.\" value=\"稀\" />稀に発生
<input type=\"radio\" name=\".houkokuhindo.\" value=\"複数回\" />複数回確認
<input type=\"radio\" name=\".houkokuhindo.\" value=\"二回\" />二回確認
<input type=\"radio\" name=\".houkokuhindo.\" value=\"初回\" />初めて確認
<input type=\"radio\" name=\".houkokuhindo.\" value=\"未確認\" />未確認<br />
<input type=\"radio\" name=\".houkokuhindo.\" value=\"その他\" />その他のお問い合わせ
</td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作発生面</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".houkokuhasseimen.\" size=\"60\" value=\"$MEN_TITLE\" /></td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作影響範囲</td>
<td class=\"bgcFFF8F0\">
<input type=\"radio\" name=\".houkokuhani.\" value=\"全鯖\" />全サーバー
<input type=\"radio\" name=\".houkokuhani.\" value=\"テスト鯖\" />テスト鯖全体
<input type=\"radio\" name=\".houkokuhani.\" value=\"国取鯖\" />国取鯖全体
<input type=\"radio\" name=\".houkokuhani.\" value=\"$MEN_TITLE\" />「誤動作発生面」の項目で記載した面<br />
<input type=\"radio\" name=\".houkokuhani.\" value=\"その他\" />その他のお問い合わせ
</td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作キャラのデフォルトID</td>
<td class=\"bgcFFF8F0\">
<input type=\"text\" name=\".houkokuhasseikid.\" size=\"60\" value=\"$f_id\" /></td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作が発生した国の名称</td>
<td class=\"bgcFFF8F0\">
<input id=situ type=\"radio\" name=\".houkokuhasseikcon.\" value=\"\" /><label for=\"situ\"><input id=\"sitw\" type=\"text\" name=\".houkokukuni.\" size=\"22\" maxlength=\"255\" value=\"\" />←現在の所属国でない場合</LABEL> 
<input id=\"sitw\" type=\"radio\" name=\".houkokuhasseikcon.\" value=\"デフォNo$p_kunino{$f_id}・仮想No$k_kunino{$fk_id}・$k_name{$fk_id}\" /><LABEL FOR=\"sitw\">$k_name{$fk_id}</LABEL></td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作に関連する相手キャラのID</td>
<td class=\"bgcFFF8F0\">
<input type=\"text\" name=\".houkokuhasseieid.\" size=\"60\" value=\"\" />（空欄可）</td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作に関連する相手国の名称</td>
<td class=\"bgcFFF8F0\">
<input type=\"text\" name=\".houkokuhasseiecon.\" size=\"60\" value=\"\" />（空欄可）</td></tr>

<tr class=\"bgcF8F0E0\"><td>発生原因と思われる直前の操作</td>
<td class=\"bgcFFF8F0\">
<textarea name=\".houkokuinsgenninn.\" cols=\"60\" rows=\"5\"></textarea>
</td></tr>

<tr class=\"bgcF8F0E0\"><td>直前の各種ログ</td>
<td class=\"bgcFFF8F0\">
<textarea name=\".houkokuinslog.\" cols=\"60\" rows=\"5\"></textarea>
</td></tr>

<tr class=\"bgcF8F0E0\"><td>誤動作の詳しい内容</td>
<td class=\"bgcFFF8F0\">
<textarea name=\".houkokuinsgodousa.\" cols=\"60\" rows=\"5\"></textarea>
</td></tr>

<tr class=\"bgcF8F0E0\"><td>発生日時</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".houkokunitiji.\" size=\"60\" value=\"$tt_date\" />
</td></tr>

<tr class=\"bgcF8F0E0\"><td>その他・お問い合わせ内容</td>
<td class=\"bgcFFF8F0\">
<textarea name=\".houkokuinssonota.\" cols=\"60\" rows=\"5\"></textarea><br />（空欄可）
</td></tr>

<tr class=\"bgcF8F0E0\"><td>メールアドレス</td>
<td class=\"bgcFFF8F0\"><input type=\"text\" name=\".houkokumail.\" size=\"60\" value=\"\" />（空欄可）<br />返信しないケースが殆どです。必要がある人のみ記入してください。
</td></tr>


</table>
<a href=\"http://plaza.rakuten.co.jp/miraisu/\" target=\"setumei\">お知らせ</a>は読みましたか？<br />最新情報が記載されている場合がありますので報告前に一度ご確認下さい。<br /><br />
無償でのデータの修復に関する問い合わせ、ゲーム内の仕様に関する質問は基本的に禁じられています。
<br />費やせる時間には限りがありますので、ご理解のほどをよろしくお願いします。
<br />
<br />また、現在のプレイデータは将来的にリセットする可能性があります。（β版へ移行する2010年あたりを予定）
<br />その辺を踏まえた上でプレイしてくださるようお願いします。
<br /><br />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".ita.\" value=\"$menck-$f_id\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"submit\" value=\"同意した上で送信\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;