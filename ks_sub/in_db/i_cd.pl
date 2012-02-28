
sub MOVE {

	&GET_COOKIE;

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
							$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;

	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);
	$nen_getu = sprintf("%02d\年%02d\月", $KAISI_NEN + $keika_nen, $tuki_genzai);


	$tt = time();


	open(READ,"./p_db/cd/$f_id.cgi");
	@CD_DATA = <READ>;
	close(READ);
	$i=0;
	while($i<12){
		($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/,$CD_DATA[$i]);
		$no = $i+1;
	$no = sprintf("%02d", $no);
		if($cd_id eq ""){
		$com_list .= "$no: - <br />";
		}else{
		$com_list .= "$no: $cd_name<br />";
		}
	$i++
	}




				$add_p_jikan = $p_jikan{$f_id};
	$kousin_made_p = int(($p_jikan{$f_id} - $tt) / 60);
	$kousin_made_m = int(($m_tt - $tt) / 60);

	$kousin_made_p += 5;
	$kousin_made_m += 5;

	&HEADER;
print <<"PRI";
指令:$k_sirei_bun{$fk_id}<hr />
$nen_getu$p_name{$f_id}<br />
次Ｔ迄$kousin_made_p分/翌月迄$kousin_made_m分<br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<strong>\[コマンド\]</strong><br />
No:<select name=\".no.\" size=\"4\" multiple=\"multiple\">
<option value=\"all\">ALL</option>
PRI
		$selc = "";
	for($i=0;$i<12;$i++){
		$no = $i+1;
	$no = sprintf("%02d", $no);
		$selc .= "<option value=\"$i\">$no</option>";
	}


	$comecdl = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"軍事\">
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"mittei1\">密偵(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";
					if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
	$comecdl = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">街を巡察</option>
</optgroup>

<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"内政\">
<option value=\"kaikon\">農地開墾(金50)</option>
<option value=\"syougyou\">商業発展(金50)</option>
<option value=\"gijyutu\">技術開発(金50)</option>
<option value=\"bouei\">防衛力強化(金50)</option>
<option value=\"hosyuu\">城壁補修(金50)</option>
<option value=\"hodokosi\">施し(米50)</option>
<option value=\"khodokosi\">緊急施し(米5000)</option>
</optgroup>
<optgroup label=\"軍事\">
<option value=\"tyouhei1\">徴兵</option>
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"gsyousyuu\">義勇兵召集(金10000)</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
<option value=\"sensou1\">戦争</option>
<option value=\"sensou1z\">賊退治</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
<option value=\"ryuugen1\">流言工作(金100)</option>
<option value=\"yakiuti1\">焼き討ち(金100)</option>
<option value=\"kabeb1\">城壁破壊(金100)</option>
<option value=\"sendou1\">住民扇動(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";

					}elsif($k_kokka_keitai{$fk_id}){
	$comecdl = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">便利屋家業（賊/巡察）</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"内政\">
<option value=\"bouei\">防衛力強化(金50)</option>
<option value=\"hosyuu\">城壁補修(金50)</option>
</optgroup>
<optgroup label=\"軍事\">
<option value=\"komedoro\">米泥棒</option>
<option value=\"goudatu\">金強奪</option>
<option value=\"tyouhei1\">徴兵</option>
<option value=\"gbosyuu\">義勇兵募集</option>
<option value=\"gsyousyuu\">義勇兵召集(金10000)</option>
<option value=\"kunren\">訓練</option>
<option value=\"mkunren\">猛訓練(米5000)</option>
<option value=\"syubi\">賊砦の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
<option value=\"sensou1s\">城を強襲</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
<option value=\"ryuugen1\">流言工作(金100)</option>
<option value=\"yakiuti1\">焼き討ち(金100)</option>
<option value=\"kabeb1\">城壁破壊(金100)</option>
<option value=\"sendou1\">住民扇動(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\"></option>
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";
					}elsif($k_kunino{$fk_id}){
	$comecdl = "

<optgroup label=\"基礎\">
<option value=\"0\">休暇をとる</option>
<option value=\"jyunsatu\" selected=\"selected\">街を巡察</option>
</optgroup>
<optgroup label=\"移動\">
<option value=\"idou1\">移動</option>
<option value=\"sikan\">仕官</option>
<option value=\"geya\">下野</option>
</optgroup>

<optgroup label=\"軍事\">
<option value=\"syubi\">城の守備に就く</option>
<option value=\"enpous1\">遠方守備(米15000)</option>
</optgroup>
<optgroup label=\"諜略\">
<option value=\"touyou1\">登用(金100)</option>
<option value=\"mittei1\">密偵(金100)</option>
</optgroup>
<optgroup label=\"鍛錬\">
<option value=\"tanren1\">自己鍛錬</option>
</optgroup>
<optgroup label=\"商人\">
<option value=\"kome1\">米売買</option>
<option value=\"buki1\">武器購入</option>
<option value=\"syomotu1\">書物購入</option>
</optgroup>

";
					}


print <<"PRI";
$selc</select>
<select name=\".m.\">
$comecdl
<optgroup label=\"その他\">
<option value=\"99911\">ループ作成1</option>
<option value=\"99912\">ループ作成2</option>
<option value=\"99913\">ループ作成3</option>
<option value=\"99914\">ループ作成4</option>
<option value=\"99915\">ループ作成5</option>
<option value=\"jyounou\">国庫に金を納付</option>
<option value=\"sokui\">自己推薦</option>
<option value=\"sakujyo\">※ID凍結\申請\</option>
$add_comkn
</optgroup>
</select>
<input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"submit\" value=\"実行\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"9992\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<strong>\[ループ転写\]<br /></strong>No:<select name=\".no.\">
$selc</select>以降にループ
<select name=\".rclno.\">
<option value=\"1\" selected=\"selected\">1</option>
<option value=\"2\">2</option>
<option value=\"3\">3</option>
<option value=\"4\">4</option>
<option value=\"5\">5</option>
</select>を<input type=\"submit\" value=\"転写\" /></div></form>
<strong>\[コマンドリスト\]</strong><br />
<hr />$com_list
PRI
	&FOOTER;
	exit;


}

1;