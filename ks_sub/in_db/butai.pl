
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");
require "./$mpg_r/sub_db/tw.pl";

require "./$mpg_r/sub_db/kanbu.pl";

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
				&KANBU_NAME;
$BUTAI_NEW[0] = '入隊可 ';
$BUTAI_NEW[1] = '入隊不可 ';

$BUTAI_S1C[0] = '一斉攻撃に参加しない';
$BUTAI_S1C[1] = '残り兵士数30%以上＆';
$BUTAI_S1C[2] = '残り兵士数45%以上＆';
$BUTAI_S1C[3] = '残り兵士数60%以上＆';
$BUTAI_S1C[4] = '残り兵士数75%以上＆';
$BUTAI_S1C[5] = '残り兵士数90%以上＆';
$BUTAI_S1C[99] = '残り兵士数1%以上＆';

$BUTAI_S3C[0] = '一斉攻撃に参加しない';
$BUTAI_S3C[1] = '訓練度が30%以上の時に出撃';
$BUTAI_S3C[2] = '訓練度が45%以上の時に出撃';
$BUTAI_S3C[3] = '訓練度が60%以上の時に出撃';
$BUTAI_S3C[4] = '訓練度が75%以上の時に出撃';
$BUTAI_S3C[5] = '訓練度が90%以上の時に出撃';
$BUTAI_S3C[98] = '訓練度が0%以上の時に出撃';
$BUTAI_S3C[99] = '訓練度が1%以上の時に出撃';
$BUTAI_S3C[101] = '訓練度が総合力の30%以上の時に出撃';
$BUTAI_S3C[102] = '訓練度が総合力の45%以上の時に出撃';
$BUTAI_S3C[103] = '訓練度が総合力の60%以上の時に出撃';
$BUTAI_S3C[104] = '訓練度が総合力の75%以上の時に出撃';
$BUTAI_S3C[105] = '訓練度が総合力の90%以上の時に出撃';

$BUTAI_S2C[0] = '個々撃破';
$BUTAI_S2C[1] = 'かばう';
$BUTAI_S2C[2] = '一点集中';
$BUTAI_S2C[3] = '挑発';


#	open(IN,"./p_db/tt/ktms4$f_id.cgi");
#	@KTM = <IN>;
#	close(IN);
#	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

#	if($tmtmw2 < $tt - 3600){


	open(IN,"./w_db/butai_l/k$fk_id.cgi");
	@BUTAI_DB2 = <IN>;
	close(IN);

	foreach(@BUTAI_DB2){
	$fbutai_no=int($_);
	&BUTAI_READ("butai_db","$fbutai_no","$fbutai_no");
#		if($butai_kunino{$fbutai_no} eq $p_kunino{$f_id}){
	open(IN,"./w_db/butai_l/l$fbutai_no.cgi");
	@BUTAI_DB = <IN>;
	close(IN);

						$unit_list = "";
			$unit_num=0;
	foreach(@BUTAI_DB){
		($uni_id,$uni_name,$uni_kuni)=split(/<>/);

#			if($uni_kuni eq $p_kunino{$f_id}){

	$p_name{$uni_id} = $uni_name;
						$unit_list .= ",<a href=\"./?.m.=p_b&amp;.id.=$uni_id\" target=\"_blank\"><span class=\"c000000\">$uni_name</span></a>";
#			}

	}
#			if($unit_list){
	$e_id=$butai_yakusyoku_id{$fbutai_no}[1];
	&P_READ("p","$e_id","$e_id");
	&IMG_SAKUSEI("$p_img{$e_id}$p_img_f{$e_id}","$img_wide_d","$img_height_d","$p_img_m{$e_id}","b$e_id\_taityou");
			$unit_party .= "<tr><td class=\"bgcFFF8F0\"><input type=\"radio\" name=\".unit_id.\" value=\"$fbutai_no\" /></td>
<td class=\"bgcF8F0E8\" title=\"$p_name{$e_id}\">$img_sakusei_kekka<br /><a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_no}[1]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_no}[1]}</span></a></td>
<td class=\"bgcF8F0E0\">
<table border=\"1\" class=\"bgcF8F0E0\" width=\"100%\" height=\"100%\"><tr>
<td width=\"7%\" class=\"txtc\">部隊名</td><td width=\"20%\" class=\"txtc\">$butai_name{$fbutai_no}</td><td width=\"7%\" class=\"txtc\">隊員数</td><td width=\"7%\" class=\"txtc\">$butai_busyou_suu{$fbutai_no}名</td><td width=\"9%\" class=\"txtc\">入隊設定</td><td width=\"9%\" class=\"txtc\">$BUTAI_NEW[$butai_sinki_f{$fbutai_no}]</td><td width=\"9%\" class=\"txtc\">部隊指令</td><td width=\"9%\" class=\"txtc\">$bsirei1</td>
</tr>
<tr><td class=\"txtc\">勧誘文</td><td colspan=\"7\" class=\"txtc\">$butai_kanyuu_bun{$fbutai_no}</td>

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

	open(IN,"./w_db/butai_l/l$fbutai_id.cgi");
	@BUTAI_DB = <IN>;
	close(IN);

	foreach(@BUTAI_DB){
		($uni_id,$uni_name)=split(/<>/);

						$u_member .= "<option value=\"$uni_id\">$uni_name</option>";
	}

$add_no =2;
	while($add_no < 7){
	if($butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]){
						$u_member2 .= "<option value=\"$add_no\">・$p_name{$butai_yakusyoku_id{$p_butaino{$f_id}}[$add_no]}</option>";
	}
$add_no ++;
	}
	$add_come_ijyou = "<input type=\"submit\" value=\"部隊長権限委譲\" />※部隊長権限を別メンバーに与え、隠居します。";
	if($fbutai_id){
$uhit=1;
			$kunit_name = "「<span class=\"cFFFFCC\">$butai_name{$p_butaino{$f_id}}</span>」部隊に所属しています。";
	if($p_butai_yakusyoku{$butai_yakusyoku_id{$fbutai_no}[1]} ne "1"){
	$add_come_ijyou = "<input type=\"submit\" value=\"部隊長推薦\" />※部隊員を部隊長に推薦します。（部隊長空席時限定）";
	}
	}else{ 
	$uhit=0;
		$kunit_name = "部隊に所属していません。";
	}

	if($butai_sirei_bun{$fbutai_id}){
			$kunit_sirei = "<br /><br />部隊指令：$butai_sirei_bun{$fbutai_id}";
	}

	&HEADER;

