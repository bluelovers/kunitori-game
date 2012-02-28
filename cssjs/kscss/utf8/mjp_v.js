
function cbcopyaimjpv(cbins,cbtitle){
cbins = 'cbins + '<a href="#" onclick=javascript:cbcopyaimjpv("'+ cbins +'","'+ cbtitle +'");>自分のホームページにファイルを貼り付ける</a>';
window.clipboardData.setData("text",cbins);
alert("クリップボードに"+ cbtitle +"のファイル部分のHTMLタグをコピーしました");

}
