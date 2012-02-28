
sub MOVE {
require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;

require "$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;
		$igcome = "";
		$igcomeent = "";
		$igcome2 = "";
		if($in{'um'} eq "ig"){
		$in{'s1no'} = abs(int($in{'s1no'}));
		$zc1 = $in{'s1no'};
		$gitname = $gitem[$zc1];

		$igcome = "合成";
		}elsif($in{'um'} eq "ik"){
		$in{'s1no'} = abs(int($in{'s1no'}));
		$in{'ino'} = abs(int($in{'ino'}));
			if($in{'ino'} eq $in{'s1no'}){
		$gicome = "同じアイテムがセットされています。";
			}
	open(IN,"./p_db/it/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);
		$itn = "";
	($itn,$itnw,$itent) = split(/<>/,$F_LOG2[$in{'ino'}]);
		$zc1 = $itn;
		$itn = "";
		$igcomeent = "（+$itent）";
	($itn,$itnw,$itent) = split(/<>/,$F_LOG2[$in{'s1no'}]);
		$zc2 = $itn;
		$itn = "";
		$igcome = "強化";
			if($zc1 eq $zc2){
		$igcome = "重ね合わせて合成強化";
			}else{
		$igcome2 = "$gitem[$zc2]（+$itent）を使用して";
			}
		}elsif($in{'um'} eq "iu"){

		
			if($in{'s1no'} < 1){
		$e_id = $f_id;
			}elsif($in{'s1no'} < 5){
		$e_id = "$f_id-h$in{'s1no'}";
			}elsif($in{'s1no'} < 9){
		$e_id = "$f_id-p$in{'s1no'}";
			}

	&P_READ("p","$e_id","$e_id");

	if("" eq $p_id{$e_id}){
		$gicome = "IDが存在しません";
	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$gicome<br />アイテム管理画面へお戻りください。</strong></span>\n";

	print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"アイテム管理画面へ\" /></div></form>
PRI

	print "<br /><br /><hr />\n</div></body></html>\n";

	exit;
	}
		$igcome2 = "$p_name{$e_id}に";


	open(IN,"./p_db/it/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);
		$itn = "";
			if($in{'ino'} < 10000){
	($itn,$itnw,$itent) = split(/<>/,$F_LOG2[$in{'ino'}]);
		$zc1 = $itn;
		$zcent = $itent;
		$itn = "";
		$igcomeent = "（+$itent）";
		$igcome = "装備";
				if(int($in{'s2no'}/10) eq "1"){
					if(int($in{'s2no'}%10) eq "1"){
						if($p_migite{$e_id} and $p_migite{$e_id}%1000 < 100){
		$igcome0 = "右手の$item_name{$p_migite{$e_id}}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "2"){
						if($p_hidarite{$e_id} and $p_hidarite{$e_id}%1000 < 100){
		$igcome0 = "左手の$item_name{$p_hidarite{$e_id}}を売り払い";
						}
					}
				}elsif(int($in{'s2no'}/10)  eq "2"){
						if($p_syomotu{$e_id} and $p_syomotu{$e_id}%1000 < 100){
		$igcome0 = "書物 $item_name{$p_syomotu{$e_id}}を売り払い";
						}
				}elsif(int($in{'s2no'}/10)  eq "3"){
						if($p_norimono{$e_id} and $p_norimono{$e_id}%1000 < 100){
		$igcome0 = "$item_name{$p_norimono{$e_id}}を売り払い";
						}
				}elsif(int($in{'s2no'}/10)  eq "4"){
						if($p_ihuku{$e_id} and $p_ihuku{$e_id}%1000 < 100){
		$igcome0 = "衣服 $item_name{$p_ihuku{$e_id}}を売り払い";
						}
				}elsif(int($in{'s2no'}/10)  eq "5"){
					if(int($in{'s2no'}%10) eq "0"){
						if($p_akusesari_b{$e_id}[0] and $p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome0 = "装飾１ $item_name{$p_akusesari_b{$e_id}[0]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "1"){
						if($p_akusesari_b{$e_id}[1] and $p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome0 = "装飾２ $item_name{$p_akusesari_b{$e_id}[1]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "2"){
						if($p_akusesari_b{$e_id}[2] and $p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome0 = "装飾３ $item_name{$p_akusesari_b{$e_id}[2]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "3"){
						if($p_akusesari_b{$e_id}[3] and $p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome0 = "装飾４ $item_name{$p_akusesari_b{$e_id}[3]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "4"){
						if($p_akusesari_b{$e_id}[4] and $p_akusesari_b{$e_id}[0]%1000 < 100){
		$igcome0 = "装飾５ $item_name{$p_akusesari_b{$e_id}[4]}を売り払い";
						}
					}
				}elsif(int($in{'s2no'}/10)  eq "6"){
					if(int($in{'s2no'}%10) eq "0"){
						if($p_akusesari_h{$e_id}[0] and $p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome0 = "兵装１ $item_name{$p_akusesari_h{$e_id}[0]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "1"){
						if($p_akusesari_h{$e_id}[1] and $p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome0 = "兵装２ $item_name{$p_akusesari_h{$e_id}[1]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "2"){
						if($p_akusesari_h{$e_id}[2] and $p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome0 = "兵装３ $item_name{$p_akusesari_h{$e_id}[2]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "3"){
						if($p_akusesari_h{$e_id}[3] and $p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome0 = "兵装４ $item_name{$p_akusesari_h{$e_id}[3]}を売り払い";
						}
					}elsif(int($in{'s2no'}%10)  eq "4"){
						if($p_akusesari_h{$e_id}[4] and $p_akusesari_h{$e_id}[0]%1000 < 100){
		$igcome0 = "兵装５ $item_name{$p_akusesari_h{$e_id}[4]}を売り払い";
						}
					}
				}

				if($in{'s2no'} > 80){
		$igcome = "使用";
				}
			}else{
		$zc1 = 0;
		$zcent = 0;
		$igcome2 = "$p_name{$e_id}の";
		$igcome = "装備解除";
							$hit = 0;
				if(int($in{'s2no'}/10) eq "1"){
					if(int($in{'s2no'}%10) eq "1"){
							$reazc = $p_migite{$e_id};
		$igcomeent = "右手";
					}elsif(int($in{'s2no'}%10)  eq "2"){
							$reazc = $p_hidarite{$e_id};
		$igcomeent = "左手";
					}elsif(int($in{'s2no'}%10)  eq "0"){
					if($p_migite{$e_id}%1000){
							$reazc = $p_migite{$e_id};
							$zc1 = $p_migite{$e_id};
					}
					if($p_hidarite{$e_id}%1000){
							$reazc = $p_hidarite{$e_id};
							$zc1 = $p_hidarite{$e_id};
					}
							
		$igcomeent = "右手＆左手";
		$igcome = "装備交換";
					}

				}elsif(int($in{'s2no'}/10)  eq "2"){
							$reazc = $p_syomotu{$e_id};
		$igcomeent = "書物";
				}elsif(int($in{'s2no'}/10)  eq "3"){
							$reazc = $p_norimono{$e_id};
		$igcomeent = "馬";
				}elsif(int($in{'s2no'}/10)  eq "4"){
							$reazc = $p_ihuku{$e_id};
		$igcomeent = "衣服";
				}elsif(int($in{'s2no'}/10)  eq "5"){
					if(int($in{'s2no'}%10) eq "0"){
							$reazc = $p_akusesari_b{$e_id}[0];
		$igcomeent = "装飾１";
					}elsif(int($in{'s2no'}%10)  eq "1"){
							$reazc = $p_akusesari_b{$e_id}[1];
		$igcomeent = "装飾２";
					}elsif(int($in{'s2no'}%10)  eq "2"){
							$reazc = $p_akusesari_b{$e_id}[2];
		$igcomeent = "装飾３";
					}elsif(int($in{'s2no'}%10)  eq "3"){
							$reazc = $p_akusesari_b{$e_id}[3];
		$igcomeent = "装飾４";
					}elsif(int($in{'s2no'}%10)  eq "4"){
							$reazc = $p_akusesari_b{$e_id}[4];
		$igcomeent = "装飾５";
					}
				}elsif(int($in{'s2no'}/10)  eq "6"){
					if(int($in{'s2no'}%10) eq "0"){
							$reazc = $p_akusesari_h{$e_id}[0];
		$igcomeent = "兵装１";
					}elsif(int($in{'s2no'}%10)  eq "1"){
							$reazc = $p_akusesari_h{$e_id}[1];
		$igcomeent = "兵装２";
					}elsif(int($in{'s2no'}%10)  eq "2"){
							$reazc = $p_akusesari_h{$e_id}[2];
		$igcomeent = "兵装３";
					}elsif(int($in{'s2no'}%10)  eq "3"){
							$reazc = $p_akusesari_h{$e_id}[3];
		$igcomeent = "兵装４";
					}elsif(int($in{'s2no'}%10)  eq "4"){
							$reazc = $p_akusesari_h{$e_id}[4];
		$igcomeent = "兵装５";
					}
				}
				if($reazc%1000 > 99){
							$hit = 1;
				}
			}
		}

		if($igcome ne ""){
	&TT_GET;

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";

		$m_ttfl = (stat("./p_db/it/$f_id.cgi"))[9];

			if($in{'tt'} < $m_ttfl){
&ER1("アイテムが更新されているようです。前の画面に戻って画面更新をしてください。");
			}
			if($in{'kaku'} eq ""){
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$igcome0$igcome2$gitem[$zc1]$igcomeentを$igcomeしますがよろしいですか？</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemu\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".um.\" value=\"$in{'um'}\" /><input type=\"hidden\" name=\".kaku.\" value=\"ok\" />
<input type=\"hidden\" name=\".s1no.\" value=\"$in{'s1no'}\" /><input type=\"hidden\" name=\".s2no.\" value=\"$in{'s2no'}\" /><input type=\"hidden\" name=\".ino.\" value=\"$in{'ino'}\" />
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
<input type=\"submit\" value=\"$igcomeします\" /></div></form>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"$igcomeしません\" /></div></form>
PRI
			}else{


		if($in{'um'} eq "ig"){

#_/_/_/_/_/_/_/合成_/_/_/_/_/_/_/#

	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

	open(IN,"./p_db/it/ig_$f_id.cgi");
	@KTM2 = <IN>;
	close(IN);
							$hit = 0;
	foreach(@KTM2){
		($gitno)=split(/<>/);
			if($gitno eq $zc1){
							$hit = 1;
			}
	}


			if(($tmtmit and $tmtmit > $tmtmw1) or $hit == 0){
							$hittt = $tmtmit - ($tt - 3600);
		$gicome = "アイテムが更新されています。";
		$gicomett = "<br />注：アイテム合成を行うには、残り$hittt秒間アイテムを動かさずに待機して下さい";
			if($hit == 0){
		$gicomett = "";
		$gicome = "あんた素材アイテム揃えてネェやんけ！";
			}
	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$gicome<br />アイテム管理画面へお戻りください。$gicomett</strong></span>\n";

	print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"アイテム管理画面へ\" /></div></form>
PRI

	print "<br /><br /><hr />\n</div></body></html>\n";

	exit;
			}


		}elsif($in{'um'} eq "ik"){

#_/_/_/_/_/_/_強化/_/_/_/_/_/_/#

							$hit = 0;
							$hit2 = 0;
			if($zc1){
							$hit ++;
							$itent1 = $itent;
							$itentw1 = "$gitem[$itn]（+$itent）";
			}
			if($zc2){
							$hit ++;
							$itent2 = $itent;
							$itentw2 = "$gitem[$itn]（+$itent）";
			}
							$itentw = $itent2 + $itent1;
							$gitsyu = 0;
require "./$mpg_r/sub_db/itg.pl";
		($gitname,$gitsyu,$gi1,$gi2,$gi3,$gi4,$gi5,$gi6,$gi7,$gi8,$gi9,$gi10,$gi11,$gi12,$gix1,$gix2,$gix3)=split(/<>/,$gitem[$zc1]);

			if($zc2 eq $zc1){
							$hit2 ++;
							$itent1 += $itent2;
			}elsif("9101" eq $zc2){
							$hit2 ++;
			}elsif("9102" eq $zc2 and $gitsyu == 1){
							$itentw += 1;
							$hit2 ++;
			}elsif("9129" eq $zc2){
							$hit2 ++;
			}

			if($hit < 2 or $hit2 < 1 or $in{'s1no'} eq $in{'ino'}){

		$gicome = "エンチャントアイテムが正しくセットされていません。";
			if($zc2 eq $zc1 and $gitsyu and $zc1 % 1000 < 100){
		$gicome = "店で買えるアイテムは重ね合わせ強化出来ません。";
			}
			if($hit < 2){
		$gicome = "あんた強化アイテム揃えてネェやんけ！";
			}
	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$gicome<br />アイテム管理画面へお戻りください。</strong></span>\n";

	print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"アイテム管理画面へ\" /></div></form>
PRI

	print "<br /><br /><hr />\n</div></body></html>\n";

	exit;
			}


		}elsif($in{'um'} eq "iu"){

#_/_/_/_/_/_/_/装備_/_/_/_/_/_/_/#

	if($zc1 ne "0"){
							$zc = 0;
							$hit = 0;
	foreach(@F_LOG2){
		($itn,$itnw,$itent)=split(/<>/);
			if($zc eq $in{'ino'} and $itn and $itn eq $zc1){
							$hit ++;
							$itent1 = $itent;
							$itentw1 = "$gitname（+$itent）";
			}
							$zc ++;
	}
							$gitsyu = 0;
require "./$mpg_r/sub_db/itg.pl";
		($gitname,$gitsyu,$gi1,$gi2,$gi3,$gi4,$gi5,$gi6,$gi7,$gi8,$gi9,$gi10,$gi11,$gi12,$gix1,$gix2,$gix3)=split(/<>/,$gitem[$zc1]);

			if($in{'s2no'} eq "10"){
							$hit = 1;
			}else{
		$gicome = "あんたアイテム持ってネェやんけヽ(｀Д´)ノ";
			if($gitsyu < 1){
		$gicome = "そのアイテムは合成素材専用です。どの箇所にも装備できません。";
							$hit = 0;
			}elsif($gitsyu eq "1" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは武器です。武器の箇所に装備してください。";
							$hit = 0;
			}elsif($gitsyu eq "2" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは書物です。書物の箇所に装備してください。";
							$hit = 0;
			}elsif($gitsyu eq "3" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは馬です。馬の箇所に装備してください。";
							$hit = 0;
			}elsif($gitsyu eq "4" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは衣服です。衣服の箇所に装備してください。";
							$hit = 0;
			}elsif($gitsyu eq "5" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは装飾です。装飾の箇所に装備してください。";
							$hit = 0;
			}elsif($gitsyu eq "6" and int($in{'s2no'}/10) ne $gitsyu){
		$gicome = "そのアイテムは兵士用装備です。装備箇所の選択をしなおしてください。";
							$hit = 0;
			}elsif($gitsyu > 8 and int($in{'s2no'}/10) ne "9"){
		$gicome = "そのアイテムの効果は未実装です。";
							$hit = 0;
			}elsif($gitsyu > 8 and int($in{'s2no'}/10) ne "9"){
		$gicome = "そのアイテムは使用専門です。装備は出来ません。";
							$hit = 0;
			}

			}
	}else{
		$gicome = "装備解除できるのは合成アイテムの装備品のみです。";
	}
			if($hit < 1){
	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$gicome<br />アイテム管理画面へお戻りください。</strong></span>\n";

print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"アイテム管理画面へ\" /></div></form>
PRI

	print "<br /><br /><hr />\n</div></body></html>\n";

	exit;
			}


		}


    &F_LOCK("item");
################

		$in{'tuika'} = abs(int($in{'tuika'}));
$a_a_d="itemu<>0<>$gitname・アイテム$igcome <><>$f_id<><>$in{'s1no'}<>$in{'s2no'}<>$in{'ino'}<>$in{'um'}<>$igcome2<>$igcomeent<>$igcome<>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$gitname・アイテム$igcome を<br />アクティブコマンドとして予約しました。";

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

	&UNLOCK_FILE("item");

	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"item\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END


	exit;
			}
		}else{
	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>モード未選択</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
		}
	exit;
}
1;