



###########
sub NEKONYANB
{
$ippatusakujyo = 0;
		$nekonyanch = 1;

		$apontm = 0;
		$apontmk = 0;
		$apontmip = 0;
	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);
###########
$kiadd = $f_id;
$kiadd1 = $kiadd;
$kiadd2 = $kiadd;
$kiadd =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiaddl=();
	while ($addw < length($kiadd) - 4) {
  $kiaddl[$addw] = substr($kiadd, $addw, $addw+3);
$addw ++;
	}

$kiadd1 =~ tr/a-zA-Z//d;
$kiadd1 =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiadd1l=();
	while ($addw < length($kiadd1) - 4) {
  $kiadd1l[$addw] = substr($kiadd1, $addw, $addw+3);
$addw ++;
	}
$kiadd2 =~ tr/a-zA-Z//cd;
$kiadd2 =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiadd2l=();
	while ($addw < length($kiadd2) - 4) {
  $kiadd2l[$addw] = substr($kiadd2, $addw, $addw+3);
$addw ++;
	}

###########
$kpadd = $p_pass{$f_id};
$kpadd =~ s/＼<//g;
$kpadd1 = $kpadd;
$kpadd2 = $kpadd;
$kpadd =~ s/(.)\1+/$1/g;

$kpadd1 =~ tr/a-zA-Z//d;
$kpadd1 =~ s/(.)\1+/$1/g;
$kpadd2 =~ tr/a-zA-Z//cd;
$kpadd2 =~ s/(.)\1+/$1/g;


##########
$addw = "192.168.1.";
 if ($p_syokihost{$f_id} !~ /\Q$addw\E/) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/$p_syokihost{$f_id}.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
$f_id =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }else{
		$nnsapontm = 0;
		$nnsapontmk = 0;
		$nnsapontmip = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
 if (abs($nnsapontm - $apontm) < 3600) {
 $add = 1;
 $add2 = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
 }
	}

	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);

	open(OUT,">./ip_db/tajyuul/$p_syokihost{$f_id}.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);
}
##########

	if (length($kiadd1) > 3) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/i_$kiadd1.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
$f_id =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }
		$nnsapontm = 0;
		$nnsapontmk = 0;
		$nnsapontmip = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
		$e_id = $nnsid;
 if (!$p_id{$e_id}) {
	&P_READ("p","$e_id","$e_id");
 }
 if ($p_syokihost{$e_id} eq $p_syokihost{$f_id}) {
$ippatusakujyo = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
	}
	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);
	open(OUT,">./ip_db/tajyuul/i_$kiadd1.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);
	}

##########

	if (length($kiadd2) > 3) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/i_$kiadd2.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
$f_id =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }
		$nnsapontm = 0;
		$nnsapontmk = 0;
		$nnsapontmip = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
		$e_id = $nnsid;
 if (!$p_id{$e_id}) {
	&P_READ("p","$e_id","$e_id");
 }
 if ($p_syokihost{$e_id} eq $p_syokihost{$f_id}) {
$ippatusakujyo = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
	}
	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);
	open(OUT,">./ip_db/tajyuul/i_$kiadd2.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);

	}


###########
}


