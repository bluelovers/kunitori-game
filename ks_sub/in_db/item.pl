
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
		$gicome1 = "
<select name=\".s1no.\">
<option value=\"0\">$p_name{$f_id}</option>
<option value=\"1\">$kmeidoid1</option>
<option value=\"2\">$kmeidoid2</option>
<option value=\"3\">$kmeidoid3</option>
<option value=\"4\">$kmeidoid4</option>
<option value=\"5\">$kpetid1</option>
<option value=\"6\">$kpetid2</option>
<option value=\"7\">$kpetid3</option>
<option value=\"8\">$kpetid4</option></select>";
		$gicome2 = "
<select name=\".s2no.\">
<option value=\"11\">の右手に装備</option>
<option value=\"12\">の左手に装備</option>
<option value=\"21\">の書物として装備</option>
<option value=\"31\">がこの馬に乗る</option>
<option value=\"41\">がこの衣服を着る</option>
<option value=\"50\">の装飾１に装備</option>
<option value=\"51\">の装飾２に装備</option>
<option value=\"52\">の装飾３に装備</option>
<option value=\"53\">の装飾４に装備</option>
<option value=\"54\">の装飾５に装備</option>
<option value=\"60\">の兵装１に装備</option>
<option value=\"61\">の兵装２に装備</option>
<option value=\"62\">の兵装３に装備</option>
<option value=\"63\">の兵装４に装備</option>
<option value=\"64\">の兵装５に装備</option>
<option value=\"91\">に使用</option>
<option value=\"92\">の兵士に使用</option></select>";

		$gicome12 = "
