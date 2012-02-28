
$KEITAI_T = "i_cd";
$COMMAND = "./";

$ichit = 1;
		if($in{'id'} eq "-$mpass"){
			$hfip = 1;
		}

$TAG_html_s{$doc_mode} = '';
$TAG_d_head{$doc_mode} = '';



$TAG_html_s{'xi'} = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.0//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">';

$TAG_html_s{'xii'} = '<!DOCTYPE html PUBLIC "-//i-mode group (ja)//DTD XHTML i-XHTML(Locale/Ver.=ja/1.0) 1.0//EN" "i-xhtml_4ja_10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">';

$TAG_d_head{'xi'} = "<meta http-equiv=\"Content-Type\" content=\"application/xhtml+xml\" charset=\"UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" />
<meta name=\"description\" content=\"携帯ゲーム.$GAME_TITLE$MEN_TITLE\" />
<meta name=\"keywords\" content=\"携帯ゲーム,国取り,無料ゲーム,モバゲ\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_I_URI/op.css\" /><script type=\"text/javascript\" src=\"$CSS_I_URI/main.js\"></script>";
$TAG_d_head{'xii'} = "<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_I_URI/op.css\" /><script type=\"text/javascript\" src=\"$CSS_I_URI/main.js\"></script>";

$TAG_div_s{'xi'} = "<div class=\"m_b\">
";
$TAG_div_s{'xii'} = "<div class=\"m_b\">
";
1;