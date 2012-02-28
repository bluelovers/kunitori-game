
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "$mpg_r/sub_db/tw.pl";

$datev2.="
<script type=\"text/javascript\" src=\"$CSS_URI/messe.js\"></script>
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/messe.css\" />
";
$datev4.="msid='$in{'id'}';mspass='$in{'pass'}';";

#function nameins(hfname,hfname2){
#	document.hfname.elements[1].value = document.hfname.elements[1].value + hfname2;
#}
	open(IN,"./w_db/gundan_list.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);


							$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");
							$fbutai_id = $p_butaino{$f_id};
	&BUTAI_OPEN("butai_db","$fbutai_id","$fbutai_id");

	$sendlist = "";
	$sendlist2 = "";
	$sendlist_gaikou = "<option value=\"\">外交権限がありません</option>";
	$sendlist_friend = "<option value=\"\">お気に入り武将未登録</option>";

	open(IN,"./w_db/guest/msbk_$f_id.cgi");
	@add_list = <IN>;
	close(IN);
		if (@add_list){
			$sendlist_friend = "";
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
			$koate_l{$mdsid} = $mdsname;
			$add_okiniiri{$mdsid} = 1;
			$sendlist_friend .= "<option value=\"$mdsid\">$mdsnameへ</option>";
	}
		}
			$addc_okiniiri{"1"} = "お気に入り登録解除";
			$addc_okiniiri{""} = "お気に入り登録";
$KOATE=10;

