
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");
require "./$mpg_r/sub_db/tw.pl";

require "./$mpg_r/sub_db/kanbu.pl";

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
				&KANBU_NAME;
$BUTAI_SC[0] = '集合指示に従う';
$BUTAI_SC[1] = '単独行動';
$BUTAI_SC[2] = '謀反密約';

$BUTAI_NEW[0] = '入団可 ';
$BUTAI_NEW[1] = '入団不可 ';

#	open(IN,"./p_db/tt/ktms4$f_id.cgi");
#	@KTM = <IN>;
#	close(IN);
#	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

#	if($tmtmw2 < $tt - 3600){

	open(IN,"./w_db/gundan_l/k$fk_id.cgi");
	@GUNDAN_DB2 = <IN>;
	close(IN);

	foreach(@GUNDAN_DB2){
	$fgundan_no = int($_);
	&GUNDAN_READ("gundan_db","$fgundan_no","$fgundan_no");

			$unit_as.="$fgundan_no $gundan_kunino{$fgundan_no} ";
#		if($gundan_kunino{$fgundan_no} eq $p_kunino{$f_id}){
	open(IN,"./w_db/gundan_l/l$fgundan_no.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);

						$unit_list = "";
			$unit_num=0;
	foreach(@GUNDAN_DB){
		($uni_id,$uni_name,$uni_kuni)=split(/<>/);

#			if($uni_kuni eq $p_kunino{$f_id}){
	$p_name{$uni_id} = $uni_name;
						$unit_list .= ",<a href=\"./?.m.=p_b&amp;.id.=$uni_id\" target=\"_blank\"><span class=\"c000000\">$uni_name</span></a>";
#			}


	}
#			if($unit_list){
	$e_id=$gundan_yakusyoku_id{$fgundan_no}[1];
	&P_READ("p","$e_id","$e_id");
	$ndate = "";
			if($p_gunsirei{$gundan_yakusyoku_id{$fgundan_no}[1]}[0] eq "1"){
			($qsec,$qmin,$qhour,$qday) = localtime($p_jikan{$e_id});
	$ndate = sprintf("%02d\/%02d\:%02d\ ", $qday, $qhour, $qmin);
				$bsirei1 = "$t_name[$p_taizai_iti{$p_id{$e_id}}]集合";
			}else{
				$bsirei1 = "自由行動";
			}
	&IMG_SAKUSEI("$p_img{$e_id}$p_img_f{$e_id}","$img_wide_d","$img_height_d","$p_img_m{$e_id}","b$e_id\_taityou");
			$unit_party .= "<tr><td class=\"bgcFFF8F0\"><input type=\"radio\" name=\".unit_id.\" value=\"$fgundan_no\" /></td>
<td class=\"bgcF8F0E8\" title=\"$p_name{$e_id}\">$img_sakusei_kekka<br /><a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_no}[1]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_no}[1]}</span></a></td>
<td class=\"bgcF8F0E0\">
<table border=\"1\" class=\"bgcF8F0E0\" width=\"100%\" height=\"100%\"><tr>
<td width=\"7%\" class=\"txtc\">軍団名</td><td width=\"20%\" class=\"txtc\">$gundan_name{$fgundan_no}</td><td width=\"7%\" class=\"txtc\">団員数</td><td width=\"7%\" class=\"txtc\">$gundan_busyou_suu{$fgundan_no}名</td><td width=\"9%\" class=\"txtc\">入団設定</td><td width=\"9%\" class=\"txtc\">$BUTAI_NEW[$gundan_sinki_f{$fgundan_no}]</td><td width=\"9%\" class=\"txtc\">$bsirei1</td><td width=\"9%\" class=\"txtc\">$ndate</td>
</tr>
<tr><td class=\"txtc\">勧誘文</td><td colspan=\"7\" class=\"txtc\">$gundan_kanyuu_bun{$fgundan_no}</td>

</tr><tr>
<td colspan=\"8\">メンバー；$unit_list</td>
</tr></table>
</td></tr>";
#			}
#		}
	}

#			$tmtmw2 = $tt - 1;
#	@KTM=();
#	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
#	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
#	print OUT @KTM;
#	close(OUT);

#	}

	open(IN,"./w_db/gundan_l/l$fgundan_id.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);

	foreach(@GUNDAN_DB){
		($uni_id,$uni_name)=split(/<>/);
						$u_member .= "<option value=\"$uni_id\">$uni_name</option>";

	}

$add_no =2;
	while($add_no < 7){
	if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]){
	$u_member2 .= "<option value=\"$add_no\">・$p_name{$gundan_yakusyoku_id{$p_gundanno{$f_id}}[$add_no]}</option>";
	}
$add_no ++;
	}

	$add_come_ijyou = "<input type=\"submit\" value=\"軍団長権限委譲\" />※軍団長権限を別メンバーに与え、隠居します。";
	if($gundan_no{$p_gundanno{$f_id}}){
$uhit=1;
			$kunit_name = "「<span class=\"cFFFFCC\">$gundan_name{$p_gundanno{$f_id}}</span>」軍団に所属しています。";
	if($p_gundan_yakusyoku{$gundan_yakusyoku_id{$fbutai_no}[1]} ne "1"){
	$add_come_ijyou = "<input type=\"submit\" value=\"軍団長推薦\" />※軍団員を軍団長に推薦します。（軍団長空席時限定）";
	}
	}else{ 
	$uhit=0;
		$kunit_name = "軍団に所属していません。";
	}


	if($gundan_sirei_bun{$fgundan_id}){
			$kunit_sirei = "<br /><br />軍団指令：$gundan_sirei_bun{$fgundan_id}";
	}
	&HEADER;

