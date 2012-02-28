
sub MOVE {
#$doc_mode = "x";
	&HEADER_IF;
	print <<"PRI";

<table width=\"780\"><tr><td width=\"615\">
<iframe title=\"\" src=\"./?.m.=entry\" name=\"_en\" width=\"615\" height=\"550\" frameborder=\"0\" border=\"0\">
<ilayer src=\"./?.m.=entry\" name=\"_en\" width=\"615\" height=\"550\" frameborder=\"0\" border=\"0\">インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./?.m.=entry\" target=\"_en\">入り口</a>
</ilayer> 
</iframe> </td><td width=\"160\">《 新規登録 》<br /><br />
必要事項を全て埋め、<br />
最下段にある《 登録 》<br />
ボタンを押して下さい。<br />
<pre>
<a href=\"./?.m.=entry#1\" target=\"_en\">基本事項</a>

<a href=\"./?.m.=entry#2\" target=\"_en\">キャラ設定</a>

<a href=\"./?.m.=entry#3\" target=\"_en\">個性形成</a>

<a href=\"./?.m.=entry#4\" target=\"_en\">各国の勧誘文</a>

<a href=\"./?.m.=entry#5\" target=\"_en\">初期位置</a>

<a href=\"./?.m.=entry#6\" target=\"_en\">建国</a>


<a href=\"./?.m.=entry#7\" target=\"_en\">登録</a>


<a href=\"$URI/\" target=\"_top\">ログイン画面へ</a>
</pre>
</td></tr>
</table>

</div></body>
</html>

PRI
	exit;
}
1;