$add_gaiko_f{$k_yakusyoku_id{$fk_id}[24]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[1]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[2]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[3]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[4]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[5]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[6]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[16]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[17]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[18]}=1;
	if($add_gaiko_f{$f_id}){

	$sendlist_gaikou = "";
		foreach(@k_seizon_l){
		$ek_id=$_;

			$koate_l_k{$ek_id} = $k_name_d[$ek_id];
			$sendlist_gaikou .= "<option value=\"k_$ek_id\">$k_name_d[$ek_id]へ</option>";

		}
	$sendlist2 = $sendlist_gaikou;
	}

	$jyusin_m = "";
	$sousin_m = "";
	$tosiate_m = "";
	$gundan_mes = "";
	$butai_mes = "";
	$kuniate_m = "";

	if($gundan_no{$p_gundanno{$f_id}}){$gundan_name = "$gundan_name{$fgundan_id}/ ";
	open(IN,"./w_db/gundan_m/l$fgundan_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "g0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","");
			$gundan_mes .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFA500\"><strong>$messe_e_name・$messe_f_nameから$p_name{$f_id}へ</strong></span><br /><span class=\"cFFFFFF\">「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>


<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>
";
			$koate_l_gundan{$messe_f_id} = $messe_f_name;



	$add_no ++;
	$w_mes_i ++;
		}
	$sendlist .= "<option value=\"m_gundan\">$gundan_name軍団の人へ</option>";
	}else{$gundan_name = "未所属 / ";
	}

	if($butai_no{$p_butaino{$f_id}}){$butai_name = "$butai_name{$fbutai_id}/ ";
	open(IN,"./w_db/butai_m/l$fbutai_id\_k$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "b0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","返信はここをクリック");
			$butai_mes .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFA500\"><strong>$messe_e_name・$messe_f_nameから$p_name{$f_id}へ</strong></span><br /><span class=\"cFFFFFF\">「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";

			$koate_l_butai{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}
	$sendlist .= "<option value=\"m_butai\">$butai_name部隊の人へ</option>";
	}else{$butai_name = "未所属 / ";
	}

	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "j0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","返信はここをクリック");
			$jyusin_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFFFFF\"><strong><span class=\"cFFA500\">$messe_f_name\@$t_name[$messe_f_taizai_iti]</span>から$messe_e_nameへ</strong> <br />「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";

			$koate_l{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}
	open(IN,"./w_db/jyusin/s_$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "s0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","返信はここをクリック");
			$sousin_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"c87CEEB\"><strong>$p_name{$f_id}から$messe_e_nameへ</strong></span><br /><span class=\"cFFFFFF\">「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";

			$koate_l{$messe_e_id} = $messe_e_name;
	$add_no ++;
	$w_mes_i ++;
		}

	open(IN,"./w_db/mati/$p_taizai_iti{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "t0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","返信はここをクリック");
			$tosiate_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFFFFF\"><strong>$messe_f_name\@$t_name[$messe_f_taizai_iti]から</strong><br />「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";
			$koate_l_mati{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}



	open(IN,"./w_db/kuni/$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "k0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","");
			$kuniate_m .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFCC33\"><strong>	$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ</strong></span><br /><span class=\"cFFFFFF\">「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";
			$koate_l_kuni{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}

	open(IN,"./w_db/kuni/gaiko_$p_kunino{$f_id}.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "gaiko0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","");
			$kuniate_m2 .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><span class=\"cFFCC33\"><strong>	$messe_f_name\@$t_name[$messe_f_taizai_iti]から$messe_e_nameへ</strong></span><br /><span class=\"cFFFFFF\">「<strong>$messe_naiyou</strong>」<br /></span></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div><div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"bk$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>";
			$koate_l_gaikou{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}

	@NEWADD = ();
	$hit = 0;
	$i = 0;
	open(IN,"./w_db/jyusin/m_$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "m0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
			if($messe_f_kuni eq $p_kunino{$f_id}){
			push(@NEWADD,"$MES_REG[$w_mes_i]");
			}elsif($k_kunino[$messe_f_kuni] and -e "./p_db/p/$messe_f_id.cgi"){
	&IMG_B_CG_SAKUSEI("$messe_f_cg_d","$img_wide","$img_height","$p_img_mime{$messe_f_cg_sabano}","cg_$add_no","$messe_f_id","0","#000000","","","","");
			$touyou_bun .= "<tr class=\"bgc000000\"><td width=\"100%\" ondblclick=\"hensin('$add_no');\" title=\"ダブルクリックで返信\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".idno.\" value=\"$i\" /><input type=\"hidden\" name=\".m.\" value=\"kunikae\" /><span class=\"cFFFFFF\"><strong><span class=\"c87CEEB\">$messe_f_nameが$k_name_d[$messe_f_kuni]への仕官を勧めています。</span><br /></strong>「<strong>$messe_naiyou</strong>」<br /><input type=\"radio\" name=\".sel.\" value=\"0\" />承諾<input type=\"radio\" name=\".sel.\" value=\"1\" />断る<input type=\"radio\" name=\".sel.\" value=\"2\" />無視<input type=\"submit\" value=\"返答\" /></span></div></form></td><td width=\"$img_wide\">$img_sakusei_kekka</td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" name=\"fm$add_no\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=\"$add_no\" class=\"d_none\"><input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"返信\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".mes_id.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
</div></form></td></tr>
<tr class=\"bgc000000\"><td colspan=\"2\" class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" onsubmit=\"fidins(this);\" utn=\"utn\"><div>
<div id=bk$add_no class=\"d_none\">
<input type=\"hidden\" name=\".id.\" value=\"\" /><input type=\"hidden\" name=\".pass.\" value=\"\" />
<input type=\"submit\" value=\"$addc_okiniiri{$add_okiniiri{$messe_f_id}}\" />
<input type=\"hidden\" name=\".mes_id2.\" value=\"$messe_f_id\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"messe\" /></div>
</div></form></td></tr>
";
			$koate_l{$messe_f_id} = $messe_f_name;
			push(@NEWADD,"$MES_REG[$w_mes_i]");
			}else{
	$hit = 1;

			}
	$add_no ++;
	$w_mes_i ++;
	$i ++;
		}

#最新版では負荷よりも二重表示されない方を重視、負荷削減したい場合、koate_l_fにまとめず、下記のように即表示すると効率的です
#foreach $key ( keys %koate_l ) {
#	$sendlist .= "<option value=\"$key\">$koate_l{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_kuni ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_kuni{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_butai ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_butai{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_gundan ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_gundan{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_gaikou ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_gaikou{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_mati ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_mati{$key}さんへ</option>";
#}
#foreach $key ( keys %koate_l_k ) {
#	$sendlist .= "<option value=\"$key\">$koate_l_k{$key}へ</option>";
#}

delete $koate_l{'m_sakujyo'}; 
foreach $key ( keys %koate_l ) {
	$koate_l_f{$key} = "$koate_l{$key}さん";
}
foreach $key ( keys %koate_l_kuni ) {
	$koate_l_f{$key} = "$koate_l_kuni{$key}さん";
}
foreach $key ( keys %koate_l_butai ) {
	$koate_l_f{$key} = "$koate_l_butai{$key}さん";
}
foreach $key ( keys %koate_l_gundan ) {
	$koate_l_f{$key} = "$koate_l_gundan{$key}さん";
}
foreach $key ( keys %koate_l_gaikou ) {
	$koate_l_f{$key} = "$koate_l_gaikou{$key}さん";
}
foreach $key ( keys %koate_l_mati ) {
	$koate_l_f{$key} = "$koate_l_mati{$key}さん";
}
foreach $key ( keys %koate_l_k ) {
	$koate_l_f{$key} = "$koate_l_k{$key}";
}
foreach $key ( keys %koate_l_f ) {
	$sendlist .= "<option value=\"$key\">$koate_l_f{$key}へ</option>";
}
			if($hit){
				open(OUT,">./w_db/jyusin/m_$f_id.cgi");
				print OUT @NEWADD;
				close(OUT);
			}

$add_k_name=" / 国内";
			if(!$k_kunino{$fk_id} and $fk_id){
$add_k_name="系・放浪武将";
			}
	&HEADER;
print <<"PRI";
<a id=\"0\"></a>


<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 手紙閲覧 * </strong>＞＞</span>（手紙本文をダブルクリックすると返信\可/IE&NNで動作確認/javascriptオン必須）</span>
</td>
</tr>
</table>
<table width=\"500\"><tr><td class=\"txth\" width=\"20%\">

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"手紙閲覧\" /></div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"門下省\" />
</div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"中書省\" />
</div></form></td><td class=\"txth\" width=\"20%\">

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"尚書省\" />
</div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$URI_SP_D/kunibbs/\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"国取掲示板\" />
</div></form></td>
</tr></table>


<table width=\"100%\">

<tr><td class=\"txth\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><a id=\"k\">
<div id=\"keitai\" class=\"d_none\">
<input type=\"text\" name=\".naiyou.\" size=\"60\" />
<select name=\".mes_id.\"><option value=\"k_$k_kunino[$fk_id]\">$k_name[$fk_id]へ</option><option value=\"m_tosi\">$t_name[$p_taizai_iti{$f_id}]の人々へ</option>$sendlist$sendlist2$sendlist_friend</select>
<input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /></div>
<div id=\"bkkeitai\" class=\"d_none\"></div>
</div></form></td></tr>


<tr>
<td class=\"txth\"><a href=\"javascript:hensin('keitai');\">携帯用</a>&nbsp;&nbsp;
<a href=\"#11\">国内宛</a>&nbsp;&nbsp;<a href=\"#4\">個人宛</a>&nbsp;&nbsp;<a href=\"#2\">軍団宛</a>&nbsp;&nbsp;<a href=\"#3\">部隊宛</a>&nbsp;&nbsp;<a href=\"#1\">都市宛</a>&nbsp;&nbsp;<a href=\"#12\">外交文</a>&nbsp;&nbsp;<a href=\"#13\">密書文</a>&nbsp;&nbsp;<a href=\"#5\">送信済</a></td>
</tr>
</table>



<div class=\"txtr\">
<table width=\"470\"><tr>
<td class=\"txth\" width=\"200\">
<form action=\"$COMMAND\" target=\"$in{'sv'}\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"tegami\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />
<input type=\"submit\" value=\"個人宛手紙・武将検索\" />
</div></form></td><td class=\"txth\" width=\"120\">
<form action=\"$COMMAND\" target=\"$in{'sv'}\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".m.\" value=\"messed\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />
<input type=\"submit\" value=\"受信拒否設定\" />
</div></form></td>
</td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" target=\"$in{'sv'}\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"m_sakujyo\" />
<input type=\"submit\" value=\"古い手紙を削除\" />
</div></form></td>
</tr>
</table>
</div>

<div class=\"messe_div\">
<div class=\"messe_block1\">

<div class=\"txtl\">
<a id=\"1\"></a>\n<a href=\"#0\">↑</a> <a href=\"#0\">・</a> <a href=\"#2\">↓</a> $t_name[$p_taizai_iti{$f_id}]の人々へ（5件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"m_tosi\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />

</div></form></td><td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#1\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" /></div></form>
</td>
</tr>
$tosiate_m
</table>


<div class=\"txtl\">
<a id=\"2\"></a>\n<a href=\"#1\">↑</a> <a href=\"#0\">・</a> <a href=\"#3\">↓</a> $gundan_name軍団宛て（5件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"m_gundan\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form>
</td><td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#2\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
</div></form></td>
</tr>
$gundan_mes
</table>

<div class=\"txtl\">
<a id=\"3\"></a>\n<a href=\"#2\">↑</a> <a href=\"#0\">・</a> <a href=\"#4\">↓</a> $butai_name部隊宛て（5件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=text name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"m_butai\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form></td><td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#3\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
</div></form></td>
</tr>
$butai_mes
</table>


<div class=\"txtl\">
<a id=\"4\"></a>\n<a href=\"#3\">↑</a> <a href=\"#0\">・</a> <a href=\"#5\">↓</a> $p_name{$f_id}個宛て（$KOATE件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"15\" />
<select name=\".mes_id.\">$sendlist_friend</select><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form></td><td class=\"txth\" width=\"$img_wide\">
<form action=\"$COMMAND\#4\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
</div></form></td></tr>
$jyusin_m
</table>

<div class=\"txtl\">
<a id=\"5\"></a>\n<a href=\"#4\">↑</a> <a href=\"#0\">・</a> <a href=\"#6\">↓</a> 送信済み（5件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
$sousin_m
</table>

</div>
<div class=\"messe_block2\">

<div class=\"txtl\">
<a id=\"11\"></a>\n<a href=\"#0\">↑</a> <a href=\"#0\">・</a> <a href=\"#12\">↓</a> $k_name_d[$fk_id]$add_k_name宛て（10件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"40\" /><input type=\"submit\" value=\"送信\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"k_$fk_id\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form></td>
<td class=\"txth\" width=\"$img_wide\"><form action=\"$COMMAND\#11\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
</div></form></td></tr>
$kuniate_m
</table>

<div class=\"txtl\">
<a id=\"12\"></a>\n<a href=\"#11\">↑</a> <a href=\"#0\">・</a> <a href=\"#13\">↓</a> $k_name_d{$fk_id}宛て外交書類（10件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
<tr class=\"bgc000000\"><td>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"text\" name=\".naiyou.\" size=\"15\" />
<select name=\".mes_id.\">$sendlist_gaikou</select><input type=\"submit\" value=\"送信\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" />
</div></form></td>
<td class=\"txth\" width=\"$img_wide\"><form action=\"$COMMAND\#12\" method=\"post\" utn=\"utn\"><div><input type=\"submit\" value=\"更新\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
</div></form></td></tr>
$kuniate_m2
</table>

<div class=\"txtl\">
<a id=\"13\"></a>\n<a href=\"#12\">↑</a> <a href=\"#0\">・</a> <a href=\"#13\">↓</a> $p_name{$f_id}宛て密書（10件まで）</div>
<table width=\"100%\" class=\"bgc808000\">
$touyou_bun
</table>

</div>
</div>
<div class=\"clear_b\"></div>

PRI
	&FOOTER;


}

1;