###########
sub NKONYANS
{

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";

###########
$kiadd = $f_id;
$kiadd1 = $kiadd;
$kiadd2 = $kiadd;
$kiadd =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiaddl=();
	while ($addw < length($kiadd) - 4) {
  $kiaddl[$addw] = substr($kiadd, $addw, $addw+3);
$addw ++;
	}

$kiadd1 =~ tr/a-zA-Z//d;
$kiadd1 =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiadd1l=();
	while ($addw < length($kiadd1) - 4) {
  $kiadd1l[$addw] = substr($kiadd1, $addw, $addw+3);
$addw ++;
	}
$kiadd2 =~ tr/a-zA-Z//cd;
$kiadd2 =~ s/(.)\1+/$1/g;
$addw = 0;
	@kiadd2l=();
	while ($addw < length($kiadd2) - 4) {
  $kiadd2l[$addw] = substr($kiadd2, $addw, $addw+3);
$addw ++;
	}

###########
$kpadd = $p_pass{$f_id};
$kpadd =~ s/＼<//g;
$kpadd1 = $kpadd;
$kpadd2 = $kpadd;
$kpadd =~ s/(.)\1+/$1/g;

$kpadd1 =~ tr/a-zA-Z//d;
$kpadd1 =~ s/(.)\1+/$1/g;
$kpadd2 =~ tr/a-zA-Z//cd;
$kpadd2 =~ s/(.)\1+/$1/g;

##########

	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/$host.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }else{
&NKONYANSS;
	push(@NEW_TAJYUU,"$_");
 }
	}


	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);

	open(OUT,">./ip_db/tajyuul/$host.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);

##########
$addw = "192.168.1.";
 if ($p_syokihost{$f_id} !~ /\Q$addw\E/) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/$p_syokihost{$f_id}.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }else{
 $nnsapontm = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
 if (abs($nnsapontm - $apontm) < 3600) {
 $add = 1;
 $add2 = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
 }
	}


	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);

	open(OUT,">./ip_db/tajyuul/$p_syokihost{$f_id}.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);
}
##########

	if (length($kiadd1) > 3) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/i_$kiadd1.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }
 $nnsapontm = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
		$e_id = $nnsid;
	&P_READ("p","$e_id","$e_id");
 if ($p_syokihost{$e_id} eq $p_syokihost{$f_id}) {
$ippatusakujyo = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
	}
	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);
	open(OUT,">./ip_db/tajyuul/i_$kiadd1.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);
	}

##########

	if (length($kiadd2) > 3) {
	@NEW_TAJYUU=();
	open(IN,"./ip_db/tajyuul/i_$kiadd2.cgi");
	@CN_TAJYUU = <IN>;
	close(IN);
	foreach(@CN_TAJYUU){
 $nnsid = "";
 $nnspass = "";
	($nnsid,$nnspass,$nnstm) =split(/<>/);
 $add = 0;
 $add2 = 0;

$nnsid =~ tr/A-Z/a-z/;
 if ($nnsid eq $f_id or (!-e "./p_db/p/$nnsid.cgi") or !$nnsid) {
 next;
 }
 $nnsapontm = 0;
	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($nnsapontm,$nnsapontmk,$nnsapontmip) = split(/<>/,$CN_DATATM[0]);
 if (abs($nnsapontm - $apontm) < 21600) {
		$e_id = $nnsid;
	&P_READ("p","$e_id","$e_id");
 if ($p_syokihost{$e_id} eq $p_syokihost{$f_id}) {
$ippatusakujyo = 1;
 }
&NKONYANSS;
 }
	push(@NEW_TAJYUU,"$_");
	}
	unshift(@NEW_TAJYUU,"$f_id<>$p_pass{$f_id}<>$tt<>\n");

	splice(@NEW_TAJYUU,3);
	open(OUT,">./ip_db/tajyuul/i_$kiadd2.cgi");
	print OUT @NEW_TAJYUU;
	close(OUT);

	}


###########
}


