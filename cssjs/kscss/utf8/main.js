
ref = "";
function fcheck(ref){
parenurl = "";
try{ parenurl = parent.location.href; } catch(e){  }
rurl = ""+ref;
rurl = rurl.substring(7,26);
if (rurl.indexOf(domain,0 ) < 0 && parenurl == ""){ parent.location.href = 'http://nullpo.in/'; }
}

function cbcopy(cbins,cbtitle){
cbins = "cbins";
window.clipboardData.setData("text",cbins);
alert("クリップボードに"+ cbtitle +"をコピーしました");

}
