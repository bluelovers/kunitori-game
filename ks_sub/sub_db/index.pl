
$KEITAI_T = "cd";
$COMMAND = "./";


$IMAGECOME = "";

# ロックファイル
$lockfile = './lock/lockdir';
$lockfile2 = './lock/lockdir2';
$lockfiled = './lock/';

#画像鯖0番が他の画像を兼ねるときは0（別な方式に変えるときは値を無しに）
$KYARA_IMG_SABA_D = "0";

#画像鯖別画像収録数（各画像鯖0番に置く透過画像は含まないこと）
$KYARA_IMG_MAX{""} = 0;
$KYARA_IMG_MAX{"0"} = 100;
$KYARA_IMG_MAX{"1"} = 40;
$KYARA_IMG_MAX{"2"} = 40;
$KYARA_IMG_MAX{"3"} = 20;
$KYARA_IMG_MAX{"4"} = 115;
$KYARA_IMG_MAX{"5"} = 125;
$KYARA_IMG_MAX{"6"} = 50;
$KYARA_IMG_MAX{"7"} = 25;
$KYARA_IMG_MAX{"8"} = 30;
$KYARA_IMG_MAX{"9"} = 10;
$KYARA_IMG_MAX{"10"} = 0;
$KYARA_IMG_MAX{"11"} = 0;
$KYARA_IMG_MAX{"12"} = 0;
$KYARA_IMG_MAX{"13"} = 0;
$KYARA_IMG_MAX{"14"} = 0;
$KYARA_IMG_MAX{"15"} = 0;

# 画像URL（最後に/は必要なし）
$IMG_HTML = "http://img.kunitori.com/txt";
$IMG{""} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"0"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"1"} = "http://game.kunitori.com/img/sp/ksdm";
$IMG{"2"} = "http://game.kunitori.com/img/sp/ksdw";
$IMG{"3"} = "http://game.kunitori.com/img/sp/ksdb";
$IMG{"4"} = "http://game.kunitori.com/img/abi";
$IMG{"5"} = "http://game.kunitori.com/img/mgs/m";
$IMG{"6"} = "http://game.kunitori.com/img/mgs/w";
$IMG{"7"} = "http://game.kunitori.com/img/heji/hito";
$IMG{"8"} = "http://game.kunitori.com/img/heji/neko";
$IMG{"9"} = "http://game.kunitori.com/img/heji/etc";
$IMG{"10"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"11"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"12"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"13"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"14"} = "http://game.kunitori.com/img/sp/ksd";
$IMG{"15"} = "http://game.kunitori.com/img/sp/ksd";
$p_img_kakutyou{""}=".png";
$p_img_kakutyou{"0"}=".png";
$p_img_kakutyou{"1"}=".png";
$p_img_kakutyou{"2"}=".png";
$p_img_kakutyou{"3"}=".png";
$p_img_kakutyou{"4"}=".gif";
$p_img_kakutyou{"5"}=".gif";
$p_img_kakutyou{"6"}=".gif";
$p_img_kakutyou{"7"}=".gif";
$p_img_kakutyou{"8"}=".gif";
$p_img_kakutyou{"9"}=".gif";
$p_img_kakutyou{"10"}=".gif";
$p_img_kakutyou{"11"}=".gif";
$p_img_kakutyou{"12"}=".gif";
$p_img_kakutyou{"13"}=".gif";
$p_img_kakutyou{"14"}=".gif";
$p_img_kakutyou{"15"}=".gif";
$p_img_mime{""}="png";
$p_img_mime{"0"}="png";
$p_img_mime{"1"}="png";
$p_img_mime{"2"}="png";
$p_img_mime{"3"}="png";
$p_img_mime{"4"}="gif";
$p_img_mime{"5"}="gif";
$p_img_mime{"6"}="gif";
$p_img_mime{"7"}="gif";
$p_img_mime{"8"}="gif";
$p_img_mime{"9"}="gif";
$p_img_mime{"10"}="gif";
$p_img_mime{"11"}="gif";
$p_img_mime{"12"}="gif";
$p_img_mime{"13"}="gif";
$p_img_mime{"14"}="gif";
$p_img_mime{"15"}="gif";
$IMG_SABA_NAME{"0"} = 'デフォルト画像鯖：全画像';
$IMG_SABA_NAME{"1"} = 'デフォルト画像鯖：男性';
$IMG_SABA_NAME{"2"} = 'デフォルト画像鯖：女性';
$IMG_SABA_NAME{"3"} = 'デフォルト画像鯖：その他';
$IMG_SABA_NAME{"4"} = '第四画像鯖：<a href=http://illustmaker.abi-station.com/ target=_blank>by似顔絵イラストメーカー</a>';
$IMG_SABA_NAME{"5"} = '第五画像鯖：男性キャラ byマンガさん';
$IMG_SABA_NAME{"6"} = '第六画像鯖：女性キャラ byマンガさん';
$IMG_SABA_NAME{"7"} = '第七画像鯖：人間キャラ by heji';
$IMG_SABA_NAME{"8"} = '第八画像鯖：猫耳キャラ by heji';
$IMG_SABA_NAME{"9"} = '第九画像鯖：その他 by heji';
$IMG_SABA_NAME{"10"} = '第十画像鯖：？';
$IMG_SABA_NAME{"11"} = '第十一画像鯖：？';
$IMG_SABA_NAME{"12"} = '第十二画像鯖：？';
$IMG_SABA_NAME{"13"} = '第十三画像鯖：？';
$IMG_SABA_NAME{"14"} = '第十四画像鯖：？';
$IMG_SABA_NAME{"15"} = '第十五画像鯖：？';