############
sub NKONYANSS
{

###########
$nnsiadd = $nnsid;
$nnsiadd1 = $nnsiadd;
$nnsiadd2 = $nnsiadd;
$nnsiadd =~ s/(.)\1+/$1/g;

$nnsiadd1 =~ tr/a-zA-Z//d;
$nnsiadd1 =~ s/(.)\1+/$1/g;
$nnsiadd2 =~ tr/a-zA-Z//cd;
$nnsiadd2 =~ s/(.)\1+/$1/g;


$nnspadd = $nnspass;
$nnspadd =~ s/＼<//g;
$nnspadd1 = $nnspadd;
$nnspadd2 = $nnspadd;
$nnspadd =~ s/(.)\1+/$1/g;

$nnspadd1 =~ tr/a-zA-Z//d;
$nnspadd1 =~ s/(.)\1+/$1/g;
$nnspadd2 =~ tr/a-zA-Z//cd;
$nnspadd2 =~ s/(.)\1+/$1/g;

###########
	if (length($kiadd) > 3 and length($nnsiadd) > 3) {
 if ($kiadd =~ /\Q$nnsiadd\E/) {
 $add = 1;
 }
 if ($nnsiadd =~ /\Q$kiadd\E/) {
 $add = 1;
 }
		foreach(@kiaddl){
 if ($_ and $nnsiadd =~ /\Q$_\E/) {
 $add = 1;
 }
		}
	}
	if (length($kiadd1) > 2 and length($nnsiadd1) > 2) {
 if ($kiadd1 =~ /\Q$nnsiadd1\E/) {
 $nnsiadd1 = $kiadd1;
 }
 if ($nnsiadd1 =~ /\Q$kiadd1\E/) {
 $add = 1;
 }
		foreach(@kiadd1l){
 if ($_ and $nnsiadd1 =~ /\Q$_\E/) {
 $add = 1;
 }
		}
	}
	if (length($kiadd2) > 2 and length($nnsiadd2) > 2) {
 if ($kiadd2 =~ /\Q$nnsiadd2\E/) {
 $add = 1;
 }
 if ($nnsiadd2 =~ /\Q$kiadd2\E/) {
 $add = 1;
 }
		foreach(@kiadd2l){
 if ($_ and $nnsiadd2 =~ /\Q$_\E/) {
 $add = 1;
 }
		}
	}

###########
	if (length($kpadd) > 3 and length($nnspadd) > 3) {
 if ($kpadd =~ /\Q$nnspadd\E/) {
 $add2 = 1;
 }
 if ($nnspadd =~ /\Q$kpadd\E/) {
 $add2 = 1;
 }
	}
	if (length($kpadd1) > 2 and length($nnspadd1) > 2) {
 if ($kpadd1 =~ /\Q$nnspadd1\E/) {
 $add2 = 1;
 }
 if ($nnspadd1 =~ /\Q$kpadd1\E/) {
 $add2 = 1;
 }
	}
	if (length($kpadd2) > 2 and length($nnspadd2) > 2) {
 if ($nnspadd2 and $kpadd2 =~ /\Q$nnspadd2\E/) {
 $add2 = 1;
 }
 if ($nnspadd2 =~ /\Q$kpadd2\E/) {
 $add2 = 1;
 }
	}
	if ($p_pass{$f_id} eq $nnspass) {
 $add2 = 1;
	}
###########

	if ($f_id eq $nnspass) {
 $add = 1;
 $add2 = 1;
	}
	if ($p_pass{$f_id} eq $nnsid) {
 $add = 1;
 $add2 = 1;
	}

	if ($kiadd1 eq $nnspass and length($kiadd1) > 3) {
 $add = 1;
 $add2 = 1;
	}
	if ($p_pass{$f_id} eq $nnsiadd1 and length($nnsiadd1) > 3) {
 $add = 1;
 $add2 = 1;
	}
	if ($kiadd2 eq $nnspass and length($kiadd2) > 3) {
 $add = 1;
 $add2 = 1;
	}
	if ($p_pass{$f_id} eq $nnsiadd2 and length($nnsiadd2) > 3) {
 $add = 1;
 $add2 = 1;
	}
###########
		if($add and $add2){

############
		if($ippatusakujyo){
$d_id = $nnsid;
$d_id =~ tr/A-Z/a-z/;
			$apontmj = $apontm + 86400 - $times;



$p_yomikaki{$f_id} = 1;
$p_yomikaki{$d_id} = 1;

		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }
							unlink("./p_db/p/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";

	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;

	&BL_SAVE("bl","$f_id","$f_id");

if(!$p_id{$d_id}){
	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}
}





require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$d_id","$d_id");

							unlink("./p_db/p/$d_id.cgi");
							unlink("./p_db/touketu/$d_id.cgi");
			unlink("./p_db/tt/$d_id.cgi");


		$add=int(rand(3)+95);
		$add2=int(rand(5))+1;
		if(!$nekonyanch){
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！.....");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>猫々娘々が推奨するペナルティ内容はこれ（´ー`)つ「データ抹消」");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータを抹消したのら～。");

	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("$p_name{$d_id}との多重容疑が濃厚となったため、貴方のIDと $p_name{$d_id}のデータは抹消されました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />誤認の場合は別途調査しますのでバグ報告をお願いします。");

	exit;
		}
		if(!$nekonyanhit){
	&MAP_LOG('<span class=\"msp\">　　　　　　　　 _,&#46;&#46;,&#46;&#46;,&#46;,&#46;,_ <br />　　　　　　 ,／　　　　 `ヽ, <br />　　　　　 ,&#39; , ,　　　　　,　ﾞ､ﾞi_ <br />　　　　 ,イ i,&#39; i &#47;`&#39;ﾍ ﾄ, &#39;, i l i　｀ &gt; <br />　　　／　l ,i tﾄ､_　 l_ﾊ&#39;&quot;!ﾘﾉi,／　　　　猫々娘々がこの世界を監視しています。 <br />　　　~~~&#39;ﾉゝ代ﾅ　　弋ｱ&#39;ﾘ从 <br />　　　　　 ﾉ从ﾘゝ,_-_,&#46; イﾉ从!&#39; <br />　　　 　 　 　 &#47; ､ ゝ､,,,,,,i､ <br />　　　　　 　　|　 i 　 ﾉ ‐､!　　 (⌒ ､ <br />　　　　　　 　片┐　!＿_」　　　　,)　） <br />　　　　 　 ,&#46;-!､ l　l ,&#47; ,&#47;ﾉ`ﾄ ､ﾆﾆ,&#46;&#46;ノ <br />　　　 と(´__i__`とi)(iニ)&#39;__ﾉ___)｀) </span>');
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>一撃必殺「猫々砲」発射なのら～。");
#	&MAP_LOG('<span class=\"msp\">||||||||||||||||||||||||||　　　　┳　　　||||||||||||||||||||||||||||| <br />|||||||||||||||||||:　　　　　　 ┠ +20　　　　||||||||||||||||||| <br />|||||||||||||||:　　　　　　　　┃　　　　　　　 　:|||||||||||||| <br />|||||||||||:　　　　　　　　　 ┠ +10　　　 &#46;／&#39;|　:||||||||||| <br />|||||||||:　　　　　　　　　∧＿∧　　 ,／&#39;　　|　　||||||||| <br />||||||||┣┿┿┿┿　 &lt;丶｀∀´&gt;／┿┿┿┿┫|||||| <br />||||||||　　　　　&#46;＿　　(　　つつ@&#39;＿　　　　|　　:|||||||| <br />|||||||||:　　　　 ＼￣￣　　 ￣　ノ　　　　　 |　 :||||||||<br />||||||||||| ~　゜~~。゜ ~彡~ ┠ -10~ ゜~~ ~。゜ ~||||||||||| <br />|||||||||||||||:　　　　　　　　┃　　　　　　　　:||||||||||||||| <br />|||||||||||||||||||:　　　　　　 ┠ -20　　　　||||||||||||||||||| <br />|||||||||||||||||||||||||||||　　　┻　　　||||||||||||||||||||||||||||| </span>');

		}
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータを抹消したのら～。");
	$nekonyanhit = 1;
	next;
############
		}

			$apontm = $times - 200000;
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$nnsid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);
$d_id = $nnsid;
$d_id =~ tr/A-Z/a-z/;
	@NEW_COMTM=();
			$apontm = $times - 300000;
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$nnsid.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

