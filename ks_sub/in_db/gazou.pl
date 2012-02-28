
sub MOVE {


	if($in{'icon'} eq "") { 

	&P_OPEN;
$p_img{$f_id} =~ s/&#47;/\//g;
$p_img{$f_id} =~ s/&#46;/\./g;
		if($in{'icon_saba'} eq ""){
$in{'icon_saba'} = 0;
		}
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

$add_saba_sel[$in{'icon_saba'}] = " selected=\"selected\"";

$datev2cgl.="sitem = [";
$datev2cgs.="litem = [";
foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}


foreach (@add_img){
$add_g_saba_l.="<option value=$_$add_saba_sel[$_]>$IMG_SABA_NAME{$_}</option>";
$datev2cgl.="	[";
$datev2cgs.="	[";
	foreach (0..$KYARA_IMG_MAX{$_}){
$datev2cgl.="$_,";
$datev2cgs.="'イメージ\[$_\]',";
$IMAGEKAZU ++;
	}
	chop($datev2cgl);
$datev2cgl.="],";
	chop($datev2cgs);
$datev2cgs.="],";
$datev2saba.="saba[$_]='$IMG{$_}/';saba_f[$_]='$p_img_kakutyou{$_}';";
}
	chop($datev2cgl);
$datev2cgl.="];";
	chop($datev2cgs);
$datev2cgs.="];";

$IMAGEKAZU -= int($KYARA_IMG_MAX{$KYARA_IMG_SABA_D} + 1);

$datev4.="saba_i=0;saba=new Array();saba_f=new Array();$datev2saba$datev2cgl$datev2cgs durlw='$p_img{$f_id}$p_img_f{$f_id}';add_s();";
	&HEADER;

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
	print <<"PRI";

<a id=\"t\"></a>
<table width==\"100%=\">
<tr>
<td class=\"kbgcb0\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * キャラ画像を変更 *</strong>＞＞</span>（設定画面を正しく表示\するにはjavascriptオン必須）</span>
</td>
</tr>
</table>
$come_cdl
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gazou\" />
<input type=\"submit\" value=\"リロード\" />
</div></form>

<form action=\"$COMMAND\" method=\"post\" name=entry utn=\"utn\"><div>

<table class=\"bgc884422\" border=\"2\" width=\"600\">
<tr class=\"bgcFFF0F5\"><td width=\"120\"></td><td width=\"100\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txtc\" colspan=\"3\">キャラ画像を変更</td></tr>

<tr><td class=\"bgc000000\">

<img src=\"$p_img{$f_id}$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img\" id=\"Img\" />
</td><td class=\"bgcFFF8F0\">
<select name=\".icon.\" onChange=\"cgimgno(this);\" size=\"20\">
PRI
$p_cgno_d{$f_id} = int($p_cgno_d{$f_id});
	foreach (0..$KYARA_IMG_MAX{$in{'icon_saba'}}){
	if($p_cgno_d{$f_id} eq "$_"){
print "<option value=\"$p_cgno_d{$f_id}\" selected=\"selected\">イメージ[$p_cgno_d{$f_id}]</option>\n";
	}else{
print "<option value=\"$_\">イメージ[$_]</option>\n";
	}
	}


print <<"PRI";
</select></td><td class=\"bgcFFF8F0\">・武将のイメージを選択してください。
<br />・全部で$IMAGEKAZU種類<br /><br />・<a href=\"./?.m.=egazou\" target=\"_blank\">
<span class=\"cFF0000\">イメージ一覧</span></a><br /><select name=\".icon_saba.\" onChange=\"cgimgsaba(this);\">$add_g_saba_l</select>
<br /><br />現在一つの画像鯖しか設置されてませんが、<br />
プログラム的には外部の画像鯖との連動が可能です。<br />
簡単な配置により感情表現分岐にも対応できます。<br />
んでも肝心の絵が足りないので今のところ無意味です。<br />
</td></tr>
<tr class=\"bgcFFF8F0\"><td class=\"txtc\" colspan=\"3\">
<input type=\"hidden\" name=\".m.\" value=\"gazou\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<input type=\"submit\" value=\"キャラ画像を変更\" /><br />
</td></tr></table></div></form>


<form action=\"$URI_SP_D/support/$COMMAND\" method=\"post\" name=\"glink\" id=\"glink\" utn=\"utn\"><div>

<table class=\"bgc884422\" border=\"2\" width=\"600\">
<tr class=\"bgcFFF0F5\"><td class=\"txtc\" colspan=\"5\">キャラ画像を自作画像に変更</td></tr>
<tr class=\"bgc000000\"><td width=\"120\" rowspan=\"2\" class=\"txtc\"><img src=\"$p_img{$f_id}$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_d\" id=\"Imgd\" /></td><td class=\"bgcFFF8F0\" colspan=\"4\">
・自作画像を使用する際は下記にアドレスを入力してください。<br />
デフォルト画像URL<input type=\"text\" name=\".icon.\" size=\"65\" onChange=\"cgimgurl(this,'d');\" value=\"$p_img{$f_id}$p_img_f{$f_id}\" /></td></tr>
<tr class=\"bgcFFF8F0\"><td colspan=\"2\">
リンク可能条件<br />
※画像サイズ96×96ピクセル<br />
※容量200kbit以下<br />
※gif png jpeg jpg形式限定<br />
※【広告/OPT設定】の<a href=\"$URI_SP_D_TOOL/tools/\" target=\"_blank\">国取ツール</a>内<a href=\"http://multi-thread.net/\" target=\"_blank\">マルチ BBS</a>に自作画像を置くことができます。(new)
</td><td colspan=\"2\">・お勧め画像作成サイト<br /><br /><a href=\"http://www.moeruavatar.com/\" target=\"_blank\">萌える！アバターメーカー</a>
<br /><a href=\"http://illustmaker.abi-station.com/\" target=\"_blank\">似顔絵イラストメーカー</a>
</td></tr>

<tr class=\"bgcFFF8F0\"><td class=\"txtc\" colspan=\"5\"><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<div class=\"txtl\"><pre>

$GAME_TITLE画像リンク機能利用規約
※無関係なサイトの画像を無断転載すると、著作権法に違反する恐れがありますので、ご注意下さい。
※画像を掲載しているリンク先のサイト管理者は、$GAME_TITLEID使用者本人でなければなりません。
※当機能を利用したことにより生じる全ての責任は、ユーザー側に帰すものとします。</pre>
<input type=\"submit\" value=\"上記規約に同意し、画像設定を行う\" /></div><br />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".ita.\" value=\"$menck-$f_id\">
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" /><input type=\"hidden\" name=\".m.\" value=\"gazouc\" /></td></tr>


<tr class=\"bgcFFF0F5\"><td class=\"txtc\" colspan=\"5\">拡張設定</td></tr>
<tr class=\"bgcFFF8F0\"><td class=\"txtc\" colspan=\"5\"><table><tr><td><pre>

拡張設定の使い方
<input type=\"hidden\" name=\".dummy1.\" value=\"\" />
・拡張画像を設置する場合は、必ずデフォルト画像を設置した同じディレクトリに設置してください。
※１,現在の設定での例 ⇒ <input type=\"text\" name=\"glc1\" size=\"80\" class=\"gazoui\" />

・拡張画像の名称は、デフォルト画像のファイル名の末尾に文字列を付け加えた物のみ使用できます。
※２,現在の設定での例 ⇒ <input type=\"text\" name=\"glc2\" size=\"80\" class=\"gazoui\" />

・拡張画像の拡張子（gif,png,jpg等）は、デフォルト画像と同じ形式のみ使用できます。
※３,現在の設定での例 ⇒ <input type=\"text\" name=\"glc3\" size=\"80\" class=\"gazoui\" />
<input type=\"hidden\" name=\".dummy2.\" value=\"\" />
拡張画像を上記ガイドライン通りに自分のサイトに設置し終えたら、設置した拡張画像ファイル名を
デフォルト画像ファイル名と比較して、？（※２）の部分に該当する部分を下記の入力フォームに
記入してください。設定を行うことで、場面毎に画像を使い分けることが出来るようになります。
最後に上のテーブルにある「上記規約に同意し、画像設定を行う」ボタンを押せば設定完了\です。
</pre></td></tr>
</table></td></tr>
<tr class=\"bgc000000\">
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_0\" id=\"Img_0\" />
<br /><span class=\"cFFFFFF\">コミュニティ画面</span><br /><input type=\"text\" name=\".icon_0.\" size=\"12\" onChange=\"cgimgurlop(this,0);\" value=\"$p_cgno{$f_id}[0]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[1]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_1\" id=\"Img_1\" /><br /><span class=\"cFFFFFF\">戦闘開始</span><br /><input type=\"text\" name=\".icon_1.\" size=\"12\" onChange=\"cgimgurlop(this,1);\" value=\"$p_cgno{$f_id}[1]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[2]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_2\" id=\"Img_2\" /><br /><span class=\"cFFFFFF\">戦闘中</span><br /><input type=\"text\" name=\".icon_2.\" size=\"12\" onChange=\"cgimgurlop(this,2);\" value=\"$p_cgno{$f_id}[2]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[3]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_3\" id=\"Img_3\" /><br /><span class=\"cFFFFFF\">勝利時</span><br /><input type=\"text\" name=\".icon_3.\" size=\"12\" onChange=\"cgimgurlop(this,3);\" value=\"$p_cgno{$f_id}[3]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[4]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_4\" id=\"Img_4\" /><br /><span class=\"cFFFFFF\">敗北時</span><br /><input type=\"text\" name=\".icon_4.\" size=\"12\" onChange=\"cgimgurlop(this,4);\" value=\"$p_cgno{$f_id}[4]\" /></td>
</tr>

<tr class=\"bgc000000\">
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[5]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_5\" id=\"Img_5\" /><br /><span class=\"cFFFFFF\">混乱時</span><br /><input type=\"text\" name=\".icon_5.\" size=\"12\" onChange=\"cgimgurlop(this,5);\" value=\"$p_cgno{$f_id}[5]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[6]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_6\" id=\"Img_6\" /><br /><span class=\"cFFFFFF\">炎上時</span><br /><input type=\"text\" name=\".icon_6.\" size=\"12\" onChange=\"cgimgurlop(this,6);\" value=\"$p_cgno{$f_id}[6]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[7]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_7\" id=\"Img_7\" /><br /><span class=\"cFFFFFF\">毒状態</span><br /><input type=\"text\" name=\".icon_7.\" size=\"12\" onChange=\"cgimgurlop(this,7);\" value=\"$p_cgno{$f_id}[7]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[8]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_8\" id=\"Img_8\" /><br /><span class=\"cFFFFFF\">石化</span><br /><input type=\"text\" name=\".icon_8.\" size=\"12\" onChange=\"cgimgurlop(this,8);\" value=\"$p_cgno{$f_id}[8]\" /></td>
<td class=\"txtc\" width=\"120\"><img src=\"$p_img{$f_id}$p_cgno{$f_id}[9]$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img_9\" id=\"Img_9\" /><br /><span class=\"cFFFFFF\">未定</span><br /><input type=\"text\" name=\".icon_9.\" size=\"12\" onChange=\"cgimgurlop(this,9);\" value=\"$p_cgno{$f_id}[9]\" /></td>
</tr>


</table></div></form>
<br /><br /><table width=\"600\"><tr><td><pre>自作画像を設置するサーバーを探す際は、下記のサイトが参考になります。
・<a href=\"http://www.kooss.com/hp/\" target=\"_blank\">kooss.com/無料ホームページ・リンク集</a>
・<a href=\"http://www.kooss.com/blog/\" target=\"_blank\">kooss.com/無料ブログ・リンク集</a>

無料レンタルサーバーでは画像リンク専用目的での使用が禁止されている場合がありますので、
サーバーを借りる際は必ずレンタルサーバー側の利用規約に従ってください。

画像の外部呼出しが禁止されてるサーバー（下記の無料鯖では使用できない模様です）
ジオシティー、FC2ブログ、AAA!CAFE、ぶっとびねっと。

ーーーーーーーーーーーーーー
Windows系で自宅サーバーを構築したい人はこちら（常時接続の方なら自分のPCで画像を公開できます）
・<a href=\"http://www2j.biglobe.ne.jp/~apollo/server/server.html\" target=\"_blank\">ActivePerlとApacheでパソコンをサーバに</a>
CGIを使わないのであれば「4: Apache 2.0.47 for Win32 のダウンロード」以降の手順で完了します。

インストールと設定が終わり、画像を設置したら、下記のサイトでサブドメイン登録をしましょう。
・<a href=\"http://ddo.jp/\" target=\"_blank\">Dynamic DO!.jp</a>
Dynamic DO!.jpの場合は、http://○○.ddo.jp/というアドレスになります。

最後にサブドメインを自動的に更新するDiCEというソフトをインストールします。
・<a href=\"http://www.hi-ho.ne.jp/yoshihiro_e/dice/\" target=\"_blank\">DiCE</a>

上記手順を全て完了すれば、ネットに接続している限り貴方のPCが画像サーバーとして機能します。
特別な費用は一切かかりません。
必要な設備はWinXPのパソコンと常時接続回線（光やASDL）だけでOKです。

ーーーーーーーーーーーーーー
自宅サーバーを公開するにあたってオリジナルドメインを使用したい方は、下記のサイトがお勧めです。
年額９ドル～で、サーバーアドレスが自由に設定できます。（http://○○.○○.○○/）
・<a href=\"http://www.value-domain.com/?ref=k42\" target=\"_blank\">バリュードメイン</a>
</pre></td></tr></table>

<script type=\"text/javascript\" src=\"$CSS_URI/gazou1.js\"></script>

PRI
	&FOOTER;

	exit;

	}

	$in{'icon'} = abs(int($in{'icon'}));
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}
	if($in{'icon_saba'}>$#add_img){&ER1("画像鯖が正しく入力されていません。");}
	if($in{'icon'} > $KYARA_IMG_MAX{$in{'icon_saba'}}) { &ER1("0～$KYARA_IMG_MAX{$in{'icon_saba'}}の間で入力してください。"); }



	&P_OPEN;




$p_cgno_d{$f_id} = $in{'icon'};
$p_cg_sabano{$f_id} = $in{'icon_saba'};

$p_cgno{$f_id}[0] = "$in{'icon_0'}";
$p_cgno{$f_id}[1] = "$in{'icon_1'}";
$p_cgno{$f_id}[2] = "$in{'icon_2'}";
$p_cgno{$f_id}[3] = "$in{'icon_3'}";
$p_cgno{$f_id}[4] = "$in{'icon_4'}";
$p_cgno{$f_id}[5] = "$in{'icon_5'}";
$p_cgno{$f_id}[6] = "$in{'icon_6'}";
$p_cgno{$f_id}[7] = "$in{'icon_7'}";
$p_cgno{$f_id}[8] = "$in{'icon_8'}";
$p_cgno{$f_id}[9] = "$in{'icon_9'}";

@{$p_cgno{$f_id}} = ();

$" = ',';
################

$a_a_d="gazou<>0<>武将画像変更 <><>$f_id<><>$p_cgno_d{$f_id}<>$p_cg_sabano{$f_id}<>@{$p_cgno{$f_id}}<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "武将画像変更 を<br />アクティブコマンドとして予約しました。";

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
################

$p_img_w{$p_cg_sabano{$f_id}}="$IMG{$p_cg_sabano{$f_id}}/";
$p_img_w{$p_cg_sabano{$f_id}}.=int($p_cgno_d{$f_id});
$p_img_w{"gif"}="$p_cgno_d{$f_id}";
$p_img_w{"jpg"}="$p_cgno_d{$f_id}";
$p_img_w{"png"}="$p_cgno_d{$f_id}";
$p_img_w{"jpeg"}="$p_cgno_d{$f_id}";
$p_img{$f_id}=$p_img_w{$p_cg_sabano{$f_id}};
$p_img_f{$f_id}=$p_img_kakutyou{$p_cg_sabano{$f_id}};
$p_img_m{$f_id}=$p_img_mime{$p_cg_sabano{$f_id}};

	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" />$img_sakusei_kekka<input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


	exit;

}

1;