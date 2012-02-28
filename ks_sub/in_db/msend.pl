
sub MOVE {

	if($in{'ckalm'}) {
$in{'ckal'}=1;
	&GET_COOKIE;
	}
	$mcome = "";

	$add_alink=0;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if($in{'mes_id2'}) {
$in{'mes_id'}=$in{'mes_id2'};
	}elsif($in{'mes_id3'}){
$in{'mes_id'}=$in{'mes_id3'};
	}

$KOATE=10;
require "./p_db/tt/kcs4$f_id.pl";
#	if($rank_mes ne ""){$KOATE=20;
#	}


	if ($in{'mes_id'} =~ m/[^0-9a-zA-Z_]/) {
				open(IN,"./w_db/aponx.cgi");
				@NEW_DATA3 = <IN>;
				close(IN);

	unshift(@NEW_DATA3,"$f_id<>$p_name{$f_id}<>$p_keyword{$f_id}<>$host<>$host_name<>\n");

	open(OUT,">./w_db/aponx.cgi");
	print OUT @NEW_DATA3;
	close(OUT);

&ER1("もっと手短に伝言を伝えてください"); }


	if($in{'naiyou'} eq "" and $in{'mes_id'} ne "m_sakujyo") { &ER1("メッセージが記入されていません"); }
	if($in{'mes_id'} eq "") { &ER1("相手が指定されていません"); }
	&MOJISUU($in{'naiyou'},220);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。手紙。$mojisuu_re"); }

	$eiji_kazu = ($in{'naiyou'} =~ tr/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/);
	if($eiji_kazu > 60 and $eiji_kazu > length($in{'naiyou'})*0.8) {
&ER1("英数字＆記号文字列が多すぎます。");
	}
	&P_OPEN;
	if($in{'mes_id'} eq "$f_id") { &ER1("自分には送れません。"); }
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
							$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");
							$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");


    &F_LOCK("messe");
	&TT_GET;


	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES_REG2 = <IN>;
	close(IN);

	if($in{'mes_id'} eq "m_tosi"){
	$add_alink=1;

	open(IN,"./w_db/mati/$p_taizai_iti{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
		$jname = "$t_name{$ft_id}";
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFFFFF\">$p_name{$f_id}</span></a> <a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c87CEEB\">$k_name_d[$p_kunino{$f_id}]</span></a> $rank_mes";

	}elsif($in{'mes_id'} eq "m_sakujyo"){

	@MES_REG2 = ();
	@MES_REGNW = ();
		foreach(@MES_REG2){
			($k11,$k11,$k11,$k11,$k5,$k11,$k11,$k11,$k11,$k11,$tdhit)=split(/<>/);
			if($tdhit + 3600> $tt){
				if($k5 eq "件名：メッセージの削除依頼"){
		&ER1("メッセージ管理システム曰く・・「連続使用禁止ヽ(｀Д´)ノ」");
				}
		push(@MES_REGNW,"$_");
			}
		}
	@MES_REG2 = @MES_REGNW;


	@MES_REG = ();
	@MES_REGNW = ();
	if($gundan_no{$p_gundanno{$f_id}}){
	open(IN,"./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
		foreach(@MES_REG){
			($k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$tdhit)=split(/<>/);
			if($tdhit + 3600> $tt){
		push(@MES_REGNW,"$_");
			}
		}
	open(OUT,">./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	print OUT @MES_REGNW;
	close(OUT);	
	}

	@MES_REG = ();
	@MES_REGNW = ();
	if($butai_no{$p_butaino{$f_id}}){
	open(IN,"./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
		foreach(@MES_REG){
			($k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$tdhit)=split(/<>/);
			if($tdhit + 3600> $tt){
		push(@MES_REGNW,"$_");
			}
		}
	open(OUT,">./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	print OUT @MES_REGNW;
	close(OUT);	
	}

	@MES_REG = ();
	@MES_REGNW = ();
	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
		foreach(@MES_REG){
			($k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$tdhit)=split(/<>/);
			if($tdhit + 3600> $tt){
		push(@MES_REGNW,"$_");
			}
		}
	open(OUT,">./w_db/jyusin/$f_id.cgi");
	print OUT @MES_REGNW;
	close(OUT);	

#	@MES_REG = ();
#	@MES_REGNW = ();
#	open(IN,"./w_db/jyusin/m_$f_id.cgi");
#	@MES_REG = <IN>;
#	close(IN);
#		foreach(@MES_REG){
#			($k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$k11,$tdhit)=split(/<>/);
#			if($tdhit + 3600 > $tt){
#		push(@MES_REGNW,"$_");
#			}
#		}
#	open(OUT,">./w_db/jyusin/m_$f_id.cgi");
#	print OUT @MES_REGNW;
#	close(OUT);	

		$jname = "メッセージ管理システム";
$in{'naiyou'} = "件名：メッセージの削除依頼（1時間以上経過したメッセージに限ります）";
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFFFFF\">$p_name{$f_id}</span></a>";
	}elsif($in{'mes_id'} eq "m_gundan"){
	$add_alink=2;
	open(IN,"./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);


		if(!$gundan_no{$p_gundanno{$f_id}} or $k_kunino{$fk_id} eq "0"){&ER1("無所属/軍団未所属は軍団宛てを使用できません。");}
		$jname = "$gundan_name{$p_gundanno{$f_id}}軍団";
		if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id){
		$u_add ="<span class=\"cFFCC33\"><strong>[軍団長]</strong></span>";
		}else{
		$u_add ="<span class=\"c33CCFF\"><strong>[団員]</strong></span>";
		}
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a> $rank_mes";
	}elsif($in{'mes_id'} eq "m_butai"){
	$add_alink=3;
	open(IN,"./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);


		if(!$butai_no{$p_butaino{$f_id}} or $k_kunino{$fk_id} eq "0"){&ER1("無所属/部隊未所属は部隊宛てを使用できません。");}
		$jname = "$butai_name{$p_butaino{$f_id}}部隊";
		if($butai_yakusyoku_id{$p_butaino{$f_id}}[1] eq $f_id){
		$u_add ="<span class=\"cFFCC33\"><strong>[部隊長]</strong></span>";
		}else{
		$u_add ="<span class=\"c33CCFF\"><strong>[隊員]</strong></span>";
		}
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a> $rank_mes";
	}elsif($in{'mes_id'} =~ /k\_/){
$m_kuni_id=$in{'mes_id'};
$m_kuni_id =~ s/k\_//g;
	open(IN,"./w_db/kuni/$m_kuni_id.cgi");
	@MES_REG = <IN>;
	close(IN);


	if($m_kuni_id ne "$p_kunino{$f_id}"){
	$add_alink=12;
		$jname = "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$m_kuni_id\" target=\"_blank\"><span class=\"c87CEEB\">$k_name_d[$m_kuni_id]</span></a>";
	open(IN,"./w_db/kuni/gaiko_$m_kuni_id.cgi");
	@MES_REG3 = <IN>;
	close(IN);
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a> <a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c87CEEB\">$k_name_d[$p_kunino{$f_id}]</span></a> $rank_mes";
	}else{
	$add_alink=11;
$add_k_name=" / 国内";
			if(!$k_kunino{$fk_id} and $fk_id){
$add_k_name="系・放浪武将";
			}
		$jname = "$k_name_d[$m_kuni_id]$add_k_name";
$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a> $rank_mes";
	}

	}else{
	$add_alink=4;

$p_name{$f_id} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$f_id}</span></a> <a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c87CEEB\">$k_name_d[$p_kunino{$f_id}]</span></a> $rank_mes";
	open(IN,"./w_db/jyusin/$in{'mes_id'}.cgi");
	@MES_REG = <IN>;
	close(IN);
$e_id=$in{'mes_id'};
	&P_READ("p","$e_id","$e_id");
	if(!-e "./p_db/p/$e_id.cgi" and !-e "./p_db/touketu/$e_id.cgi") {&ER2('相手のIDが存在しません。'); }
$jpass=$p_pass{$e_id};
$jid=$p_id{$e_id};
$jname="<a href=\"./?.m.=p_b&amp;.id.=$p_id{$e_id}\" target=\"_blank\"><span class=\"cFFCC33\">$p_name{$e_id}</span></a>";
	}


	unshift(@MES_REG,"$in{'mes_id'}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$u_add$in{'naiyou'}$tt_date<>$jname<>$p_cg_sabano{$f_id}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$p_kunino{$f_id}<>0<>$tt<>\n");
	unshift(@MES_REG2,"$in{'mes_id'}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}$rank_mes<>$u_add$in{'naiyou'}$tt_date<>$jname<>$p_cg_sabano{$f_id}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$p_kunino{$f_id}<>0<>$tt<>\n");


	if($in{'mes_id'} eq "m_tosi"){
splice(@MES_REG , 5);
	open(OUT,">./w_db/mati/$p_taizai_iti{$f_id}.cgi");
	print OUT @MES_REG;
	close(OUT);
	}elsif($in{'mes_id'} eq "m_gundan"){
splice(@MES_REG , 5);
	open(OUT,">./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	print OUT @MES_REG;
	close(OUT);
	}elsif($in{'mes_id'} eq "m_butai"){
splice(@MES_REG , 5);
	open(OUT,">./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	print OUT @MES_REG;
	close(OUT);
	}elsif($in{'mes_id'} eq "m_sakujyo"){
splice(@MES_REG2 , 5);
	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES_REG2;
	close(OUT);

	}elsif($in{'mes_id'} =~ /k\_/){
$m_kuni_id=$in{'mes_id'};
$m_kuni_id =~ s/k\_//g;
splice(@MES_REG , 10);
splice(@MES_REG2 , 5);

	if($m_kuni_id ne $p_kunino{$f_id}) {
	open(IN,"./w_db/guest/msdk_$m_kuni_id.cgi");
	@add_list = <IN>;
	close(IN);
	$hmsdk=0;
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
	if($p_kunino{$f_id} eq $mdsid) { $hmsdk=1; }
			
	}

		if($hmsdk == 0) {
	open(OUT,">./w_db/kuni/$m_kuni_id.cgi");
	print OUT @MES_REG;
	close(OUT);
	unshift(@MES_REG3,"$in{'mes_id'}<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$u_add$in{'naiyou'}$tt_date<>$jname<>$p_cg_sabano{$f_id}<>$p_img{$f_id}$p_img_f{$f_id}<>$p_kunino{$f_id}<>0<>$tt<>\n");
splice(@MES_REG3 , 10);
	open(OUT,">./w_db/kuni/gaiko_$m_kuni_id.cgi");
	print OUT @MES_REG3;
	close(OUT);
	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES_REG2;
	close(OUT);
		}else{
	$mcome = "<br /><br />・・手紙は相手国に届かなかった模様です。<br />相手国は何らかの理由で貴方の国との国交を断絶しています。";
		}
	}else{
	open(OUT,">./w_db/kuni/$m_kuni_id.cgi");
	print OUT @MES_REG;
	close(OUT);
	}

	}else{
splice(@MES_REG , $KOATE);
splice(@MES_REG2 , 5);

	open(IN,"./w_db/guest/msdk_$in{'mes_id'}.cgi");
	@add_list = <IN>;
	close(IN);
	$hmsdk=0;
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
	if($f_id eq $mdsid) { $hmsdk=1; }
			
	}

		if($hmsdk == 0) {
	open(OUT,">./w_db/jyusin/$in{'mes_id'}.cgi");
	print OUT @MES_REG;
	close(OUT);	
		}

	open(OUT,">./w_db/jyusin/s_$f_id.cgi");
	print OUT @MES_REG2;
	close(OUT);
	}


$jname =~ s/<(.*?)>//g;

	&UNLOCK_FILE("messe");

	&HEADER;

$ims{''} = "messe";
$ims{'i'} = "i_m";
	print <<"PRI";
<hr /><span class=\"fs4\">$jnameへ手紙を送信しました。$mcome</span><br /><br />
<form action=\"$COMMAND\#$add_alink\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$ims{$in{'i'}}\" />

<input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>

PRI
	&FOOTER;

	exit;

}
1;