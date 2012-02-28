function hensin(hfname){
	hfurl = document.getElementById(hfname).style;
	hfurlbk = document.getElementById('bk' + hfname).style;
	if (hfurl.display == 'none'){
	hfurl.display = 'block'; 
	hfurlbk.display = 'block'; 
	}else{
	hfurl.display = 'none';
	hfurlbk.display = 'none';
	}
}
function fidins(fidurl){
	fidurl.elements[0].value = msid;
	fidurl.elements[1].value = mspass;
}