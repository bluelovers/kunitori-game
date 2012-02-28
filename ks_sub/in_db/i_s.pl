
sub MOVE {

	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


require "./$mpg_r/sub_db/sen.pl";
	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);
	$nen_getu = sprintf("%02d\年%02d\月", $KAISI_NEN + $keika_nen, $tuki_genzai);


	$tt = time();

	open(READ,"./p_db/my_log/$f_id.cgi");
	@LOG_DATA = <READ>;
	close(READ);
	$i=0;
	while($i<5){
$LOG_DATA[$i] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$log_list .= "$LOG_DATA[$i]<br />";
$i++;

	}




$k_kousen_aite_name{$fk_id} =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
				$add_p_jikan = $p_jikan{$f_id};
	$kousin_made_p = int(($p_jikan{$f_id} - $tt) / 60);
	$kousin_made_m = int(($m_tt - $tt) / 60);

	$kousin_made_p += 5;
	$kousin_made_m += 5;

	if($p_syubi_eria{$f_id}){
		$syubiitic = "$t_name[$p_syubi_tosi{$f_id}] $senno[$p_syubi_eria{$f_id}] ";
	}
	&HEADER;
print <<"PRI";
指令:$k_sirei_bun{$fk_id}<hr />
$nen_getu$p_p_b_a_i{$f_id}<br />
次Ｔ迄$kousin_made_p分/翌月迄$kousin_made_m分<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

金:$p_syoji_kin{$f_id}/米:$p_syoji_kome{$f_id}:貢献:$p_kunkou{$f_id}<br />$SOL_TYPE[$p_heisyu{$f_id}]:$p_heisisuu{$f_id}/訓練:$p_kunren{$f_id}<br />
<strong>\[$t_name{$ft_id}\]</strong><br />
国:$k_p_k_a_i{$fk_id}<br />
領民:$t_ryoumin_suu{$ft_id}・治安:$t_tian_ti{$ft_id}<br />
農業:$t_nougyou_ti{$ft_id}/$t_nougyou_max{$ft_id}<br />
商業:$t_syougyou_ti{$ft_id}/$t_syougyou_max{$ft_id}<br />
技術:$t_gijyutu_ti{$ft_id}/$t_gijyutu_max{$ft_id}<br />
城/防衛:$t_siro_bouei_ti{$ft_id}/$t_siro_bouei_max{$ft_id}<br />
城/耐久:$t_siro_taikyuu_ti{$ft_id}/$t_siro_taikyuu_max{$ft_id}<br /><br />
賊:$k_name_d[$k_kunino[$t_zokuno[$ft_id]]]<br />
賊/防衛$t_nougyou_ti{$ft_id}/$t_zoku_bouei_max{$ft_id}<br />
賊/耐久$t_zoku_taikyuu_ti{$ft_id}/$t_zoku_taikyuu_max{$ft_id}<br /><br />
相場:$t_kome_souba{$ft_id}
<hr />
交戦相手国:$k_kousen_aite_name{$fk_id}$add_tc<br />
後方徴兵都市:$k_kouhou_tyouhei_name{$fk_id}<br />
守備位置:$syubiitic<br />
<hr />
$log_list<hr />
$t_name{$ft_id}城守備数:$t_siro_syubi_suu{$ft_id}<br />
$t_name{$ft_id}の賊砦守備数:$t_toride_syubi_suu{$ft_id}

PRI
	&FOOTER;
	exit;


}

1;