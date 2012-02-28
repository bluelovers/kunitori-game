
function kssend(add_uri)
{
parenurl = '';
try{ parenurl = parent.location.href; } catch(e){  }
if (parenurl != add_uri + '/'){ parent.location.href = add_uri + '/'; }
}