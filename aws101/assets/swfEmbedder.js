window.onload = function (){
	var divs = document.getElementsByTagName('div');
	for (i = 0; i < divs.length; i++){
		var thisDiv = divs[i];
		if(thisDiv.className == 'section swf'){
			var metas = document.getElementsByName('DC.Identifier');
			var remString = metas[0].content + '__';
			var swfString = thisDiv.id.replace(remString, '');
			var so = new SWFObject("assets/swf/"+swfString+"_skin.swf", "Captivate", "800", "631", "10", "#CCCCCC");
			so.addParam("quality", "high");
			so.addParam("name", "Captivate");
			so.addParam("id", "Captivate");
			so.addParam("wmode", "window");
			so.addParam("bgcolor","#F1F4F5");
			so.addParam("menu", "false");
			so.addVariable("variable1", "value1");
			so.setAttribute("redirectUrl", "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash");
			so.write(thisDiv.id);
		} else {
			alert("div not found");
		}
	}
}