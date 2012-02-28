
function syokika(delno){
	var i;
	for (i=0; i<delno; i++){
		document.entry.elements[3].options[i] = null;
	}
}
function cgimgsaba(parts){
saba_i=parts.options[parts.selectedIndex].value; 
			var n = saba_i;
	optlen = document.entry.elements[3].options.length;
	while(optlen > 0){
		syokika(optlen);
		optlen = document.entry.elements[3].options.length;
	}
	if (litem[n].length > 0){
	 z = 0;
		for (i=0; i<litem[n].length; i++){
			document.entry.elements[3].options[z] = new Option(litem[n][i],sitem[n][i]);
	 z ++;
		}
	}

}
function cgimgno(parts){
Imgno=parts.options[parts.selectedIndex].value; 
			document.Img.src=saba[saba_i] + Imgno + saba_f[saba_i];
}
function cgimgurl(parts){

Imgurl=parts.value; 
			document.Img.src=Imgurl;
}