<select name=\".s2no.\">
<option value=\"10\">の右手と左手を持替</option>
<option value=\"11\">の右手を装備解除</option>
<option value=\"12\">の左手を装備解除</option>
<option value=\"21\">の書物を装備解除</option>
<option value=\"31\">の馬を装備解除</option>
<option value=\"41\">の衣服を装備解除</option>
<option value=\"50\">の装飾１を装備解除</option>
<option value=\"51\">の装飾２を装備解除</option>
<option value=\"52\">の装飾３を装備解除</option>
<option value=\"53\">の装飾４を装備解除</option>
<option value=\"54\">の装飾５を装備解除</option>
<option value=\"60\">の兵装１を装備解除</option>
<option value=\"61\">の兵装２を装備解除</option>
<option value=\"62\">の兵装３を装備解除</option>
<option value=\"63\">の兵装４を装備解除</option>
<option value=\"64\">の兵装５を装備解除</option></select>";
	open(IN,"./p_db/it/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	$itemkazu = @F_LOG2;
		@itgw = ();
		@it = ();
		$it[0] = ".";
		$itgw[0] = 1;
		$itemcome1 = "";
		$itemcome2 = "";
		$itemcome3 = "";
		$itcwk = "";
		$zc = 0;
	foreach(@F_LOG2){
		($itn,$itnw,$itent)=split(/<>/);
		$it[$zc] = "$gitem[$itn]";
		$itno[$zc] = "$itn";
		$itentw[$zc] = "（+$itent）";
		$itgw[$itn] ++;

	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($itnw);
	$qmon++;
#	$qyear += 1900;
	$tt_datel = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
#最小23？（ファイヤーフォックス）
		$itemcome1 .= "
<tr class=\"bgcF8F0E0\" height=\"23\"><td class=\"txtr\">
装備・使用チェック→<input type=\"radio\" name=\".ino.\" value=\"$zc\" /></td>
<td class=\"txth\">$it[$zc]$itentw[$zc]</td>
<td>$tt_datel</td>
</tr>
";

		$itemcome2 .= "
<tr class=\"bgcF8F0E0\" height=\"23\"><td>
<input type=checkbox name=\".no.\" value=\"$zc\" />←出品チェック</td>
</tr>
";
							$itcwk .= "<option value=\"$zc\">$gitem[$itn]（+$itent）</option>";

		$zc++;

	}


	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

	if($tmtmit > $tmtmw1){
	if($tmtmit < $tt - 3600){
require "./$mpg_r/sub_db/itg.pl";

	@KTM2=();
		$zc = 0;
		foreach(@gitem){
			$gitsyu = "";
		($gitname,$gitsyu,$gi1,$gi2,$gi3,$gi4,$gi5,$gi6,$gi7,$gi8,$gi9,$gi10,$gi11,$gi12,$gix1,$gix2,$gix3)=split(/<>/);
			if($gitsyu and $itgw[$gi1] and $itgw[$gi2] and $itgw[$gi3] and $itgw[$gi4] and $itgw[$gi5] and $itgw[$gi6] and $itgw[$gi7] and $itgw[$gi8] and $itgw[$gi9] and $itgw[$gi10] and $itgw[$gi11] and $itgw[$gi12]){
	unshift(@KTM2,"$zc<>$gitname<>\n");
$gitem[$zc] = $gitname;
			}
		$zc++;
		}


			$tmtmw1 = $tt - 1;
	@KTM=();
	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	open(OUT,">./p_db/it/ig_$f_id.cgi");
	print OUT @KTM2;
	close(OUT);
	}else{
$tmtmitwt=$tmtmit - ($tt - 3600);
	$tmtmitwc = "<br /><span class=\"cFF0000\">所持アイテムに変更がありました。素材判定まで残り$tmtmitwt秒。</span>";
	}

	}
							$itcw = "";

	open(IN,"./p_db/it/ig_$f_id.cgi");
	@KTM2 = <IN>;
	close(IN);
	foreach(@KTM2){
							$gitno = "";
		($gitno)=split(/<>/);
			if($gitno){
							$itcw .= "<option value=\"$gitno\">$gitem[$gitno]</option>";
			}
	}

	&HEADER;
	$no = $in{'no'} + 1;

	print <<"PRI";
$come_cdl

<table width=\"760\">
<tr class=\"bgc414141"><td class=\"txth\">
<span class=\"cFFFFFF\"> - アイテム管理 - </span>
</td></tr>
</table>
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"755\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td width=\"39\"></td><td width=\"205\"></td><td width=\"39\"></td><td width=\"205\"></td><td width=\"39\"></td><td width=\"205\"></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"6\"><a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\">$p_name{$f_id}</a>の装備</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"50\">右手</td><td class=\"txth\" width=\"200\">・$item_name{$p_migite{$f_id}}（+$p_migite_lv{$f_id}）</td><td width=\"50\">装飾１</td><td class=\"txth\" width=\"200\">・$item_name{$p_akusesari_b{$f_id}[0]}（+$p_akusesari_b_lv{$f_id}[0]）</td><td width=\"50\">兵装１</td><td class=\"txth\" width=\"200\">・$item_name{$p_akusesari_h{$f_id}[0]}（+$p_akusesari_h_lv{$f_id}[0]）</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>左手</td><td class=\"txth\">・$item_name{$p_hidarite{$f_id}}（+$p_hidarite_lv{$f_id}）</td><td>装飾２</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[1]}（+$p_akusesari_b_lv{$f_id}[1]）</td><td>兵装２</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[1]}（+$p_akusesari_h_lv{$f_id}[1]）</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>書物</td><td class=\"txth\">・$item_name{$p_syomotu{$f_id}}（+$p_syomotu_lv{$f_id}）</td><td>装飾３</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[2]}（+$p_akusesari_b_lv{$f_id}[2]）</td><td>兵装３</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[2]}（+$p_akusesari_h_lv{$f_id}[2]）</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>愛馬</td><td class=\"txth\">・$item_name{$p_norimono{$f_id}}（+$p_norimono_lv{$f_id}）</td><td>装飾４</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[3]}（+$p_akusesari_b_lv{$f_id}[3]）</td><td>兵装４</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[3]}（+$p_akusesari_h_lv{$f_id}[3]）</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>衣服</td><td class=\"txth\">・$item_name{$p_ihuku{$f_id}}（+$p_ihuku_lv{$f_id}）</td><td>装飾５</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[4]}（+$p_akusesari_b_lv{$f_id}[4]）</td><td>兵装５</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[4]}（+$p_akusesari_h_lv{$f_id}[4]）</td></tr>

</table>
<table border=\"0\" width=\"450\">
<tr><td width=270>
※アイテムの特殊効果はまだ未実装です。<br />
</td><td width=\"170\"></td></tr>
<tr><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"item\" />$gicome1<input type=\"submit\" value=\"キャラ切り替え\" />
</div></form>
</td>
<td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" />
<input type=\"submit\" value="オークション会場へ">
</div></form>
</td></tr>
<tr><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".ino.\" value=\"10000\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"itemu\" />
<input type=\"hidden\" name=\".um.\" value=\"iu\" />$gicome1$gicome12<input type=\"submit\" value=\"決定\" />
</div></form>
</td><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" />
<input type=\"submit\" value=\"画面更新\" /></div></form>
</td>
</tr></table>
PRI


print <<"PRI";
<br />

<div class=\"item_div\">
<table width=\"100%\" class=\"bgc884422\">
<tr class=\"bgcFFF8F0\"><td class=\"txth\">アイテムの管理（保有数$itemkazu個/MAX100個）</td></tr>
</tr></table>
<div class=\"item_block1\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"100%\" class=\"bgc884422\">
<tr class=\"bgcF8F0E0\"><td width=\"160\"></td><td></td><td width=\"70\"></td></tr>$itemcome1
<tr class=\"bgcF8F0E0\"><td colspan=\"3\">
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"itemu\" />
<input type=\"hidden\" name=\".um.\" value=\"iu\" />$gicome1$gicome2<input type=\"submit\" value=\"決定\" />
</td>
</tr>
</table></div></form>
</div>
<div class=\"item_block2\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"100%\" class=\"bgc884422\"><tr><td class=\"bgcF8F0E0\"></td></tr>
$itemcome2
<tr class=\"bgcF8F0E0\">

<td>
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"items\" /><input type=\"submit\" value=\"オークションに出品\"></td>
</tr>
</table></div></form>
</td>
</div>
</div>
<div class=\"clear_b\"></div>
<pre>
ーーーーーーーーーーーーーーーーーーーーーーーーーー

☆アイテム合成$tmtmitwc
</pre>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemu\" /><input type=\"hidden\" name=\".um.\" value=\"ig\" />
<select name=\".s1no.\" size=\"10\">
<option value=>＝＝選択肢に何も出てない場合は作れる物がありません＝＝</option>
$itcw
</select>
<input type=\"submit\" value=\"合成する\" />
</div></form>
<pre>
※　アイテム合成パターンは下記のURLの一覧をごらんください

<a href=\"../it2.txt\" target=\"setumei\">アイテム合成例</a>

ーーーーーーーーーーーーーーーーーーーーーーーーーー

☆アイテム強化
</pre>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"400\">
<tr><td width=\"150\">強化対象アイテム<br />

<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemu\" /><input type=\"hidden\" name=\".um.\" value=\"ik\" />
<select name=\".ino.\" size=\"10\">
$itcwk
</select></td><td width=\"15\">＋</td><td width=215>エンチャントアイテム<br />
<select name=\".s1no.\" size=\"10\">
$itcwk
</select>
<input type=\"submit\" value=\"強化する\" />
</td></tr>
</table>
</div></form>
<pre>
※　アイテム強化を行うには、同種類のアイテムを掛け合わせるか、下記のエンチャントアイテムを使用する必要があります。

武器エンチャントアイテム ⇒ フルングニルの砥石
万能エンチャントアイテム ⇒ 踊る埴輪、打出の小槌

ーーーーーーーーーーーーーーーーーーーーーーーーーー
</pre>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面へ\" /></div></form>



PRI

	&FOOTER;

	exit;

}
1;