$p_img_kakutyou{"jpg"}=".jpg";
$p_img_kakutyou{"jpeg"}=".jpeg";
$p_img_kakutyou{"gif"}=".gif";
$p_img_kakutyou{"png"}=".png";

$p_img_mime{"jpg"}="jpeg";
$p_img_mime{"jpeg"}="jpeg";
$p_img_mime{"gif"}="gif";
$p_img_mime{"png"}="png";


# 爵位
$LANK[0] = '歩卒';
$LANK[1] = '公士';
$LANK[2] = '上造';
$LANK[3] = '簪ジョウ';
$LANK[4] = '不更';
$LANK[5] = '大夫';
$LANK[6] = '官大夫';
$LANK[7] = '公大夫';
$LANK[8] = '公乗';
$LANK[9] = '五大夫';
$LANK[10] = '左庶長';
$LANK[11] = '右庶長';
$LANK[12] = '左更';
$LANK[13] = '中更';
$LANK[14] = '右更';
$LANK[15] = '少上造';
$LANK[16] = '大上造';
$LANK[17] = '駟車庶長';
$LANK[18] = '大庶長';
$LANK[19] = '関内侯';
$LANK[20] = '列侯';

# 兵士種類
$SOL_TYPE[0] = '民兵';
$SOL_TYPE[1] = '斧鉞兵';
$SOL_TYPE[2] = '長剣歩兵';
$SOL_TYPE[3] = '弓兵';
$SOL_TYPE[4] = '戟兵';
$SOL_TYPE[5] = '軽騎兵';
$SOL_TYPE[6] = '戟騎兵';
$SOL_TYPE[7] = '弩兵';
$SOL_TYPE[8] = '方士';
$SOL_TYPE[9] = '山賊';

$SOL_TYPE[11] = '発石車';
$SOL_TYPE[12] = '虎戦車';
$SOL_TYPE[13] = '近衛騎兵';
$SOL_TYPE[14] = '侍女';
$SOL_TYPE[15] = '御林突騎';
$SOL_TYPE[16] = '遊侠';
$SOL_TYPE[17] = '矛槍兵';
$SOL_TYPE[18] = '衝車';
$SOL_TYPE[19] = '連弩車';
$SOL_TYPE[20] = '元戎連弩兵';

$SOL_TYPE[21] = '剣豪';
$SOL_TYPE[22] = '忍者';
$SOL_TYPE[23] = '鉄甲騎兵';
$SOL_TYPE[24] = '藤甲兵';
$SOL_TYPE[25] = '猛獣使い';
$SOL_TYPE[26] = '象騎兵';
$SOL_TYPE[27] = '蒙古騎兵';
$SOL_TYPE[28] = '白馬義従';
$SOL_TYPE[29] = '山越兵';
$SOL_TYPE[30] = '九真象騎兵';

$SOL_TYPE[31] = '水軍兵';
$SOL_TYPE[32] = '海賊';
$SOL_TYPE[33] = '五斗米教徒';
$SOL_TYPE[34] = '青州兵';
$SOL_TYPE[35] = '丹楊兵';
$SOL_TYPE[36] = '敢死兵';
$SOL_TYPE[37] = '解煩兵';
$SOL_TYPE[38] = '戦車兵';
$SOL_TYPE[39] = '虎豹騎';
$SOL_TYPE[40] = '貊弓兵';

