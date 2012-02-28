
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;


	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);
		if($tmtmw3 ne $in{'tmtmw3'}){
&ER1("モード未選択です$tmtmw3/$buffer。");
		}
		if($in{'item_f'} eq "3"){
$item_f[0] = 3102;
$item_f[1] = 3103;
$item_f[2] = 3104;
$item_f[3] = 1101;
$item_f[4] = 1104;
$item_f[5] = 1105;
$item_f[6] = 1106;
$item_f[7] = 1107;
$in{'item_f'} = int(rand(8));
$in{'item_f'} = $item_f[$in{'item_f'}];
		}elsif($in{'item_f'} eq "2"){
$item_f[0] = 9129;
$item_f[1] = 9103;
$item_f[2] = 9104;
$item_f[3] = 9105;
$item_f[4] = 9101;
$item_f[5] = 9102;
$item_f[6] = 5107;
$item_f[7] = 9112;
$in{'item_f'} = int(rand(8));
$in{'item_f'} = $item_f[$in{'item_f'}];
		}else{
$in{'item_f'} = int(rand(8))+1;
		}
################

$a_a_d="itemp<>0<>アイテムプレゼント <><>$f_id<><>$in{'item_f'}<><><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$add_i_nameで入札 を<br />アクティブコマンドとして予約しました。";

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

	&HEADER;

	&FOOTER;

	exit;

}
1;