${"gs1id$p_gunsirei{$f_id}[0]"} = " selected=\"selected\"";

#（現在の設定⇒$BUTAI_SC[$p_gunsirei{$f_id}[0]]）
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 軍 団 編 成 》<br /><br />ここでは軍団関連のコマンドを実行できます。
<br />あなたは現在、$kunit_name<br />軍団に所属すると各種コマンドで統制が取りやすくなります。
$kunit_sirei</span>
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table class=\"bgc884422\" width=\"700\"><tr class=\"bgcFFF0F5\">
<td class=\"txtc\" width=\"26\">選択</td><td class=\"txtc\" width=\"100\">軍団</td><td class=\"txtc\" width=\"564\">詳細データ</td></tr>
PRI


print <<"PRI";
$unit_party
</table>
<br />
<select name=\".m.\">
<option value=\"gundann\">入団</option>
<option value=\"gundand\">軍団脱退・解散</option>
</select>


<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"実行\" /><br />（軍団解散権限：${$zokukanbuptn}[1] or 軍団長）<br />（太傅が軍団から脱退する際は軍団を選択せずに実行ボタンを押してください）</div></form>

<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>団員コマンド</strong></span></span>
<table width=\"700\"><tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundanc2\" />
<input type=\"hidden\" name=\".mode2.\" value=\"1\" />
<select name=\".bsirei1.\">
<option value=\"0\"$gs1id0>$BUTAI_SC[0]</option>
<option value=\"1\"$gs1id1>$BUTAI_SC[1]</option>
<option value=\"2\"$gs1id2>$BUTAI_SC[2]</option>
</select>
<input type=\"submit\" value=\"左記の内容で指令受け入れ状態を設定\" />※軍団長の指令に従うかどうかを設定できます。</div></form>
</td></tr></table>
<br /><br />


<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>幹部専用コマンド</strong></span></span>
<table width=\"700\"><tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"9\" />

勧誘文<input type=\"text\" name=\".mes.\" size=\"30\" />
<input type=\"submit\" value=\"勧誘文変更\" />※[全角大文字で２０文字以内]</div></form>
<br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"8\" />