$SOL_TYPE[41] = '烏丸突騎';
$SOL_TYPE[42] = '吉羅使い';
$SOL_TYPE[43] = '韃靼騎兵';
$SOL_TYPE[44] = '匈奴騎兵';
$SOL_TYPE[45] = '精鋭軽騎兵';
$SOL_TYPE[46] = '狗使い';
$SOL_TYPE[47] = '象弓騎兵';
$SOL_TYPE[48] = '蛇使い';
$SOL_TYPE[49] = '巫女';

$SOL_TYPE[81] = '陰陽師';
$SOL_TYPE[82] = '黄巾賊';
$SOL_TYPE[83] = '長弓兵';
$SOL_TYPE[88] = '鉄砲隊';
$SOL_TYPE[89] = '大砲';

$SOL_TYPE[91] = '仙人';
$SOL_TYPE[92] = '仙娘';
$SOL_TYPE[93] = '吸血姫';
$SOL_TYPE[94] = '仙狐';
$SOL_TYPE[95] = '猫耳';
$SOL_TYPE[96] = '魑魅魍魎';
$SOL_TYPE[97] = '僵屍';

# 文字（薄め）
$ELE_C[0] = "#f1f1f0";
$ELE_C[1] = "#FFE4E1";
$ELE_C[2] = "#cfeffe";
$ELE_C[3] = "#c8ffc7";
$ELE_C[4] = "#FFFFE2";
$ELE_C[5] = "#FFEFD5";
$ELE_C[6] = "#fffff9";
$ELE_C[7] = "#effffe";
$ELE_C[8] = "#FFF0FE";

# 背景（濃い）
$ELE_BG[0] = "#666665";
$ELE_BG[1] = "#800001";
$ELE_BG[2] = "#000083";
$ELE_BG[3] = "#006001";
$ELE_BG[4] = "#B8860B";
$ELE_BG[5] = "#8B0000";
$ELE_BG[6] = "#ac8a3b";
$ELE_BG[7] = "#0f6081";
$ELE_BG[8] = "#400041";

# 背景（MAP）
$ELE_MAP[0] = "#808080";
$ELE_MAP[1] = "#FFE4E1";
$ELE_MAP[2] = "#cfeffe";
$ELE_MAP[3] = "#c8ffc7";
$ELE_MAP[4] = "#FFFFE2";
$ELE_MAP[5] = "#F4A460";
$ELE_MAP[6] = "#F0E68C";
$ELE_MAP[7] = "#effffe";
$ELE_MAP[8] = "#DA70D6";

# 開始年
$KAISI_NEN = 100;

# 爵位必要値
$SYAKUI_P = 5000;

# キャラ画像サイズ
$img_wide = "64";
$img_height= "64";

$img_wide_d = "96";
$img_height_d= "96";

# [CSSファイル名]
$CSS_URI = "http://css.kunitori.com/utf8";
$CSS_I_URI = "http://kscss.gjp.mobi/utf8";


$TAG_html_s{'x'} = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">';

$TAG_html_s{'xb'} = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.0//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">';
$TAG_q0 = '"';
$TAG_s0 = '/';


$TAG_d_head{'x'} = "<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/op.css\" />
<meta name=\"description\" content=\"オンラインゲーム.$GAME_TITLE$MEN_TITLE\" />
<meta name=\"keywords\" content=\"MMORPG,CGIゲーム,携帯ゲーム,国取り,戦国,後漢,三国志,無料ゲーム\" />
<script type=\"text/javascript\" src=\"$CSS_URI/main.js\"></script>
";
$TAG_d_head{'xb'} = "<meta http-equiv=\"Content-Type\" content=\"application/xhtml+xml\" charset=\"UTF-8\" />
<meta http-equiv=\"Content-Script-Type\" content=\"text/javascript\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/op.css\" />
<script type=\"text/javascript\" src=\"$CSS_URI/main.js\"></script>
";

$TAG_div_s{'x'} = "<div class=\"m_b\">
";
$TAG_div_s{'xb'} = "<div class=\"m_b\">
";

####デフォルトサーバー位置指定（この欄を変更すると一部機能が使えなくなります）
#画像サーバ、簡易処理サーバ（国取掲示板）
$URI_SP_D = "http://game.kunitori.com";
#国取ツールサーバ（ユーザレンタルツール専用）
$URI_SP_D_TOOL = "tool.kunitori.com";
$URI_SP_D_TOOL_dr_max = 10000;
$URI_SP_D_TOOL_kbbs_max = 10000;
$URI_SP_D_TOOL_ks_max = 1000;
#国取.com
$URI_SP_D_T = "http://kunitori.com";
$URI_SP_D_N = "kunitori.com";
$URI_C_T = "http://mmo.cc/";
$URI_C_N = "MMO Communications";
##############################

1;
