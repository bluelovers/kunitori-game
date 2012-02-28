
sub MOVE {
&HOST_NAME;
	$hostr2 = "0.0.1";
	$hostr3 = "192.168.";
if($host !~ /\Q$hostr2\E/ and $host !~ /\Q$hostr3\E/ and $host ne "") { &ER2("外部からのアクセスは禁じられているのら！侵入者の名前は覚えておくのら～。"); }

if(!$KOUSIN_AUTO) { &ER2("リセット等の管理ツールを使用する際は、念のためオートパイロットをオフ（値を1）にして下さい。<br />設定はks_sub/men_db/sp/$menck.pl"); }

if($in{'m2'} eq 'MMRISE') { &MMRISE; }else{&GMIN;}

}

sub GMIN {

	&HEADER;
	print <<"PRI";

<span class=\"fs4\">管理</span>
<form method=\"post\" action=\"./\"><div>
<input type=\"hidden\" name=\".m.\" value=\"gm\" />
<input type=\"hidden\" name=\".m2.\" value=\"MMRISE\" />
<input type=\"hidden\" name=\".id.\" value=\"gm\" />
<input type=\"hidden\" name=\".pass.\" value=\"$mpass\" />
<input type=\"submit\" value=\"初期化\" />
<br /></div></form>
すべてのデータを初期化します。



PRI
	&FOOTER;
	exit;
}

sub GM_LOG {

&F_LOCK;
	open(IN,"./gm.txt");
	@A_LOG = <IN>;
	close(IN);
	&TT_GET;

	unshift(@A_LOG,"$_[0]($mday/$hour/$min)\n\n");
	splice(@A_LOG,20);

	open(OUT,">./w_db/gm.log");
	print OUT @A_LOG;
	close(OUT);
	&UNLOCK_FILE();

}

sub MMRISE {

	require "$mpg_r/rese0.pl";
&HOST_NAME;
	&RESET_MOVE;

	&GM_LOG("全データを初期化。[$host]");
unlink("./w_db/rise0.txt");
	
	&HEADER;
	print <<"PRI";
<span class=\"fs4\"><span color=red>全データを初期化。</span></span>
<br />
<br />
<form method=\"post\" action=\"./\"><div>
<input type=\"hidden\" name=\".m.\" value=\"gm\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"初期画面へ\" />
</form>
<br />
PRI

	&FOOTER;
	exit;
}


1;
