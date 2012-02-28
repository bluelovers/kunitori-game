
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;


$p_cgno_d{$f_id} = $in{'icon'};
$p_cg_sabano{$f_id} = $in{'icon_saba'};

$p_cgno{$f_id}[0] = "$in{'icon_0'}";
$p_cgno{$f_id}[1] = "$in{'icon_1'}";
$p_cgno{$f_id}[2] = "$in{'icon_2'}";
$p_cgno{$f_id}[3] = "$in{'icon_3'}";
$p_cgno{$f_id}[4] = "$in{'icon_4'}";
$p_cgno{$f_id}[5] = "$in{'icon_5'}";
$p_cgno{$f_id}[6] = "$in{'icon_6'}";
$p_cgno{$f_id}[7] = "$in{'icon_7'}";
$p_cgno{$f_id}[8] = "$in{'icon_8'}";
$p_cgno{$f_id}[9] = "$in{'icon_9'}";
$" = ',';
################

$a_a_d="gazou<>0<>武将画像変更 <><>$f_id<><>$p_cgno_d{$f_id}<>$p_cg_sabano{$f_id}<>@{$p_cgno{$f_id}}<><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "武将画像変更 を<br />アクティブコマンドとして予約しました。";

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

$p_img_w{$p_cg_sabano{$f_id}}="$IMG{$p_cg_sabano{$f_id}}/$p_cgno_d{$f_id}";
$p_img_w{"gif"}="$p_cgno_d{$f_id}";
$p_img_w{"jpg"}="$p_cgno_d{$f_id}";
$p_img_w{"png"}="$p_cgno_d{$f_id}";
$p_img{$f_id}=$p_img_w{$p_cg_sabano{$f_id}};
$p_img_f{$f_id}=$p_img_kakutyou{$p_cg_sabano{$f_id}};

$p_kunino{$f_id} =$in{'ita'};
$bbsurl =$in{'ref_uri_d'};
$URI ="$bbsurl$in{'bbsurl'}";
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");
	print "Content-type: text/html\n\n";
	print <<"PRI";
<hr /><span class=\"fs4\">$xyz</span><br /><br />
<form action=\"$bbsurl/$in{'bbsurl'}/$COMMAND\" method=\"post\" utn=\"utn\"><div>
$img_sakusei_kekka
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"ＯＫ\" />
</div></form>
PRI


	exit;

}
1;