unlink ("./p_db/touketu/$f_id.cgi");
rename ("./p_db/p/$f_id.cgi", "./p_db/touketu/$f_id.cgi");

		$p_jikan{$f_id}=$tt +86400;

$p_yomikaki{$f_id} = 1;
$p_yomikaki{$d_id} = 1;



		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;

	&TOUKETU_SAVE("touketu","$f_id","$f_id");


if(!$p_id{$d_id}){
	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}
}
unlink ("./p_db/touketu/$d_id.cgi");
rename ("./p_db/p/$d_id.cgi", "./p_db/touketu/$d_id.cgi");

		$p_jikan{$d_id}=$tt +86400;


	open(IN,"./p_db/my_log/$p_id{$d_id}.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$f_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$f_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$p_id{$d_id}.cgi");
	print OUT @F_LOG;
	close(OUT);

	open(IN,"./p_db/my_log/$f_id.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$f_id.cgi");
	print OUT @F_LOG;
	close(OUT);



require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;

	&TOUKETU_SAVE("touketu","$d_id","$d_id");

		$add=int(rand(20)+75);
		$add2=int(rand(5))+1;

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$f_id<><><><>\n");
	open(OUT,">./ip_db/giwaku/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$p_id{$d_id}<><><><>\n");
	open(OUT,">./ip_db/giwaku/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
		if(!$nekonyanch){
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！......");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>・・多重チェックを掻い潜ろうとしている可能性・・有り");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>娘々はそんなに甘くないのら・・");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>不正者に裁きの鉄槌を！");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>高感度状況分析ルーチンVol.$add2起動・・・");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>確証はないけど・・自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータをペナルティ付き凍結処理にしたのら～。");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>猫々娘々が推奨するペナルティ内容はこれ（´ー`)つ「クッキー発行回数＋10回」＆「24時間行動力拘束ボーナス」＆「役職初期化」");

	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。");

	exit;
		}
		if(!$nekonyanhit){
#			&MAP_LOG('<span class=\"msp\">　　　　　　　　 _,&#46;&#46;,&#46;&#46;,&#46;,&#46;,_ <br />　　　　　　 ,／　　　　 `ヽ, <br />　　　　　 ,&#39; , ,　　　　　,　ﾞ､ﾞi_ <br />　　　　 ,イ i,&#39; i &#47;`&#39;ﾍ ﾄ, &#39;, i l i　｀ &gt; <br />　　　／　l ,i tﾄ､_　 l_ﾊ&#39;&quot;!ﾘﾉi,／　　　　猫々娘々がこの世界を監視しています。 <br />　　　~~~&#39;ﾉゝ代ﾅ　　弋ｱ&#39;ﾘ从 <br />　　　　　 ﾉ从ﾘゝ,_-_,&#46; イﾉ从!&#39; <br />　　　 　 　 　 &#47; ､ ゝ､,,,,,,i､ <br />　　　　　 　　|　 i 　 ﾉ ‐､!　　 (⌒ ､ <br />　　　　　　 　片┐　!＿_」　　　　,)　） <br />　　　　 　 ,&#46;-!､ l　l ,&#47; ,&#47;ﾉ`ﾄ ､ﾆﾆ,&#46;&#46;ノ <br />　　　 と(´__i__`とi)(iニ)&#39;__ﾉ___)｀) </span>');
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>一撃必殺「猫々砲」発射なのら～");
#	&MAP_LOG('<span class=\"msp\">||||||||||||||||||||||||||　　　　┳　　　||||||||||||||||||||||||||||| <br />|||||||||||||||||||:　　　　　　 ┠ +20　　　　||||||||||||||||||| <br />|||||||||||||||:　　　　　　　　┃　　　　　　　 　:|||||||||||||| <br />|||||||||||:　　　　　　　　　 ┠ +10　　　 &#46;／&#39;|　:||||||||||| <br />|||||||||:　　　　　　　　　∧＿∧　　 ,／&#39;　　|　　||||||||| <br />||||||||┣┿┿┿┿　 &lt;丶｀∀´&gt;／┿┿┿┿┫|||||| <br />||||||||　　　　　&#46;＿　　(　　つつ@&#39;＿　　　　|　　:|||||||| <br />|||||||||:　　　　 ＼￣￣　　 ￣　ノ　　　　　 |　 :||||||||<br />||||||||||| ~　゜~~。゜ ~彡~ ┠ -10~ ゜~~ ~。゜ ~||||||||||| <br />|||||||||||||||:　　　　　　　　┃　　　　　　　　:||||||||||||||| <br />|||||||||||||||||||:　　　　　　 ┠ -20　　　　||||||||||||||||||| <br />|||||||||||||||||||||||||||||　　　┻　　　||||||||||||||||||||||||||||| </span>');

		}
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータをペナルティ付き凍結処理にしたのら～。");

	$nekonyanhit = 1;
	next;
		}

}
############

1;