指令文<input type=\"text\" name=\".mes.\" size=\"30\" />
<input type=\"submit\" value=\"指令文変更\" />※[全角大文字で２０文字以内]</div></form>
<br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".rty.\">
<option value=\"0\">選択して下さい</option>
<option value=\"1\">山林</option>
<option value=\"2\">山道</option>
<option value=\"3\">川原沿い</option>
<option value=\"4\">草原</option>
<option value=\"5\">林道</option>
<option value=\"6\">森林</option>
</select>
<select name=\".rts.\">
<option value=\"0\">選択して下さい</option>
<option value=\"21\">西門</option>
<option value=\"22\">北門</option>
<option value=\"23\">東門</option>
<option value=\"24\">南門</option>
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"1\" />
<input type=\"submit\" value=\"『進軍ルート』変更指令\" />※メンバー全員の進軍ルートを修正します。</div></form>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".rty.\">
<option value=\"0\">選択して下さい</option>
<option value=\"1\">山林</option>
<option value=\"2\">山道</option>
<option value=\"3\">川原沿い</option>
<option value=\"4\">草原</option>
<option value=\"5\">林道</option>
<option value=\"6\">森林</option>
<option value=\"0\">＝＝＝</option>
<option value=\"11\">山岳砦</option>
<option value=\"12\">平地砦</option>
<option value=\"13\">森林砦</option>
<option value=\"0\">＝＝＝</option>
<option value=\"20\">郊外防衛拠点</option>
<option value=\"0\">＝＝＝</option>
<option value=\"21\">西門</option>
<option value=\"22\">北門</option>
<option value=\"23\">東門</option>
<option value=\"24\">南門</option>
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"2\" />
<input type=\"submit\" value=\"『守備位置』変更指令\" />※メンバー全員の守備位置の予約を修正します。</div></form>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"submit\" value=\"入団設定変更\" />※入団不可\にすると新規入団不可能になります。</div></form>
<br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください</option>
$u_member
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanj\" />
<input type=\"submit\" value=\"団員除名\" />※メンバーを除隊させます。</div></form>

</td></tr></table>
<br /><br />


<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>軍団長コマンド</strong></span></span>
<table width=\"700\"><tr><td>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"3\" />
<select name=\".rty.\">
<option value=\"0\"$gs1id0>自由行動</option>
<option value=\"1\"$gs1id1>現地集合</option>
</select>
<input type=\"submit\" value=\"軍団指令変更\" />※集合等の設定を行うことができます。</div></form>
<br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"muhon\" />
<input type=\"submit\" value=\"謀反\" />※賊砦に立て篭もり、仕官先に反旗を翻します。団員を連れて行くには予め密約しておく必要があります。</div></form>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください</option>
$u_member
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"7\" />
<input type=\"submit\" value=\"補佐官任命\" />※軍団長を補佐する者を任命します。（最大5名まで）</div></form>
軍団長：<a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[1]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[1]}</span></a>
<br />補佐官：<a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[2]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[2]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[3]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[3]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[4]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[4]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[5]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[5]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$gundan_yakusyoku_id{$fgundan_id}[6]\" target=\"_blank\"><span class=\"c000000\">$p_name{$gundan_yakusyoku_id{$fgundan_id}[6]}</span></a>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=>選択してください</option>
$u_member2
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"5\" />
<input type=\"submit\" value=\"役職解任\" />※対象者の軍団役職を解任いたします。</div></form>

<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください</option>
$u_member
</select>
<input type=\"hidden\" name=\".m.\" value=\"gundanc\" />
<input type=\"hidden\" name=\".mode2.\" value=\"6\" />
$add_come_ijyou</div></form>
<br /><br />
</td></tr></table>
<br /><br />

<hr />

<span class=\"fs4\"><span class=\"c3355AA\"><strong>新規軍団作成</strong></span></span>（国家貢献度 500以上必要/$p_kuni_kouken{$f_id}）
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"700\"><tr><td>
軍団名<input type=\"text\" name=\".name.\" size=\"30\" />[全角大文字で１～８文字以内]<br />
勧誘文<input type=\"text\" name=\".mes.\" size=\"30\" />[全角大文字で２０文字以内]<br />
</td></tr></table>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gundans\" />
<input type=\"submit\" value=\"軍団作成\" /></div></form>
<hr />


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面に戻る\" /></div></form>
PRI

	&FOOTER;
	exit;
}
1;