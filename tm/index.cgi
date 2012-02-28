#!/usr/bin/perl

require "./men.pl";
require "$mpg_r/jcode.pl";
require "$mpg_r/0spt.pl";
&CODE;
if($MENTE) { &ER0("緊急メンテナンス中です。しばらくお待ちください。"); }

$in{'m'} =~ s/[^0-9_\-A-Za-z]//g;
if(!-e "$mpg_r/in_db/$in{'m'}.pl") { &ER0("モード未選択です$buffer。"); }
require "$mpg_r/in_db/$in{'m'}.pl";
&MOVE;
	exit;

