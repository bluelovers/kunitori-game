
sub MOVE {
#$doc_mode = "x";
	&HEADER;
	print <<"PRI";

<table width=\"780\"><tr><td width=\"640\">
<iframe title=\"\" src=\"./meisyou.html\" name=\"_en\" width=\"640\" height=\"500\" frameborder=\"0\">
インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./meisyou.html\" target=\"_en\">入り口</a>
</iframe> </td><td class=\"valignt\" width=135>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>《  名将一覧  》<br />
<input type=\"submit\" value=\"ログイン画面へ\"></div></form>
<br />
<pre>
<a href=\"./meisyou.html#1\" target=\"_en\" title=\"全ランキングのTOP。\">大陸の覇者</a>

<a href=\"./meisyou.html#2\" target=\"_en\" title=\"三種総合ランクのベスト10。\">覇王ランク</a>
<a href=\"./meisyou.html#3\" target=\"_en\" title=\"武力ランクのベスト10。\">武力ランク</a>
<a href=\"./meisyou.html#4\" target=\"_en\" title=\"知力ランクのベスト10。\">知力ランク</a>
<a href=\"./meisyou.html#5\" target=\"_en\" title=\"統率ランクのベスト10。\">統率ランク</a>

<a href=\"./meisyou.html#6\" target=\"_en\" title=\"十種総合ランクのベスト10。\">鬼才ランク</a>
<a href=\"./meisyou.html#7\" target=\"_en\" title=\"騎乗ランクのベスト10。\">騎乗ランク</a>
<a href=\"./meisyou.html#8\" target=\"_en\" title=\"射撃ランクのベスト10。\">射撃ランク</a>
<a href=\"./meisyou.html#9\" target=\"_en\" title=\"政治ランクのベスト10。\">武術ランク</a>
<a href=\"./meisyou.html#10\" target=\"_en\" title=\"呪術ランクのベスト10。\">呪術ランク</a>
<a href=\"./meisyou.html#11\" target=\"_en\" title=\"諜報ランクのベスト10。\">諜報ランク</a>
<a href=\"./meisyou.html#12\" target=\"_en\" title=\"重機ランクのベスト10。\">重機ランク</a>
<a href=\"./meisyou.html#13\" target=\"_en\" title=\"調教ランクのベスト10。\">調教ランク</a>
<a href=\"./meisyou.html#14\" target=\"_en\" title=\"人望ランクのベスト10。\">人望ランク</a>
<a href=\"./meisyou.html#15\" target=\"_en\" title=\"政治ランクのベスト10。\">政治ランク</a>
<a href=\"./meisyou.html#16\" target=\"_en\" title=\"商才ランクのベスト10。\">商才ランク</a>

<a href=\"./meisyou.html#17\" target=\"_en\" title=\"火行ランクのベスト10。\">火行ランク</a>
<a href=\"./meisyou.html#18\" target=\"_en\" title=\"水行ランクのベスト10。\">水行ランク</a>
<a href=\"./meisyou.html#19\" target=\"_en\" title=\"木行ランクのベスト10。\">木行ランク</a>
<a href=\"./meisyou.html#20\" target=\"_en\" title=\"金行ランクのベスト10。\">金行ランク</a>
<a href=\"./meisyou.html#21\" target=\"_en\" title=\"土行ランクのベスト10。\">土行ランク</a>
<a href=\"./meisyou.html#22\" target=\"_en\" title=\"律師ランクのベスト10。\">律師ランク</a>
<a href=\"./meisyou.html#23\" target=\"_en\" title=\"無頼ランクのベスト10。\">無頼ランク</a>
<a href=\"./meisyou.html#24\" target=\"_en\" title=\"光属性ランクのベスト10。\">光属性ランク</a>
<a href=\"./meisyou.html#25\" target=\"_en\" title=\"闇属性ランクのベスト10。\">闇属性ランク</a>

<a href=\"./meisyou.html#26\" target=\"_en\" title=\"撃破ランクのベスト10。\">撃破ランク</a>
<a href=\"./meisyou.html#27\" target=\"_en\" title=\"総資産ランクのベスト10。\">富豪ランク</a>
<a href=\"./meisyou.html#28\" target=\"_en\" title=\"名声ランクのベスト10。\">名声ランク</a>
<a href=\"./meisyou.html#29\" target=\"_en\" title=\"義理ランクのベスト10。\">義理ランク</a>
</pre>


</td></tr>
</table>

</div></body>
</html>

PRI
	exit;
}
1;