#			if($p_butaisirei{$f_id}[0] eq "0" or $p_butaisirei{$f_id}[2] eq "0"){
#				$bsirei1c = "一斉攻撃に参加しない";
#			}else{
#				$bsirei1c = "$BUTAI_S1C[$p_butaisirei{$f_id}[0]]$BUTAI_S3C[$p_butaisirei{$f_id}[2]]";
#			}
#<br />（現在の設定⇒$bsirei1c）（現在の設定⇒$BUTAI_S2C[$p_butaisirei{$f_id}[1]]）

${"bs1id$p_butaisirei{$f_id}[0]"} = " selected=\"selected\"";
${"bs2id$p_butaisirei{$f_id}[1]"} = " selected=\"selected\"";
${"bs3id$p_butaisirei{$f_id}[2]"} = " selected=\"selected\"";

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 部 隊 編 成 》<br /><br />ここでは部隊関連のコマンドを実行できます。
<br />あなたは現在、$kunit_name<br />部隊を編成すると敵国攻略時に複数人で攻め込めるようになります。$kunit_sirei</span>
</td></tr></table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table class=\"bgc884422\" width=\"700\"><tr class=\"bgcFFF0F5\">
<td class=\"txtc\" width=\"26\">選択</td><td class=\"txtc\" width=\"100\">隊長</td><td class=\"txtc\" width=\"564\">詳細データ</td></tr>
PRI


print <<"PRI";
$unit_party
</table>
<br />
<select name=\".m.\">
<option value=\"butain\">入隊</option>
<option value=\"butaid\">部隊脱退・解散</option>
</select>


<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"実行\" /><br />（部隊解散権限：${$zokukanbuptn}[1] or 部隊長）<br />（太傅が部隊から脱退する際は部隊を選択せずに実行ボタンを押してください）</div></form>


