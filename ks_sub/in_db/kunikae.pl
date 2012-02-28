
sub MOVE {


							$in{'sel'} = abs(int($in{'sel'}));
	if($in{'sel'} >2) { &ER1("選択されていません"); }

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";


require "./$mpg_r/sub_db/kakuduke.pl";


	open(IN,"./w_db/jyusin/m_$f_id.cgi");
	@MES = <IN>;
	close(IN);

	$mes_num1 = @MES;
	$in{'idno'} = abs(int($in{'idno'}));

	if($in{'idno'} >= $mes_num1) { &ER1("その手紙は存在しません。"); }

		($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni) = split(/<>/,$MES[$in{'idno'}]);

	$e_id=$messe_f_id;
	&P_READ("p","$e_id","$e_id");


		$add_knok = $k_kunino{$messe_f_kuni};

		$ek_id = $p_kunino{$e_id};
	&K_READ("kuni_db","$ek_id","$ek_id");

	&TT_GET;

	if(!$in{'sel'}){

if($k_kokusaku{$k_kunino{$p_kunino{$f_id}}} eq "9"){
	&ER1("$k_name{$p_kunino{$f_id}}は鎖国体制をしいています。関所の監視が厳しく寝返ることができません…。");
}
	if($p_exgiri{$f_id} < 30) { &ER1("相手国の天子に拒否されました。義理の値が低すぎます。下野してから通常仕官してください。<br />登用分を受諾できるのは義理30以上の武将のみです。<br />義理の値は一箇所に長期間仕えることで上昇します。<br /><br />注：寝返りや下野ばかりしていると仕官先がなくなります。"); }

	if(!$p_id{$e_id}) { &ER1('登用もとの武将が存在しません。'); }
	if(!$k_kunino{$p_kunino{$e_id}}){&ER1('登用もとの国が滅んでいます。'); }

if($k_kokusaku{$k_kunino{$ek_id}} eq "8"){
	&ER1("$k_name{$ek_id}は国策：聖戦を発動させています。国境付近で門前払いされました…。");
}
	open(IN,"./w_db/k_sikan_kyozetu.cgi");
	@B_LIST = <IN>;
	close(IN);
	foreach(@B_LIST){
		($bid,$bcon,$bname,$bsub) = split(/<>/);
		if($bid eq $f_id and $bcon eq $p_kunino{$e_id} and $e_id ne $k_yakusyoku_id{$ek_id}[15] and $e_id ne $k_yakusyoku_id{$ek_id}[1] and $e_id ne $k_yakusyoku_id{$ek_id}[2] and $e_id ne $k_yakusyoku_id{$ek_id}[3]){
			&ER1("その国への仕官は拒否されました。");
		}
	}


################

							$in{'type'} = abs(int($in{'type'}));
$a_a_d="kunikae<>0<>$p_name{$e_id}の誘いを受け$k_name{$ek_id}へ仕官 <><>$f_id<><>$in{'type'}<>$e_id<>$add_knok<>$in{'idno'}<><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$p_name{$e_id}の誘いを受け$k_name{$ek_id}へ仕官 を<br />アクティブコマンドとして予約しました。";

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



	}elsif($in{'sel'} eq "2"){
		$xyz = "$p_name{$f_id}は$p_name{$e_id}からの密書を破り捨てました。";
		$res_mes = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a>は<a href=\"./?.m.=p_b&amp;.id.=$p_id{$p_id{$e_id}}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$e_id}</span></a>からの密書を破り捨てました。";
		$p_name{$e_id} = "メッセージ管理システム";

	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES2 = <IN>;
	close(IN);
	open(IN,"./w_db/jyusin/$p_id{$e_id}.cgi");
	@MES3 = <IN>;
	close(IN);

	unshift(@MES2,"$p_id{$e_id}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}$rank_mes<>$res_mes<>$p_name{$e_id}<>$tt_date<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>$messe_f<>$messe_tt<>\n");

splice(@MES3 , 5);
splice(@MES2 , 5);

splice(@MES , $in{'idno'}, 1);
	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES2;
	close(OUT);
	open(OUT,">./w_db/jyusin/$p_id{$e_id}.cgi");
	print OUT @MES3;
	close(OUT);
	open(OUT,">./w_db/jyusin/m_$f_id.cgi");
	print OUT @MES;
	close(OUT);
	}else{
		$xyz = "$p_name{$f_id}は$p_name{$e_id}からの誘いを丁重に断りました。";
		$res_mes = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a>は<a href=\"./?.m.=p_b&amp;.id.=$p_id{$p_id{$e_id}}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$e_id}</span></a>からの誘いを丁重に断りました。";


	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES2 = <IN>;
	close(IN);
	open(IN,"./w_db/jyusin/$p_id{$e_id}.cgi");
	@MES3 = <IN>;
	close(IN);
	unshift(@MES3,"$p_id{$e_id}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$res_mes<>$p_name{$e_id}<>$tt_date<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>$messe_f<>$messe_tt<>\n");
	unshift(@MES2,"$p_id{$e_id}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}$rank_mes<>$res_mes<>$p_name{$e_id}<>$tt_date<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>$messe_f<>$messe_tt<>\n");


splice(@MES3 , 5);
splice(@MES2 , 5);

splice(@MES , $in{'idno'}, 1);
	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES2;
	close(OUT);
	open(OUT,">./w_db/jyusin/$p_id{$e_id}.cgi");
	print OUT @MES3;
	close(OUT);
	open(OUT,">./w_db/jyusin/m_$f_id.cgi");
	print OUT @MES;
	close(OUT);
	}


$ims{''} = "messe";
$ims{'i'} = "i_m";
	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$ims{$in{'i'}}\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


	exit;

}
1;