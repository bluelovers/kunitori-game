
function add_s(){
    durl2 = durlw.substring(durlw.lastIndexOf('.'),durlw.length);
    durl1 = durlw.substr(0,durlw.lastIndexOf('.'));

    durl0 = durlw.substr(0,durlw.lastIndexOf('/')+1);
    durlnf = durlw.substring(durlw.lastIndexOf('/')+1,durlw.length);
    durln = durlnf.substring(0,durlnf.indexOf('.'));

    document.glink.glc1.value = durl0 + '拡張画像ファイル';
    document.glink.glc2.value = durln + '？' + durl2;
    document.glink.glc3.value = durl2 + '形式';
}


function syokika(delno){
	var i;
	for (i=0; i<delno; i++){
		document.entry.elements[0].options[i] = null;
	}
}
function cgimgsaba(parts){
saba_i=parts.options[parts.selectedIndex].value; 

			var n = saba_i;
	optlen = document.entry.elements[0].options.length;
	while(optlen > 0){
		syokika(optlen);
		optlen = document.entry.elements[0].options.length;
	}
	if (litem[n].length > 0){
	 z = 0;
		for (i=0; i<litem[n].length; i++){
			document.entry.elements[0].options[z] = new Option(litem[n][i],sitem[n][i]);
	 z ++;
		}
	}

}
function cgimgno(parts){
Imgno=parts.options[parts.selectedIndex].value; 
			document.Img.src=saba[saba_i] + Imgno + saba_f[saba_i];
}
function cgimgurl(parts,urlid){

Imgurl=parts.value; 
			document.glink.elements['Img'+ urlid].src=Imgurl;
    durlw = document.glink.elements[0].value;
			document.glink.elements['Img_'+ urlid].src=Imgurl;
    durlw = document.glink.elements[0].value;
}
function cgimgurlop(parts,urlid){
    durl2 = durlw.substring(durlw.lastIndexOf("."),durlw.length);
    durl1 = durlw.substr(0,durlw.lastIndexOf("."));

    durl0 = durlw.substr(0,durlw.lastIndexOf("/")+1);
    durlnf = durlw.substring(durlw.lastIndexOf("/")+1,durlw.length);
    durln = durlnf.substring(0,durlnf.indexOf("."));

    document.glink.glc1.value = durl0 + '拡張画像ファイル';
    document.glink.glc2.value = durln + '？？？' + durl2;
    document.glink.glc3.value = durl2 + '形式';

Imgurl=parts.value; 
			document.elements['Img_'+ urlid].src= durl1 + Imgurl + durl2;

}