<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>隊員コマンド</strong></span></span>
<table width=\"700\"><tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butaic2\" />
<input type=\"hidden\" name=\".mode2.\" value=\"1\" />
<select name=\".bsirei1.\">
<option value=\"0\"$bs1id0>$BUTAI_S1C[0]</option>
<option value=\"5\"$bs1id5>$BUTAI_S1C[5]</option>
<option value=\"4\"$bs1id4>$BUTAI_S1C[4]</option>
<option value=\"3\"$bs1id3>$BUTAI_S1C[3]</option>
<option value=\"2\"$bs1id2>$BUTAI_S1C[2]</option>
<option value=\"1\"$bs1id1>$BUTAI_S1C[1]</option>
<option value=\"99\"$bs1id99>$BUTAI_S1C[99]</option>
</select>
<select name=\".bsirei3.\">
<option value=\"0\"$bs3id0>$BUTAI_S3C[0]</option>
<option value=\"5\"$bs3id5>$BUTAI_S3C[5]</option>
<option value=\"4\"$bs3id4>$BUTAI_S3C[4]</option>
<option value=\"3\"$bs3id3>$BUTAI_S3C[3]</option>
<option value=\"2\"$bs3id2>$BUTAI_S3C[2]</option>
<option value=\"1\"$bs3id1>$BUTAI_S3C[1]</option>
<option value=\"98\"$bs3id98>$BUTAI_S3C[98]</option>
<option value=\"105\"$bs3id105>$BUTAI_S3C[105]</option>
<option value=\"104\"$bs3id104>$BUTAI_S3C[104]</option>
<option value=\"103\"$bs3id103>$BUTAI_S3C[103]</option>
<option value=\"102\"$bs3id102>$BUTAI_S3C[102]</option>
<option value=\"101\"$bs3id101>$BUTAI_S3C[101]</option>
</select>
<input type=\"submit\" value=\"左記の内容で出陣判断基準を設定\" />
<br />※同じ都市に所属する部隊員の誰かが敵国に出陣した際に同時攻撃を仕掛ける頻度を設定します。</div></form>
<br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butaic2\" />
<input type=\"hidden\" name=\".mode2.\" value=\"3\" />
<select name=\".bsirei1.\">
<option value=\"0\"$bs2id0>$BUTAI_S2C[0]</option>
<option value=\"1\"$bs2id1>$BUTAI_S2C[1]</option>
<option value=\"2\"$bs2id2>$BUTAI_S2C[2]</option>
<option value=\"3\"$bs2id3>$BUTAI_S2C[3]</option>
</select>
<input type=\"submit\" value=\"左記の内容で部隊スキルを設定\" />
<br />※戦闘時の特殊技能の設定を行います。</div></form>
</td></tr></table>
<br /><br />

<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>幹部専用コマンド</strong></span></span>
<table width=\"700\"><tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"hidden\" name=\".mode2.\" value=\"9\" />
勧誘文<input type=\"text\" name=\".mes.\" size=\"30\" />
<input type=\"submit\" value=\"勧誘文変更\" />※[全角大文字で２０文字以内]</div></form>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"hidden\" name=\".mode2.\" value=\"8\" />
指令文<input type=\"text\" name=\".mes.\" size=\"30\" />
<input type=\"submit\" value=\"指令文変更\" />※[全角大文字で２０文字以内]</div></form>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"submit\" value=\"入隊設定変更\" />※入隊不可\にすると新規入隊不可能になります。</div></form>

<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください$u_member</option>
</select>
<input type=\"hidden\" name=\".m.\" value=\"butaij\" />
<input type=\"submit\" value=\"隊員除名\" />※メンバーを除隊させます。</div></form>
</td></tr></table>
<br /><br />

<hr />
<span class=\"fs4\"><span class=\"c3355AA\"><strong>部隊長コマンド</strong></span></span>
<table width=\"700\"><tr><td>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\" />
<option value=\"\">選択してください</option>
$u_member
</select>
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"hidden\" name=\".mode2.\" value=\"7\" />
<input type=\"submit\" value=\"司\令官任命\" />
※部隊長を補佐する者を任命します。（最大5名まで）</div></form>
部隊長：<a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[1]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[1]}</span></a>
<br />司\令官：<a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[2]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[2]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[3]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[3]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[4]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[4]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[5]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[5]}</span></a> <a href=\"./?.m.=p_b&amp;.id.=$butai_yakusyoku_id{$fbutai_id}[6]\" target=\"_blank\"><span class=\"c000000\">$p_name{$butai_yakusyoku_id{$fbutai_id}[6]}</span></a>
<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください</option>
$u_member2
</select>
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"hidden\" name=\".mode2.\" value=\"5\" />
<input type=\"submit\" value=\"役職解任\" />※対象者の部隊役職を解任いたします。</div></form>

<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".did.\">
<option value=\"\">選択してください</option>
$u_member
</select>
<input type=\"hidden\" name=\".m.\" value=\"butaic\" />
<input type=\"hidden\" name=\".mode2.\" value=\"6\" />
$add_come_ijyou</div></form>

</td></tr></table>
<br /><br />

<hr />

<span class=\"fs4\"><span class=\"c3355AA\"><strong>新規部隊作成</strong></span></span>（国家貢献度 500以上必要/$p_kuni_kouken{$f_id}）
<table width=\"700\"><tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
部隊名<input type=\"text\" name=\".name.\" size=\"30\" />[全角大文字で１～８文字以内]<br />
勧誘文<input type=\"text\" name=\".mes.\" size=\"30\" />[全角大文字で２０文字以内]<br />
</td></tr></table>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"butais\" />
<input type=\"submit\" value=\"部隊作成\" /></div></form>
<hr />


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面に戻る\" /></div></form>
PRI

	&FOOTER;
	exit;
}
1;