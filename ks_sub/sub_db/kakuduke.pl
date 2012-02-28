#$f_id任命するもの$fk_id今の国$add_k1昔いた国
#	&KUNI_KAKUDUKE("$f_id","$fk_id","$add_k1");
#	&K_SAVE("kuni_db","$add_k1","$add_k1");

#任命のみ$add_k1を空にK_SAVEいらない
#役職削除$fk_id$add_k1を同一にしK_SAVEの前に$p_kuni_yakusyoku{$w_id} = 0;

sub KUNI_KAKUDUKE {
$w_id=$_[0];
$wk_id=$_[1];

 if (!$p_id{$w_id}) {
	&P_READ("p","$w_id","$w_id");
 }

 if (!$k_id{$wk_id}) {
	&K_READ("kuni_db","$wk_id","$wk_id");
 }
$p_kuni_yakusyoku{$w_id} = 0;

	if($k_yakusyoku_id{$wk_id}[1] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 1;
	}elsif($k_yakusyoku_id{$wk_id}[2] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 2;
	}elsif($k_yakusyoku_id{$wk_id}[3] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 3;
	}elsif($k_yakusyoku_id{$wk_id}[4] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 4;
	}elsif($k_yakusyoku_id{$wk_id}[5] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 5;
	}elsif($k_yakusyoku_id{$wk_id}[6] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 6;
	}elsif($k_yakusyoku_id{$wk_id}[7] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 7;
	}elsif($k_yakusyoku_id{$wk_id}[10] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 10;
	}elsif($k_yakusyoku_id{$wk_id}[8] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 8;
	}elsif($k_yakusyoku_id{$wk_id}[9] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 9;
	}elsif($k_yakusyoku_id{$wk_id}[11] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 11;
	}elsif($k_yakusyoku_id{$wk_id}[12] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 12;
	}elsif($k_yakusyoku_id{$wk_id}[13] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 13;
	}elsif($k_yakusyoku_id{$wk_id}[14] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 14;
	}elsif($k_yakusyoku_id{$wk_id}[15] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 15;
	}elsif($k_yakusyoku_id{$wk_id}[16] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 16;
	}elsif($k_yakusyoku_id{$wk_id}[17] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 17;
	}elsif($k_yakusyoku_id{$wk_id}[18] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 18;
	}elsif($k_yakusyoku_id{$wk_id}[19] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 19;
	}elsif($k_yakusyoku_id{$wk_id}[20] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 20;
	}elsif($k_yakusyoku_id{$wk_id}[21] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 21;
	}elsif($k_yakusyoku_id{$wk_id}[22] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 22;
	}elsif($k_yakusyoku_id{$wk_id}[23] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 23;
	}elsif($k_yakusyoku_id{$wk_id}[24] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 24;
	}elsif($k_yakusyoku_id{$wk_id}[25] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 25;
	}elsif($k_yakusyoku_id{$wk_id}[26] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 26;
	}elsif($k_yakusyoku_id{$wk_id}[27] eq "$p_id{$w_id}"){
$p_kuni_yakusyoku{$w_id} = 27;
	}

 if ($_[2]) {
$wk_id=$_[2];
 if (!$k_id{$wk_id}) {
	&K_READ("kuni_db","$wk_id","$wk_id");
 }

		$add_kaku = 1;
	while ($add_kaku<30) {
	if($k_yakusyoku_id{$wk_id}[$add_kaku] eq $w_id){
	$k_yakusyoku_id{$wk_id}[$add_kaku]="";
	
	}
		$add_kaku ++;
	}

 }
}


1;