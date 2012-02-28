
function fcheck(ref){
parenurl = "";
try{ parenurl = parent.location.href; } catch(e){  }
rurl = ref;
rurl = rurl.substring(7,26);
if (rurl.indexOf('kunitori.com',0 ) < 0 && parenurl == ""){ parent.location.href = 'http://nullpo.in/'; }
}