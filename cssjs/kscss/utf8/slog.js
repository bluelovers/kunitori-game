
timerID = 0;
ftt = 0;
flag = false;
function sld(){
	ftt = 0;
clearTimer();
}

function clearTimer(){
	if (flag){
	clearInterval(timerID);
	flag = false;
	}
}
function slm(msec){
	ftt = ftt + msec;
	if(ftt > 0){
	if(ftt > 3){
	ftt = 4;
	}
clearTimer();
	timerID = window.setInterval('scrollBy(0,ftt)',10);
	flag = true;
	}
	if(ftt < 0){
	if(ftt < -3){
	ftt = -4;
	}
clearTimer();
	timerID = window.setInterval('scrollBy(0,ftt)',10);
	flag = true;
	}
	if(ftt == 0){
clearTimer();
	}
}
