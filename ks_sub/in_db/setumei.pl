
sub MOVE {
	$in{'koumoku'} = abs(int($in{'koumoku'}));
	
			$mess = "";
	if(!$in{'koumoku'}){
	open(READ,"../ksmanual.html");
	@add = <READ>;
	close(READ);

	foreach(@add){
	$ksmanual .= $_;
	}
	$ksmanual =~ s/\r|\n|\r\n/<br\ \/>/g;
	$ksmanual =~ s/<br\ \/><br\ \/>/<br\ \/>/g;
	
	$ksmanual =~ s/\" target=\"en\">/<>/g;

		@body = split(/<a href=\".\/ksmanualf.html/, $ksmanual);

	foreach(@body){
	($ksm_body_id,$ksm_body) = split(/<>/,$_);
	$ksm_body_id =~ s/#//g;
		$ksmadd{$ksm_body_id}= $ksm_body;
		if($ksm_body_id > 4){
			$mess .= "<a href=\"./?.m.=setumei\&amp;.koumoku.=$ksm_body_id\&amp;.i.=i\">$ksm_body";
		}
	}
	}else{ 
	open(READ,"../ksmanualf.html");
	@add = <READ>;
	close(READ);

	foreach(@add){
	$ksmanualf .= $_;
	}
	$ksmanualf =~ s/\r|\n|\r\n/<br\ \/>/g;
	$ksmanual =~ s/<br\ \/><br\ \/>/<br\ \/>/g;
	$ksmanualf =~ s/\"><\/a>/<>/g;
		@bodyf = split(/<a id=\"/, $ksmanualf);
	foreach(@bodyf){
	($ksm_body_id,$ksm_body) = split(/<>/,$_);
		$ksmadd{$ksm_body_id}=$ksm_body;
	}
	
		$mess = $ksmadd{$in{'koumoku'}};
	$mess =~ s/.\/it2.txt/..\/it2.txt/g;
	
	}
	&HEADER;
	print <<"PRI";
説明書<br />
$mess
<hr />
<a href=\"$URI/?.m.=setumei\&amp;.i.=i\">携帯版説明書TOPへ</a>
<hr />
国取物語携帯版は画面サイズと容量の関係上、ゲーム内で使用できるコマンドが一部制限されています。
XHTML対応（フルブラウザ搭載）の最新の携帯電話ではPC版にもログインすることができます。
携帯電話からアクセスする場合、転送速度が速い携帯版を使うか、
大容量のフルバージョンのPC版を使うかは、お好みでお願い致します。
PRI

	&FOOTER;
	exit;

}


1;

