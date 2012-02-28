
sub P_B_1 {
	$add_p_come = "
<div class=\"p_b_div\">
<div class=\"p_b_block1\">

<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"100%\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td width=\"96\"></td><td width=\"39\"></td><td class=\"txth\" width=\"85\"></td><td width=\"39\"></td><td class=\"txth\" width=\"85\"></td><td width=\"39\"></td><td class=\"txth\" width=\"85\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"7\"><span class=\"kcc$k_iro_d{$fk_id}\">$p_name{$f_id}</span></td></tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td rowspan=\"5\">$img_sakusei_kekka</td><td>武力</td><td class=\"txth\">$p_buryoku{$f_id}</td><td>知力</td><td class=\"txth\">$p_tiryoku{$f_id}</td><td>統率力</td><td class=\"txth\">$p_tousotu{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td><td>総合力</td><td class=\"txth\">$p_sougou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>年齢</td><td class=\"txth\">$khsn1</td><td>性別</td><td class=\"txth\">$khsn2</td><td>風評</td><td class=\"txth\">$HUUHYOU[$p_sekentei{$f_id}]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>爵位</td><td class=\"txth\">$LANK[$p_syakui{$f_id}]</td><td>勲功</td><td class=\"txth\">$p_kunkou{$f_id}</td><td>忠誠</td><td class=\"txth\">$p_tyuusei{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td colspan=\"2\" class=\"txtc\">Last login</td><td colspan=\"4\" class=\"txtc\">$tt_date</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>傭兵評価価値</td><td class=\"txth\" colspan=\"2\">$p_youhei_hyouka{$f_id}</td><td>所在</td><td class=\"txth\">$t_name[$p_taizai_iti{$f_id}]</td><td>体力</td><td class=\"txth\">$p_tairyoku{$f_id}</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属国</td><td class=\"txth\" colspan=\"2\">$k_p_k_a{$fk_id}</td><td>従年数</td><td class=\"txth\">$p_kuni_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\">$rank_mes</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属派閥</td><td class=\"txth\" colspan=\"2\">$habatu_name[$p_habatuno{$f_id}]</td><td>従年数</td><td class=\"txth\">$p_habatu_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\"></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属ギルド</td><td class=\"txth\" colspan=\"2\">$guild_name[$p_guildno{$f_id}]</td><td>従年数</td><td class=\"txth\">$p_guild_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\"></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属軍団</td><td class=\"txth\" colspan=\"2\">$gundan_name[$p_gundanno{$f_id}]</td><td>従年数</td><td class=\"txth\">$p_gundan_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\">$GUNDAN_KANBU[$p_gundan_yakusyoku{$f_id}]</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属部隊</td><td class=\"txth\" colspan=\"2\">$butai_name[$p_butaino{$f_id}]</td><td>従年数</td><td class=\"txth\">$p_butai_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\">$BUTAI_KANBU[$p_butai_yakusyoku{$f_id}]</td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属パーティー</td><td class=\"txth\" colspan=\"2\">$pt_name[$p_ptno{$f_id}]</td><td>従年数</td><td class=\"txth\">$p_pt_sikan_nensuu{$f_id}</td><td>役職</td><td class=\"txth\"></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>入国許可\</td><td class=\"txth\" colspan=\"6\"></td></tr>
</table>
</div><div class=\"p_b_block2\">
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txtr\"></td><td class=\"txtr\" width=\"68\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"3\">$old_date</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>総合/順位</td><td class=\"txtr\">$rsougoup</td><td class=\"txtr\">$rsougouj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>武力/順位</td><td class=\"txtr\">$rbujyokup</td><td class=\"txtr\">$rbujyokuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>知力/順位</td><td class=\"txtr\">$rtiryokup</td><td class=\"txtr\">$rtiryokuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>統率/順位</td><td class=\"txtr\">$rtousotup</td><td class=\"txtr\">$rtousotuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>十種/順位</td><td class=\"txtr\">$rjyussyup</td><td class=\"txtr\">$rjyussyuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>資産/順位</td><td class=\"txtr\">$rsisanp</td><td class=\"txtr\">$rsisanj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>名声/順位</td><td class=\"txtr\">$rn_meiseip</td><td class=\"txtr\">$rn_meiseij位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>撃破/順位</td><td class=\"txtr\">$rgekihap</td><td class=\"txtr\">$rgekihaj位</td></tr>
</table>
";

}
sub P_B_2 {
	$add_p_come = "
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"750\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">将兵</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"10%\">兵種</td><td class=\"txth\" width=\"10%\">$SOL_TYPE[$p_heisyu{$f_id}]</td><td width=\"10%\">兵士数</td><td class=\"txth\" width=\"10%\">$p_heisisuu{$f_id}/$p_heisisuu_max{$f_id}</td><td width=\"10%\">負傷兵数</td><td class=\"txth\" width=\"10%\">$p_heisisuu_husyou{$f_id}</td><td width=\"10%\">訓練</td><td class=\"txth\" width=\"10%\">$p_kunren{$f_id}/$p_kunren_max{$f_id}</td><td width=\"10%\">士気</td><td class=\"txth\" width=\"10%\">$p_hei_siki{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>使役兵</td><td class=\"txth\">$SOL_TYPE{$p_sieki_heisyu{$f_id}}</td><td>使役兵数</td><td class=\"txth\">$p_sieki_heisisuu{$f_id}/$p_sieki_heisisuu_max{$f_id}</td><td>使役負傷兵</td><td class=\"txth\">$p_sieki_heisisuu_husyou{$f_id}</td><td>使役兵訓練</td><td class=\"txth\">$p_sieki_kunren{$f_id}/$p_sieki_kunren_max{$f_id}</td><td>指揮形態</td><td class=\"txth\">$SIKIKEITAI[$p_jintousiki{$f_id}]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵：行軍</td><td class=\"txth\">$HEIKOUGUN[$p_h_kougun{$f_id}]</td><td>兵：速度</td><td class=\"txth\">$p_h_idou_sokudo{$f_id}</td><td>兵：疲労</td><td class=\"txth\">$p_h_hirou{$f_id}</td><td>兵：状態</td><td class=\"txth\" colspan=\"3\">$h_st_w{$f_id}</td></tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>将：行軍</td><td class=\"txth\">$BUKOUGUN[$p_b_kougun{$f_id}]</td><td>将：速度</td><td class=\"txth\">$p_b_idou_sokudo{$f_id}</td><td>将：疲労</td><td class=\"txth\">$p_b_hirou{$f_id}</td><td>将：状態</td><td class=\"txth\" colspan=\"3\">$b_st_w{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>将：HP</td><td class=\"txth\">$p_busyou_hp{$f_id}</td><td>将：MP</td><td class=\"txth\">$p_busyou_mp{$f_id}</td><td>将：SP</td><td class=\"txth\">$p_busyou_sp{$f_id}</td><td>将：方針１</td><td class=\"txth\">$BUHOUSIN[$p_jyoujihousin1{$f_id}]</td><td>将：方針２</td><td class=\"txth\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">輸送隊</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>形態</td><td class=\"txth\">$p_yusou_keitai{$f_id}</td><td>移動速度</td><td class=\"txth\">$p_yusou_idousokudo{$f_id}</td><td>防衛力</td><td class=\"txth\">$p_yusou_hp{$f_id}</td><td>積載量</td><td class=\"txth\"></td><td>疲労</td><td class=\"txth\"></td></tr>

</table>

<br />
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"750\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">パラメータ詳細１</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"10%\">民族</td><td class=\"txth\" width=\"10%\">$MINZOKUSAN[$p_minzoku{$f_id}]</td><td width=\"10%\">民族品格</td><td class=\"txth\" width=\"10%\">$p_minzoku_hinkaku{$f_id}</td><td width=\"10%\">使役力</td><td class=\"txth\" width=\"10%\">$p_karisuma{$f_id}</td><td width=\"10%\">容姿</td><td class=\"txth\" width=\"10%\">$p_yousi{$f_id}</td><td width=\"10%\">言葉巧み</td><td class=\"txth\" width=\"10%\">$p_kotobadakumi{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>義理</td><td class=\"txth\">$p_exgiri{$f_id}</td><td>野望</td><td class=\"txth\">$p_exyabou{$f_id}</td><td>勇猛</td><td class=\"txth\">$p_exbrave{$f_id}</td><td>冷静</td><td class=\"txth\">$p_excalm{$f_id}</td><td>幸運</td><td class=\"txth\">$p_exluck{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>精神力</td><td class=\"txth\">$p_seisin{$f_id}</td><td>集中力</td><td class=\"txth\">$p_syuutyuu{$f_id}</td><td>忍耐</td><td class=\"txth\">$p_nintai{$f_id}</td><td>信仰心</td><td class=\"txth\">$p_sinkousin{$f_id}</td><td>自制心</td><td class=\"txth\">$p_jiseisin{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>予知</td><td class=\"txth\">$p_yoti{$f_id}</td><td>危険察知</td><td class=\"txth\">$p_kikensatti{$f_id}</td><td>発明力</td><td class=\"txth\">$p_dokusousei{$f_id}</td><td>動物懐柔</td><td class=\"txth\">$p_doubutu_tekisei{$f_id}</td><td>工学適正</td><td class=\"txth\">$p_kougaku_tekisei{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>品格教養</td><td class=\"txth\">$p_kyouyou{$f_id}</td><td>記憶</td><td class=\"txth\">$p_kiokuryoku{$f_id}</td><td>社交性</td><td class=\"txth\">$p_syakousei{$f_id}</td><td>威風</td><td class=\"txth\">$p_ihuu{$f_id}</td><td>気迫</td><td class=\"txth\">$p_kihaku{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"10%\">騎乗能力</td><td class=\"txth\" width=\"10%\">$p_kijyou{$f_id}</td><td width=\"10%\">射撃能力</td><td class=\"txth\" width=\"10%\">$p_syageki{$f_id}</td><td width=\"10%\">武術</td><td class=\"txth\" width=\"10%\">$p_bujyutu{$f_id}</td><td width=\"10%\">呪術能力</td><td class=\"txth\" width=\"10%\">$p_jyujyutu{$f_id}</td><td width=\"10%\">諜報能力</td><td class=\"txth\" width=\"10%\">$p_tyouhou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>重機操舵</td><td class=\"txth\">$p_jyuukisouda{$f_id}</td><td>調教技術</td><td class=\"txth\">$p_tyoukyou{$f_id}</td><td>人望</td><td class=\"txth\">$p_jinbou{$f_id}</td><td>政治力</td><td class=\"txth\">$p_seiji{$f_id}</td><td>商才</td><td class=\"txth\">$p_sinyou{$f_id}</td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">パラメータ詳細２</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>腕力</td><td class=\"txth\">$p_busyou_str{$f_id}</td><td>器用さ</td><td class=\"txth\">$p_busyou_dex{$f_id}</td><td>俊敏さ</td><td class=\"txth\">$p_busyou_agr{$f_id}</td><td>+律/-混</td><td class=\"txth\">$p_ex_karumalc{$f_id}</td><td>+光/-闇</td><td class=\"txth\">$p_ex_karumald{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>neutral名声</td><td class=\"txth\">$p_neutral_meisei{$f_id}</td><td>law名声</td><td class=\"txth\">$p_law_meisei{$f_id}</td><td>chaos名声</td><td class=\"txth\">$p_chaos_meisei{$f_id}</td><td>light名声</td><td class=\"txth\">$p_light_meisei{$f_id}</td><td>dark名声</td><td class=\"txth\">$p_dark_meisei{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>秘技ex</td><td class=\"txth\">$p_neutral_ex{$f_id}</td><td>聖技ex</td><td class=\"txth\">$p_law_ex{$f_id}</td><td>邪技ex</td><td class=\"txth\">$p_chaos_ex{$f_id}</td><td>光技ex</td><td class=\"txth\">$p_light_ex{$f_id}</td><td>闇技ex</td><td class=\"txth\">$p_dark_ex{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>火の行</td><td class=\"txth\">$p_gogyou_ka{$f_id}</td><td>水の行</td><td class=\"txth\">$p_gogyou_sui{$f_id}</td><td>木の行</td><td class=\"txth\">$p_gogyou_moku{$f_id}</td><td>金の行</td><td class=\"txth\">$p_gogyou_kin{$f_id}</td><td>土の行</td><td class=\"txth\">$p_gogyou_do{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>火技ex</td><td class=\"txth\">$p_gogyou_ka_ex{$f_id}</td><td>水技ex</td><td class=\"txth\">$p_gogyou_sui_ex{$f_id}</td><td>木技ex</td><td class=\"txth\">$p_gogyou_moku_ex{$f_id}</td><td>金技ex</td><td class=\"txth\">$p_gogyou_kin_ex{$f_id}</td><td>土技ex</td><td class=\"txth\">$p_gogyou_do_ex{$f_id}</td></tr>

<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">パラメータ詳細３</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>Skill - 1</td><td class=\"txth\" colspan=\"3\">$SUKIRU[$kjob1]</td><td>S-1 Lv</td><td class=\"txth\">$kjob1ex</td><td>S-1 ex</td><td class=\"txth\">$p_skill_ex{$f_id}[0]</td><td></td><td class=\"txth\"></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>Skill - 2</td><td class=\"txth\" colspan=\"3\">$SUKIRU[$kjob2]</td><td>S-2 Lv</td><td class=\"txth\">$kjob2ex</td><td>S-2 ex</td><td class=\"txth\">$p_skill_ex{$f_id}[1]</td><td></td><td class=\"txth\"></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>Skill - 3</td><td class=\"txth\" colspan=\"3\">$SUKIRU[$kjob3]</td><td>S-3 Lv</td><td class=\"txth\">$kjob3ex</td><td>S-3 ex</td><td class=\"txth\">$p_skill_ex{$f_id}[2]</td><td></td><td class=\"txth\"></td></tr>



<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">キャラクター紹介</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>特技</td><td colspan=\"9\" class=\"txtc\">$khsn3</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>背景</td><td colspan=\"9\" class=\"txtc\">
<table>
<tr><td class=\"msp\">
$khsn4
</td></tr>
</table>
</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>紹介文</td><td colspan=\"9\" class=\"txtc\">
<table>
<tr><td class=\"msp\">
$khsnp
</td></tr>
</table>
</td></tr>
</table>
<br />
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"750\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td width=\"75\"></td><td class=\"txth\" width=\"225\"></td><td width=\"30\"></td><td class=\"txth\" width=\"30\"></td><td width=\"30\"></td><td class=\"txth\" width=\"95\">$p_souda{$f_id}</td><td width=\"45\"></td><td class=\"txth\" width=\"30\"></td><td width=\"60\"></td><td class=\"txth\" width=\"100\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">装備品</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>武器(右)</td><td class=\"txth\">・$item_name{$p_migite{$f_id}}（+$p_migite_lv{$f_id}）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_migite{$f_id}}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_migite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_migite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>武器(左)</td><td class=\"txth\">・$item_name{$p_hidarite{$f_id}}（+$p_hidarite_lv{$f_id}）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_hidarite{$f_id}}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>書物</td><td class=\"txth\">・$item_name{$p_syomotu{$f_id}}（+$p_syomotu_lv{$f_id}）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_syomotu{$f_id}}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>愛馬</td><td class=\"txth\">・$item_name{$p_norimono{$f_id}}（+$p_norimono_lv{$f_id}）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_norimono{$f_id}}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>衣服</td><td class=\"txth\">・$item_name{$p_ihuku{$f_id}}（+$p_ihuku_lv{$f_id}）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_ihuku{$f_id}}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>装飾１</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[0]}（+$p_akusesari_b_lv{$f_id}[0]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[0]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>装飾２</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[1]}（+$p_akusesari_b_lv{$f_id}[1]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[1]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>装飾３</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[2]}（+$p_akusesari_b_lv{$f_id}[2]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[2]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>装飾４</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[3]}（+$p_akusesari_b_lv{$f_id}[3]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[3]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>装飾５</td><td class=\"txth\">・$item_name{$p_akusesari_b{$f_id}[4]}（+$p_akusesari_b_lv{$f_id}[4]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[4]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>

<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"10\"><span class=\"kcc$k_iro_d{$fk_id}\">兵装</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵装１</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[0]}（+$p_akusesari_h_lv{$f_id}[0]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[0]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵装２</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[1]}（+$p_akusesari_h_lv{$f_id}[1]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[1]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵装３</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[2]}（+$p_akusesari_h_lv{$f_id}[2]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[2]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵装４</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[3]}（+$p_akusesari_h_lv{$f_id}[3]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[3]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵装５</td><td class=\"txth\">・$item_name{$p_akusesari_h{$f_id}[4]}（+$p_akusesari_h_lv{$f_id}[4]）</td><td>性能</td><td class=\"txth\">$item_seinou{$p_akusesari_b{$f_id}[4]}</td><td>種別</td><td class=\"txth\">$p_souda{$f_id}</td><td>破損度</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td><td>異常形態</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
</table>
<br />

<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"750\">
<tr><td width=\"75\"></td><td class=\"txth\" width=\"225\"></td><td width=\"30\"></td><td class=\"txth\" width=\"30\"></td><td width=\"30\"></td><td class=\"txth\" width=\"95\"></td><td width=\"60\"></td><td class=\"txth\" width=\"180\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"8\"><span class=\"kcc$k_iro_d{$fk_id}\">副将</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>副将１</td><td class=\"txth\"></td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\"></td><td>行動目標</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>副将２</td><td class=\"txth\"></td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\"></td><td>行動目標</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>副将３</td><td class=\"txth\"></td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\"></td><td>行動目標</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>副将４</td><td class=\"txth\"></td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\"></td><td>行動目標</td><td class=\"txth\">$p_hidarite_hason{$f_id}</td></tr>

<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"8\"><span class=\"kcc$k_iro_d{$fk_id}\">神獣</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>神獣１</td><td class=\"txth\">$p_pet_name{$f_id}[0]</td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\">$jyuu[$p_pet_type{$f_id}[0]]</td><td>行動目標</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>神獣２</td><td class=\"txth\">$p_pet_name{$f_id}[1]</td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\">$jyuu[$p_pet_type{$f_id}[1]]</td><td>行動目標</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>神獣３</td><td class=\"txth\">$p_pet_name{$f_id}[2]</td><td>忠誠</td><td class=\"txth\"></td><td>種別</td>$jyuu[$p_pet_type{$f_id}[2]]<td class=\"txth\"></td><td>行動目標</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>神獣４</td><td class=\"txth\">$p_pet_name{$f_id}[3]</td><td>忠誠</td><td class=\"txth\"></td><td>種別</td><td class=\"txth\">$jyuu[$p_pet_type{$f_id}[3]]</td><td>行動目標</td><td class=\"txth\">$p_hidarite_ijyou{$f_id}</td></tr>
</table>

<br />


<table width=\"750\">
<tr><td class=\"bgcF8F0E0\">$p_name{$f_id}の伝記</td></tr>
<tr><td class=\"bgcF8F0E0\">$S_MES</td></tr>
</table>

<br /><br /><br />

<table class=\"bgc000080\" width=\"750\">
<tr class=\"bgc000080\"><td width=\"75\"></td><td width=\"670\"></td></tr>
<tr class=\"bgcF8F0E0\"><td class=\"txth\" colspan=\"2\">$p_name{$f_id}の中の人</td></tr>

<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>URL<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hk<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>e-mail<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hy<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>ICQ<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hc<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>IRC<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hi<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>職業<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$h1<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>住所<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$h2<span class=\"cF8F0E0\">・</span></td></tr>

<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>年齢<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$h3<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>性別<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hyj<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>趣味<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hsj<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>特技<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hgj<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>好きな物<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$htr<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>嫌いな物<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span>$hmg<span class=\"cF8F0E0\">・</span></td></tr>
<tr class=\"bgcF8F0E0\"><td><span class=\"cF8F0E0\">・</span>PR文<span class=\"cF8F0E0\">・</span></td><td><span class=\"cF8F0E0\">・</span><span class=\"msp\">$hsk</span><span class=\"cF8F0E0\">・</span></td></tr>
</table>

";

}
1;