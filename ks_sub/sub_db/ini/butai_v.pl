
sub BUTAI_VW {
	($butai_id{$_[2]},$butai_no{$_[2]},$butai_name{$_[2]},
$butai_kunino{$_[2]},$butai_habatuno{$_[2]},
$butai_keika_t{$_[2]},$butai_kokka_keitai{$_[2]},$butai_yakusyoku_keitai{$_[2]},$butai_tuusan_nensuu{$_[2]},
$butai_timeido{$_[2]},$butai_honjin_iti{$_[2]},$butai_syuugou_id{$_[2]},$butai_syuugou_f{$_[2]},
$butai_sirei_bun{$_[2]},$butai_kanyuu_bun{$_[2]},
$butai_emb_s1_cgno_d{$_[2]},$butai_emb_s1_cg_sabano{$_[2]},
$butai_emb_s2_cgno_d{$_[2]},$butai_emb_s2_cg_sabano{$_[2]},
$butai_emb_s3_cgno_d{$_[2]},$butai_emb_s3_cg_sabano{$_[2]},
$butai_emb_s4_cgno_d{$_[2]},$butai_emb_s4_cg_sabano{$_[2]},
$butai_emb_s5_cgno_d{$_[2]},$butai_emb_s5_cg_sabano{$_[2]},
$butai_yakusyoku_id{$_[2]}[0],$butai_yakusyoku_id{$_[2]}[1],$butai_yakusyoku_id{$_[2]}[2],$butai_yakusyoku_id{$_[2]}[3],$butai_yakusyoku_id{$_[2]}[4],
$butai_yakusyoku_id{$_[2]}[5],$butai_yakusyoku_id{$_[2]}[6],$butai_yakusyoku_id{$_[2]}[7],$butai_yakusyoku_id{$_[2]}[8],$butai_yakusyoku_id{$_[2]}[9],
$butai_yakusyoku_id{$_[2]}[10],$butai_yakusyoku_id{$_[2]}[11],$butai_yakusyoku_id{$_[2]}[12],$butai_yakusyoku_id{$_[2]}[13],$butai_yakusyoku_id{$_[2]}[14],
$butai_yakusyoku_id{$_[2]}[15],$butai_yakusyoku_id{$_[2]}[16],$butai_yakusyoku_id{$_[2]}[17],$butai_yakusyoku_id{$_[2]}[18],$butai_yakusyoku_id{$_[2]}[19],
$butai_yakusyoku_id{$_[2]}[20],$butai_yakusyoku_id{$_[2]}[21],$butai_yakusyoku_id{$_[2]}[22],$butai_yakusyoku_id{$_[2]}[23],$butai_yakusyoku_id{$_[2]}[24],
$butai_yakusyoku_id{$_[2]}[25],$butai_yakusyoku_id{$_[2]}[26],$butai_yakusyoku_id{$_[2]}[27],$butai_yakusyoku_id{$_[2]}[28],$butai_yakusyoku_id{$_[2]}[29],
$butai_sinki_f{$_[2]},
$butai_busyou_suu{$_[2]},
$butai_sou_kunkou{$_[2]},
$butai_jyoutai_f{$_[2]}[0],$butai_jyoutai_f{$_[2]}[1],$butai_jyoutai_f{$_[2]}[2],$butai_jyoutai_f{$_[2]}[3],$butai_jyoutai_f{$_[2]}[4],
$butai_jyoutai_f{$_[2]}[5],$butai_jyoutai_f{$_[2]}[6],$butai_jyoutai_f{$_[2]}[7],$butai_jyoutai_f{$_[2]}[8],$butai_jyoutai_f{$_[2]}[9],
$butai_jyoutai_c{$_[2]}[0],$butai_jyoutai_c{$_[2]}[1],$butai_jyoutai_c{$_[2]}[2],$butai_jyoutai_c{$_[2]}[3],$butai_jyoutai_c{$_[2]}[4],
$butai_jyoutai_c{$_[2]}[5],$butai_jyoutai_c{$_[2]}[6],$butai_jyoutai_c{$_[2]}[7],$butai_jyoutai_c{$_[2]}[8],$butai_jyoutai_c{$_[2]}[9],
$butai_kuesuto_f1{$_[2]},$butai_kuesuto_f2{$_[2]},$butai_kuesuto_f3{$_[2]},$t_k_kuesuto_f4{$_[2]},$butai_kuesuto_f5{$_[2]},
$butai_kouryaku_mokuhyou{$_[2]}[0],$butai_kouryaku_kome{$_[2]}[0],
$butai_kouryaku_mokuhyou{$_[2]}[1],$butai_kouryaku_kome{$_[2]}[1],
$butai_kouryaku_mokuhyou{$_[2]}[2],$butai_kouryaku_kome{$_[2]}[2],
$butai_mokuhyou_kuni{$_[2]}[0],$butai_mokuhyou_tosi{$_[2]}[0],
$butai_mokuhyou_kuni{$_[2]}[1],$butai_mokuhyou_tosi{$_[2]}[1],
$butai_mokuhyou_kuni{$_[2]}[2],$butai_mokuhyou_tosi{$_[2]}[2],
$butai_kokko_kin{$_[2]},$butai_kokko_kome{$_[2]},$butai_kokko_sougaku{$_[2]},
$butai_sakusen{$_[2]}[0],$butai_sakusen{$_[2]}[1],$butai_sakusen{$_[2]}[2],
$butai_sakusen{$_[2]}[0],$butai_sakusen{$_[2]}[1],$butai_sakusen{$_[2]}[2],
$butai_gogyou_ka{$_[2]},$butai_gogyou_sui{$_[2]},$butai_gogyou_moku{$_[2]},$butai_gogyou_kin{$_[2]},$butai_gogyou_do{$_[2]},
$butai_ex_karumalc{$_[2]},$butai_ex_karumald{$_[2]},
$butai_op_hei_syu{$_[2]}[0],$butai_op_hei_syu{$_[2]}[1],$butai_op_hei_syu{$_[2]}[2],$butai_op_hei_syu{$_[2]}[3],$butai_op_hei_syu{$_[2]}[4],
$butai_op_hei_syu{$_[2]}[5],$butai_op_hei_syu{$_[2]}[6],$butai_op_hei_syu{$_[2]}[7],$butai_op_hei_syu{$_[2]}[8],$butai_op_hei_syu{$_[2]}[9],
$butai_jyoutai_f{$_[2]}[0],$butai_jyoutai_f{$_[2]}[1],$butai_jyoutai_f{$_[2]}[2],$butai_jyoutai_f{$_[2]}[3],$butai_jyoutai_f{$_[2]}[4],
$butai_jyoutai_f{$_[2]}[5],$butai_jyoutai_f{$_[2]}[6],$butai_jyoutai_f{$_[2]}[7],$butai_jyoutai_f{$_[2]}[8],$butai_jyoutai_f{$_[2]}[9],
$butai_jyoutai_c{$_[2]}[0],$butai_jyoutai_c{$_[2]}[1],$butai_jyoutai_c{$_[2]}[2],$butai_jyoutai_c{$_[2]}[3],$butai_jyoutai_c{$_[2]}[4],
$butai_jyoutai_c{$_[2]}[5],$butai_jyoutai_c{$_[2]}[6],$butai_jyoutai_c{$_[2]}[7],$butai_jyoutai_c{$_[2]}[8],$butai_jyoutai_c{$_[2]}[9],
$butai_kuesuto_f1{$_[2]},$butai_kuesuto_f2{$_[2]},$butai_kuesuto_f3{$_[2]},$butai_kuesuto_f4{$_[2]},$butai_kuesuto_f5{$_[2]},
$butai_keika_nen{$_[2]},
$butai_yomikaki{$_[2]}) = split(/,/,$butai_db_view[0]);
}
1;
